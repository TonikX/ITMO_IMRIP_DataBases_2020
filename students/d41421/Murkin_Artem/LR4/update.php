<?php

session_start();

$dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');

$sql = 'update bus_bd_schema.buses set route_number = \'' . $_POST["route_number"] . '\', bus_type = \'' . $_POST["bus_type"] . ' \' where license_plate = \'' . $_POST["license_plate"] . '\'';
$result = $dbh->query($sql);
echo "OK";
header("Refresh: 1; " . "index.php");

?> 

