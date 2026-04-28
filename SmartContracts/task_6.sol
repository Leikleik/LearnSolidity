// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;


// Контракт для задания 6. Эфир и баланс (balance/transfer) и 8. Эфир и баланс (balance/transfer)
// Выполнил: Виктор (GitHub: https://github.com/Leikleik/LearnSolidity)
// Полная разработка всех заданий проекта ведется в ветке develop!

contract urok2 {
    string message = "hello!";

    // 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8 - Отправитель (owner)
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    fallback() external payable { }

    receive() external payable { }

    function pay() external payable {}
    
    function setMessage(string memory newMessage) external {
        message = newMessage;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function getMessage() external view returns(string memory) {
        return message;
    }

    function rate(uint amount) public pure returns(uint) {
        return amount * 3;
    }

    function sendEther(address payable _to, uint _amount) external {
    
    // 0x4815A8Ba613a3eB21A920739dE4cA7C439c7e1b1 - Получатель (_to)
    
    // 1. Проверяем баланс контракта
    require(address(this).balance >= _amount, "Insufficient balance");

    // 2. Отправляем через .call
    (bool success, ) = _to.call{value: _amount}("");
    
    // 3. Проверяем, прошла ли транзакция
    require(success, "Transfer failed");

    // 4. Проверяем, владелец ли выполняет транзакцию
    require(msg.sender == owner, "Not an owner");
    }
}