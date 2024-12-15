// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/utils/Strings.sol";

contract EvenOrOdd {

    string choice = ""; //EVEN OR ODD
    
    function compareString(string memory string1, string memory string2) private pure returns (bool) {
        bytes memory arrayOfTheBytesString1 = bytes(string1);
        bytes memory arrayOfTheBytesString2 = bytes(string2);
        return arrayOfTheBytesString1.length == arrayOfTheBytesString2.length && keccak256(arrayOfTheBytesString1) == keccak256(arrayOfTheBytesString2);
    }

    function choose(string memory newChoise) public {
        require(compareString(newChoise, "EVEN") || compareString(newChoise, "ODD"), "Choose EVEN or ODD");
        choice = newChoise;
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encode(block.timestamp, choice, block.number))) % 2;
    }
    
    function play(uint8 number) public view returns (string memory) {
    
        require(number >= 0 && number <= 2, "Play 0,1 or 2");
        require(!compareString(choice, ""), "First, choose your option (EVEN or ODD)");
    
        uint256 cpuNumber = random();
        bool isEven = (number + cpuNumber) % 2 == 0;
        string memory message = string.concat("Player choose: ", choice, " and plays: ", Strings.toString(number), ". CPU plays: ", Strings.toString(cpuNumber));

        if (isEven && compareString(choice, "EVEN")) return string.concat(message, ". Player WON :)");
        if (!isEven && compareString(choice,"ODD")) return string.concat(message, ". Player WON :)");
        else
            return string.concat(message, ". CPU WON :(");
    }
}
