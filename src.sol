pragma solidity ^0.5.0;

import "https://github.com/ipfs/js-ipfs-http-client/blob/master/src/index.js";
import "https://github.com/ipfs/js-ipfs-api/blob/master/src/index.js";

contract NFT {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(uint256 => Image) public images;
    mapping(address => uint256) public balanceOf;

    struct Image {
        string ipfsHash;
        string metadata;
    }

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
    }

    function addImage(string memory _ipfsHash, string memory _metadata) public {
        require(balanceOf[msg.sender] < totalSupply, "You have reached the maximum number of images you can add.");

        uint256 id = balanceOf[msg.sender];
        images[id] = Image(_ipfsHash, _metadata);
        balanceOf[msg.sender]++;
    }

    function getImage(uint256 _id) public view returns (string memory, string memory) {
        Image storage image = images[_id];
        return (image.ipfsHash, image.metadata);
    }
}
