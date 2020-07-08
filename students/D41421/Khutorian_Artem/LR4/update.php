<!DOCTYPE html>
<head>
<h2>Edit data</h2>
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
</head>
<body>
<ul>
<form name="display" action="update.php" method="POST" >
<!--li>Booking ID:</li><li><input type="text" name="booking_id" /></li>
<li><input type="submit" name="submit" value="submit" /></li-->
</form>
</ul>
</body>
</html>

<?php
    try {
        $dbh = new PDO('pgsql:host=localhost;port=5432;dbname=Hotel;user=postgres;password=123456');
        echo "PDO connection object created<br>";
    }
    catch(PDOException $e) {
        echo $e->getMessage();
    }

    $sql = 'SELECT * FROM "DBHotel"."Booking" where booking_id = '. $_POST["booking_id"];
    $result = $dbh->query($sql);
    $row = $result->fetch();

    $booking_id = $row['booking_id'];
    $guest_id = $row['guest_id'];
    $room_id = $row['room_id'];
    
	echo '<form action="" method="post">
      booking_id: <input type="text" name="booking_id" value="' . $booking_id . '" readonly><br>
      guest_id: <input type="text" name="guest_id" value="' . $guest_id . '"><br>
      room_id: <input type="text" name="room_id" value="' . $room_id . '"><br>
      <input type="submit" value="Edit" name="new">
    </form>';
    

    if (isset($_POST['new'])){
      $sql_update = 'UPDATE "DBHotel"."Booking" SET "room_id" = \'' . $_POST["room_id"] . '\', "guest_id" = \'' . $_POST["guest_id"] . '\' WHERE "Booking"."booking_id" = ' . $_POST["booking_id"] . ';';
	  $result = $dbh->query($sql_update);
        if (!$sql_update){
            echo "Update failed!!";
        }
        else {
            echo "Update successfull;";
            $page = "index.php";
            header("Refresh: 1; " . $page);
        }
    };

?>

