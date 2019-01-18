/* global artifacts */
const SampleContract = artifacts.require('SampleContract.sol')

const sampleContract = async (deployer, network) => {
    await deployer.deploy(SampleContract)
}
module.exports = sampleContract
