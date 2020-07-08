<?php

session_start();

$dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');

$sql = 'UPDATE hotelsc.clients SET full_name_c = \'' . $_POST["full_name_c"] . '\', id_client = \'' . $_POST["id_client"] . ' \', passport = \'' . $_POST["passport"] . ' \', city = \'' . $_POST["city"] . ' \'';
$result = $dbh->query($sql);
echo "OK";
header("Refresh: 1; " . "index.php");

?> 

