// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Cutie.sol";

contract CutieTest is Test {
    Cutie cutie;
    address owner = address(0x1223);
    address alice = address(0x1889);
    address bob = address(0x1778);

    function setUp() public {
        vm.startPrank(owner);
        cutie = new Cutie();
        vm.stopPrank();
    }

    function testMaxSupply() public {
        assertEq(Cutie.MAX_SUPPLY(), 100);
    }
}
