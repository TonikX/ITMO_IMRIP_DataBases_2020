  Список всех изданных книг заданного автора
SELECT "Contract"."author_id", "Book"."Name" FROM "Typography"."Book", "Typography"."Contract" 
WHERE "Book"."contract_id" = "Contract"."contract_id" AND "Contract"."author_id" = 4
  Список ответственных редакторов для всех изданий 
SELECT "Editor_book"."name", "Editor"."worker_FIO" FROM "Typography"."Editor_book", "Typography"."Editor" 
WHERE "Editor"."worker_ID" = "Editor_book"."editor_in_charge_id"
  Количество редакторов каждой книги
SELECT "Editing"."Book_name", COUNT("Editing"."Editors") AS "Число редакторов" FROM "Typography"."Editing" 
GROUP BY "Editing"."Book_name"
  Количество контрактов за последний год
SELECT count("Contract"."contract_id") as "Количество контрактов за год" from "Typography"."Contract" WHERE "Contract"."contract_date" > '2019.06.08'
  Найти менеджера, которые имеет максимальное количество контрактов за определенный период 
SELECT "Contract"."manager_id", count("Contract"."contract_id") AS "number" FROM "Typography"."Contract"
WHERE "Contract"."contract_date" BETWEEN '2017.06.08' AND '2020.06.08'
GROUP BY "Contract"."manager_id" ORDER BY "number" DESC
LIMIT 1
  Отметить книги, выпущенный до 2020 года – старой редакцией, а с 2020ого года – новой
SELECT "Book"."Name", CASE WHEN "Contract"."contract_date" < '2020.01.01'
THEN 'old redaction'
ELSE 'new readction' END AS "redaction"
FROM "Typography"."Book", "Typography"."Contract"
WHERE "Contract"."contract_id" = "Book"."contract_id"
  Посчитать длину имени каждого сотрудника типографии и расположить в порядке от самого короткого к самому длинному
SELECT DISTINCT "Worker"."worker_FIO", CHAR_LENGTH("Worker"."worker_FIO") as "Length_of_name"
FROM "Typography"."Worker" ORDER BY "Length_of_name"
  Вывести информацию по менеджерам типографии, у которых оформлено более 1 контракта
SELECT "Manager"."worker_ID", "Manager"."worker_FIO" FROM "Typography"."Manager"
WHERE "Manager"."worker_ID" in (
	SELECT "Manager"."worker_ID"
	FROM (
	SELECT "Manager"."worker_ID", count("Contract"."contract_id")
FROM "Typography"."Contract" GROUP BY "Contract"."manager_id")
as "Results" where COUNT>1)
  Вывести всех ФИО людей в базе типографии с указанием их роли, сгруппировать по ролям
(SELECT "Manager"."worker_FIO", 'Manager' as "Role" FROM "Typography"."Manager")
UNION
(SELECT "Editor"."worker_FIO", 'Editor' as "Role" FROM "Typography"."Editor")
UNION 
(SELECT "Author"."author_FIO", 'Author' as "Role" FROM "Typography"."Author")
UNION
(SELECT "Buyer"."buyer_FIO", 'Buyer' as "Role" FROM "Typography"."Buyer")
ORDER BY "Role"



SELECT DISTINCT  "Book_order"."book_name" FROM "Typography"."Author", "Typography"."Book_order"
WHERE "Book_order"."book_name" IN (
	SELECT "Book_order"."book_name"
	FROM (
		SELECT "Book_order"."book_name", count("Book_order"."book_name")
		FROM "Typography"."Book_order"
		GROUP BY "Book_order"."book_name")
	as results
	WHERE count < 2)
  Вывести ФИО всех менеджеров и их ID, если указанный менеджер оформлял контракты
SELECT DISTINCT "Contract"."manager_id", "Manager"."worker_FIO"
FROM "Typography"."Contract", "Typography"."Manager"
WHERE "Contract"."manager_id" = "Manager"."worker_ID"
AND EXISTS (
SELECT * FROM "Typography"."Contract", "Typography"."Manager"
WHERE "Contract"."manager_id" = 4)

  Вывести информацию из заказов книг, где количество книг в заказе не наименьшее
SELECT "Book_order"."buyer_id", "Book_order"."book_name", "Book_order"."number"
FROM "Typography"."Book_order"
WHERE "Book_order"."number" > ANY (SELECT "Book_order"."number" FROM "Typography"."Book_order")

  Найти информацию о покупателе, книге и количестве книг в заказе по заданным фильтрам
SELECT "Book_order"."buyer_id", "Book_order"."book_name", "Book_order"."number" FROM "Typography"."Book_order"
WHERE "Book_order"."number" > 5 AND "Book_order"."number" < 200
GROUP BY "Book_order"."book_name", "Book_order"."buyer_id", "Book_order"."number"
HAVING "Book_order"."buyer_id" = 2

  Получить информацию о том, как много различных позиций положили в корзину какие покупатели
SELECT "Buyer"."buyer_FIO", count("Book_order"."number") as "Number" 
FROM "Typography"."Book_order", "Typography"."Buyer"
WHERE "Buyer"."buyer_id" = "Book_order"."buyer_id"
GROUP BY "Buyer"."buyer_FIO"
ORDER BY "Number" DESC

  Получить информацию о том, сколько авторов у каждой книги
SELECT "Author_book"."name", COUNT("Author_book"."author_id") as "Number_of_authors"
FROM "Typography"."Author_book"
GROUP BY "Author_book"."name"






  


