// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

// Создание контракта StudentDiary
contract StudentDiary {
    string public StudentName; // Имя студента
    address public StudentAddress; // Адресс студента
    uint256 public lessonCount; // Количество пройденных уроков
    bool public isActive; // Активность ученика
    mapping(string => uint256) private grades; // Словарь оценок (Предмет => Оценка)

    // Конструктор для инициализации переменных
    constructor(string memory _StudentName, address _StudentAddress) {
        StudentName = _StudentName;
        StudentAddress = _StudentAddress;
        lessonCount = 0;
        isActive = false;
    }

    // Смена оценки по предмету
    function setGrade(string memory _subject, uint256 _grade) public {
        grades[_subject] = _grade;
    }

    // Вьюшка для получения оценки
    function getGrade(string memory _subject) public view returns (uint256) {
        return grades[_subject];
    }

    // Добавление урока
    function addLesson() public {
        lessonCount += 1;
    }

    // Функция умножения на 2
    function multiplyByTwo(uint256 _number) public pure returns (uint256) {
        return _number * 2;
    }

    // Смена активности
    function activateStudent() public {
        isActive = true;
    }
}
