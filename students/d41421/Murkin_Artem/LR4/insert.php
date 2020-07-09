
<?php

session_start();

$dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');

$sql = 'insert into "bus_bd_schema"."buses" values (\'' . $_POST["license_plate"] . '\', \'' . $_POST["route_number"] . '\', \'' . $_POST["bus_type"] . ' \')';
$result = $dbh->query($sql);
echo "OK";
header("Refresh: 1; " . "index.php");

?> 


