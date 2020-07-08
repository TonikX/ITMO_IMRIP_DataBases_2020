<?php
$dbh = new PDO('pgsql:host=localhost;port=5432;dbname=Luch;user=postgres;password=1995');
$sql = "INSERT INTO luch_schema.price_list VALUES(" .
    "'" . $_POST["id"]       . "'" . ", " .
    "'" . $_POST["service"]  . "'" . ", " .
    "'" . $_POST["price"]    . "'" . ");";
$result = $dbh->query($sql);
header("Location:main.php");
?>