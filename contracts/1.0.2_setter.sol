// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract HelloWorldSetter {
    int number;

    function getNumber() public view returns (int) {
        return number;
    }

    function setNumber(int _number) public {
        number = _number;
    }
}
