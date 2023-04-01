// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Bank {
    mapping(address => uint) balance;

    address owner;

    constructor() {
        owner = msg.sender; //address owner = "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4";
    }

    //Modifiers (0:40): https://academy.moralis.io/lessons/modifiers-2
    // modifiers are like mini-functions.
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Sorry, you are not the Owner/deployer of this contract"
        );
        _; // (Modifers @ 5:03) - Underscore means run the function.
    }

    // When virtual machine runs our modifer onlyOwner ends up looking like this:
    // modifier onlyOwner {
    //     require(msg.sender == owner, "Sorry, you are not the Owner/deployer of this contract");
    //     balance[msg.sender] += _toAdd;
    //     return balance[msg.sender];
    // }

    //(Modifiers @ 6:10 - Modifers can have arguments which would then be passed to the function header:
    // modifier onlyOwner (uint number){
    //     require(msg.sender == number);
    //     _;
    // }

    // function addBalance(uint _toAdd) public onlyOwner(100) NOT onlyOwner(uint number) returns (uint){}
    //**************************************************************************************************

    //********* (Modifiers @ 7:00) Another Common Modifier ***********************************************8
    modifier costs(uint price) {
        require(msg.value >= price);
        _; //run the function.
    }

    //     function transfer(address recipient, uint amount)  public costs(100) {}

    //     function getBalance() public view costs(10) returns (uint) {}

    //**************************************************************************************************

    function addBalance(uint _toAdd) public onlyOwner returns (uint) {
        // (2:50) Modifiers
        //Move common repeatable code to modifer: (1:45)
        // require(msg.sender == owner, "Sorry, you are not the Owner/deployer of this contract");

        balance[msg.sender] += _toAdd;
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
        //event logs and further checks.
    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount; // balance[msg.sender] -= amount;
        balance[to] += amount; // balance[recipient] += amount;
    }
}
