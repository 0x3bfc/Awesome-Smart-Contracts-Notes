pragma solidity ^0.4.25;

contract Ownable {
    address owner;
    event Killed(string _contract);
    modifier onlyOnwer(){
        require(
            owner == msg.sender,
            'invalid owner'
            );
        _;
    }
    constructor() public {
        owner = msg.sender;
    }
    function kill() public onlyOnwer {
        emit Killed('Ownable');
        selfdestruct(owner);
    }
}
contract Base1 is Ownable {
    
}

contract Base2 {
    event Killed(string _contract);
    function kill() public{
        emit Killed('Base2');
    }
}

contract Base3 is Base2, Base1 {
    
}

contract Final is Base3 {
    function kill() public {
        super.kill();
    }
}

