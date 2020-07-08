
<?php

session_start();

$dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');

$sql = 'INSERT INTO "hotelsc"."clients" VALUES (\'' . $_POST["full_name_c"] . ' \', \'' . $_POST["id_client"] . '\', \'' . $_POST["passport"] . '\', \')';
$result = $dbh->query($sql);
echo "OK";
header("Refresh: 1; " . "index.php");

?> 

