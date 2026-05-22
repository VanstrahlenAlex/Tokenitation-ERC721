// SPDX-License-Identifier: MIT

pragma solidity ^0.8.35;

import {Script} from "../lib/forge-std/src/Script.sol";
import {AVNFTCollection} from "../src/AVNFTCollection.sol";


contract DeployAVNFTCollection is Script {

	function run() external returns (AVNFTCollection) {

		uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

		string memory name_ = "Alexander Van Strahlen";
		string memory symbol_ = "AVS";
		uint256 totalSupply_ = 100;
		string memory baseURI_ = "ipfs://bafybeielvog3lkboy7vlhilmjryshiddbunzuyx6l52outz5bioz5jopde/";

		AVNFTCollection nftCollection = new AVNFTCollection(name_, symbol_, totalSupply_, baseURI_);

		vm.startBroadcast(deployerPrivateKey);
		return nftCollection;
	}
}