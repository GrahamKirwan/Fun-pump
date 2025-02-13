// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; // stating our version - compiler versions

contract SimpleStorage {

    uint256 myFavNum = 6; // state variable

    // uint256[] lisOfFavNums;
    
    // Define a struct
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    // Define a dynamic array
    Person[] public listOfPeople;

    // Mapping (Better than an array since we can map content with a 'key' to easily find - Think a dictionary)
    mapping (string => uint256) public nameToFavNumber;

    // Storage function ('virtual' is for an overriding function in AddFiveStorage)
    function storeFavNum(uint256 _favNum) public virtual {
        myFavNum =  _favNum;
    }

    // Retreival function
    function retreiveFavNum() public view returns(uint256) {
        return myFavNum;
    }

    // Add a person of struct type Person to a dynamic array and add them to our mapping
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, _name)); 
        nameToFavNumber[_name] = _favouriteNumber;
    }
}