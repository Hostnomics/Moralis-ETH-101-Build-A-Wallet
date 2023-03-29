// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract helloWorld {
    //state variables
    string message;

    //constructors - set initial state
    constructor(string memory _message) {
        message = _message; //set by deployer of contract
    }

    function hello() public returns (string memory) {
        // string memory message = "Hello World";
        return message;
    }
}
