pragma solidity ^0.4.25;

contract ExternalVsPublic{
    uint b = 10;
    function f1() external view returns(uint a){
        a = b;
    }
}

contract Caller is ExternalVsPublic {
    function f2() public view returns(uint a){
        return this.f1(); // external
    }
    
    function f3() public view returns(uint a){
        return f2(); // public
    }
}
