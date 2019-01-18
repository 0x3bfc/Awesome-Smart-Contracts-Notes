pragma solidity ^0.4.25;

contract Constants {
    uint constant x = 3 ** 22 + 8;
    string constant text = 'abc';
    bytes32 constant hash = keccak256('abc');
}
