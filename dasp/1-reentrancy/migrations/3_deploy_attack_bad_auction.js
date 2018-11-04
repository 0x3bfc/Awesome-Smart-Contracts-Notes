/* global artifacts */
const AttackBadAuction = artifacts.require('AttackBadAuction.sol')
const BadAuction = artifacts.require('BadAuction.sol')
const attackdadauction = async (deployer, network) => {
    await deployer.deploy(AttackBadAuction, BadAuction.address)
}
module.exports = attackdadauction