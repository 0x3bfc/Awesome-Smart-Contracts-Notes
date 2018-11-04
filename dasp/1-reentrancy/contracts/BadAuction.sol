pragma solidity ^0.4.25;

/**
@title Bad Auction Contract https://blog.ethereum.org/2016/06/10/smart-contract-security/
**/

contract BadAuction {

  address highestBidder;
  uint highestBid;

  function bid(uint _value) public {
    if (_value < highestBid) throw;
    if (highestBidder != 0)
      highestBidder.send(highestBid); // refund previous bidder
    highestBidder = msg.sender;
    highestBid = _value;
  }
}