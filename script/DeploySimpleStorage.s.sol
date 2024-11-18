// DeploySimpleStorage.s.sol -> The s is just a foundry convention to know it's a scripting  file

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        // foundry cheat code -> and it  send everything after the broadcast will be send to RPC
        // Any tx we need to send will need to be put between vm.startBroadcast() and vm.stopBroadcast()
        // So we can put code that we do need to send tx before the vm.startBroadcast(); and after vm.stopBroadcast();
        // for example creating a variable; uint256 number = 1;
        vm.startBroadcast();
        // Create new contract
        SimpleStorage simpleStorage = new SimpleStorage();

        vm.stopBroadcast();

        return simpleStorage;
    }
}
