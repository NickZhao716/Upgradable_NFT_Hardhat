/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require('dotenv').config();
require("@nomiclabs/hardhat-ethers");
require('@openzeppelin/hardhat-upgrades');
require('./tasks/NFTTask.js');
require("@nomiclabs/hardhat-etherscan");

const{ALCHEMY_KEY,ACCOUNT_SK_0,ACCOUNT_SK_1,ACCOUNT_SK_2,ETHERSCAN_API_KEY,INFURA_KEY} = process.env;

module.exports = {
  solidity: "0.8.2",
  defaultNetwork: "ropsten",
  networks:{
    ropsten:{
      url: `https://ropsten.infura.io/v3/${INFURA_KEY}`,
      accounts: 
      [
        `0x${ACCOUNT_SK_0}`,
        `0x${ACCOUNT_SK_1}`,
        `0x${ACCOUNT_SK_2}`
      ]
    },
    rinkeby:{
      url: `https://rinkeby.infura.io/v3/${INFURA_KEY}`,
      accounts: 
      [
        `0x${ACCOUNT_SK_0}`,
        `0x${ACCOUNT_SK_1}`,
        `0x${ACCOUNT_SK_2}`
      ]
    },
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
}