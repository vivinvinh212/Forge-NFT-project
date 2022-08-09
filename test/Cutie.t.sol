// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Figbot.sol";

contract FigbotTest is Test {
    Figbot figbot;
    address owner = address(0x1223);
    address alice = address(0x1889);
    address bob = address(0x1778);

    function setUp() public {
        vm.startPrank(owner);
        figbot = new Figbot();
        vm.stopPrank();
    }
}
