<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.0/milligram.css">
   <style>
body { 
    margin: 10px; 
   }
   </style>
   </head>
   <a href="index.php">Вернуться на главную</a>
   <form action="" method="get">
            <input type="submit" value="get" name="get">
    </form>;
            <h4> 1. Получить вместимость номера, цену и номер этажа </h4>
            
<?php
          try {
            $db = new PDO('pgsql:host=localhost;port=5432;dbname=Hotel;user=postgres;password=123456');
            //echo "PDO connection object created<br>";
          }
          catch(PDOException $e) {
            echo $e->getMessage();
          }
          $sql = 'Select "room_type"."Capacity", "room_type"."Price", "Floor"."floor_number" FROM "DBHotel"."room_type" JOIN "DBHotel"."Room" ON "Room"."type_id" = "room_type"."type_id" 
RIGHT JOIN "DBHotel"."Floor" ON "Floor"."floor_id" = "Room"."floor_id";';
          $result = $db->query($sql);
          
	if (isset($_GET['get'])){
		  while ($row = $result->fetch())
			{
				echo $row['Capacity'] . ' ' . $row['Price'] . ' ' . $row['floor_number'] . " " . "<br>";
			}
	}
?>

<h4> 2. Посчитать номера на этаже </h4>
            
<?php
          try {
            $db = new PDO('pgsql:host=localhost;port=5432;dbname=Hotel;user=postgres;password=123456');
            //echo "PDO connection object created<br>";
          }
          catch(PDOException $e) {
            echo $e->getMessage();
          }
          $sql = 'SELECT COUNT("Room"."room_id"), "Floor"."floor_number" FROM "DBHotel"."Room" 
JOIN "DBHotel"."Floor" ON "Floor"."floor_id" = "Room"."floor_id" GROUP BY "Floor"."floor_number";';
          $result = $db->query($sql);
          /*echo '<form action="" method="get">
            <input type="submit" value="get" name="get">
    </form>';*/
	if (isset($_GET['get'])){
		  while ($row = $result->fetch())
			{
				echo $row['count'] . ' ' . $row['floor_number'] . " " . "<br>";
			}
	}
?>

<h4> 3. Вывести имя сотрудника, день недели, в который он работает и номер этажа </h4>
            
<?php
          try {
            $db = new PDO('pgsql:host=localhost;port=5432;dbname=Hotel;user=postgres;password=123456');
            //echo "PDO connection object created<br>";
          }
          catch(PDOException $e) {
            echo $e->getMessage();
          }
          $sql = 'SELECT "employee"."employee_surname", "cleaning_schedule"."weekday", "cleaning_schedule"."floor_number" FROM "DBHotel"."employee" 
RIGHT JOIN "DBHotel"."cleaning_schedule" ON "cleaning_schedule"."empoyee_id" = "employee"."employee_id";';
          $result = $db->query($sql);
          /*echo '<form action="" method="get">
            <input type="submit" value="get" name="get">
    </form>';*/
	if (isset($_GET['get'])){
		  while ($row = $result->fetch())
			{
				echo $row['employee_surname'] . ' ' . $row['weekday'] . ' ' . $row['floor_number'] . " " . "<br>";
			}
	}
?>

<h4> 4. Вывести имя сотрудника, которому расписание составил администратор с id=2 </h4>
<?php
          try {
            $db = new PDO('pgsql:host=localhost;port=5432;dbname=Hotel;user=postgres;password=123456');
            //echo "PDO connection object created<br>";
          }
          catch(PDOException $e) {
            echo $e->getMessage();
          }
          $sql = 'SELECT "employee"."employee_id", "employee"."employee_surname", "employee"."employee_name" FROM "DBHotel"."employee" 
JOIN "DBHotel"."Administrator" 
ON "Administrator"."Admin_id" = "employee"."admin_id" WHERE "Administrator"."Admin_id" = 2;';
          $result = $db->query($sql);
          /*echo '<form action="" method="get">
            <input type="submit" value="get" name="get">
    </form>';*/
	if (isset($_GET['get'])){
		  while ($row = $result->fetch())
			{
				echo $row['employee_id'] . ' ' . $row['employee_surname'] . ' ' . $row['employee_name'] . " " . "<br>";
			}
	}
?>

<h4> 5. Вывести id номера и телефон номера на 3 этаже </h4>
<?php
          try {
            $db = new PDO('pgsql:host=localhost;port=5432;dbname=Hotel;user=postgres;password=123456');
            //echo "PDO connection object created<br>";
          }
          catch(PDOException $e) {
            echo $e->getMessage();
          }
          $sql = 'Select "Room"."room_id", "Room"."telephone" FROM  "DBHotel"."Room" 
RIGHT JOIN "DBHotel"."Floor" ON "Floor"."floor_id" = "Room"."floor_id" WHERE "Floor"."floor_number" = 3;';
//echo $sql
          $result = $db->query($sql);
		  /*echo '<form action="" method="get">
            <input type="submit" value="get" name="get">
    </form>';*/
	if (isset($_GET['get'])){
		  while ($row = $result->fetch())
			{
				echo $row['room_id'] . ' ' . $row['telephone'] . " " . "<br>";
			}
	}
?>