-- 1 --
SELECT * FROM author WHERE lastname LIKE '%й'
ORDER BY lastname;

-- 2 --
SELECT book_name FROM book_example, author 
WHERE publisher = 'Отечественная проза' 
AND book_example.author_id = author.author_id 
AND author.lastname='Пушкин' 
ORDER BY book_name

-- 3 --
SELECT reader.full_name, book_example.book_name 
FROM reader, taking_a_book, book, book_example
WHERE reader.reader_id = taking_a_book.reader 
AND taking_a_book.book = book.book_id 
AND book.example_id = book_example.example_id
ORDER BY reader.full_name

-- 4 --
SELECT count(reader_id) FROM reader 
WHERE date_of_registration <= '31.12.2013'


-- 5 -- 
SELECT r1.* FROM reader r1
INNER JOIN ( 
    SELECT MAX(date_of_birth) AS MaxDate
    FROM reader
    WHERE education='Высшее'
) r2
ON r1.date_of_birth = r2.MaxDate;

-- 6 --
SELECT  R.full_name, RR.name
FROM reader R 
LEFT JOIN reading_room RR
ON  R.reading_room_id=RR.reading_room_id
WHERE RR.name='Большой читательный зал'
ORDER BY R.full_name;


-- 7 --
SELECT book_example.book_name, taking_a_book.date_of_taking  
FROM reader, taking_a_book, book, book_example
WHERE reader.reader_id = taking_a_book.reader 
AND taking_a_book.book = book.book_id 
AND book.example_id = book_example.example_id
AND reader.full_name = 'Дмитрий Дмитриевич Дмитриев'
ORDER BY taking_a_book.date_of_taking

-- 8 --
SELECT R.full_name, TB.date_of_taking
FROM reader R 
LEFT JOIN taking_a_book TB
ON R.reader_id=TB.reader
WHERE TB.date_of_taking <= CURRENT_DATE - INTERVAL '2' YEAR

-- 9 --
SELECT count(reader_id) FROM reader 
WHERE date_of_birth <= CURRENT_DATE - INTERVAL '21' YEAR
AND education='Высшее'


-- 10 --
SELECT education, (COUNT(education)* 100 / (select count(*) from reader)) AS Score
FROM reader
GROUP BY education

-- 11 --
SELECT full_name, COUNT(book.book_id) AS number_of_books 
FROM reader, taking_a_book, book, book_example
WHERE reader.reader_id = taking_a_book.reader AND taking_a_book.book = book.book_id
AND book.example_id = book_example.example_id 
GROUP BY reader.full_name


-- 12 --
SELECT book_name FROM book, book_example 
WHERE book.example_id IN (
SELECT example_id FROM book
GROUP BY example_id 
HAVING count(*) < 2
) 
AND book.example_id = book_example.example_id
ORDER BY book_name

-- 13 --
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
SELECT book_name, concat(firstname, ' ', middlename, ' ', lastname) AS full_name
FROM book_example, author
WHERE author.author_id = book_example.author_id
ORDER BY book_name
