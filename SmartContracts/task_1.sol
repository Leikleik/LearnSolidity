// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

// Контракт для задания: "Переписать смарт-контракт из видео, используя pragma solidity ^0.8.30; протестировать функции самостоятельно"
// Выполнил: Виктор (GitHub: https://github.com/Leikleik/LearnSolidity)
// Полная разработка всех заданий проекта ведется в ветке develop!

contract MyShop {
    
    address public owner;
    mapping (address => uint) public payments;

    constructor() {
        owner = msg.sender;
    }

    function payForItem() public payable {
        payments[msg.sender] += msg.value;
    }

    function withdrawAll() public {
        address payable _to = payable(owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
        payments[msg.sender] = 0;
    }
} 