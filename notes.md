## General Notes and checklists

#### ZeppelinOS Upgradability checklist

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
