/* global artifacts */
const AttackTransferEth = artifacts.require('AttackTransferEth.sol')
const TransferEth = artifacts.require('TransferEth.sol')
const attack = async (deployer, network) => {
    await deployer.deploy(AttackTransferEth, TransferEth.address)
}
module.exports = attack