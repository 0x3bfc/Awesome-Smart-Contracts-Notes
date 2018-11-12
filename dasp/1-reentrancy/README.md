# Reentrancy Attack


#### Code Examples:

   1. [Transfer Ether](contracts/TransferEth.sol)  and [Attacking Transfer Ether](contracts/AttackTransferEth.sol) contracts.
#### Quick start
##### 1. starting TestNet

Open a new terminal in order to start start `ganache-cli`. 

```bash
    $ ganache-cli
```

##### 2. Using terminal 2 
install, compile and migrate the following contracts
```bash
    $ npm install
    $ npm run compile
    $ npm run migrate 
```

#### 3. Run attacks

```
    $ turffle test
```

```bash
 Contract: AttackTransferEth
    Test Reentrancy Attack of Bad Transfer Ether Contract
         > Count:  1 Attacker Contract Balance: 500000000000000000
         > Count:  2 Attacker Contract Balance: 1000000000000000000
         > Count:  3 Attacker Contract Balance: 1500000000000000000
         > Count:  4 Attacker Contract Balance: 2000000000000000000
         > Count:  5 Attacker Contract Balance: 2500000000000000000
      ✓ Should able to attack the transfer ether contract (65ms)

```

### References:
- [Solidity Documentation: Reentrancy](https://solidity.readthedocs.io/en/develop/security-considerations.html#re-entrancy)
- [Ethereum Blogpost Smart Contract Security](https://blog.ethereum.org/2016/06/10/smart-contract-security/)

