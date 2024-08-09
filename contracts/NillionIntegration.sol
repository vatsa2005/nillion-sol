// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INillion {
    function requestComputation(string memory operation, string memory data) external returns (bytes32);
    function getResult(bytes32 id) external view returns (string memory);
}

contract NillionIntegration {
    address public nillionAddress;

    event DataStored(bytes32 indexed id, string data);
    event ComputationRequested(bytes32 indexed id, string operation, string data);
    event ComputationResult(bytes32 indexed id, string result);

    constructor(address _nillionAddress) {
        nillionAddress = _nillionAddress;
    }

    function storeData(bytes32 id, string memory data) public {
        // Logic to interact with Nillion network for storage
        emit DataStored(id, data);
    }

    function requestComputation(string memory operation, string memory data) public returns (bytes32) {
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
