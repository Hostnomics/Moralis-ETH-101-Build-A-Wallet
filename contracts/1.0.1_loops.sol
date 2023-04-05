// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract HelloWorldLoops {
    //while loop
    function countWhile(int number) public pure returns (int) {
        int i = 0;
        while (i > 10) {
            number++;
            i++;
        }
        return number;
    }

    //for loop
    function countFor(int number) public pure returns (int) {
        // int i = 0;
        for (int i = 0; i < 10; i++) {
            number++;
        }
        return number;
    }
}
