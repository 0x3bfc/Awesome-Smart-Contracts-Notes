pragma solidity ^0.5.2;

contract FixedPointNumbers{
    function divide(uint x, uint y) public pure returns(fixed8x2){
        //UnimplementedFeatureError: Not yet implemented - FixedPointType.
        return fixed8x2(x/y);
    }
}
