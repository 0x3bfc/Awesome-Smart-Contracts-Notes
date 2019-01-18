pragma solidity ^0.5.2;

contract A{
    function f(uint _in) public pure returns(uint _out){
        return _in;
    }
    function f(address _address) public pure returns(address){
        return _address;
    }
}
