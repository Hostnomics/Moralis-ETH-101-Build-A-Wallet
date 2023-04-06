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

    // ERROR: "Type int256 is not implicitly convertible to expected type uint256" (4:25): https://academy.moralis.io/lessons/arrays
    // expecting uint, so change to uint, BECAUSE we can't have NEGATIVE numbers which "int" would include!
    // function getNumber(int _index) public returns (int) {
    //     return numbers[_index];
    // }

    // ERROR: "Function state mutability can be restricted to view"
    // function getNumber(uint _index) public returns (int) {

    //AT (7:06) change returns to int[] memory
    //function getNumber(uint _index) public view returns (int) {
    function getNumbers() public view returns (int[] memory) {
        //Return argument type int256 is not implicitly convertible to expected type (type of first return variable) int256[] memory
        // return numbers[_index];
        return numbers; //return the entire numbers array
    }
}
