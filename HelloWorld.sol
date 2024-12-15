// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/*
    Reference size values types:
        int8 age: From -128 to +127 possibles
        uint8 age2: From 0 to +127 possibles
        uint256 age3: From 0 to +255 possibles
        wallet get: https://etherscan.io/address/0x14f135e633563d6d27b3389db738e00ac7379abf
*/
contract HelloWorld {
    int8 public age = 35;
    uint8 public age2 = 35;
    uint256 public age3 = 35;
    string public message = "Hello World!";
    address public wallet = 0x14F135E633563d6D27B3389dB738e00ac7379ABF;
    bool public isValid = false;
    enum Chave { ON, OFF}
    Chave public status = Chave.ON;
}
