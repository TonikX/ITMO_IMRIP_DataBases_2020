<?php

session_start();

$dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');

$sql = 'delete from "bus_bd_schema"."buses" where license_plate = \'' . $_POST["license_plate"]. ' \'';
$result = $dbh->query($sql);
echo "OK";
header("Refresh: 1; " . "index.php");

?> 
