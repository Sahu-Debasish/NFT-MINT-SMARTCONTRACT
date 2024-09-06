// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DynamicNFTMarketplace is ERC721URIStorage, Ownable {

    // A struct to hold athlete's data (e.g., stats, achievements)
    struct AthleteData {
        uint256 id;
        uint256 score;
        uint256 achievements;
    }

    // Mapping from tokenId to AthleteData
    mapping(uint256 => AthleteData) public athletesData;

    // Event to trigger when NFT data is updated
    event AthleteDataUpdated(uint256 tokenId, uint256 score, uint256 achievements);

    constructor() ERC721("DynamicNFT", "DYNFT") {}

    // Mint a new dynamic NFT
    function mintNFT(address to, uint256 tokenId, string memory tokenURI, uint256 score, uint256 achievements) public onlyOwner {
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        athletesData[tokenId] = AthleteData(tokenId, score, achievements);
    }

    // Update Athlete data dynamically (called by oracle, off-chain data provider)
    function updateAthleteData(uint256 tokenId, uint256 newScore, uint256 newAchievements, string memory newTokenURI) public onlyOwner {
        require(_exists(tokenId), "Token does not exist");
        athletesData[tokenId].score = newScore;
        athletesData[tokenId].achievements = newAchievements;
        _setTokenURI(tokenId, newTokenURI);  // Update metadata URL
        emit AthleteDataUpdated(tokenId, newScore, newAchievements);
    }

    // Fetch current athlete data for the tokenId
    function getAthleteData(uint256 tokenId) public view returns (AthleteData memory) {
        require(_exists(tokenId), "Token does not exist");
        return athletesData[tokenId];
    }
}
// You can change according you 
