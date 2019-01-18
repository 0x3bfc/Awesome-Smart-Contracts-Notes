pragma solidity ^0.5.2;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract SampleContract is Ownable {
    // state variable
    uint24 public x = 343;
    // events 
    event SampleEvent(uint24 x);
    // function modifiers
    modifier SampleModifier(uint24 y) {
        require(x == y);
        _;
    }
    // functions 
    function SampleFunction(uint24 y) 
    public 
    SampleModifier(y) 
    returns(bool) 
    {
        emit SampleEvent(y);
        return true;
    }
}
