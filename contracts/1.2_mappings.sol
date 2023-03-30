// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract mappingHelloWorld {
    //FROM: https://academy.moralis.io/lessons/mappings-introduction
    // FORMAT: mapping(keyType=>valueType)balance;
    // Array (50 users), requires 50 searches to find Address => Balance
    // Mapping instantly. When know Key. (6:30): https://academy.moralis.io/lessons/mappings-introduction

    mapping(address => uint) balance;

    //balance to add           returns new balance
    function addBalance(uint _toAdd) public returns (uint) {
        // balance[msg.sender] = balance[msg.sender] + _toAdd;
        balance[msg.sender] += _toAdd;
        return balance[msg.sender];
    }

    function getBalance() public view returns (uint) {
        return balance[msg.sender];
    }
}
