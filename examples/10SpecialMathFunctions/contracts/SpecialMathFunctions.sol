pragma solidity ^0.5.2;

contract SpecialMathFunctions{

    function getAddMod(uint x, uint y, uint z) public pure returns(uint){
        return addmod(x, y, z); // 10, 3, 5
    }
    
    function getMultMod(uint x, uint y, uint z) public pure returns(uint){
        return mulmod(x, y, z); // 10, 3, 5
    }
}
