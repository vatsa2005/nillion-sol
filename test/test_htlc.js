const HTLC = artifacts.require("HTLC");

contract("HTLC", accounts => {
    it("should allow withdrawal with correct preimage", async () => {
        const hashlock = web3.utils.sha3("secret");
        const instance = await HTLC.new(hashlock, 3600, accounts[1], { from: accounts[0], value: 1000 });

        await instance.withdraw("secret", { from: accounts[1] });
        const balance = await web3.eth.getBalance(accounts[1]);
        assert.isAbove(Number(balance), 1000, "Withdrawal failed");
    });

    it("should allow refund after timelock", async () => {
        const hashlock = web3.utils.sha3("secret");
        const instance = await HTLC.new(hashlock, 1, accounts[1], { from: accounts[0], value: 1000 });

        await new Promise(resolve => setTimeout(resolve, 2000));
        await instance.refund({ from: accounts[0] });
        const balance = await web3.eth.getBalance(accounts[0]);
        assert.isAbove(Number(balance), 1000, "Refund failed");
    });
});
