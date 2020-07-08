<?php

session_start();

$_SESSION['dbuser'] = 'postgres';
$_SESSION['dbpass'] = 'carina';
$_SESSION['host'] = '127.0.0.1';
$_SESSION['port'] ='5432';
$_SESSION['dbname'] = 'hotel';

try {
    $dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');
    echo "Connected.";
  }
  catch(PDOException $e) {
    echo $e->getMessage();
  } 

  $dbshow = "SELECT * FROM information_schema.tables WHERE table_schema = 'hotelsc' ORDER BY table_name";
  $resultdb = $dbh->query($dbshow);
  $resultdb->setFetchMode(PDO::FETCH_ASSOC);

  
  $sql= "SELECT * FROM hotelsc.clients ORDER BY full_name_c";
  $result = $dbh->query($sql);
  $result->setFetchMode(PDO::FETCH_ASSOC);
  
  $sql1 = "SELECT full_name_worker, full_name_c
	FROM hotelsc.bookings, hotelsc.workers, hotelsc.clients
WHERE hotelsc.bookings.id_client=hotelsc.clients.id_client 
AND hotelsc.bookings.id_worker=hotelsc.workers.id_worker
GROUP BY full_name_worker,full_name_c";
  $result1 = $dbh->query($sql1);
  $result1->setFetchMode(PDO::FETCH_ASSOC);

  $sql2 = 'SELECT full_name_c, city FROM hotelsc.clients ORDER BY full_name_c';
  $result2 = $dbh->query($sql2);
  $result2->setFetchMode(PDO::FETCH_ASSOC);

  $sql3 = 'SELECT full_name_c FROM hotelsc.clients WHERE passport=563443';
  $result3 = $dbh->query($sql3);
  $result3->setFetchMode(PDO::FETCH_ASSOC);

  $sql4 = 'SELECT id_room FROM hotelsc.rooms WHERE floor_num=1 AND price_per_night>1500';
  $result4 = $dbh->query($sql4);
  $result4->setFetchMode(PDO::FETCH_ASSOC);

  $sql5 = 'SELECT full_name_c, id_room FROM hotelsc.clients, hotelsc.bookings
 WHERE hotelsc.clients.id_client=hotelsc.bookings.id_client';
  $result5 = $dbh->query($sql5);
  $result5->setFetchMode(PDO::FETCH_ASSOC);


?>
<!DOCTYPE html>
<style>
    body {background-color: cadetblue;}
    h1   {color: coral;}
    th {text-align: left;color:Azure}
    table, th, td {border: 2px solid LightSlateGrey;}
</style>
<html>
    <head>
        <title>PHP Hotel Index</title>
    </head>
    <body>
        <div id="container">
        <h1>Содержимое БД</h1>
            <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
                <thead>
                    <tr>
                        <th>table_name</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $resultdb->fetch()): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['table_name']) ?></td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        
        <h1>Запрос 1</h1>
         SELECT full_name_worker, COUNT(DISTINCT weekday) 
	FROM "Hotel Scheme".workers,"Hotel Scheme".time_table 
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>full_name_c</th>
                    <th>full_name_c</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result1->fetch()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['full_name_worker']) ?></td>
                        <td><?php echo htmlspecialchars($row['full_name_c']); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <h1>Запрос 2</h1>
        SELECT full_name_c, city FROM "Hotel Scheme".clients ORDER BY full_name_c
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>full_name_c</th>
					<th>city</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result2->fetch()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['full_name_c']); ?></td>
						<td><?php echo htmlspecialchars($row['city']); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <h1>Запрос 3</h1>
        SELECT full_name_c FROM "Hotel Scheme".clients WHERE passport=563443
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>full_name_c</th>

                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result3->fetch()): ?>
                    <tr>
                    <td><?php echo htmlspecialchars($row['full_name_c']) ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <h1>Запрос 4</h1>
        SELECT id_room FROM hotelsc.rooms WHERE floor_num=1 AND price_per_night>1500
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>id_room</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result4->fetch()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['id_room']) ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <h1>Запрос 5</h1>
        SELECT full_name_c, id_room
	FROM hotelsc..clients,hotelsc.bookings
 WHERE hotelsc.clients.id_client=hotelsc.bookings.id_client
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>full_name_c</th>
					<th>room</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result5->fetch()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['full_name_c']) ?></td>
						 <td><?php echo htmlspecialchars($row['id_room']) ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
		<h1>Клиенты</h1>
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>full_name_c</th>
                    <th>id_client</th>
                    <th>passport</th>
                    <th>city</th>

                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['full_name_c']) ?></td>
                        <td><?php echo htmlspecialchars($row['id_client']); ?></td>
                        <td><?php echo htmlspecialchars($row['passport']); ?></td>
                        <td><?php echo htmlspecialchars($row['city']); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <h1>Измения в БД</h1>
        <form action="add.php" method="post">
            <h2> Добавить данные </h2>
            full_name_c: <input type="text" name="full_name_c"><br>
            id_client: <input type="text" name="id_client"><br>
            passport: <input type="text" name="passport"><br>
            city: <input type="text" name="city"><br>
            <input type="submit" value="Add">
        </form>

        <form action="edit.php" method="post">
            <h2> Изменить данные </h2>
            full_name_c: <input type="text" name="full_name_c"><br>
            id_client:  <input type="text" name="id_client"><br>
            passport: <input type="text" name="passport"><br>
            city: <input type="text" name="city"><br>
            <input type="submit" value="Edit">
        </form>

        <form action="delete.php" method="post">
            <h2> Удалить данные </h2>
            passport: <input type="text" name="passport"><br>
            <input type="submit" value="Delete">
        </form>
		
    </body>
</div>
</html>