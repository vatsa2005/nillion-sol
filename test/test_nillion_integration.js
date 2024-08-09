const NillionIntegration = artifacts.require("NillionIntegration");

contract("NillionIntegration", accounts => {
    let nillionInstance;

    before(async () => {
        nillionInstance = await NillionIntegration.deployed();
    });

    it("should store data using Nillion", async () => {
        await nillionInstance.storeData("0x123", "Sample Data", { from: accounts[0] });
        // Add assertions based on the Nillion network's response
    });

    it("should request computation using Nillion", async () => {
        const computationId = await nillionInstance.requestComputation("add", "1+1", { from: accounts[0] });
        assert(computationId, "Computation ID should not be empty");
    });

    it("should retrieve computation result from Nillion", async () => {
        const computationId = await nillionInstance.requestComputation("add", "1+1", { from: accounts[0] });
        // Simulate some delay for computation to complete
        await new Promise(resolve => setTimeout(resolve, 5000));
        const result = await nillionInstance.getComputationResult(computationId);
        assert(result, "Result should not be empty");
        assert.equal(result, "2", "Computation result should be 2");
    });
});
