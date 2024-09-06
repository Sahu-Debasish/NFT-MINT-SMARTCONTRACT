// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTRental is Ownable {

    struct LeaseAgreement {
        address lessor;     // The owner of the NFT
        address lessee;     // The renter
        uint256 tokenId;
        uint256 startTime;
        uint256 endTime;
        uint256 rentAmount; // In wei
        bool isActive;
    }

    IERC721 public nftContract;
    mapping(uint256 => LeaseAgreement) public leaseAgreements;

    event NFTLeased(address lessor, address lessee, uint256 tokenId, uint256 startTime, uint256 endTime, uint256 rentAmount);
    event LeaseEnded(uint256 tokenId);

    constructor(address _nftContractAddress) {
        nftContract = IERC721(_nftContractAddress);
    }

    // Lease an NFT to another address
    function leaseNFT(uint256 tokenId, uint256 duration, uint256 rentAmount, address lessee) public {
        require(nftContract.ownerOf(tokenId) == msg.sender, "Not the NFT owner");
        require(leaseAgreements[tokenId].isActive == false, "NFT is already leased");

        // Transfer the NFT to the smart contract for the duration of the lease
        nftContract.transferFrom(msg.sender, address(this), tokenId);

        // Create a new lease agreement
        leaseAgreements[tokenId] = LeaseAgreement({
            lessor: msg.sender,
            lessee: lessee,
            tokenId: tokenId,
            startTime: block.timestamp,
            endTime: block.timestamp + duration,
            rentAmount: rentAmount,
            isActive: true
        });

        emit NFTLeased(msg.sender, lessee, tokenId, block.timestamp, block.timestamp + duration, rentAmount);
    }

    // Complete the lease and return the NFT to the owner
    function endLease(uint256 tokenId) public {
        LeaseAgreement memory lease = leaseAgreements[tokenId];
        require(lease.isActive, "Lease not active");
        require(block.timestamp >= lease.endTime, "Lease period has not ended yet");

        // Transfer the NFT back to the owner
        nftContract.transferFrom(address(this), lease.lessor, tokenId);

        // Mark the lease as inactive
        leaseAgreements[tokenId].isActive = false;

        emit LeaseEnded(tokenId);
    }

    // Lessee can pay the rent
    function payRent(uint256 tokenId) public payable {
        LeaseAgreement memory lease = leaseAgreements[tokenId];
        require(lease.isActive, "No active lease for this token");
        require(msg.sender == lease.lessee, "Not the lessee");

        // Pay rent to the lessor
        payable(lease.lessor).transfer(lease.rentAmount);
    }

    // Fetch current lease agreement details
    function getLeaseAgreement(uint256 tokenId) public view returns (LeaseAgreement memory) {
        return leaseAgreements[tokenId];
    }
}
// Chnage according your project 
