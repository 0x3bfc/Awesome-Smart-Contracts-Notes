pragma solidity ^0.4.25;

contract SimpleBadAccess{

    address private owner;
    constructor() public {
        // init contract owner
        owner = msg.sender;
    }
    // fix this using modifier checkout SimpleAccess.sol
    function resetContractOwner() public returns(bool) {
        owner = msg.sender;
        return true;
    }

    function getContractOwner() public view returns(address) {
        return owner;
    }
}