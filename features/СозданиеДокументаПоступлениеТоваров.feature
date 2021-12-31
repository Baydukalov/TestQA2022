﻿#language: ru

@tree

Функционал: создание документа Поступления товаров

Как Менеджер по закупкам я хочу
создание документа поступление товара 
чтобы <бизнес-эффект> 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий


Сценарий: создание документа поступление товаров
// создание документа
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения	
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
	И из выпадающего списка с именем "Поставщик" я выбираю точное значение 'Магазин "Бытовая техника"'
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Колбаса'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку "Записать"

* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документов
	И таблица "Список" содержит строки:
		| 'Номер'     |
		| '$Номер$' |
	
Сценарий: проверка наличия в справочнике номенклатуры торт
	И В командном интерфейсе я выбираю 'Продажи' 'Товары'
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Артикул' | 'Вид'   | 'Код'       | 'Наименование' | 'Поставщик'   |
		| 'Т78'     | 'Товар' | '000000032' | 'Торт '        | 'Мосхлеб ОАО' |
