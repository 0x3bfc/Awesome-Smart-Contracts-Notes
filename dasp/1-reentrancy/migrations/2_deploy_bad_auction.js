/* global artifacts */
const BadAuction = artifacts.require('BadAuction.sol')

const badauction = async (deployer, network) => {
    await deployer.deploy(BadAuction)
}
module.exports = badauction