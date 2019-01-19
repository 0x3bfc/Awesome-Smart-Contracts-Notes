pragma solidity ^0.5.2;

contract Divide{
    function devide(uint numerator,uint denominator) 
    public 
    pure 
    returns(uint quotient, uint remainder){
        quotient = numerator / denominator;
        remainder = numerator - denominator * quotient;
    }
}
