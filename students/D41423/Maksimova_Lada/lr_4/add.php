<?php

session_start();

$dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');

$sql = 'INSERT INTO "chick"."chicken" VALUES (\'' . $_POST["chicken_id"] . ' \', \'' . $_POST["breed"] . '\', \'' . $_POST["weight"] . '\', \'' . $_POST["birth_date"] . '\', \'' . $_POST["productivity"] . '\', \'' . $_POST["cell"] . '\')';
$result = $dbh->query($sql);
echo "OK";
header("Refresh: 1; " . "index.php");

?>