1. SELECT full_name_c, city FROM "Hotel Scheme".clients ORDER BY full_name_c;
2. SELECT id_room FROM "Hotel Scheme".rooms WHERE floor_num=1 AND price_per_night>1500
3. SELECT full_name_c FROM "Hotel Scheme".clients WHERE passport=563443;
4. SELECT full_name_c
	FROM "Hotel Scheme".clients,"Hotel Scheme".bookings
 WHERE "Hotel Scheme".clients.id_client="Hotel Scheme".bookings.id_client AND id_room=100;
5. SELECT full_name_c
	FROM "Hotel Scheme".clients,"Hotel Scheme".bookings
 WHERE "Hotel Scheme".clients.id_client="Hotel Scheme".bookings.id_client AND arrival_date BETWEEN '2020-01-01' AND '2020-05-01';
6. SELECT full_name_c
	FROM "Hotel Scheme".clients,"Hotel Scheme".bookings
 WHERE "Hotel Scheme".clients.id_client="Hotel Scheme".bookings.id_client  AND number_of_nights>10;
7. SELECT full_name_worker, COUNT(DISTINCT weekday) 
	FROM "Hotel Scheme".workers,"Hotel Scheme".time_table 
WHERE "Hotel Scheme".workers.id_worker="Hotel Scheme".time_table.id_worker
GROUP BY full_name_worker
8. SELECT DISTINCT full_name_worker 
FROM "Hotel Scheme".workers,"Hotel Scheme".time_table,"Hotel Scheme".bookings, "Hotel Scheme".clients,"Hotel Scheme".rooms
WHERE "Hotel Scheme".workers.id_worker="Hotel Scheme".time_table.id_worker
AND "Hotel Scheme".time_table.floor_num="Hotel Scheme".rooms.floor_num AND "Hotel Scheme".rooms.id_room="Hotel Scheme".bookings.id_room
AND "Hotel Scheme".bookings.id_client="Hotel Scheme".clients.id_client AND full_name_c='Коврова Прасковья Юльевна'
9. SELECT full_name_c, COUNT (id_booking)
	FROM "Hotel Scheme".bookings LEFT JOIN "Hotel Scheme".clients 
ON "Hotel Scheme".bookings.id_client="Hotel Scheme".clients.id_client
GROUP BY full_name_c
10. SELECT full_name_worker, full_name_c
	FROM "Hotel Scheme".bookings, "Hotel Scheme".workers, "Hotel Scheme".clients
WHERE "Hotel Scheme".bookings.id_client="Hotel Scheme".clients.id_client 
AND "Hotel Scheme".bookings.id_worker="Hotel Scheme".workers.id_worker
GROUP BY full_name_worker,full_name_c
11. SELECT AVG(number_of_nights) AS "средняя продолжительность проживания в отеле в 2020 году" FROM "Hotel Scheme".bookings WHERE arrival_date>'2020-01-01'
12. SELECT full_name_c, price_per_night*number_of_nights AS "Счет"
FROM "Hotel Scheme".clients,"Hotel Scheme".rooms, "Hotel Scheme".bookings 
WHERE "Hotel Scheme".bookings.id_client="Hotel Scheme".clients.id_client AND "Hotel Scheme".bookings.id_room="Hotel Scheme".rooms.id_room
13. SELECT COUNT(CASE WHEN arrival_date >= '2020-01-01’   THEN arrival_date ELSE NULL END) AS "2020 год", COUNT(CASE WHEN arrival_date <'2020-01-01' THEN arrival_date ELSE NULL END) AS "2019 год"  FROM "Hotel Scheme".bookings  
14. SELECT * FROM "Hotel Scheme".bookings INNER JOIN "Hotel Scheme".rooms ON 
"Hotel Scheme".bookings.id_room = "Hotel Scheme".rooms.id_room
15. SELECT full_name_c, 'guest' as "type" FROM "Hotel Scheme".clients
16.SELECT full_name_c, case city WHEN  'Санкт-Петербург' then 'Регистрация не требуется' else 'Регистрация требуется' end as "Регистрация" FROM "Hotel Scheme".clients
