const NMCBridge = artifacts.require("NMCBridge");

contract("NMCBridge", accounts => {
    let nmcBridgeInstance;

    before(async () => {
        nmcBridgeInstance = await NMCBridge.deployed();
    });

    it("should store encrypted key using Nillion", async () => {
        await nmcBridgeInstance.storeKey("0x123", "encryptedKey", { from: accounts[0] });
        // Add assertions based on the Nillion network's response
    });

    it("should request computation using Nillion", async () => {
        const computationId = await nmcBridgeInstance.requestComputation("operation", "data", { from: accounts[0] });
        assert(computationId, "Computation ID should not be empty");
    });

    it("should retrieve computation result from Nillion", async () => {
        const computationId = await nmcBridgeInstance.requestComputation("operation", "data", { from: accounts[0] });
        // Simulate some delay for computation to complete
        await new Promise(resolve => setTimeout(resolve, 5000));
        const result = await nmcBridgeInstance.getComputationResult(computationId);
        assert(result, "Result should not be empty");
    });
});
