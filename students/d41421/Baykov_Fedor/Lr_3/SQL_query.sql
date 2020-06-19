-- 1 --
-- Вывести отсортированный список авторов книг, у которых фамилия заканчивается на «й». --
SELECT * FROM author WHERE lastname LIKE '%й'
ORDER BY lastname;

-- 2 --
-- Вывести отсортированные названия экземпляров книг, у которых издатель «Отечественная проза» и автор «Пушкин».--
SELECT book_name FROM book_example, author 
WHERE publisher = 'Отечественная проза' 
AND book_example.author_id = author.author_id 
AND author.lastname='Пушкин' 
ORDER BY book_name

-- 3 --
-- Вывести отсортированные по алфавиту имена читателей, а также названия книг, записанных на их имя --
SELECT reader.full_name, book_example.book_name 
FROM reader, taking_a_book, book, book_example
WHERE reader.reader_id = taking_a_book.reader 
AND taking_a_book.book = book.book_id 
AND book.example_id = book_example.example_id
ORDER BY reader.full_name

-- 4 --
-- Вывести общее кол-во читателей, записанных в библиотеку, которые зарегистрировались в ней до 31.12.2013 -- 
SELECT count(reader_id) FROM reader 
WHERE date_of_registration <= '31.12.2013'


-- 5 -- 
-- Вывести всю информацию о самом молодом читателе библиотеки имеющего высшее образование  -- 
SELECT r1.* FROM reader r1
INNER JOIN ( 
    SELECT MAX(date_of_birth) AS MaxDate
    FROM reader
    WHERE education='Высшее'
) r2
ON r1.date_of_birth = r2.MaxDate;

-- 6 --
-- Вывести имена читателей, записанных в «большой читательный зал» -- 
SELECT  R.full_name, RR.name
FROM reader R 
LEFT JOIN reading_room RR
ON  R.reading_room_id=RR.reading_room_id
WHERE RR.name='Большой читательный зал'
ORDER BY R.full_name;


-- 7 --
-- Вывести названия книг, закрепленных за читателем «Дмитрий Дмитриевич Дмитриев» и дату, когда они были взяты, начиная от самой старой даты. --
SELECT book_example.book_name, taking_a_book.date_of_taking  
FROM reader, taking_a_book, book, book_example
WHERE reader.reader_id = taking_a_book.reader 
AND taking_a_book.book = book.book_id 
AND book.example_id = book_example.example_id
AND reader.full_name = 'Дмитрий Дмитриевич Дмитриев'
ORDER BY taking_a_book.date_of_taking

-- 8 --
-- Вывести имена читателей, взявших книгу более двух лет назад, от текущей даты. -- 
SELECT R.full_name, TB.date_of_taking
FROM reader R 
LEFT JOIN taking_a_book TB
ON R.reader_id=TB.reader
WHERE TB.date_of_taking <= CURRENT_DATE - INTERVAL '2' YEAR

-- 9 --
-- Вывести сумму читателей в библиотеке старше 21 года и имеющих высшее образование -- 
SELECT count(reader_id) FROM reader 
WHERE date_of_birth <= CURRENT_DATE - INTERVAL '21' YEAR
AND education='Высшее'


-- 10 --
-- Вывести процентное отношение читателей, имеющих начальное, среднее или высшее образование. --
SELECT education, (COUNT(education)* 100 / (select count(*) from reader)) AS Score
FROM reader
GROUP BY education

-- 11 --
-- Вывести имена читателей и кол-во книг, закрепленных за ними. --
SELECT full_name, COUNT(book.book_id) AS number_of_books 
FROM reader, taking_a_book, book, book_example
WHERE reader.reader_id = taking_a_book.reader AND taking_a_book.book = book.book_id
AND book.example_id = book_example.example_id 
GROUP BY reader.full_name


-- 12 --
-- Вывести названия книг количество экземпляров которых в библиотеке меньше двух. --
SELECT book_name FROM book, book_example 
WHERE book.example_id IN (
SELECT example_id FROM book
GROUP BY example_id 
HAVING count(*) < 2
) 
AND book.example_id = book_example.example_id
ORDER BY book_name

-- 13 --
-- Вывести имена читателей, за которыми закреплены книги, количество экземпляров которых в библиотеке меньше двух. --
SELECT full_name, book_name FROM book, book_example, taking_a_book, reader
WHERE book.example_id in (
	SELECT example_id FROM book
	GROUP BY example_id 
	HAVING count(*) < 2
) 
AND book.example_id = book_example.example_id AND book.book_id = taking_a_book.book 
AND taking_a_book.reader = reader.reader_id
ORDER BY full_name

-- 14 --
-- Вывести сортированные названия книг и сконтактенированные имена их авторов в столбец с названием full_name. --
SELECT book_name, concat(firstname, ' ', middlename, ' ', lastname) AS full_name
FROM book_example, author
WHERE author.author_id = book_example.author_id
ORDER BY book_name
