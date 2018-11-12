pragma solidity ^0.4.25;

contract TransferEth {

  function withdraw(uint256 _value) {
    if (!msg.sender.call.value(_value)()) throw;
  }

  function deposit() payable {
    address(this).send(msg.value);
  }
}