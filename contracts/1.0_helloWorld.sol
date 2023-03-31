// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract helloWorld {
    //state variables
    //Examples:
    int a = -1; // signed integer can be negative
    uint aa = 2; // unsigned integer, only positive (>=0)
    address d = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; //unique data type to solidity

    //use this one
    string message;

    //constructors - set initial state
    constructor(string memory _message) {
        message = _message; //set by deployer of contract
    }

    function helloView() public view returns (string memory) {
        // READS from state variable elsewhere (above) in the contract.
        // VIEW can't CANGE a state variable like message = "changed message";
        return message;
    }

    function helloPure() public pure returns (string memory) {
        // string memory message = "Hello World";
        // NO interaction with any other part of this contract:

        // https://academy.moralis.io/lessons/variables-scope - (2:50)
        string
            memory localMessage = "Local function scope variables must have data location type specified. Memory most common.";

        // return "PURE predefined string output here";
        return localMessage;
    }
}
