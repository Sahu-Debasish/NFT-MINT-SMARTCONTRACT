// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FractionalNFT is ERC721, Ownable {
    ERC20 public fractionalToken; // Token representing fractional ownership

    struct FractionalNFTData {
        uint256 tokenId;
        uint256 totalFractions;
        uint256 fractionsAvailable;
    }

    mapping(uint256 => FractionalNFTData) public fractionalNFTs;

    event NFTFractionalized(uint256 tokenId, uint256 totalFractions);
    event NFTPurchased(uint256 tokenId, address buyer, uint256 amount);

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        fractionalToken = new ERC20("Fractional Token", "FT");
    }

    // Mint an NFT and fractionalize it
    function mintAndFractionalize(address to, uint256 tokenId, string memory tokenURI, uint256 totalFractions) public onlyOwner {
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);

        // Register fractional ownership data
        fractionalNFTs[tokenId] = FractionalNFTData({
            tokenId: tokenId,
            totalFractions: totalFractions,
            fractionsAvailable: totalFractions
        });

        // Mint fractional tokens representing ownership shares
        fractionalToken.mint(to, totalFractions);

        emit NFTFractionalized(tokenId, totalFractions);
    }

    // Buy fractions of the NFT
    function buyFractionalOwnership(uint256 tokenId, uint256 amount) public payable {
        require(fractionalNFTs[tokenId].fractionsAvailable >= amount, "Not enough fractions available");
        uint256 price = calculatePrice(tokenId, amount);
        require(msg.value == price, "Incorrect payment");

        fractionalNFTs[tokenId].fractionsAvailable -= amount;

        // Transfer fractional ownership tokens to the buyer
        fractionalToken.transfer(msg.sender, amount);

        emit NFTPurchased(tokenId, msg.sender, amount);
    }

    // Calculate the price of fractions (can be based on dynamic pricing)
    function calculatePrice(uint256 tokenId, uint256 amount) public view returns (uint256) {
        // Simple pricing logic (1 ether per fraction)
        return amount * 1 ether;
    }
}
// change according you
