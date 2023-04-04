## Solidity Concepts

1. Constructors [_See Constructors here_](https://academy.moralis.io/lessons/constructors-2).
2. Structs [_See Structs here_](https://academy.moralis.io/lessons/structs-3).
3. Mappings [_See Mappings here_](https://academy.moralis.io/lessons/mappings-2).
4. Visibility [_See Visibility here_](https://academy.moralis.io/lessons/implementing-visibility).
5. Error Handling
   - require
   - assert
6. Data Location

   - memory
   - storage
   - calldata

7. Events [_See Events here_](https://academy.moralis.io/lessons/events-3).
   - We trigger event with `emit` in the function we want

```js
//Added Event (2:02): https://academy.moralis.io/lessons/events-3 - triggers when addBalance fn used
    event balanceAdded(uint amount, address depositedTo);
//(5:09) Covers "indexed" - we can use the indexed parameters to search/query for those events
    event balanceAdded(uint indexed amount, address indexed depositedTo);
//(5:30) - Don't need to index amount b/c we won't search for that, but we will search for depositedTo addy
    event balanceAdded(uint amount, address indexed depositedTo);

//Using the emit keyword in the addBalance Function:
    function addBalance(uint _toAdd) public onlyOwner returns (uint) {
        balance[msg.sender] += _toAdd;
// (3:07) Use emit to trigger Event `balanceAdded`: https://academy.moralis.io/lessons/events-3
        emit balanceAdded(_toAdd, msg.sender);
        return balance[msg.sender];
    }

```

**This EVENT is now logged**

```json
[
  {
    "logIndex": 1,
    "blockNumber": 27,
    "blockHash": "0x858e88799665d19f07b1bde70c55e5cce02b1698c0dfde9db8ac14eaa1396483",
    "transactionHash": "0x0d18c491afb2fd2fb96e9654a585b0eaac43b832d11abefe5bfcdbc3f84e9615",
    "transactionIndex": 0,
    "address": "0xb7bb1792BBfabbA361c46DC5860940e0E1bFb4b9",
    "data": "0x0000000000000000000000000000000000000000000000000000000000000064",
    "topics": [
      "0xdb42e689d0c993b1eaac62924e67d96c365c40778a39beaaaf6865b061a93f32",
      "0x000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb2"
    ],
    "id": "log_5936afa9"
  }
]
```

As shown in this screen shot:
![balanceAdded event in logs](https://i.imgur.com/j91B5e8.png).

8. Payable Functions [_See Payable here_](https://academy.moralis.io/lessons/payable-functions-3).
