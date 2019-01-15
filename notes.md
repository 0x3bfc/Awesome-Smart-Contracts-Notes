## General Notes and checklists

### 1. ZeppelinOS Upgradability checklist

##### Contracts

- [ ] You must add initializers. 
- [ ] Don't forget to initialize the inherited contracts
- [ ] Make sure that all the initial values are set in an initializer function. Otherwise,
any upgrable instance will not have these fields sets
- [ ] When you create new instance of an arbitray contract inside contract, 
pass the instance of that contract to initialize function
- [ ] You can create new contract instances on the fly using `BaseApp` in ZeppelinOS
- [ ] Rememeber nothing prevent malicious actor from sending transactions
- [ ] Make sure to add the new variables at the end
- [ ] be careful when you introduce new updates to the contracts
- [ ] be careful with the solidity inheretance linearization 
  - [ ] Avoid base contracts swapping
  - [ ] Avoid adding new variables to the base contracts. A workaround for this is to declare unused variables on base contracts that you may want to extend in the future, as a means of "reserving" those slots. Note that this trick does not involve increased gas usage.

##### Unit testing

- [ ] ZOS provides `TestHelper()` function which in turn returns project structure from `ZOS.json`
- [ ] Set `NODE_ENV=test truffle test` then invoke `TestHelper()` in the test suit setup 
- [ ] To generate new instance of contracts use `createProxy` function
- [ ] Truffle does not know how to resolve situations where contracts has functions
that have matching names but different operands or arguments. For unit test call `initialize` manually by using `encodeCall`
