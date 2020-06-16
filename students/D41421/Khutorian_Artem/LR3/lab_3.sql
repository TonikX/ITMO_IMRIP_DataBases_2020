--1
SELECT “Administrator”.”Name” FROM “DBHotel”.”Administrator” WHERE “NAME” LIKE ‘S%’;

--2
SELECT "employee"."employee_id", "employee"."employee_surname", "employee"."employee_name" FROM "DBHotel"."employee" 
JOIN "DBHotel"."Administrator" 
ON "Administrator"."Admin_id" = "employee"."admin_id" WHERE "Administrator"."Name" = 'Oleg Mihailov';

--3
SELECT "Guest"."Name" FROM "DBHotel"."Guest" JOIN "DBHotel"."Booking" ON "Guest"."Guest_id" = "Booking"."guest_id" WHERE 
"Booking"."checkout_date" BETWEEN '2020-05-07' AND '2020-05-09';

--4
SELECT "Booking"."checkin_date", "Booking"."checkout_date" FROM "DBHotel"."Booking" 
JOIN "DBHotel"."Guest" ON "Guest"."Guest_id" = "Booking"."guest_id" WHERE "Guest"."Name" LIKE 'N%';

--5
Select "Administrator"."Name", "Guest"."Name", "Guest"."Where_from" from "DBHotel"."Administrator" JOIN "DBHotel"."Booking" ON "Booking"."admin_id" = "Administrator"."Admin_id" 
JOIN "DBHotel"."Guest" ON "Guest"."Guest_id" = "Booking"."guest_id" WHERE "Guest"."Where_from" LIKE 'M%';

--6
Select "employee"."employee_surname", "cleaning_schedule"."floor_number" FROM "DBHotel"."employee" 
JOIN "DBHotel"."cleaning_schedule" ON "cleaning_schedule"."empoyee_id" = "employee"."employee_id" ORDER BY "floor_number";

--7
Select "room_type"."Capacity", "room_type"."Price", "Floor"."floor_number" FROM "DBHotel"."room_type" JOIN "Room" ON "Room"."type_id" = "room_type"."type_id" 
RIGHT JOIN "Floor" ON "Floor"."floor_id" = "Room"."floor_id";

--8
SELECT COUNT("Booking"."guest_id") FROM "DBHotel"."Booking" JOIN "DBHotel"."Room" ON "Room"."room_id" = "Booking"."room_id" 
WHERE "Booking"."checkin_date" >= '2020-05-01' AND "Booking"."checkout_date" <= '2020-06-01';

--9
SELECT COUNT("Room"."room_id"), "Floor"."floor_number" FROM "DBHotel"."Room" 
JOIN "DBHotel"."Floor" ON "Floor"."floor_id" = "Room"."floor_id" GROUP BY "Floor"."floor_number";

--10
SELECT "employee"."employee_surname", "cleaning_schedule"."weekday", "cleaning_schedule"."floor_number" FROM "DBHotel"."employee" 
RIGHT JOIN "DBHotel"."cleaning_schedule" ON "cleaning_schedule"."empoyee_id" = "employee"."employee_id";

--11
SELECT "Guest"."Name" FROM "DBHotel"."Guest" WHERE 
EXISTS (SELECT "Booking"."checkin_date" FROM "DBHotel"."Booking" 
		WHERE "Booking"."guest_id" = "Guest"."Guest_id" AND "Booking"."checkin_date" < '2020-05-06');

--12
SELECT "Room"."room_id" FROM "DBHotel"."Room" JOIN "DBHotel"."Floor" ON "Floor"."floor_id" = "Room"."floor_id"
JOIN "DBHotel"."Cleaning" ON "Cleaning"."floor_id" = "Room"."floor_id" 
WHERE "Cleaning"."cleaning_id" NOT IN(SELECT "Cleaning"."cleaning_id" FROM "DBHotel"."Cleaning" WHERE "Cleaning"."cleaning_date" > '2020-05-03');

--13
SELECT "Room"."room_id" FROM "DBHotel"."Room" JOIN "DBHotel"."Floor" ON "Floor"."floor_id" = "Room"."floor_id"
JOIN "DBHotel"."Cleaning" ON "Cleaning"."floor_id" = "Room"."floor_id" 
WHERE EXISTS(SELECT "Room"."room_id" FROM "DBHotel"."Room" 
												  JOIN "DBHotel"."Booking" ON "Booking"."room_id" = "Room"."room_id"
WHERE "Booking"."checkin_date" < '2020-05-05' AND "Cleaning"."cleaning_id" 
			 NOT IN(SELECT "Cleaning"."cleaning_id" FROM "DBHotel"."Cleaning" 
						WHERE "Cleaning"."cleaning_date" < '2020-05-06' AND "Cleaning"."cleaning_date" > '2020-05-01'));

--14
SELECT "Room"."room_id", (MAX("Booking"."checkout_date")) AS checkout_date
FROM "DBHotel"."Room" LEFT JOIN "DBHotel"."Booking" ON "Booking"."room_id" = "Room"."room_id"
GROUP BY "Room"."room_id"
HAVING (((MAX("Booking"."checkout_date"))< '2020-05-10')) OR (((MAX("Booking"."checkout_date")) IS NULL));

--15
SELECT DISTINCT "room_type"."type_id" AS Room_type, COUNT("Booking"."booking_id") AS Num_bookings, 
SUM("room_type"."Price") AS living_price, 
ABS(date("Booking"."checkout_date") - date("Booking"."checkin_date")) AS Amount_of_days, 
SUM("room_type"."Price" * ABS(date("Booking"."checkout_date") - date("Booking"."checkin_date"))) AS living_cost 
FROM("DBHotel"."room_type" INNER JOIN ( "DBHotel"."Booking" INNER JOIN "DBHotel"."Room" ON "Room"."room_id" = "Booking"."room_id") 
	  ON "room_type"."type_id" = "Room"."type_id")
GROUP BY "room_type"."type_id", "Booking"."checkout_date", "Booking"."checkin_date";

