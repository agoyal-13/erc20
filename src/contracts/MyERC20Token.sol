// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20 {
    constructor(uint256 _supply) ERC20("MyERC20Token", "OT") {
        _mint(msg.sender, _supply);
    }
}
