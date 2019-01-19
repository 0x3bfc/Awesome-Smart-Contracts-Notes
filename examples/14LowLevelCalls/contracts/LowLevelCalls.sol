pragma solidity ^0.5.2;

contract CallCodeCallee{
    mapping(address => bytes32[]) assets;
    function register(bytes32 asset) public returns(bool){
        assets[msg.sender].push(asset);
    }
}

contract CallCodeCaller{
    address callee;
    
    constructor(address _callee) public {
        callee = _callee;
    }
    
    function registerAsset(bytes32 asset) public returns(bool){
        return callee.callcode.gas(1000000).value(1 ether)('register', asset);
    }
}


contract CallCaller{
    address registryContract;
    constructor(address _registeryContract) public{
        registryContract = _registeryContract;
    }
    
    function register(uint256 number) public returns(bool){
        return registryContract.call.gas(1000000).value(1 ether)('register', number);
    }
}

contract CallCallee{
    uint256 number;
    
    function register(uint256 _number)public returns(bool){
        number = _number;
    }
}
