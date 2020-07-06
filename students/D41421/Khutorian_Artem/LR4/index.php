<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.0/milligram.css">
   <style>
body { 
    margin: 10px; 
   }
   </style>
   </head>
    <body>
        <h2> Select data </h2>
        <?php
          try {
            $db = new PDO('pgsql:host=localhost;port=5432;dbname=Hotel;user=postgres;password=123456');
            echo "PDO connection object created<br>";
          }
          catch(PDOException $e) {
            echo $e->getMessage();
          }
          $sql = 'SELECT * FROM "DBHotel"."Booking";';
          $result = $db->query($sql);

          while ($row = $result->fetch())
            {
                echo $row['booking_id'] . ' ' . $row['guest_id'] . ' ' . $row['room_id'] . " " . "<br>";
            }
        ?>
		
        <form action="new_insert.php" method="post">
            <h2> Insert data </h2>
            Booking id: <input type="text" name="booking_id"><br>
            Guest id: <input type="text" name="guest_id"><br>
            Room id: <input type="text" name="room_id"><br>
			<!--Admin id: <input type="text" name="admin_id"><br-->
			Admin id: <select name="admin_id"><br>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				</select> 
            <input type="submit" value="Add">
        </form>

        <form action="update.php" method="post">
            <h2> Update data </h2>
            <p> Enter booking id to update</p>
            Booking id: <input type="text" name="booking_id"><br>
            <input type="submit" value="Update">
        </form>

        <!--form action="delete.php" method="post">
            <h2> Delete data </h2>
            <p> Choose data to delete</p-->
			<form action="delete.php" method="post">
            <h2> Delete data </h2>
            booking_id: <input type="text" name="booking_id"><br>
            <input type="submit" value="Delete">
        </form>
        <?php
            /*try {
              $dbh = new PDO('pgsql:host=localhost;port=5432;dbname=Hotel;user=postgres;password=123456');
            }
            catch(PDOException $e) {
              echo $e->getMessage();
            };
            $sql = 'SELECT * FROM "DBHotel"."Booking" ORDER BY booking_id';
            $result = $dbh->query($sql);
            $i = 1;
            echo "<table>
        <tr>
        <th>booking id</th>
        <th>guest id</th>
        <th>room id</th>
        </tr>";
        while ($row = $result->fetch()){
            echo "<tr>";
            echo "<td>" . $row['booking_id'] . "</td>";
            echo "<td>" . $row['guest_id'] . "</td>";
            echo "<td>" . $row['room_id'] . "</td>";
            echo '<td><input type="checkbox" name="checkboxstatus[' . $i . ']" value="' . $row["booking_id"] . '"  /></td>';
            echo "</tr>";
            $i++;
        };
        echo "</table>";*/
        ?>

            <!--input type="submit" value="Delete" name="Delete" />
        </form>
    </body>
</html>