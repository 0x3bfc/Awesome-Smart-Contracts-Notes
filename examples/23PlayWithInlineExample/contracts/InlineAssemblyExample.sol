pragma solidity ^0.4.25;

contract PlayWithInLineAssembly {
    function add(uint256 _a, uint256 _b) public pure 
      returns (uint256 result) 
        {
            assembly {
              // Solidity always stores a free memory pointer at position 0x40
              // load into stack from memory @0x40
              let aPtr := mload(0x40) 
              // increment bPtr by adding 32 bytes offset to 0x40
              let bPtr := add(aPtr, 32) 
              // copy call data (_a) into memory: after first 4 bytes (function selector)
              calldatacopy(aPtr, 4, 32) 
              // copy call data (_b) into memory: after first (4bytes + 32 bytes)
              calldatacopy(bPtr, add(4, 32), 32) 
              // load data (aPtr, bPtr) from memory into stack
              result := add(mload(aPtr), mload(bPtr)) // sum two data values and assign the output to result 
        }
    }
}

