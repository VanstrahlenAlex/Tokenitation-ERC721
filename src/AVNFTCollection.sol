// SPDX-License-Identifier: MIT

pragma solidity ^0.8.35;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Strings} from "../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract AVNFTCollection is ERC721 {

	using Strings for uint256;

	//Variables
	uint256 public currentTokenId; // 0 by default
	uint256 public totalSupply; // 0 by default
	string public baseURI;

	//Events 
	event MintNFT(address userAddress_, uint256 tokenId_);

	constructor(string memory name_, string memory symbol_, uint256 totalSupply_, string memory baseURI_) ERC721(name_, symbol_) {
		totalSupply = totalSupply_;
		baseURI = baseURI_;
	}

	//TotalSuply = 100 -> [0 - 99]

	function mint() external {
		require(currentTokenId < totalSupply, "BANFTCollection: Total supply reached");
		_safeMint(msg.sender, currentTokenId);
		currentTokenId++;

		emit MintNFT(msg.sender, currentTokenId--);
	}

	function _baseURI() internal view override returns (string memory) {
		return baseURI;
	}

	function tokenURI(uint256 tokenId) public view override returns (string memory) {
		_requireOwned(tokenId);

		string memory baseUri = _baseURI();
		return bytes(baseUri).length > 0 ? string.concat(baseUri, tokenId.toString(), ".json") : "";
	}
}