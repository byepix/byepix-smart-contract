// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/ownership/Ownable.sol";


contract EPIXNFT is ERC1155, Ownable {

    string private _name;
    
    string private _symbol;


    function name() external view returns (string memory) {
        return _name;
    }

    /**
     * @dev Gets the token symbol.
     * @return string representing the token symbol
     */
    function symbol() external view returns (string memory) {
        return _symbol;
    }

    function mint(address userac, uint256 itemID, uint256 amount, bytes memory data) public onlyOwner
    {
        _mint(userac, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) public onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}