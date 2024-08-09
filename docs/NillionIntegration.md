# Nillion Integration

## Overview

The Nillion network is used for secure multi-party computation (MPC) and decentralized storage.

## Smart Contracts

### NillionIntegration.sol

Handles interactions with Nillion's MPC and storage functionalities.

#### Methods

- `storeData(bytes32 id, string memory data)`: Stores data using Nillion's network.
- `requestComputation(string memory operation, string memory data)`: Requests a blind computation from Nillion.
- `getComputationResult(bytes32 computationId)`: Retrieves the result of a blind computation.

## Scripts

### NillionMPC.py

This script handles requests for blind computations and retrieves results from the Nillion network.

#### Methods

- `perform_mpc(operation, data)`: Requests a blind computation.
- `get_computation_result(computation_id)`: Retrieves the result of a blind computation.

## Configuration

### nillion-config.json

Configuration file for connecting to the Nillion network.

```json
{
    "networkUrl": "https://nillion-network-url",
    "apiKey": "your-nillion-api-key"
}
