const{getAccount} = require('./helpers')
require('ethers');
require('@openzeppelin/hardhat-upgrades')

async function deployUpgradable(key,hre){
    
    const contract  = await hre.ethers.getContractFactory("NFT",getAccount(key));
    console.log('Deploying contract');
    const proxy  = await hre.upgrades.deployProxy(contract,['flybear','AI arts']);
    await proxy.deployed();
    console.log(`contract deployed to ${proxy.address}`);
}
async function upgradeContract(key,hre){
    const updatedContract  = await hre.ethers.getContractFactory("NFT");
    console.log('Updating contract');
    await upgrades.upgradeProxy(process.env.NFT_CONTRACT_PROXY_ADDRESS,updatedContract)
    console.log('contract updated');

}
module.exports = {
    deployUpgradable,
    upgradeContract
}