// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnlockingContract {
    mapping(bytes32 => uint256) public lockedBTC;
    address public owner;

    event Burned(address indexed user, bytes32 btcAddress, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function burn(bytes32 btcAddress, uint256 amount) external onlyOwner {
        require(lockedBTC[btcAddress] >= amount, "Insufficient balance");
        lockedBTC[btcAddress] -= amount;
        emit Burned(msg.sender, btcAddress, amount);
    }

    function addLockedBTC(bytes32 btcAddress, uint256 amount) external onlyOwner {
        lockedBTC[btcAddress] += amount;
    }
}
