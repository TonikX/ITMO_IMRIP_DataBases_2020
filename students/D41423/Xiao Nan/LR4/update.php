<html>
    <body>
<?php

try {
    
    $MyPDO = new PDO("pgsql:host=localhost;port=5432;dbname=lw2","postgres","930301ly520");
    echo "Successfully connect to database<br><br>";
    
}

catch(PDOException $e) {
    
    echo $e->getMessage();
    
}

    $sql = 'SELECT * FROM "public"."Brokers" WHERE "Brokers_ID" = \'' . $_POST["Brokers_ID"]. ' \'';
    $result = $MyPDO->query($sql);
    $row = $result->fetch();

    $Brokers_ID = $row['Brokers_ID'];
    $Brokers_Name = $row['Brokers_Name'];
    $Contact = $row['Contact'];

echo '<form action="update.php" method="post">
      <h3> Update data </h3>
      Brokers_ID: <input type="text" name="Brokers_ID" value="' . $Brokers_ID . '"><br>
      Brokers_Name: <input type="text" name="Brokers_Name" value="' . $Brokers_Name . '"><br>
      Contact: <input type="text" name="Contact" value="' . $Contact . '"><br>
      <input type="submit" value="Update" name="new">
    </form>';

if (isset($_POST['new'])){
    $sql_update = 'UPDATE "public"."Brokers" SET "Brokers_Name" = \'' . $_POST["Brokers_Name"] . '\', "Contact" = \'' . $_POST["Contact"] . '\' WHERE "Brokers_ID" = ' . $_POST["Brokers_ID"] . ';';
    $result = $MyPDO->query($sql_update);
    if (!$sql_update){
        echo "Update failed!!";
    }
    else {
        echo "Update successfull;";
    }
};
?>
    <form action="Index.php" method="post">
    <input type="submit" value="Back to Home">
    </form>
    
    </body>
</html>