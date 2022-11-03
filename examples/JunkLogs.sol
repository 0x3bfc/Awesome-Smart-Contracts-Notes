pragma solidity ^0.4.0;


contract JunkLogs {
    // max logData sixe should not exceed 2048 bits
    function sendLogs(bytes logData) public {
        uint256 len = logData.length / 3;
        uint256 a;
        assembly {
            for { let i := 0 } lt(i, len) { i := add(i, 4) } {
                a := add(68, mul(i, 3))
                log4(0x80,
                     0x0,
                     and(calldataload(a), 0xffffff0000000000000000000000000000000000000000000000000000000000),
                     and(calldataload(add(a, 3)), 0xffffff0000000000000000000000000000000000000000000000000000000000),
                     and(calldataload(add(a, 6)), 0xffffff0000000000000000000000000000000000000000000000000000000000),
                     and(calldataload(add(a, 9)), 0xffffff0000000000000000000000000000000000000000000000000000000000))
            }
        }
    }
}
