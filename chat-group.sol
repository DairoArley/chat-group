//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract GroupChat{

    struct Message {
        address userSender;
        string message;
        string userName;
        uint time;
    }
    Message[] public messages;

    function sendMessage(string memory _message, string memory _userName) public {
        messages.push(Message(msg.sender, _message, _userName, block.timestamp));
    }

    function getMessages() public view returns (Message[] memory){
        return messages;
    }

    function deleteLastMessage() public payable onlyOwner {
        delete messages[messages.length - 1];        
    }

    modifier onlyOwner(){
        require(msg.sender == addres(messages[messages.length].userSender), "Solo el propietario puede ejecutar la funcion");
        _;
    }

}