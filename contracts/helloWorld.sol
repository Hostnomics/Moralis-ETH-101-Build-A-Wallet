// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract helloWorld {
    function hello() public returns (string memory) {
        string memory message = "Hello World";
        return message;
    }
}
