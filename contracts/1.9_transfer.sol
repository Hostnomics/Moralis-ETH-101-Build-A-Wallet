// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Bank {
    mapping(address => uint) balance;

    address owner;

    constructor() {
        owner = msg.sender;
    }

    // event balanceAdded(uint amount, address indexed depositedTo);
    event depositDone(uint amount, address indexed depositedTo);

    modifier onlyOwner() {
        require(msg.sender == owner);
        _; //run the function
    }

    //Updated (2:00) https://academy.moralis.io/lessons/payable-functions-3
    // function addBalance(uint _toAdd) public returns (uint){
    function deposit() public payable returns (uint) {
        // require(msg.sender == owner, "Sorry, you are not the Owner/deployer of this contract");
        // balance[msg.sender] += _toAdd;
        balance[msg.sender] += msg.value;
        // emit depositDone(_toAdd, msg.sender);
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }

    //Added withddraw (00:29): https://academy.moralis.io/lessons/transfer
    function withdraw(uint amount) public returns (uint) {
        // msg.sender is an address
        // address payable toSend = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
        // toSend.transfer(amount);

        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return balance[msg.sender];
    }

    function getBalance() public view returns (uint) {
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Not enough ETH brah!");
        require(msg.sender != recipient, "Can't send ETH to yourself!");

        uint previousSenderBalance = balance[msg.sender]; //ex 1000

        _transfer(msg.sender, recipient, amount); //ex send 750
        assert(balance[msg.sender] == previousSenderBalance - amount); //ex => 250 = 250 (1000 - 750)
    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
}
