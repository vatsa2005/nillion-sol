# System Architecture

## Components

1. **Smart Contracts**: Solidity contracts for locking/unlocking BTC and HTLC.
2. **Bitcoin Scripts**: Scripts for locking/unlocking BTC.
3. **Relayers**: Scripts to relay transactions between Bitcoin and Ethereum.
4. **Oracles**: Scripts to provide price feeds.
5. **Nillion Integration**: Smart contracts and scripts for interacting with Nillion's network.

## Flow

1. **Locking BTC**: User locks BTC using `LockingContract` and equivalent wBTC is minted on Ethereum.
2. **HTLC**: Facilitates atomic swaps using hashlock and timelock.
3. **Unlocking BTC**: User burns wBTC using `UnlockingContract` and BTC is released on Bitcoin.
4. **Nillion Network**: Used for secure computations and data storage.
