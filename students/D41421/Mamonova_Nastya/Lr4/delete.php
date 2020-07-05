<?php
try {
  $dbh = new PDO('pgsql:host=localhost;port=5432;dbname=AdvertAgency;user=vladiknaska;password=123');
  echo "PDO connection object created<br>";
}
catch(PDOException $e) {
  echo $e->getMessage();
}

    if (isset($_POST['Delete'])){
        foreach($_POST['checkboxstatus'] as $val) {
            $sqldel = 'DELETE from "AdvertAgencySchema"."Customer" WHERE id = '. $val .';';
            $result = $dbh->query($sqldel);
        };
        echo "Row was deleted";
    }
    $page = "work_with_db.php";
    header("Refresh: 1; " . $page);
?>
