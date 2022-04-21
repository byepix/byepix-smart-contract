// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC1155/ERC1155.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract BYEPIXVL is Ownable, ERC1155 {
    string private baseURI;
    string public symbol;
    string public name;

    mapping(uint => string) public itemURI;

   constructor(string memory _name ,  string memory _symbol) ERC1155("") {
    name = _name ;
    symbol = _symbol;
  }

    function setURI(string memory _newuri) public onlyOwner {
        _setURI(_newuri);
    }

    function setName(string memory _name) public onlyOwner {
        name = _name;
    }
    
    function setSymbol(string memory _symbol) public onlyOwner {
        symbol = _symbol;
    }
       
       
    function mint(address _to, uint _id, uint _amount) external onlyOwner {
    _mint(_to, _id, _amount, "");
    }

    function burn(uint _id, uint _amount) external {
     _burn(msg.sender, _id, _amount);
    }

    function setURI(uint _id, string memory _uri) external onlyOwner {
    itemURI[_id] = _uri;
    emit URI(_uri, _id);
  }


}