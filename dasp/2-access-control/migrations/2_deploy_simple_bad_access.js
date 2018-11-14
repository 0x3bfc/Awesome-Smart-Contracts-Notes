/* global artifacts */
const SimpleBadAccess = artifacts.require('SimpleBadAccess.sol')

const simpleBadAccess = async (deployer, network) => {
    await deployer.deploy(SimpleBadAccess)
}
module.exports = simpleBadAccess