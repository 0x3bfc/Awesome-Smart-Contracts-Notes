pragma solidity ^0.4.25;

library Set {
    // these data will be stored in the calling contract
    struct Data { mapping(uint => bool) flags; }
    
    function insert(Data storage self, uint value) public returns (bool) {
        if (self.flags[value])
            return false; // already there
        self.flags[value] = true;
        return true;
    }
    
    function remove(Data storage self, uint value) public returns (bool) {
        if (!self.flags[value])
            return false; // not there
        self.flags[value] = false;
        return true;
    }

    function contains(Data storage self, uint value) public view returns (bool) {
        return self.flags[value];
    }
}

contract PlayWithSet {
    Set.Data knownValues;

    function register(uint value) public {
        // The library functions can be called without a
        // specific instance of the library, since the
        // "instance" will be the current contract.
        require(Set.insert(knownValues, value));
    }
    // In this contract, we can also directly access knownValues.flags, if we want.
}

