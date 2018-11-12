/* global artifacts */
const TransferEth = artifacts.require('TransferEth.sol')

const transferEth = async (deployer, network) => {
    await deployer.deploy(TransferEth)
}
module.exports = transferEth