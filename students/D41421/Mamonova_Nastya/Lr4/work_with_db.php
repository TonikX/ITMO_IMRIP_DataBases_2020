<html>
    <body>
        <h2> Select data </h2>
        <?php
          try {
            $dbh = new PDO('pgsql:host=localhost;port=5432;dbname=AdvertAgency;user=vladiknaska;password=123');
            echo "PDO connection object created<br>";
          }
          catch(PDOException $e) {
            echo $e->getMessage();
          }
          $sql = 'SELECT * FROM "AdvertAgencySchema"."Customer" ORDER BY id;';
          $result = $dbh->query($sql);

          while ($row = $result->fetch())
            {
                echo $row['id'] . ' ' . $row['full_name'] . ' ' . $row['phone_number'] . $row['email'] . " " . "<br>";
            }
        ?>
        <form action="add.php" method="post">
            <h2> Add data </h2>
            id: <input type="text" name="id"><br>
            full_name: <input type="text" name="full_name"><br>
            phone_number: <input type="text" name="phone_number"><br>
            email: <input type="text" name="email"><br>
            <input type="submit" value="Add">
        </form>

        <form action="edit.php" method="post">
            <h2> Edit data </h2>
            <p> Enter customer id which should be edited</p>
            id: <input type="text" name="id"><br>
            <input type="submit" value="Enter">
        </form>

        <form action="delete.php" method="post">
            <h2> Delete data </h2>
            <p> Choose rows which should be deleted</p>
        <?php
            try {
              $dbh = new PDO('pgsql:host=localhost;port=5432;dbname=AdvertAgency;user=vladiknaska;password=123');
            }
            catch(PDOException $e) {
              echo $e->getMessage();
            };
            $sql = 'SELECT * FROM "AdvertAgencySchema"."Customer" ORDER BY id';
            $result = $dbh->query($sql);
            $i = 1;
            echo "<table>
        <tr>
        <th>id</th>
        <th>full_name</th>
        <th>phone_number</th>
        <th>email</th>
        </tr>";
        while ($row = $result->fetch()){
            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['full_name'] . "</td>";
            echo "<td>" . $row['phone_number'] . "</td>";
            echo "<td>" . $row['email'] . "</td>";
            echo '<td><input type="checkbox" name="checkboxstatus[' . $i . ']" value="' . $row["id"] . '"  /></td>';
            echo "</tr>";
            $i++;
        };
        echo "</table>";
        ?>

            <input type="submit" value="Delete" name="Delete" />
        </form>
    </body>
</html>
