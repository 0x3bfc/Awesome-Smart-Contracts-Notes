pragma solidity ^0.4.25;

contract LowLevelCallsExample{
    mapping(address => bytes32[]) assets;
    function register(bytes32 asset) public returns(bool){
        assets[msg.sender].push(asset);
    }
}

contract CallCodeCaller{
    // call LowLevelCallsExample.register
    address callee;
    
    constructor(address _callee) public {
        callee = _callee;
    }
    
    function registerAsset(bytes32 asset) public returns(bool){
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
        return _callee.delegatecall(bytes4(keccak256('register')), _number);
    }
}
