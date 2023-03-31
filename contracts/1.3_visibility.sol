// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Bank {
    //BACKGROUND: https://academy.moralis.io/lessons/introduction-to-visibility-2
    // FROM: https://academy.moralis.io/lessons/introduction-to-visibility-2
    // FOUR TYPES OF VISIBILITY: "From where should our fn/variable be able to be called?"
    // 1. Public - everyone. Anyone can access variable or execute function.
    // regardless if call from within THIS K or other contracts on blockchain or external service like Remix. (1:05)
    // 2. Private (2:08) - only from WITHIN That contract itself. (not remix, or later on after deployed from outside)
    // - Often helper functions to another function (like a another public fn).
    // - Also placed on state variables
    // DOES NOT mean the data is protected, Anyone can see it, just can't EXECUTE IT.
    // 3. Internal - Private and contracts deriving from it.
    // Only from within THIS contract and subsequent K's deriving from it. Like "Private Plus (Inheritance)"
    // 4. External - (4:34) - Only executed from OTHER contracts. (Not the current K you are in).
    // Useful to restrict certain functionality so not called by mistake. Often by automated interactions b/t Ks.
    //

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

    // transfer() function FROM: (00:43): https://academy.moralis.io/lessons/implementing-visibility
    function transfer(address recipient, uint amount) public {
        //Later, check that msg.sender has sufficient funds:

        _transfer(msg.sender, recipient, amount);

        //event logs and further checks.
    }

    // (3:48) Common convention to name INTERNAL functions with underscore
    function _transfer(address from, address to, uint amount) private {
        // balance[msg.sender] -= amount;
        // balance[recipient] += amount;
        balance[from] -= amount;
        balance[to] += amount;
    }
}
