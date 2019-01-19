pargma solidity ^0.4.25;

contract Ownable{
    address owner;
    
    modifier onlyOwner(){
        require(msg.sender == owner, 'invalid contract owner');
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function delegateOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}

// built-in modifiers view and pure

contract FuncDeclarationExample{
    function f1(uint a, uint b) public view returns(uint){
        return (a * b) + now;
    }
    
    function f2(uint a, uint b) public pure returns(uint){
        // TypeError: Function declared as pure, but this expression (potentially) reads from the environment or state
        return (a * b) + now; 
    }
}
