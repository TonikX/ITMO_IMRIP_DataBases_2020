<?php

session_start();

$_SESSION['dbuser'] = 'postgres';
$_SESSION['dbpass'] = 'pswd1234';
$_SESSION['host'] = 'localhost';
$_SESSION['port'] = '5432';
$_SESSION['dbname'] = 'bus_park';

try {
    $dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');
    echo "Connected to the database<br><br>";
  }
  catch(PDOException $e) {
    echo $e->getMessage();
  } 

  $sql= "select * from bus_bd_schema.buses";
  $result = $dbh->query($sql);
  $result->setFetchMode(PDO::FETCH_ASSOC);

?>

<html>
    <head>
        <title>Buses db</title>
    </head>
    <body>
		<h1>Buses</h1>
        <?php
		while ($row = $result->fetch()) echo $row['license_plate'].'	||	'.$row['route_number'].'	||	'.$row['bus_type'].'<br>';
		?>
        <form action="insert.php" method="post">
            <h2> Insert new data </h2>
            license_plate: <input type="text" name="license_plate"><br>
            route_number: <input type="text" name="route_number"><br>
			bus_type: <input type="text" name="bus_type"><br>
            <input type="submit" value="Insert">
        </form>
        <form action="update.php" method="post">
            <h2> Update existing data </h2>
            license_plate to update: <input type="text" name="license_plate"><br>
			<h3>New data</h3>
            route_number:  <input type="text" name="route_number"><br>
            bus_type: <input type="text" name="bus_type"><br>
            <input type="submit" value="Update">
        </form>
        <form action="delete.php" method="post">
            <h2> Delete data </h2>
            license_plate of the bus to delete: <input type="text" name="license_plate"><br>
            <input type="submit" value="Delete">
        </form>
    </body>
</html> 