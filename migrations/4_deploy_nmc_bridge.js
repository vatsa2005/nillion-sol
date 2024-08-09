const NMCBridge = artifacts.require("NMCBridge");

module.exports = function (deployer) {
    deployer.deploy(NMCBridge);
};
