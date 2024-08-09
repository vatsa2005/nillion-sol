const NillionIntegration = artifacts.require("NillionIntegration");

module.exports = function (deployer) {
    deployer.deploy(NillionIntegration);
};
