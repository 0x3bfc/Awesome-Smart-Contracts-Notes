/* global artifacts */
const SimpleAccess = artifacts.require('SimpleAccess.sol')

const simpleAccess = async (deployer, network) => {
    await deployer.deploy(SimpleAccess)
}
module.exports = simpleAccess