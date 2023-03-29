// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract HelloWorldStruct {
    //FROM: https://academy.moralis.io/lessons/structs-3
    //Define own data structure, the properties a Person object should have here:
    struct Person {
        uint age;
        string name;
    }

    // Person Array
    Person[] people;

    function addPerson(uint _age, string memory _name) public {
        Person memory variableNewPerson = Person(_age, _name);
        // Person memory variableNewPerson = Person(30, "Bob");
        //Add to people Array:
        people.push(variableNewPerson);
    }

    function getPerson(uint _index) public view returns (uint, string memory) {
        Person memory personToReturn = people[_index];
        return (personToReturn.age, personToReturn.name);
    }
}
