pragma solidity ^0.5.0;

contract IPFSInbox {
    
    mapping (address => string) public ipfsInbox;
    
    event ipfsSent(string _ipfsHash, address _address);
    event inboxResponse(string response);
    
    modifier notFull( string memory _string) {
        bytes memory ipfsHash = bytes(_string);
        require (ipfsHash.length == 0);
        _;
    }
    
    constructor() public{}
    
    function sendIPFS(string memory _ipfsHash, address _address) public notFull(ipfsInbox[_address]){
        ipfsInbox[_address] = _ipfsHash;
        emit ipfsSent(_ipfsHash, _address);
    }
    
    function checkInbox() public {
        string memory ipfsHash = ipfsInbox[msg.sender];
        if(bytes(ipfsHash).length == 0){
            emit inboxResponse("Empty Inbox");
        }
        else{
            ipfsInbox[msg.sender] = "";
            emit inboxResponse(ipfsHash);
        }
    }
}