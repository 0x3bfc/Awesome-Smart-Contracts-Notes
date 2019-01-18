pragma solidity ^0.4.25;

contract PlayWithAnonymousEvents{
    uint256 private counter = 0;
    event newEvent(string _value, uint256 _counter);
    function testEvent() public {
        counter +=1;
        emit newEvent("test event", counter);
    }
}
