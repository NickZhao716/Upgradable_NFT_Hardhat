const { task } = require("hardhat/config");
const{getEnvVariable,getAccount} = require('/Users/Flybear/Documents/VSProjects/NFTUpgradable/utils/helpers');
const{deployUpgradable,upgradeContract} = require('/Users/Flybear/Documents/VSProjects/NFTUpgradable/utils/contractOp');


task("account_balance","Get EOA balance")
.addParam("id","Account id")
.setAction( async function(taskArguments,hre){
    const account = getAccount(taskArguments.id);
    console.log(`Account balance for ${account.address}: ${await account.getBalance()}`);
}
);

task("deploy", "Deploy NFT.sol contract")
.addParam("id","Account id")
.setAction( async function(taskArguments,hre){
   await deployUpgradable(taskArguments.id,hre);
}
);

task("upgrade","Update NFT.sol contract")
.addParam("id","Account id")
.setAction(async function(taskArguments,hre){
    await upgradeContract(taskArguments.id,hre);
}
);

