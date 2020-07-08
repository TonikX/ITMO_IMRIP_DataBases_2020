<?php
$dbh = new PDO('pgsql:host=localhost;port=5432;dbname=Luch;user=postgres;password=1995');
if (isset($_POST["Delete"])) {
    $dbh->query("DELETE FROM luch_schema.price_list WHERE id = " . substr($_POST["Delete"], strlen("Delete ")) . ";");
}
if (isset($_POST["Update"])) {
    $id = substr($_POST["Update"], strlen("Update "));
    $sql = "UPDATE luch_schema.price_list SET service = '" . $_POST["EditService" . $id] . "', price = " . $_POST["EditPrice" . $id] . " WHERE id = " . $id . ";";
    $result = $dbh->query($sql);
}

header("Location:main.php");
?>