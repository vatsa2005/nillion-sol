// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LockingContract {
    mapping(bytes32 => uint256) public lockedBTC;
    address public owner;

    event Locked(address indexed user, bytes32 btcAddress, uint256 amount);
    event Unlocked(address indexed user, bytes32 btcAddress, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function lock(bytes32 btcAddress, uint256 amount) external onlyOwner {
        lockedBTC[btcAddress] += amount;
        emit Locked(msg.sender, btcAddress, amount);
    }

    function unlock(bytes32 btcAddress, uint256 amount) external onlyOwner {
        require(lockedBTC[btcAddress] >= amount, "Insufficient balance");
        lockedBTC[btcAddress] -= amount;
        emit Unlocked(msg.sender, btcAddress, amount);
    }
}
