const {ethers} = require('ethers');

function getEnvVariable(key){
    if(process.env[key])
    {
        return process.env[key];
    }
    else
    {
        throw `${key} is not found in env`;
    }
}

function getProvider(){
    return ethers.getDefaultProvider(getEnvVariable("NETWORK"),{infura: getEnvVariable("INFURA_KEY")});
}

function getAccount(key){
    var accountName = "ACCOUNT_SK_";
    accountName+= key;
    return new ethers.Wallet(getEnvVariable(accountName),getProvider());
}

module.exports = {
    getEnvVariable,
    getProvider,
    getAccount,
}

