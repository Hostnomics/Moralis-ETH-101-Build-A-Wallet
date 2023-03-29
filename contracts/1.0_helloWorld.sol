// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract helloWorld {
    //state variables
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
        return "PURE predefined string output here";
    }
}
