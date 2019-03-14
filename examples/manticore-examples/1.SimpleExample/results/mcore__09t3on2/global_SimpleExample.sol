pragma solidity 0.5.3;

contract SimpleExample{
    function foo(uint256 a) payable public {
        if(a == 40){
            revert();
        }
    }
}
