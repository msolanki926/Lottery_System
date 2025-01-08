// SPDX-License-Identifier: MIT
pragma solidity >=0.8.27;

contract lottery
{
    //What are entities 1. Manager 2. Players 3. Winner

    address public manager;
    address payable[] public players;
    address payable[] public winner;

    constructor()
    {
        manager=msg.sender;
    }

    function participate() payable public 
    {
        require(msg.value==1 ether,"Please Pay 1 ether");
        players.push(payable (msg.sender));
    }

    function getbalance() public view returns(uint)
    {
        require(manager==msg.sender,"You are not a manager");
        return address(this).balance;
    }

    function random() public view returns(uint)
    {
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players.length)));
    }

}
