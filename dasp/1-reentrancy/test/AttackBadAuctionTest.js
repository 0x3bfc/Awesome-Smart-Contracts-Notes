/* eslint-env mocha */
/* eslint-disable no-console */
/* global assert */
const Web3 = require('web3')
const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'))
const BadAuction = artifacts.require('BadAuction.sol')
const AttackBadAuction = artifacts.require('AttackBadAuction.sol')

contract('AttackBadAuction', (accounts) => {
    describe('Test Reentrancy Attack of Bad Auction Contract', () => {
        let badAuction, attackBadAuction
        before(async () => {
            badAuction = await BadAuction.new()
            attackBadAuction = await AttackBadAuction.new(badAuction.address)
        })

        it('Should able to attack the bad auction', async () => {

           const bid = await attackBadAuction.attackAuction({ from: accounts[0], value: 1000000000000000000 }) // 1 Ether
           const attack = await attackBadAuction.attackAuction({ from: accounts[1], value: 500000000000000000 }) // 2 Ether
           console.log(bid.logs[0].args.value.toNumber())
           console.log(attack.logs[0].args.value.toNumber())
           const currentBalance = await attackBadAuction.getBalance()
           console.log(currentBalance.logs[0].args.value.toNumber())
        })
    })

})