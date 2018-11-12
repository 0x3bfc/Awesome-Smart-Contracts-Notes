pragma solidity ^0.4.25;

/**
@title Bad Auction Contract https://blog.ethereum.org/2016/06/10/smart-contract-security/
**/

contract BadAuction {

  address highestBidder = address(0);
  uint256 highestBid = 0;

    function bid() public payable {
        if (msg.value < highestBid) throw;
        if (highestBidder != address(0))
            if(highestBidder.call.value(highestBid)()) throw;

        highestBidder = msg.sender;
        highestBid = msg.value;
  }
}