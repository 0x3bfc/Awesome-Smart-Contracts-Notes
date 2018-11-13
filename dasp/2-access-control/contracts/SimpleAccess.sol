pragma solidity ^0.4.25;

contract SimpleBadAccess{

    address private owner;
    modifier isOwner() {
        require(msg.sender == owner, 'access denied');
        _;
    }

    constructor() public {
        // init contract owner
        owner = msg.sender;
    }
    function resetContractOwner() public isOwner() returns(bool) {
        owner = msg.sender;
        return true;
    }

    function getContractOwner() public view returns(address) {
        return owner;
    }
}