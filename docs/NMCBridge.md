# NMC Bridge

## Overview

The NMC Bridge leverages Nillion's NMC (Nil Message Compute) protocol to create a trustless Bitcoin bridge. It uses secure encryption, secret sharing, and cross-chain witness validation to enable the secure and decentralized transfer of Bitcoin to other blockchains.

## Components

- **NMCBridge.sol**: Smart contract handling Nillion integration for encryption, computation requests, and result retrieval.
- **NMCBridgeUtils.py**: Script for encryption, secret sharing, and interaction with Nillion's MPC capabilities.

## Process

### Initial Encryption

Encrypt the Bitcoin secret key using a symmetric encryption scheme with a condition-based ciphertext on Ethereum.

### Generating Particles

Apply a One-Time Mask (OTM) to generate masked particles.

### Blinding Factor Sharing

Distribute the blinding factors using Linear Secret Sharing (LSS).

### Particle Distribution

Distribute the masked particles across the decentralized network.

### Witness Condition Validation

Validate the predefined condition on Ethereum and generate a witness proof.

### Reconstruction and Decryption

Reconstruct the blinding factors and unmask the particles to recover the original ciphertext. Decrypt to obtain the Bitcoin secret key.

## Advantages

- **Decentralization**: No central trusted authority.
- **Security**: Confidentiality and integrity of the Bitcoin secret key.
- **Cross-chain Interoperability**: Secure transfer of Bitcoin to other blockchains.
- **Fault Tolerance**: Secret can be reconstructed even if some nodes are unavailable.

## Usage

1. Deploy `NMCBridge` contract with Nillion network address.
2. Use `storeKey` to store encrypted keys.
3. Request computations using `requestComputation`.
4. Retrieve results using `getComputationResult`.
