// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhard/console.sol";

contract NFTMarketplace is ERC721URIStorage {
	using Counters for Counters.Counter;

	Counters.Counter private _tokenIds;	
	Counters.Counter private _itemsSold;

// listing price on marketplace - type uint ether
	uint256 listingPrice = 0.025 ether;

// owner wallet address - type address
	address payable owner;

// mapping id to the item so that we can fetch it later
	mapping(uint256 => marketItem) private idToMarketItem;

	struct MarketItem{
		uint256 tokenId;
		address payable seller;
		address payable owner;
		uint256 price;
		bool sold;
	}

// event triggered upon action
	event MarketItemCreated{
		uint256 indexed tokenId,
		address  seller,
		address  owner,
		uint256 price,
		bool sold,
	}

	constructor(){

	// one who is deploying the contract is the owner
	owner = payable(msg.sender)
	}

	function updateListingPrice(uint _listingPrice) public payable{
		require=(owner == msg.sender, "Only marketplace owner can update the listing price");
		listingPrice = _listingPrice;
	}

// view - function is not doing anything, no logic only returns value
	function getListingPrice() public view returns (uint256){
		return listingPrice;
	}
}