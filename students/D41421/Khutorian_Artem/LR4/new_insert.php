<?php
session_start();
try {
	$db = new PDO('pgsql:host=localhost;port=5432;dbname=Hotel;user=postgres;password=123456');
	echo "PDO connection object created<br>";
}
catch(PDOException $e) {
	echo $e->getMessage();
}
	$sql_ins = 'INSERT into "DBHotel"."Booking" ("booking_id", "guest_id", "room_id", "admin_id") VALUES (\'' . $_POST["booking_id"] . '\', \'' . $_POST["guest_id"] . '\', \'' . $_POST["room_id"] . '\', \'' . $_POST["admin_id"] . '\');';
//echo $sql_ins;
	$result = $db->query($sql_ins);
	if (!$sql_ins){
		echo "Update failed!!";
			}
	else {
		echo "Insert successfull;";
		$page = "index.php";
		header("Refresh: 1; " . $page);
			}
?>