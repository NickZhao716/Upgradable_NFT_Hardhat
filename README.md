# Upgradeable NFT Contracts with 100 tokens

Our first NFT project here!
Basic contract is an implementation of ERC721Upgradeable so that it can be upgraded when needed


## steps to try by your own

**Preparations**  
1) install some Open Zeppelin packages  
```bash
  npm install @openzeppelin/contracts-upgradeable  
```
2) write .env file of your own Private Key and API Key  

**Metadata**  
3) upload your package of images into decentralize storage, get the URI and update correspond uri in the uu.py file  
4) run ***'python tt.py'*** to execute it and get the generated metadata for all the images  
5) run ***'npx ipfs-car --pack metadata --output metadata.car'*** and upload generated metadata.car to [ NFT storage ](https://nft.storage/)  
6) upload metadata.car to [NFT.storage](https://nft.storage/)

**Deploy contract**  
7) deploy contract using ***'npx hardhat deploy'***  
8) update the .env file with new contract address  

**Set basic URL and Mint**  
9) update the base uri of contract  
```bash
  npx hardhat set-base-token-uri-ug --base-url "https://bafybeif6iuokmmcuwj7jgscybx3gvlcwkb6ybspwcduivl7mbqmgmmxubi.ipfs.dweb.link/metadata/"
```
10) mint  
```bash
   npx hardhat mint-ug --address 0x0B60cF83FB41B8CF6f808eA519742A8EB087A76A
   npx hardhat mint-ug-multiple --address 0x0B60cF83FB41B8CF6f808eA519742A8EB087A76A (it will mint 10 tokens in one-time run)
```
11) see your NFT in opensea with the link: https://testnets.opensea.io/assets/<contract_address>/<token_ID>  

**Upgrade**  
12) there are two ways to upgrade contract:  
    a)  simply revise original solidity file and upgrade  
    b)  write a new contract and upgrade  
  in this project, just run ***scripts/upgrade.js***




some useful commands:
1) npx hardhat   --to see all available TASK OPTION
