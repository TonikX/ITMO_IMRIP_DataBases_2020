<?php

session_start();

$dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');

$sql = 'UPDATE chick.chicken SET breed = \'' . $_POST["breed"] . '\', weight = \'' . $_POST["weight"] . ' \', birth_date = \'' . $_POST["birth_date"] . ' \', productivity = \'' . $_POST["productivity"] . ' \', cell = \'' . $_POST["cell"] . '\' WHERE chicken_id = \'' . $_POST["chicken_id"] . '\'';
$result = $dbh->query($sql);
echo "OK";
header("Refresh: 1; " . "index.php");

?>