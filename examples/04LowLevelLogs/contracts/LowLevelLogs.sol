pragma solidity ^0.4.25;

contract LowLevelLog {
    function f() public {
        bytes32 _id = 0x420042;
        log1(
            bytes32(msg.sender),
            _id
        );
    }
}
