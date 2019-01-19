pragma solidity ^0.5.0;

import 'github.com/openzeppelin/openzeppelin-solidity/contracts/cryptography/ECDSA.sol';

contract PlayWithSignatures{
    function isValidSignature(
        bytes32 hash, 
        bytes memory signature, 
        address consumer
    ) public returns(bool) {
        return (consumer == ECDSA.recover(hash, signature));
    }
}
