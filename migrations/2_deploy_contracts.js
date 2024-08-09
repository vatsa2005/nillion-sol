const LockingContract = artifacts.require("LockingContract");
const UnlockingContract = artifacts.require("UnlockingContract");
const HTLC = artifacts.require("HTLC");

module.exports = function (deployer) {
    deployer.deploy(LockingContract);
    deployer.deploy(UnlockingContract);
    deployer.deploy(HTLC);
};
