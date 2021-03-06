#language: ru

@tree

Функционал: Задание 1 
тест на проверку расчета суммы документа Заказ (подсистема Продажи) при изменении количества и цены

Как Менеджер по продажи я хочу
изменить количество и цену в заказе
чтобы проверить расчет суммы документа

Сценарий: Проверка суммы документа
Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	
Сценарий: Проверка суммы документа
* Создание и проведение документа
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	Тогда открылось окно 'Продажи товара'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Продажа товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'VekoNT02'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '7 000,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
	И в таблице "Товары" я завершаю редактирование строки

* Сразу проверяем сумму 
	И таблица "Товары" стала равной:
		| 'Сумма' | 
		| '14 000,00' | 
	
	
	И я нажимаю на кнопку "Записать"

* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"

	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Продажа товара (создание) *' в течение 20 секунд

* Проверка создания документа

	И таблица "Список" содержит строки:
		| 'Номер'     |
		| '$Номер$' |

