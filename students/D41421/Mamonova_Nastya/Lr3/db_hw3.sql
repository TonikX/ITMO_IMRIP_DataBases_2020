-- view all data from Customer table
-- 1 point
select * from "AdvertAgencySchema"."Customer";

-- view all data from PriceList table
-- 1 point
select * from "AdvertAgencySchema"."PriceList";

-- select items with the prize lower than $1000
-- 1 point
select service_name from "AdvertAgencySchema"."PriceList" as pl
	where pl.price_per_item::decimal <= 1000;

-- select all items from Order table
-- 1 point
select * from "AdvertAgencySchema"."Order" as o;

-- select approved orders since 2017 year
-- 1 point
select * from "AdvertAgencySchema"."Order" as o
	where o.status = 'approved' and o.paid_at >= '2017-01-01';


-- select items which measured in peaces and add amount
-- 1 point
select name, 1 as amount from "AdvertAgencySchema"."Material"
	where measure = 'pcs';


-- select all data from Customer
-- 1 point
select * from "AdvertAgencySchema"."Customer";

-- select three last customers from the table sorted by desc order
-- 1 point
select full_name from "AdvertAgencySchema"."Customer"
	order by full_name desc
	limit 3;

-- count number of rows in Performer
-- 1 point
select count(*) from "AdvertAgencySchema"."Performer";

-- count all money spent on all orders
-- 2 points
select sum(content.amount * price.price_per_item)
from "AdvertAgencySchema"."OrderContent" as content,
"AdvertAgencySchema"."PriceList" as price
where content.service_id=price.id;

-- select all data from MaterialPerOrder
-- 1 point
select * from "AdvertAgencySchema"."MaterialPerOrder";

-- count sum amount of different materials within all orders
-- 2 points
select sum(amount) from "AdvertAgencySchema"."MaterialPerOrder"
	group by material_id
	having sum(amount) > 10;

-- select services with price_per_item higher than all price for material
-- 2 points
select service_name from "AdvertAgencySchema"."PriceList"
	where price_per_item::decimal >
	any(select price_per_item::decimal from "AdvertAgencySchema"."Material");

-- select material per order history with normal names, not ids
-- 2 points
select m_order.amount, material.name, material.price_per_item
from "AdvertAgencySchema"."MaterialPerOrder" as m_order
inner join "AdvertAgencySchema"."Material" as material
on m_order.material_id = material.id;

-- know who has done service
-- 2 points
select p.full_name, pl.service_name
from "AdvertAgencySchema"."OrderContent" as o
inner join "AdvertAgencySchema"."Performer" as p
on o.performer_id = p.id
inner join "AdvertAgencySchema"."PriceList" as pl
on o.service_id = pl.id;

-- select info about customer who has ordered smth since 2019
-- 2 points
select * from "AdvertAgencySchema"."Customer" as c
where c.id in
(select customer_id from "AdvertAgencySchema"."Order"
 where paid_at > '2019-01-01');

-- count frequency of statuses and
-- applying string function upper for better visual
-- 2 points
select upper(status), count(*) as Frequency
from "AdvertAgencySchema"."Order"
group by status;

-- count how many years ago the order was paid
-- 2 points
select (DATE_PART('year', '2020-05-30'::date) - DATE_PART('year', o.paid_at::date)) years_ago
from "AdvertAgencySchema"."Order" as o;

-- 2 points
-- getting info about customers whose orders were denied
select c.full_name, c.phone_number, c.email
from "AdvertAgencySchema"."Order" as o
inner join "AdvertAgencySchema"."Customer" as c
on o.customer_id = c.id
where o.status = 'denied';

-- select orders with more than two items in it
-- 2 points
select * from "AdvertAgencySchema"."Order" as o
where o.order_content_id in
(select id from "AdvertAgencySchema"."OrderContent"
where amount > 2)
