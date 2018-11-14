/* eslint-env mocha */
/* eslint-disable no-console */
/* global assert */
const Web3 = require('web3')
const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'))
const TransferEth = artifacts.require('TransferEth.sol')
const AttackTransferEth = artifacts.require('AttackTransferEth.sol')

contract('AttackTransferEth', (accounts) => {
    describe('Test Reentrancy Attack of Bad Transfer Ether Contract', () => {
        let transferEth, attackTransferEth
        before(async () => {
            transferEth = await TransferEth.new()
            attackTransferEth = await AttackTransferEth.new(transferEth.address)

            // add some deposit on the transfer contract by other users
            const addEth1 = await transferEth.deposit({ from: accounts[0], value: 5000000000000000000 }) // add 5 eth
            const addEth2 = await transferEth.deposit({ from: accounts[1], value: 5000000000000000000 }) // add 5 eth
            // Now the contract has 10 Eth
        })

        it('Should able to attack the transfer ether contract', async () => {

            const attack = await attackTransferEth.attack(5, 500000000000000000, { from: accounts[2] })
            for(var i = 0; i < attack.logs.length ;i++) {
                console.log('\t > Count: ', attack.logs[i].args.i.toNumber(), 'Attacker Contract Balance:', attack.logs[i].args.balance)
            }
        })
    })

})

