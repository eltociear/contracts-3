#!/usr/bin/env bash

# Deploy Clone Implementations
# source .env && forge create MultiRewardStaking --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && forge create YearnAdapter --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && forge create BeefyAdapter --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && forge create CompoundV2Adapter --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && forge create OusdAdapter --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && forge create MockStrategy --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && forge create Vault --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY

# Deploy Util Contracts
# source .env && forge create AdminProxy --constructor-args 0x22f5413C075Ccd56D575A54763831C4c27A37Bdb --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --verify --etherscan-api-key=$ETHERSCAN_API_KEY
# source .env && forge create PermissionRegistry --constructor-args 0xcC09F5bd7582D02Bb31825d09589F4773B65eCc9 --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --verify --etherscan-api-key=$ETHERSCAN_API_KEY
# source .env && forge create VaultRegistry --constructor-args 0xcC09F5bd7582D02Bb31825d09589F4773B65eCc9 --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --verify --etherscan-api-key=$ETHERSCAN_API_KEY
# source .env && forge create MultiRewardEscrow --constructor-args 0x7Edd61A58B5920dF39208E9888D8be713f639A60 0x47fd36ABcEeb9954ae9eA1581295Ce9A8308655E --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --verify --etherscan-api-key=$ETHERSCAN_API_KEY
# source .env && forge create VaultRouter --constructor-args 0x41813a5303597a68c0a780FF37A827b9c7e84397 --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --verify --etherscan-api-key=$ETHERSCAN_API_KEY

# Deploy Deployment Controller
# source .env && forge create CloneFactory --constructor-args 0x22f5413C075Ccd56D575A54763831C4c27A37Bdb --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --verify --etherscan-api-key=$ETHERSCAN_API_KEY
# source .env && forge create CloneRegistry --constructor-args 0x22f5413C075Ccd56D575A54763831C4c27A37Bdb --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --verify --etherscan-api-key=$ETHERSCAN_API_KEY
# source .env && forge create TemplateRegistry --constructor-args 0x22f5413C075Ccd56D575A54763831C4c27A37Bdb --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --verify --etherscan-api-key=$ETHERSCAN_API_KEY
# source .env && forge create DeploymentController --constructor-args 0x22f5413C075Ccd56D575A54763831C4c27A37Bdb 0x99fDFcC95a45ca4604E3c1eB86f2b5d9E217f460 0x57c041e4504b05A7B3A3597134a1DA78e719fc73 0x1Ea65ae3d7E60E374221cdE29844df81F447D68c --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --verify --etherscan-api-key=$ETHERSCAN_API_KEY

# Set Deployment Controller Ownership
# source .env && cast send 0x99fDFcC95a45ca4604E3c1eB86f2b5d9E217f460 "nominateNewOwner(address)" 0x87eBAC6021F133E217FF6b8e374cae2C3456936E --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && cast send 0x57c041e4504b05A7B3A3597134a1DA78e719fc73 "nominateNewOwner(address)" 0x87eBAC6021F133E217FF6b8e374cae2C3456936E --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && cast send 0x1Ea65ae3d7E60E374221cdE29844df81F447D68c "nominateNewOwner(address)" 0x87eBAC6021F133E217FF6b8e374cae2C3456936E --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && cast send 0x87eBAC6021F133E217FF6b8e374cae2C3456936E "acceptDependencyOwnership()" --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && cast send 0x87eBAC6021F133E217FF6b8e374cae2C3456936E "nominateNewOwner(address)" 0xcC09F5bd7582D02Bb31825d09589F4773B65eCc9 --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && cast send 0xcC09F5bd7582D02Bb31825d09589F4773B65eCc9 "execute(address, bytes)" 0x87eBAC6021F133E217FF6b8e374cae2C3456936E 0x79ba509700000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000 --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY

# Set up VaultController
source .env && forge create VaultController --constructor-args 0x22f5413C075Ccd56D575A54763831C4c27A37Bdb 0x7Edd61A58B5920dF39208E9888D8be713f639A60 0x58A2704deA4168D307EFF593E897eC73C6670F6A 0x2246c4c469735bCE95C120939b0C078EC37A08D0 0x1F381429943AFBb6870b3b9B0aB4707a6BdC2356 0x0E9C19bF470ecd5f167c97bF5f2FcA433adD2066 --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --verify --etherscan-api-key=$ETHERSCAN_API_KEY
# source .env && cast send 0xcC09F5bd7582D02Bb31825d09589F4773B65eCc9 "nominateNewOwner(address)" 0xF40749d72Ab5422CC5d735A373E66d67f7cA9393 --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY
# source .env && cast send 0xF40749d72Ab5422CC5d735A373E66d67f7cA9393 "acceptAdminProxyOwnership()" --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY

# Add Template Categories
# source .env && cast send 0x3602C76ab5ADA70d40A8e09BcfB91F2c195E20BE "addTemplateCategories(bytes32[])" [0x5661756c74000000000000000000000000000000000000000000000000000000,0x4164617074657200000000000000000000000000000000000000000000000000,0x5374726174656779000000000000000000000000000000000000000000000000,0x5374616b696e6700000000000000000000000000000000000000000000000000] --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --gas-limit=15000000

# Add Templates
# source .env && cast send 0x133D8127bed4bb7aD9Ba8e924590c0E771A308EE "addTemplate(bytes32, bytes32, (address, bool, string, bool, address, bytes4[8]))" 0x5374616b696e6700000000000000000000000000000000000000000000000000 0x4d756c74695265776172645374616b696e670000000000000000000000000000 "(0xb9cC3Eac603B7E90091909EA15c3caD0Bf57E5C6,false,'',true,0x0000000000000000000000000000000000000000,[0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000])" --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --gas-limit=15000000
# source .env && cast send 0x133D8127bed4bb7aD9Ba8e924590c0E771A308EE "addTemplate(bytes32, bytes32, (address, bool, string, bool, address, bytes4[8]))" 0x4164617074657200000000000000000000000000000000000000000000000000 0x596561726e416461707465720000000000000000000000000000000000000000 "(0x2732A8BB7f7BeF891a856b816FCcf73E8FDA28F1,false,'',true,0x79286Dd38C9017E5423073bAc11F53357Fc5C128,[0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000])" --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --gas-limit=15000000
# source .env && cast send 0x133D8127bed4bb7aD9Ba8e924590c0E771A308EE "addTemplate(bytes32, bytes32, (address, bool, string, bool, address, bytes4[8]))" 0x4164617074657200000000000000000000000000000000000000000000000000 0x4265656679416461707465720000000000000000000000000000000000000000 "(0x3B276E8621f455a04C2279bE3C1648780eF0414b,false,'',true,0x99470BE7c3C60548d417CADF2e8D75cFa6f57637,[0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000])" --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --gas-limit=15000000
# source .env && cast send 0x133D8127bed4bb7aD9Ba8e924590c0E771A308EE "addTemplate(bytes32, bytes32, (address, bool, string, bool, address, bytes4[8]))" 0x5661756c74000000000000000000000000000000000000000000000000000000 0x5631000000000000000000000000000000000000000000000000000000000000 "(0xCFE6B93BD6e6CA185E925D29ccfFb53C3a527162,false,'',true,0x0000000000000000000000000000000000000000,[0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000])" --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --gas-limit=15000000
# source .env && cast send 0x3602C76ab5ADA70d40A8e09BcfB91F2c195E20BE "toggleTemplateEndorsements(bytes32[], bytes32[])" [0x5661756c74000000000000000000000000000000000000000000000000000000,0x4164617074657200000000000000000000000000000000000000000000000000,0x4164617074657200000000000000000000000000000000000000000000000000,0x5374616b696e6700000000000000000000000000000000000000000000000000] [0x5631000000000000000000000000000000000000000000000000000000000000,0x596561726e416461707465720000000000000000000000000000000000000000,0x4265656679416461707465720000000000000000000000000000000000000000,0x4d756c74695265776172645374616b696e670000000000000000000000000000] --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --gas-limit=15000000

# Deploy Vaults
# source .env && cast send 0x6F0fecBC276de8fC69257065fE47C5a03d986394 "approve(address, uint256)" 0x3602C76ab5ADA70d40A8e09BcfB91F2c195E20BE 100000000000000000000 --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --gas-limit=15000000
# source .env && cast send 0x3602C76ab5ADA70d40A8e09BcfB91F2c195E20BE "deployVault((address, address, (uint64, uint64, uint64,uint64), address, uint256, address), (bytes32, bytes), (bytes32, bytes), bool, bytes, (address, address, address, string, address[8], address, uint256), uint256)" '(0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1,0x0000000000000000000000000000000000000000,(0,0,0,0),0x22f5413C075Ccd56D575A54763831C4c27A37Bdb,115792089237316195423570985008687907853269984665640564039457584007913129639935,0x22f5413C075Ccd56D575A54763831C4c27A37Bdb)' '(0x596561726e416461707465720000000000000000000000000000000000000000,0x)' '(0x0000000000000000000000000000000000000000000000000000000000000000,0x)' true 0x0000000000000000000000006f0fecbc276de8fc69257065fe47c5a03d98639400000000000000000000000000000000000000000000000000005af3107a40000000000000000000000000000000000000000000000000056bc75e2d631000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 '(0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x22f5413C075Ccd56D575A54763831C4c27A37Bdb,QmdnDwaR7ExUmVMoVADwmVwES84NWqGtWMn2yswhZgZC8b,[0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000],0x0000000000000000000000000000000000000000,1)' 0 --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --gas-limit=15000000
# source .env && cast send 0x3602C76ab5ADA70d40A8e09BcfB91F2c195E20BE "deployVault((address, address, (uint64, uint64, uint64,uint64), address, uint256, address), (bytes32, bytes), (bytes32, bytes), bool, bytes, (address, address, address, string, address[8], address, uint256), uint256)" '(0x2e17b8193566345a2Dd467183526dEdc42d2d5A8,0x0000000000000000000000000000000000000000,(0,0,0,0),0x22f5413C075Ccd56D575A54763831C4c27A37Bdb,115792089237316195423570985008687907853269984665640564039457584007913129639935,0x22f5413C075Ccd56D575A54763831C4c27A37Bdb)' '(0x4265656679416461707465720000000000000000000000000000000000000000,0x000000000000000000000000e2f035f59de6a952ff699b4edd0f99c466f25fec0000000000000000000000000000000000000000000000000000000000000000)' '(0x0000000000000000000000000000000000000000000000000000000000000000,0x)' true 0x0000000000000000000000006f0fecbc276de8fc69257065fe47c5a03d98639400000000000000000000000000000000000000000000000000005af3107a40000000000000000000000000000000000000000000000000056bc75e2d631000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 '(0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x22f5413C075Ccd56D575A54763831C4c27A37Bdb,QmYmzycZrD28BhRw6TxZKbwfgvXccg2ygkpKJZ5JcejjFH,[0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000,0x0000000000000000000000000000000000000000],0x0000000000000000000000000000000000000000,1)' 0 --rpc-url=$FORKING_RPC_URL --private-key=$PRIVATE_KEY --gas-limit=15000000