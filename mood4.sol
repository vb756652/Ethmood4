// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") {}

        function mint(address addressof, uint256 _value1) public onlyOwner{
            _mint(addressof, _value1);
        }
        function transferTokens(address beneficiary, uint _value) external{
            require(balanceOf(msg.sender) >= _value, "Invalid Owner !!");
            approve(msg.sender,_value);
            transferFrom(msg.sender, beneficiary,_value);
        }
        function balanceCheck() external view returns(uint){
           return balanceOf(msg.sender);
        }
        function burnTokens(uint _value3) external{
            require(balanceOf(msg.sender)>= _value3, "Insufficient Tokens Present");
            _burn(msg.sender,_value3);
        }
        function clubScore() public pure returns(string memory) {
            return "1.A1  NFT=100 \n";
        }
        function pointsLeague(uint _points)public pure returns(string memory)
        {
            require(_points>=100,"You are not in any club");
            if(_points==100){
                return "Congratulation your club is A1";
            }
            else{
                return "You need Some more tokens for A1";
            }
            
        }

        function reedemToken(uint club) external payable{
            require(club>0,"Invalid selection");
            if(club ==1){
                approve(msg.sender, 100);
                transferFrom(msg.sender, owner(), 100);
                console.log("100 tokens redeemed successfully");
            }
        }

}