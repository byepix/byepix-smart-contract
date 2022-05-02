// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BXNFT is ERC721URIStorage, Ownable {

    constructor(string memory _name ,  string memory _symbol) ERC721(_name, _symbol) onlyOwner  {

      }

    /** 

      tokenURI  : WBE
      tokenId : WBE

    **/
    
   function setBXTokenURI(uint256 _tokenId, string memory tokenURI)  public onlyOwner
    {
        _setTokenURI(_tokenId, tokenURI);
    }

    function createToken(string memory tokenURI, uint256 tokenId) public onlyOwner returns (bool) {
      _mint(msg.sender, tokenId);
      _setTokenURI(tokenId, tokenURI);
      return true;
    }

}
