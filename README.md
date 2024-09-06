# NFT Mint Smart Contracts

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

This repository contains a collection of advanced-level NFT-related smart contracts built using Solidity. The smart contracts implement functionalities for a **Dynamic NFT Marketplace**, **NFT Renting & Leasing Platform**, and **Fractional Ownership of Rare NFTs**.

## Features

1. **Dynamic NFT Marketplace**
   - Create a dynamic NFT marketplace where NFT metadata is updated based on real-world data, such as player stats or achievements.
   - Allows dynamic updating of NFT metadata, making it suitable for sports NFTs, art, or any evolving use case.
   
2. **NFT Renting & Leasing Platform**
   - Enables NFT owners to lease their NFTs to others for a specified duration.
   - Useful for renting virtual real estate, in-game assets, or other valuable NFTs.

3. **Fractional Ownership of Rare NFTs**
   - Allows fractional ownership of NFTs by splitting them into smaller ERC20 tokens.
   - Facilitates trading and investment in rare NFTs by smaller investors.

## Smart Contracts Overview

### 1. Dynamic NFT Marketplace
The `DynamicNFTMarketplace.sol` smart contract allows NFT owners to mint tokens with dynamic metadata. Metadata can be updated based on off-chain oracles, which makes it suitable for real-world use cases such as sports performance or evolving artworks.

**File**: `DynamicNFTMarketplace.sol`

### 2. NFT Renting & Leasing Platform
The `NFTRental.sol` contract facilitates the leasing of NFTs. Owners can lease their NFTs for a fixed period, receive rent payments, and have the NFTs returned after the lease period.

**File**: `NFTRental.sol`

### 3. Fractional Ownership of Rare NFTs
The `FractionalNFT.sol` contract allows fractionalizing a rare NFT into multiple parts (ERC20 tokens). Investors can buy fractional ownership of an NFT and trade it on secondary markets.

**File**: `FractionalNFT.sol`

## Prerequisites

- **Node.js**
- **Solidity 0.8.x**
- **npm** or **yarn**
- **Hardhat** or **Truffle** (for smart contract deployment)
- **OpenZeppelin Contracts** for standard token implementations.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Sahu-Debasish/NFT-MINT-SMARTCONTRACT.git
   cd NFT-MINT-SMARTCONTRACT
   ```

2. **Install dependencies:**
   Install the OpenZeppelin contracts required for standard token functionalities.
   ```bash
   npm install @openzeppelin/contracts
   ```

3. **Compile the smart contracts:**
   Use Hardhat or Truffle to compile the contracts.
   ```bash
   npx hardhat compile
   ```

### Deployment

To deploy the smart contracts on a local blockchain (or a public testnet like Rinkeby), you can use the following steps:

1. **Configure Network (Hardhat):**

   In `hardhat.config.js`, add the appropriate network details for deployment.
   ```js
   networks: {
       rinkeby: {
           url: "https://rinkeby.infura.io/v3/YOUR_INFURA_PROJECT_ID",
           accounts: ["YOUR_PRIVATE_KEY"]
       }
   }
   ```

2. **Deploy Contracts:**

   You can deploy contracts using Hardhat’s deployment script:
   ```bash
   npx hardhat run scripts/deploy.js --network rinkeby
   ```

## Contract Details

### DynamicNFTMarketplace.sol

```solidity
// File: DynamicNFTMarketplace.sol
// Allows minting and dynamic updates of NFT metadata based on real-world events or external data feeds.
```

### NFTRental.sol

```solidity
// File: NFTRental.sol
// Facilitates NFT leasing for a set period, useful for in-game assets or virtual real estate.
```

### FractionalNFT.sol

```solidity
// File: FractionalNFT.sol
// Enables fractional ownership of rare NFTs using ERC20 tokens representing shares.
```

## Usage

- **Mint a Dynamic NFT**: The contract owner can mint a new NFT with dynamic metadata that can be updated later.
- **Lease an NFT**: The NFT owner can lease out their NFTs for a specified time and receive rent.
- **Buy Fractional Ownership**: Users can buy fractional tokens of rare NFTs to get partial ownership.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request to add features, improve documentation, or fix bugs.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or suggestions, feel free to reach out.

GitHub: [Sahu-Debasish](https://github.com/Sahu-Debasish)

---

### How to use:

1. **Clone the repository** from GitHub using the link provided.
2. **Install necessary dependencies** and **compile the contracts**.
3. **Deploy the contracts** to your chosen network (local or public testnet).
4. Explore the **Dynamic NFT Marketplace**, **NFT Rental**, and **Fractional Ownership** contracts to mint, lease, or fractionalize NFTs.

