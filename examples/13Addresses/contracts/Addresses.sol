pragma solidity ^0.5.2;

contract Addresses {
    function getContractAddress() 
    public 
    view 
    returns(address){
        return address(this);
    }
}
