const LockingContract = artifacts.require("LockingContract");

contract("LockingContract", accounts => {
    it("should lock BTC", async () => {
        const instance = await LockingContract.deployed();
        await instance.lock("0x123", 1000, { from: accounts[0] });
        const balance = await instance.lockedBTC.call("0x123");
        assert.equal(balance.toNumber(), 1000, "BTC was not locked correctly");
    });
});
