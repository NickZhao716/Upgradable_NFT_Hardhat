// SPDX-License-Identifier: MIT
pragma solidity 0.8.2;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is Initializable, ERC721Upgradeable, ERC721URIStorageUpgradeable, PausableUpgradeable, OwnableUpgradeable, ERC721BurnableUpgradeable, UUPSUpgradeable {

    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;
    event tokenOwnerInfo(address indexed owner, string tokenURI, uint256 mintPrice);
    uint256 public mintPrice;
    uint256 public maxTokenQuantity;
    string baseTokenURI;
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    modifier validMintCall(){
        require(msg.value >= mintPrice,"no enough service fee");
        require(currentTokenId.current()< maxTokenQuantity,"no more NFT can be minted");
        _;
    }
   
    function initialize(string memory _name,string memory _symbol) initializer public {
        __ERC721_init(_name, _symbol);
        __ERC721URIStorage_init();
        __Pausable_init();
        __Ownable_init();
        __ERC721Burnable_init();
        __UUPSUpgradeable_init();
        currentTokenId.reset();
        baseTokenURI = '';
        mintPrice = 0.18 ether;
        maxTokenQuantity = 100;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mintTo(address to) 
    public 
    payable
    validMintCall
    {
        uint256 tokenId = currentTokenId.current();
        _safeMint(to,tokenId);
        emit tokenOwnerInfo
        (
         to,
         string(abi.encodePacked(baseTokenURI,'/',tokenId)), 
         mintPrice
         );
         

         currentTokenId.increment();
    }

    function safeMint(address to, uint256 tokenId, string memory uri)
        public
        onlyOwner
    {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function _setBaseURI(string memory _baseTokenURI)
    public
    onlyOwner
    {
        baseTokenURI = _baseTokenURI;
    }

    function _baseURI()
    internal view
    virtual
    override
    returns(string memory)
    {
        return baseTokenURI;
    }

    function getBaseURI()
    public
    view
    returns(string memory)
    {
        return baseTokenURI;
    }
    



    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId)
        internal
        override(ERC721Upgradeable, ERC721URIStorageUpgradeable)
    {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721Upgradeable, ERC721URIStorageUpgradeable)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function flybearSpecial()
    public
    view
    returns(string memory)
    {
        return 'flybear best';
    }
}
