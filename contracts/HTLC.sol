// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HTLC {
    bytes32 public hashlock;
    uint256 public timelock;
    address public sender;
    address public receiver;
    uint256 public amount;

    constructor(bytes32 _hashlock, uint256 _timelock, address _receiver) payable {
        sender = msg.sender;
        receiver = _receiver;
        hashlock = _hashlock;
        timelock = block.timestamp + _timelock;
        amount = msg.value;
    }

    function withdraw(bytes32 _preimage) external {
        require(sha256(abi.encodePacked(_preimage)) == hashlock, "Invalid preimage");
        require(block.timestamp < timelock, "Timelock expired");
        payable(receiver).transfer(amount);
    }

    function refund() external {
        require(block.timestamp >= timelock, "Timelock not expired");
        payable(sender).transfer(amount);
    }
}
