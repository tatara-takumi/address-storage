// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

struct Address {
    string code; //郵便番号
    string country; //国
    string prefecture; //県
    string city; //市
    string street; //住所
    string building; //建物名
    string room; //号室
}

// ユーザーのみが参照できる（この場合はスマートコントラクト要らない）

contract PStorage {
    mapping (address => Address) private pStorage;
    /*
     * 
     * @param _value 
     * ストレージに値を保存する
     */
    function setAddress(Address calldata data) public {
        pStorage[msg.sender] = data;
    }

    function getAddress() public view returns (Address memory) {
        return pStorage[msg.sender];
    }
}