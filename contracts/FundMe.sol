// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

// Import chainlink data stream ABI
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe {

    uint256 public minimumUSD = 5e18; 

    function fund() public payable { 
        // ** If this require statement fails, nothing after this line of code will execute, and gas will be refunded for all computation after this line.
        // ** Also, if a state variable is changed in the line before this require statement and the require fails, the state variable chnage will be reset to original state
        require(getConversionRate(msg.value) > minimumUSD, "Didn't send enough ETH");
    }

    // Withdraw function

    // Fetch the ETH price
    function getPrice() public view returns(uint256) {
        // ABI is grabbed by passing chainlink pricefeed address for Shepholia ETH(0x69...) into the AggregatorV3Interface
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int answer,,,) = priceFeed.latestRoundData(); // The commas are important since 5 items are returned from .latestRoundData()
        return uint256(answer * 1e10); // Mutiplying by 1e10 just adds 10 zeros to the end + typecast answer into a uint256

    }

    // Conversion rate function (How much is 1ETH worth in USD?)
    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        return ethAmount * getPrice() / 1e18; // 2738
    }

}
