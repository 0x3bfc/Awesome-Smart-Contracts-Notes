pragma solidity ^0.5.2;

contract PlayWithOperators{
    function andOperator(uint x, uint y, uint k) public pure returns(bool state){
        addmod(x, y, k) >0 && mulmod(x, y, k) > 0 ? state = true: state = false;
    }
}
