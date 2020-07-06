<?php

session_start();

$dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');

$sql = 'DELETE FROM hotelsc.clients WHERE passport = \'' . $_POST["passport"]. ' \'';
$result = $dbh->query($sql);
echo "OK";
header("Refresh: 1; " . "index.php");

?> 