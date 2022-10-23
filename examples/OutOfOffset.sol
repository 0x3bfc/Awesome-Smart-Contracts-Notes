//SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

// THIS CONTRACT SHOULD GENERATE AN OUT OF OFFSET ERROR.
contract Instance {
    function foo(address target) public {
        assembly {
          calldatacopy(0, 0, calldatasize())
          let result := delegatecall(gas(), target, 0, calldatasize(), 0, 0)
          // trying to copy data from outside the range of what was actually returned.
          returndatacopy(0, 0, add(returndatasize(), 40))
          // returndatacopy(0, 0, add(returndatasize())) // this line should work
       }
    }
}
