pragma solidity ^0.5.2;

contract FuncGetters{
    uint8 public data = 1;
}

contract Getter1{
    FuncGetters funcGetter = new FuncGetters();
    
    function x() public view returns(uint8 val){
        return funcGetter.data(); //external access
    }
}

contract Getter2 is FuncGetters{
    function x() public view returns(uint8 val){
        return data; // internal access
    }
    
    function y() public view returns(uint8 val){
        return this.data(); // external access
    }
}
