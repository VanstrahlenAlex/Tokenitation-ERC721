// SPDX-License-Identifier: MIT

pragma solidity ^0.8.35;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract BANFTCollection is ERC721 {

	//Variables
	uint256 public currentTokenId; // 0 by default

	//Events 
	event MintNFT(address userAddress_, uint256 tokenId_);

	constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_) {

	}

	function mint(uint256 tokenId) external {
		_safeMint(msg.sender, tokenId);
		currentTokenId++;

		emit MintNFT(msg.sender, tokenId);
	}
}