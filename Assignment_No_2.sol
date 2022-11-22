//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Bank
{
    mapping(address => uint) public balances;

    function deposit() public payable
    {
        balances[msg.sender] += msg.value; 
    }
    
    function withdraw(uint _amount) public
    {
        require(balances[msg.sender] >= _amount, "Not enough ether");

        balances[msg.sender] -= _amount;

        (bool sent,) = msg.sender.call{value: _amount}("Sent");
        require(sent, "failed to send ETH");
    }

    function getBal() public view returns(uint)
    {
        return address(this).balance;
    }

}