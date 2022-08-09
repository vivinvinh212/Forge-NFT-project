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
        assertEq(cutie.MAX_SUPPLY(), 100);
    }

    function testMint() public {
        vm.startPrank(alice);
        vm.deal(alice, 1 ether);
        cutie.safeMint{value: 0.01 ether}(1);
        vm.stopPrank();
        assertEq(cutie.balanceOf(alice), 1);
    }

    //test for unsuccesfull mint due to insuffucient funds//
    function testFailMint() public {
        vm.startPrank(bob);
        vm.deal(bob, 0.005 ether);
        cutie.safeMint{value: 0.01 ether}(1);
        vm.stopPrank();
        assertEq(cutie.balanceOf(bob), 1);
    }

    function testWithdrawFromOwner() public {
        // switch to a diffent acount and mint a nft to have funds in contrat//
        vm.startPrank(bob);
        vm.deal(bob, 1 ether);
        cutie.safeMint{value: 0.01 ether}(1);
        assertEq(cutie.balanceOf(bob), 1);
        vm.stopPrank();
        //call withdraw with owner address//
        vm.startPrank(owner);
        cutie.withdraw();
        assertEq(owner.balance, 0.01 ether);
    }
}
