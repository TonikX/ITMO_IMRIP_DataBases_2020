<html>
    <body>
        <h2> Data </h2>
        <?php
          try {
              $MyPDO = new PDO("pgsql:host=localhost;port=5432;dbname=lw2","postgres","930301ly520");
              echo "Successfully connect to database<br><br>";
          }
          catch(PDOException $e) {
            echo $e->getMessage();
          }
          $sql = "SELECT * FROM public.\"Brokers\" ";
          $result = $MyPDO->query($sql);

           while ($row = $result->fetch())
            {
                echo $row['Brokers_ID'] . '  ' . $row['Brokers_Name'] . '  ' . $row['Contact'] .  '  ' . "<br>";
            }
        ?>
        <form action="add.php" method="post">
            <h2> Add data </h2>
            Brokers_ID: <input type="text" name="Brokers_ID"><br>
            Brokers_Name: <input type="text" name="Brokers_Name"><br>
            Contact: <input type="text" name="Contact"><br>
            <input type="submit" value="Add">
        </form>

         <form action="update.php" method="post">
            <h2> Update data </h2>
            Brokers_ID: <input type="text" name="Brokers_ID"><br>
            <input type="submit" value="Update">
        </form>

         <form action="delete.php" method="post">
            <h2> Delete data </h2>
            Brokers_ID: <input type="text" name="Brokers_ID"><br>
            <input type="submit" value="Delete">

        </form>
    </body>
</html>