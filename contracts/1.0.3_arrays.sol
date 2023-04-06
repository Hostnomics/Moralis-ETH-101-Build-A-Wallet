// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract HelloWorldArrays {
    // int number;
    // int[3] numbers = [2, 5, 6];

    // int[3] numbers; //push function not worked with fixed sized arrays
    int[] numbers;

    function addNumber(int _number) public {
        numbers.push(_number);
    }

    // function getNumber() public view returns (int) {
    //     return number;
    // }

    // function setNumber(int _number) public {
    //     number = _number;
    // }
}
