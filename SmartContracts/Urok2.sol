// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

// Учебный контракт видео-материала: (YouTube: https://www.youtube.com/watch?v=H2_I4TgDbl0)
// Выполнил: Виктор (GitHub: https://github.com/Leikleik/LearnSolidity)
// Полная разработка всех заданий проекта ведется в ветке develop!

contract urok2 {
    // public можно вызывать из внеконтракта так и изнутри
    // external можно вызывать только из внешне metamask и пр.
    // internal можно обращаться только из внутри, могут обращаться те контракты которые наследуют
    // private только изнутри смарт-контракта, но не из его потомков, нельзя обратится. 
    
    // view данная функция может только читать данные в блокчейне НО НЕ модифицировать его
    // pure функция вызывается через call, но не может читать никакие внешние данные
    
    string message = "hello!"; // state - переменная которая хранится в состоянии state
    uint public balance;

    fallback() external payable {} // функция вызывается в том случае, что если упоминается функция которой нету в коде, срабатывает также при calldata

    receive() external payable { // ОБЯЗАТЕЛЬНО: помечаем external payable; P.S в Remix IDE автоматически ставится!
        //balance += msg.vlue
     }

    function pay() external payable { // если не пометим payable то обратится к msg.value не выйдет, выйдет ошибка но денежные средства вернутся отправителю
        balance += msg.value; // вернет то кол-во денег которые нам сюда прислали
        // ВАЖНО: Зачисление денег действует автоматом ЕСЛИ функция "balance += msg.value" АКТИВНА
        // Платим сверхсумму, выше той которую хотим условно хотим 1 ETH, спишется чуть больше из за газа в том числе чтоы покрыть коммиссию.
    }
    
    // transaction, надо платить газ
    function setMessage(string memory newMessage) external returns(string memory) { // view и pure не указываем т.к модифицируем, string memory для нового сообщения сохранения в памяти ВРЕМЕННО, storage НЕЛЬЗЯ
        message = newMessage; // становится постоянной
        return message; // смысла нет, не получим никакого значения
    }
    // call функция вызывается через call, клиент ничего не платит, локальные данные. 
    function getBalance() public view returns(uint) { // в return можем дать то имя которое хотим вернуть
        return address(this).balance; // промежуточная переменная
        // return balance; ретерн можно не использовать вовсе, т.к указан выше
    }

    function getMessage() external view returns(string memory) { //memory - где мы хранить будем вывод; временная строка для вывода работы; pure (чистая функция) считать не поулчится, т.к это делать нельзя
        return message;
    }

    function rate(uint amount) public pure returns(uint) { // функция рейт умножает входящее число на 3, дает пользователю 3 токена
        return amount * 3;
    }
}

// за вызов getBalance; getMessage; rate; ничего не платим 