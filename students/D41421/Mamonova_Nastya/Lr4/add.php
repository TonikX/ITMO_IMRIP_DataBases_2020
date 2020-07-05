<?php
  try {
    $dbh = new PDO('pgsql:host=localhost;port=5432;dbname=AdvertAgency;user=vladiknaska;password=123');
    echo "PDO connection object created<br>";
  }
  catch(PDOException $e) {
    echo $e->getMessage();
  }

  $sql = 'INSERT INTO "AdvertAgencySchema"."Customer" VALUES (\'' . $_POST["id"] . ' \', \'' . $_POST["full_name"] . '\', \'' . $_POST["phone_number"] . '\', \'' . $_POST["email"] . '\');';
  $result = $dbh->query($sql);
  echo "<br> Values are inserted";
  $page = "work_with_db.php";
  header("Refresh: 1; " . $page);
?>
