// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {DeployERC20Token} from "../../script/DeployERC20Token.s.sol";
import {MyERC20Token} from "../../src/contracts/MyERC20Token.sol";
import {Test} from "@forge-std/Test.sol";

contract MyERC20TokenTest is Test {
    MyERC20Token public myToken;
    DeployERC20Token public deployer;

    uint256 public constant STARTING_BALANCE = 100 ether;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    function setUp() public {
        deployer = new DeployERC20Token();
        myToken = deployer.run();

        vm.prank(msg.sender);
        myToken.transfer(bob, STARTING_BALANCE);
    }

    function testInitialSupply() public {
        assertEq(myToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    function testBobBalance() public {
        assertEq(myToken.balanceOf(bob), STARTING_BALANCE);
    }

    function testAllowancesWork() public {
        uint256 initialAllowance = 1000;

        vm.prank(bob);
        myToken.approve(alice, initialAllowance);

        uint256 transferAmount = 1000;
        vm.prank(alice);
        myToken.transferFrom(bob, alice, transferAmount);

        assertEq(myToken.balanceOf(alice), transferAmount);
        assertEq(myToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }
}
