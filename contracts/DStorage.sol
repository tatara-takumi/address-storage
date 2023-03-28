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

// ユーザー,whiteliseedのアドレスが住所情報を参照できる

contract DStorage {
    mapping(address => bool) private whitelist;
    mapping (address => Address) private dStorage;
    /*
     * 
     * @param _value 
     * ストレージに値を保存する
     */
    function setAddress(Address calldata data) public {
        dStorage[msg.sender] = data;
    }

    function getAddress() public view returns (Address memory) {
        return dStorage[msg.sender];
    }

    // ホワイトリストに登録されたアドレスのみがユーザーAの住所情報を参照する関数
    function getAddressForUser(address userAddress) public view returns (Address memory) {
        require(whitelist[msg.sender], "Only whitelisted addresses can call this function");
        return dStorage[userAddress];
    }

    // ホワイトリストにアドレスを追加する関数
    function addToWhitelist(address addr) public {
        require(addr != address(0));
        whitelist[addr] = true;
    }

    // ホワイトリストからアドレスを削除する関数
    function removeFromWhitelist(address addr) public {
        whitelist[addr] = false;
    }
}