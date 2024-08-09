const UnlockingContract = artifacts.require("UnlockingContract");

contract("UnlockingContract", accounts => {
    it("should unlock BTC", async () => {
        const instance = await UnlockingContract.deployed();
        await instance.addLockedBTC("0x123", 1000, { from: accounts[0] });
        await instance.burn("0x123", 500, { from: accounts[0] });
        const balance = await instance.lockedBTC.call("0x123");
        assert.equal(balance.toNumber(), 500, "BTC was not unlocked correctly");
    });
});
