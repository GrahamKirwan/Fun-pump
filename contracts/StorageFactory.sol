// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

// We can explicitly call the contract we want to import from SimpleStorage.sol
import {SimpleStorage} from './SimpleStorage.sol';

contract StorageFactory {

    // Declare this array of contracts the same way we would with a uint or a struct etc
    SimpleStorage[] public listOfSimpleStorageContracts;

    // Create a new simple storgae contract and add it to the array
    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    // Create an sfStore function that will take in an index and a favNum and store it in the chosen contract
    function sfStore(uint256 _contractIndex, uint256 _newFavNum) public {
        listOfSimpleStorageContracts[_contractIndex].storeFavNum(_newFavNum);
    }

    // Create an sfGet function that will get the favNum of the indexed contract
    function sfGet(uint256 _contractIndex) public view returns(uint256) {
        return listOfSimpleStorageContracts[_contractIndex].retreiveFavNum();
    }
}