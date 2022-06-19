// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract NFTMarketplace is ERC721URIStorage {
	using Counters for Counters.Counter;

	Counters.Counter private _tokenIds;	
	Counters.Counter private _itemsSold;

// listing price on marketplace - type uint ether
	uint256 listingPrice = 0.025 ether;

// owner wallet address - type address
	address payable owner;

// mapping id to the item so that we can fetch it later
	mapping(uint256 => MarketItem) private idToMarketItem;

	struct MarketItem{
		uint256 tokenId;
		address payable seller;
		address payable owner;
		uint256 price;
		bool sold;
	}

// event triggered upon action
	event MarketItemCreated (
		uint256 indexed tokenId,
		address  seller,
		address  owner,
		uint256 price,
		bool sold
	);

	constructor(){

	// one who is deploying the contract is the owner
	owner = payable(msg.sender);
	}

	function updateListingPrice(uint _listingPrice) public payable{
		require(owner == msg.sender, "Only marketplace owner can update the listing price");
		listingPrice = _listingPrice;
	}

// view - function is not doing anything, no logic only returns value
	function getListingPrice() public view returns (uint256){
		return listingPrice;
	}

// URI - unique resource identifier
	function createToken(string memory tokenURI, uint256 price) public payable returns (uint){
		// creating token - update token id by 1
		_tokenIds.increment();

		uint256 newTokenId = _tokenIds.current();

		// mint the token
		_mint(msg.sender, newTokenId);
		_setTokenURI(newTokenId, tokenURI);

		// create/list it to our marketplace
		createMarketItem(newTokenId, price);
		return newTokenId;
	}

	// create market item
	function createMarketItem(uint256 tokenId, uint256 price) private{
		require(price>0, "Price must be at least 1");
		require(msg.value == listingPrice, "Price must be equal to listing price");

		idToMarketItem[tokenId] = MarketItem(
			tokenId,
			payable(msg.sender),
			payable(address(this)),
			price,
			false
		);

// transfer the ownership
		_transfer(msg.sender, address(this), tokenId);
		
		// emitting the event
		emit MarketItemCreated(tokenId, msg.sender, address(this), price, false);
	}

	// Resell Token function
	function resellToken(uint256 tokenId, uint256 price) public payable {
		require(idToMarketItem[tokenId].owner == msg.sender, "Only item owner can perform this operation");
		require(msg.value == listingPrice, "Price must be equal to listing price");

		// relist the nft
		idToMarketItem[tokenId].sold = false;
		idToMarketItem[tokenId].price = price;
		idToMarketItem[tokenId].seller = payable(msg.sender);
		idToMarketItem[tokenId].owner = payable(address(this));

		_itemsSold.decrement();

		_transfer(msg.sender, address(this), tokenId);
	}

}