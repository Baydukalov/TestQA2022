﻿#language: ru

@tree

Функционал: <описание фичи>

Как Администратор я хочу
создать тест 
чтобы выполнить задание 5

Сценарий: Создание элементов спр Номенклатура в цикле
И В командном интерфейсе я выбираю 'Справочники' 'Номенклатура'
Тогда открылось окно 'Номенклатура'
И Я запоминаю в переменную "Счетчик" значение 1
И я делаю 10 раз

	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Номенклатура (создание)'
	И в поле с именем 'Description_ru' я ввожу текст 'Стол ' + '$Счетчик$'
	И я нажимаю кнопку выбора у поля с именем "ItemType"
	Тогда открылось окно 'Виды номенклатуры'
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Номенклатура (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Unit"
	Тогда открылось окно 'Единицы измерения'
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Номенклатура (создание) *'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна 'Номенклатура (создание) *' в течение 20 секунд
	И Я запоминаю значение выражения "$Счетчик$ + 1" в переменную "Счетчик"
	

	