pragma solidity ^0.5.02;

contract InternalVsPrivate{
    bool private b = false;
    function f1() internal view returns(bool){
        return b;
    }
    
    function f2() private view returns(bool){
        return f1();
    }
    
    function f3() internal view returns(bool){
        return f2();
    }
}

contract Caller is InternalVsPrivate{
    function testPrivate() public view returns(bool){
        return f2(); // won't work!
    }
    
    function testInternal() public view returns(bool){
        return f1(); // works!
    }
}
