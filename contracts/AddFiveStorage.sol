// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {SimpleStorage} from './SimpleStorage.sol';

// Inherit functions from SimpleStorage
contract AddFiveStorage is SimpleStorage {

    // We can create the same function that SimpleStorage has, but we can 'override' its functionality (Have to add 'virtual' to original)
    function storeFavNum(uint256 _favNum) override public {
        myFavNum =  _favNum + 5;
    }
}