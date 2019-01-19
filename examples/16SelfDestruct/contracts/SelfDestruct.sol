contract SelfDestruct{
    uint val;
    address public owner;
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    constructor() public{ 
        owner = msg.sender; 
    }
    
    function test(uint _val) public {
        val = _val;
    }
    
    function kill() public onlyOwner {
        // selfdestruct clears all the contract's data, 
        // it frees up space on the blockchain (exactly 
        // from the current and future state tree (a Merkle 
        //patricia tree) not from the previous blocks, 
        //the contract bytecode will remain in a old block 
        // but its account will be no longer accessible). 
        // https://ethereum.stackexchange.com/questions/10793/contracts-state-after-a-selfdestruct#10852
        selfdestruct(address(this));
    }
}
