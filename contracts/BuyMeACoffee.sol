//SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

contract BuyMeACoffee{
	//this is an event to be emitted
	event newMemo(address from, uint256 timestamp, string name, string message);
	
	address payable owner;
	
	struct Memo{
		address from;
		uint256 timestamp;
		string name;
		string message;
	}
	
	Memo[] memos;
	
	constructor() {
		// the deployer is the contract is the payable address
		owner = payable(msg.sender);
	}
	
	//this function gets all memos
	function getMemo() public view returns (Memo[] memory){
		return memos;
	}
	
	function buyCoffee(string memory _name, string memory _message) public payable {
		// coffee payment must not be less than 0 eth
		require(msg.value > 0, "Sorry, but coffee is not for free");
		
		// store all memo in the 
		memos.push(Memo(
			msg.sender,
			block.timestamp,
			_name,
			_message
		));
		
	}
	
	//this is the withdraw function(send the available to the deployer of the contract)
	function withdrawTips() public {
		require(owner.send(address(this).balance));
	}
	
}