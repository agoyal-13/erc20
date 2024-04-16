// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "@forge-std/Script.sol";
import {MyERC20Token} from "../src/contracts/MyERC20Token.sol";

contract DeployERC20Token is Script {
    uint256 public constant INITIAL_SUPPLY = 10000 ether;

    function run() external returns (MyERC20Token) {
        vm.startBroadcast();
        MyERC20Token token = new MyERC20Token(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return token;
    }
}
