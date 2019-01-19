pragma solidity ^0.4.25;

contract LowLevelCallsExample{
    mapping(address => bytes32[]) public assets;
    
    function register(bytes32 asset) external returns(bool){
        assets[msg.sender].push(asset);
        return true;
    }
    
    function getRegisterSelector() public returns(bytes4){
        return this.register.selector;
    }
}

contract CallCodeCaller{
    // call LowLevelCallsExample.register
    address callee;
    
    constructor(address _callee) public {
        callee = _callee;
    }
    
    function registerAsset(bytes32 asset) public returns(bool){
        // should return false ... unknown function selector
        return callee.callcode.gas(1000000).value(1 ether)('register', asset);
    }
}


contract Callee{
    uint256 number;
    
    function register(uint256 _number)public returns(bool){
        number = _number;
    }
}

contract CallCaller1{
    address registryContract;
    constructor(address _registeryContract) public{
        registryContract = _registeryContract;
    }
    
    function register(uint256 number) public returns(bool){
        return registryContract.call.gas(1000000).value(1 ether)('register', number);
    }
}

contract CallCaller2{
    address registryContract;
    constructor(address _registeryContract) public{
        registryContract = _registeryContract;
    }
    
    function register(uint256 number) public returns(bool){
        return registryContract.call(bytes4(keccak256('register()')), number);
    }
}


contract DelegateCalls{
    function delegateMyCall(
        address _callee, 
        uint256 _number
    )
    public
    returns (bool){
        return _callee.delegatecall(
            // function selector 4 bytes
            bytes4(
                keccak256('register(uint256)')
            ), 
            // hash --> bytes32
            keccak256(
                abi.encodePacked(_number))
            );
    }
    
    function getHash(uint _number) public pure returns(bytes32){
        return keccak256(
                abi.encodePacked(_number)
            );
    }
}


contract TestCall{
    function testcall(address _callee, uint _number) public returns(bool){
        return _callee.call.gas(10000000).value(1 ether)(bytes4(
            keccak256('register(bytes32)')),
            keccak256(_number));
    }
}

