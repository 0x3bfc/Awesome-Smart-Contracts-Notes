pragma solidity ^0.5.0;

contract PlayWithFixedSizeArray{
    function comparison(bytes2 b1, bytes2 b2) public pure returns(bool){
        return b1 > b2;
    }
    
    function getByIndex(bytes2 b1, uint256 _index) public pure returns (byte) {
        require(b1.length > _index, 'invalid index');
        return b1[_index];
    }
    
    function bitwise(bytes2 b1, bytes2 b2) public pure returns (bytes2){
        return b1 & b2;
    }
    
    function playWithByteArray(byte[] memory b) public pure returns(uint8[2] memory){
        return [b[0].length, b[1].length];
    }
}
