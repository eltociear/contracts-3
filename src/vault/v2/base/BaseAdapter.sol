// SPDX-License-Identifier: GPL-3.0
// Docgen-SOLC: 0.8.15

pragma solidity ^0.8.15;

import {IERC20Upgradeable as IERC20} from "openzeppelin-contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";
import {OwnedUpgradeable} from "../../../utils/OwnedUpgradeable.sol";
import {PausableUpgradeable} from "openzeppelin-contracts-upgradeable/security/PausableUpgradeable.sol";
import {IBaseStrategy} from "./interfaces/IBaseStrategy.sol";

struct AdapterConfig {
    IERC20 underlying;
    IERC20 lpToken;
    bool useLpToken;
    IERC20[] rewardTokens;
}

struct ProtocolConfig {
    address registry;
    bytes protocolInitData;
}

abstract contract BaseAdapter is OwnedUpgradeable, PausableUpgradeable {
    IERC20 public underlying;
    IERC20 public lpToken;

    bool public useLpToken;

    IERC20[] public rewardTokens;

    mapping(address => bool) public isVault;

    modifier onlyVault() {
        require(isVault[msg.sender], "Only vault");
        _;
    }

    // TODO move performance fees into vaults or adapter?
    function __BaseAdapter_init(AdapterConfig memory adapterConfig) internal {
        __Owned_init(msg.sender);
        __Pausable_init();

        underlying = adapterConfig.underlying;
        lpToken = adapterConfig.lpToken;
        useLpToken = adapterConfig.useLpToken;
        rewardTokens = adapterConfig.rewardTokens;
    }

    /*//////////////////////////////////////////////////////////////
                            ACCOUNTING LOGIC
    //////////////////////////////////////////////////////////////*/

    /**
     * @notice Returns the total amount of assets
     */
    function totalAssets() public view virtual returns (uint256) {
        if (paused())
            return
                useLpToken
                    ? lpToken.balanceOf(address(this))
                    : underlying.balanceOf(address(this));

        return useLpToken ? _totalLP() : _totalUnderlying();
    }

    /**
     * @notice Returns the total amount of underlying assets.
     * @dev This function must be overriden. If the farm requires the usage of lpToken than this function must convert lpToken balance into underlying balance
     */
    function _totalUnderlying() internal view virtual returns (uint256) {}

    /**
     * @notice Returns the total amount of lpToken
     * @dev This function is optional. Some farms might require the user to deposit lpTokens directly into the farm
     */
    function _totalLP() internal view virtual returns (uint256) {}

    function maxDeposit() public view virtual returns (uint256) {
        return paused() ? 0 : type(uint256).max;
    }

    function maxWithdraw() public view virtual returns (uint256) {
        return totalAssets();
    }

    /*//////////////////////////////////////////////////////////////
                            DEPOSIT LOGIC
    //////////////////////////////////////////////////////////////*/

    /**
     * @notice Deposit Asset into the wrapped farm
     * @dev Uses either `_depositUnderlying` or `_depositLP`
     * @dev Only callable by the vault
     **/
    function deposit(uint256 amount) external virtual onlyVault whenNotPaused {
        _deposit(amount);
    }

    function _deposit(uint256 amount) internal virtual {}

    /**
     * @notice Deposits underlying asset and converts it if necessary into an lpToken before depositing
     * @dev This function must be overriden. Some farms require the user to into an lpToken before depositing others might use the underlying directly
     **/
    function _depositUnderlying(uint256 amount) internal virtual {}

    /**
     * @notice Deposits the lpToken directly into the farm
     * @dev This function is optional. Some farms might require the user to deposit lpTokens directly into the farm
     **/
    function _depositLP(uint256 amount) internal virtual {}

    /*//////////////////////////////////////////////////////////////
                            WITHDRAWAL LOGIC
    //////////////////////////////////////////////////////////////*/

    /**
     * @notice Withdraws Asset from the wrapped farm
     * @dev Uses either `_withdrawUnderlying` or `_withdrawLP`
     * @dev Only callable by the vault
     **/
    function withdraw(uint256 amount) external virtual onlyVault {
        _withdraw(amount);
    }

    function _withdraw(uint256 amount) internal virtual {}

    /**
     * @notice Withdraws underlying asset. If necessary it converts the lpToken into underlying before withdrawing
     * @dev This function must be overriden. Some farms require the user to into an lpToken before depositing others might use the underlying directly
     **/
    function _withdrawUnderlying(uint256 amount) internal virtual {}

    /**
     * @notice Withdraws the lpToken directly from the farm
     * @dev This function is optional. Some farms might require the user to deposit lpTokens directly into the farm
     **/
    function _withdrawLP(uint256 amount) internal virtual {}

    /*//////////////////////////////////////////////////////////////
                            CLAIM LOGIC
    //////////////////////////////////////////////////////////////*/

    /**
     * @notice Claims rewards
     */
    function _claim() internal virtual {}

    /*//////////////////////////////////////////////////////////////
                            MANAGEMENT LOGIC
    //////////////////////////////////////////////////////////////*/

    /// @dev This function needs to be called by a trusted contract on initialization of a new vault that wants to use this strategy
    function addVault(address _vault) external onlyOwner {
        isVault[_vault] = true;
    }

    /// @dev RewardTokens get set manually instead of fetched to allow the trusted party to ignore certain rewards if they choose to
    /// @dev This function should be called by a trusted strategist / the DAO
    function setRewardsToken(IERC20[] memory _rewardTokens) external onlyOwner {
        rewardTokens = _rewardTokens;
    }

    /*//////////////////////////////////////////////////////////////
                            PAUSING LOGIC
    //////////////////////////////////////////////////////////////*/

    /// @notice Pause Deposits and withdraw all funds from the underlying protocol. Caller must be owner.
    function pause() external onlyOwner {
        _withdraw(totalAssets());
        _pause();
    }

    /// @notice Unpause Deposits and deposit all funds into the underlying protocol. Caller must be owner.
    function unpause() external onlyOwner {
        _deposit(totalAssets());
        _unpause();
    }
}
