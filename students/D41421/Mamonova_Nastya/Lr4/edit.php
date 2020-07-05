<?php
    try {
        $dbh = new PDO('pgsql:host=localhost;port=5432;dbname=AdvertAgency;user=vladiknaska;password=123');
        echo "PDO connection object created<br>";
    }
    catch(PDOException $e) {
        echo $e->getMessage();
    }

    $sql = 'SELECT * FROM "AdvertAgencySchema"."Customer" where id = ' . $_POST["id"];
    $result = $dbh->query($sql);
    $row = $result->fetch();

    $id = $row['id'];
    $full_name = $row['full_name'];
    $phone_number = $row['phone_number'];
    $email = $row['email'];

    echo '<form action="" method="post">
      <h3> Edit data </h3>
      id: <input type="text" name="id" value="' . $id . '"><br>
      full_name: <input type="text" name="full_name" value="' . $full_name . '"><br>
      phone_number: <input type="text" name="phone_number" value="' . $phone_number . '"><br>
      email: <input type="text" name="email" value="' . $email . '"><br>
      <input type="submit" value="Edit" name="new">
    </form>';

    if (isset($_POST['new'])){
      $sql_update = 'UPDATE "AdvertAgencySchema"."Customer" SET full_name =  \'' . $_POST["full_name"] . '\' WHERE id = ' . $_POST["id"] . ';';
      $result = $dbh->query($sql_update);
        if (!$sql_update){
            echo "Update failed!!";
        }
        else {
            echo "Update successfull;";
            $page = "work_with_db.php";
            header("Refresh: 1; " . $page);
        }
    };
?>
