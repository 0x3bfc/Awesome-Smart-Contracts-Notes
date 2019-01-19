pragma solidity ^0.4.25;

interface Token {
    function transfer(address recipient, uint amount) external;
}

library Triangle {
    function area(uint256 b, uint256 h) public pure returns(uint256){
        if (b == 0 || h == 0){
            return 0;
        }
        return (b * h)/2; 
    }
}

contract PlayWithTriangle {
    function calculateArea(uint256 b, uint256 h) public pure returns(uint256){
        return Triangle.area(b, h);
    }
}
