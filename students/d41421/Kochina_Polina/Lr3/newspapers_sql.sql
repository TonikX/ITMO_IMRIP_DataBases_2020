
--1. Получение названий газет, номеров издания, цен и номеров 
--почтовых отделений, в которые они доставляются

select delivery.newspaper_name, delivery.edition_num, edition.price, 
post_office.post_office_num 
from delivery, edition, post_office 
where post_office.post_office_num =delivery.post_office_num
group by delivery.newspaper_name, delivery.edition_num, edition.price, 
post_office.post_office_num


--2. Получение количества экземпляров для доставки по цене больше 10000,
--где количество больше 500, и названия этих газет

select newspaper.newspaper_name, delivery.amount, edition.price 
from newspaper, delivery, edition
where delivery.newspaper_name=newspaper.newspaper_name 
and edition.edition_num=delivery.edition_num and delivery.amount > 500 
and edition.price > money(10000)
group by newspaper.newspaper_name, delivery.amount, edition.price


--3. Получить наибольшее количество экземпляров (больше 1000) 
--издания для доставки

select edition.edition_num, max(delivery.amount) as maximum
from edition, delivery where edition.edition_num=delivery.edition_num
group by edition.edition_num
having max(delivery.amount)>1000


--4. Вывести информацию по почтовым отделениям (номер, адрес), 
--где количество доставок газет больше 1000.

select post_office_num, post_office_adress
from post_office
where post_office_num in (
	select post_office_num
	from (
	select post_office_num, sum(amount)
from delivery
group by post_office_num )
as results 
where sum>1000)
order by post_office_num


--5. Вывести по каким адресам печатаются газеты данного наименования

SELECT newspaper.newspaper_name, printing_office.printing_office_name, 
printing_office.printing_office_adress
FROM printing_office 
INNER JOIN (newspaper INNER JOIN print ON newspaper.newspaper_name=print.newspaper_name) 
ON printing_office.printing_office_name=print.printing_office_name
GROUP BY newspaper.newspaper_name, printing_office.printing_office_name, 
printing_office.printing_office_adress
HAVING newspaper.newspaper_name = 'Газета Вторая'


--6. Фамилия редактора газеты, которая печатается в указанной типографии 
--самым большим тиражом

select printing_office.printing_office_name, newspaper.newspaper_name, 
newspaper.editor_surname, max(print.amount) as max_amount 
from printing_office 
inner join ((newspaper inner join edition on newspaper.newspaper_name=edition.newspaper_name) 
inner join print on (edition.edition_num=print.edition_num) 
and (edition.newspaper_name=print.newspaper_name)) 
on printing_office.printing_office_name=print.printing_office_name
group by printing_office.printing_office_name, newspaper.newspaper_name, 
newspaper.editor_surname
having printing_office.printing_office_name='Типография Вторая'
order by max(print.amount) desc
limit 1


--7. На какие почтовые отделения (адреса) поступают газеты, 
--имеющие цену больше указанной

SELECT newspaper.newspaper_name, post_office.post_office_num, post_office.post_office_adress,
edition.price 
FROM post_office 
INNER JOIN ((newspaper INNER JOIN delivery ON newspaper.newspaper_name = delivery.newspaper_name) 
INNER JOIN edition ON newspaper.newspaper_name=edition.newspaper_name) 
ON post_office.post_office_num=delivery.post_office_num 
GROUP BY newspaper.newspaper_name, post_office.post_office_num, post_office.post_office_adress, 
edition.price  
HAVING edition.price>money(800) 
ORDER BY edition.price 


--8. Какие газеты (название) и куда поступают (адрес почты) в количестве меньшем указанного

SELECT newspaper.newspaper_name, post_office.post_office_adress, delivery.amount 
FROM post_office 
INNER JOIN (newspaper INNER JOIN delivery ON newspaper.newspaper_name=delivery.newspaper_name)
ON post_office.post_office_num=delivery.post_office_num
GROUP BY newspaper.newspaper_name, post_office.post_office_adress, delivery.amount
HAVING delivery.amount<'50000' 
ORDER BY delivery.amount DESC


--9. Получить названия газет, которые никуда не доставляются

select distinct newspaper_name
from newspaper 
where not newspaper_name = any (select newspaper_name
from delivery)


--10. Куда (в какое почтовое отделение) поступает данная газета, 
--печатающаяся в данной типографии

SELECT newspaper.newspaper_name, printing_office.printing_office_name, 
post_office.post_office_num, post_office.post_office_adress 
FROM printing_office
INNER JOIN (print INNER JOIN (post_office INNER JOIN (newspaper INNER JOIN delivery 
ON newspaper.newspaper_name=delivery.newspaper_name) ON post_office.post_office_num=delivery.post_office_num) 
ON print.newspaper_name=newspaper.newspaper_name) 
ON printing_office.printing_office_name=print.printing_office_name
GROUP BY newspaper.newspaper_name, printing_office.printing_office_name,
post_office.post_office_num, post_office.post_office_adress
HAVING newspaper.newspaper_name='Газета Первая' 
AND printing_office.printing_office_name='Типография Вторая'


--11. Получить название, имя и фамилию редактора, для газет, 
--у которых количество поставок (доставки) больше 500

SELECT newspaper.newspaper_name, newspaper.editor_name, newspaper.editor_surname
FROM newspaper
WHERE newspaper_name IN (
	SELECT newspaper_name
	FROM (
		SELECT newspaper_name, sum(amount) 
		FROM delivery
	GROUP BY newspaper_name)
	AS results
	WHERE sum>500)
	

--12. Получить количество печатающихся газет

SELECT newspaper_name, SUM(amount) FROM print 
GROUP BY print.newspaper_name


--13. Получить количество газет каждого наименования по типографиям

SELECT print.newspaper_name, print.printing_office_name, sum(amount) AS full_amount 
FROM print, newspaper, printing_office 
WHERE newspaper.newspaper_name=print.newspaper_name 
AND printing_office.printing_office_name=print.printing_office_name
GROUP BY print.newspaper_name, print.printing_office_name
ORDER BY print.newspaper_name


--14. Получить общее количество печатающихся в типографии газет

SELECT print.printing_office_name, sum(amount) AS full_amount 
FROM print, printing_office 
WHERE printing_office.printing_office_name=print.printing_office_name
GROUP BY print.printing_office_name
ORDER BY full_amount desc


--15.  Какие газеты и в каком количестве типография отправляет 
--в каждое почтовое отделение. Сортировка по количеству (от большего к меньшему)

SELECT newspaper.newspaper_name, printing_office.printing_office_name, 
post_office.post_office_num, post_office.post_office_adress, 
SUM(delivery.amount) AS full_amount 
FROM printing_office
INNER JOIN (print INNER JOIN (post_office INNER JOIN (newspaper INNER JOIN delivery 
ON newspaper.newspaper_name=delivery.newspaper_name) 
ON post_office.post_office_num=delivery.post_office_num) 
ON print.newspaper_name=newspaper.newspaper_name) 
ON printing_office.printing_office_name=print.printing_office_name
GROUP BY newspaper.newspaper_name, printing_office.printing_office_name, 
post_office.post_office_num, post_office.post_office_adress
ORDER BY full_amount DESC


