// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    //functions or methods that modifies state of a blockchain requires gas fee

    //Types: String, boolean, address, uint, int, bytes
    // The variable favoriteNumber get initialized to zero
    uint256 public myFavoriteNumber;

    // How mapping works?
    mapping(string => uint256) public nameToFavoriteNumber;

    //Struct is like a class in OOP?
    // It just defines structure of a related data.
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    //-> Using the custom type Person to create data for jay and you , a better way is to use
    // Array (list of data ) , because what if we have more than 2 people to add ?

    // Person public jay = Person({favoriteNumber: 5, name: "jay"});
    // Person public you = Person({favoriteNumber: 10, name: "You"});

    // -> An array of Person struct (default to an empty array , until we add data)
    Person[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function retreive() public view returns (uint256) {
        return myFavoriteNumber;
    }

    //calldata, memory, storage
    function addPerson(string calldata _name, uint256 _favoriteNumber) public {
        //Another way to push to an array -> Person memory newPerson = Person({favoriteNumber: _favoriteNumber, name: _name});

        // Person.push(newPerson);

        people.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
