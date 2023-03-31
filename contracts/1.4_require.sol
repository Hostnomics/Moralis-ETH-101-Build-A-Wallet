// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Bank {
    mapping(address => uint) balance;

    address owner; //Added (5:56): https://academy.moralis.io/lessons/require

    //Hardcoded: address owner = "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4";
    constructor() {
        owner = msg.sender;
    }

    //balance to add           returns new balance
    function addBalance(uint _toAdd) public returns (uint) {
        //Added (5:56): https://academy.moralis.io/lessons/require
        require(
            msg.sender == owner,
            "Sorry, you are not the Owner/deployer of this contract"
        );

        // balance[msg.sender] = balance[msg.sender] + _toAdd;
        balance[msg.sender] += _toAdd;
        return balance[msg.sender];
    }

    function getBalance() public view returns (uint) {
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        //Later, check that msg.sender has sufficient funds:
        //FROM (1:12): https://academy.moralis.io/lessons/require
        require(balance[msg.sender] >= amount, "Not enough ETH brah!");

        //(2:17)
        require(msg.sender != recipient, "Can't send ETH to yourself!");

        _transfer(msg.sender, recipient, amount);

        //event logs and further checks.
    }

    function _transfer(address from, address to, uint amount) private {
        // balance[msg.sender] -= amount;
        // balance[recipient] += amount;
        balance[from] -= amount;
        balance[to] += amount;
    }
}
