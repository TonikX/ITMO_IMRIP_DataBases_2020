<?php

try {
	$db = new PDO('pgsql:host=localhost;port=5432;dbname=Hotel;user=postgres;password=123456');
	echo "PDO connection object created<br>";
}
catch(PDOException $e) {
	echo $e->getMessage();
}
$sql = 'DELETE from "DBHotel"."Booking" WHERE "Booking"."booking_id" = \'' . $_POST["booking_id"]. ' \'';
$result = $db->query($sql);
echo "OK";
$page = "index.php";
header("Refresh: 1; " . "index.php");

?>



