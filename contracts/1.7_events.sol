// FROM: https://academy.moralis.io/lessons/events-3

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Bank {
    mapping(address => uint) balance;

    address owner;

    //Added Event (2:02): https://academy.moralis.io/lessons/events-3 - triggers when addBalance fn used
    // event balanceAdded(uint amount, address depositedTo);
    //(5:09) Covers "indexed" - we can use the indexed parameters to search/query for those events
    // event balanceAdded(uint indexed amount, address indexed depositedTo);
    //(5:30) - Don't need to index amount b/c we won't search for that, but we will search for depositedTo addy
    event balanceAdded(uint amount, address indexed depositedTo);

    //Added transfer event
    event transferCompleted(
        address indexed from,
        address indexed to,
        uint amount
    );

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Sorry, you are not the Owner/deployer of this contract"
        );
        _; // (Modifers @ 5:03) - Underscore means run the function.
    }

    constructor() {
        owner = msg.sender; //address owner = "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4";
    }

    function addBalance(uint _toAdd) public onlyOwner returns (uint) {
        // (2:50) Modifiers - Move common repeatable code to modifer: "onlyOwner" (1:45)
        balance[msg.sender] += _toAdd;
        // (3:07) Use emit to trigger Event `balanceAdded`: https://academy.moralis.io/lessons/events-3
        emit balanceAdded(_toAdd, msg.sender);
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

        //Added transferCompleted Event:
        emit transferCompleted(msg.sender, recipient, amount);

        assert(balance[msg.sender] == previousSenderBalance - amount); //ex => 250 = 250 (1000 - 750)
        //event logs and further checks.
    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount; // balance[msg.sender] -= amount;
        balance[to] += amount; // balance[recipient] += amount;
    }
}
