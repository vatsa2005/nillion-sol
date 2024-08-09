// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INillion {
    function requestComputation(string memory operation, string memory data) external returns (bytes32);
    function getResult(bytes32 id) external view returns (string memory);
}

contract NMCBridge {
    address public nillionAddress;
    address public owner;

    event ComputationRequested(bytes32 indexed id, string operation, string data);
    event ComputationResult(bytes32 indexed id, string result);
    event KeyStored(bytes32 indexed id, string encryptedKey);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(address _nillionAddress) {
        nillionAddress = _nillionAddress;
        owner = msg.sender;
    }

    function storeKey(bytes32 id, string memory encryptedKey) public onlyOwner {
        // Store encrypted key in a decentralized manner
        emit KeyStored(id, encryptedKey);
    }

    function requestComputation(string memory operation, string memory data) public onlyOwner returns (bytes32) {
        INillion nillion = INillion(nillionAddress);
        bytes32 computationId = nillion.requestComputation(operation, data);
        emit ComputationRequested(computationId, operation, data);
        return computationId;
    }

    function getComputationResult(bytes32 computationId) public view returns (string memory) {
        INillion nillion = INillion(nillionAddress);
        string memory result = nillion.getResult(computationId);
        emit ComputationResult(computationId, result);
        return result;
    }
}
