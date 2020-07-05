<?php

session_start();

$_SESSION['dbuser'] = 'postgres';
$_SESSION['dbpass'] = 'sss';
$_SESSION['host'] = '127.0.0.1';
$_SESSION['port'] ='5432';
$_SESSION['dbname'] = 'postgres';

try {
    $dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');
    echo "Connected.";
  }
  catch(PDOException $e) {
    echo $e->getMessage();
  } 

  $dbshow = "SELECT * FROM information_schema.tables WHERE table_schema = 'chick' ORDER BY table_name";
  $resultdb = $dbh->query($dbshow);
  $resultdb->setFetchMode(PDO::FETCH_ASSOC);

  $sql = 'SELECT * FROM chick.chicken';
  $result = $dbh->query($sql);
  $result->setFetchMode(PDO::FETCH_ASSOC);

  $sql5 = 'SELECT * FROM chick.chicken WHERE chicken.weight > 4';
  $result5 = $dbh->query($sql5);
  $result5->setFetchMode(PDO::FETCH_ASSOC);

  $sql1 = 'SELECT breed.breed_name from chick.breed, chick.diet WHERE diet.diet_id = 1 AND breed.diet = diet.diet_id GROUP BY diet.diet_id, breed.breed_name';
  $result1 = $dbh->query($sql1);
  $result1->setFetchMode(PDO::FETCH_ASSOC);

  $sql2 = "SELECT chicken_id, weight, breed, productivity FROM chick.chicken WHERE weight > 3 AND breed LIKE 'русская белая' AND productivity > 26";
  $result2 = $dbh->query($sql2);
  $result2->setFetchMode(PDO::FETCH_ASSOC);

  $sql3 = 'SELECT employee.name, CHAR_LENGTH (employee.name) AS name_length FROM chick.employee ORDER BY name_length  DESC';
  $result3 = $dbh->query($sql3);
  $result3->setFetchMode(PDO::FETCH_ASSOC);

  $sql4 = 'SELECT (SELECT COUNT(*) FROM chick.chicken) AS chickens,
            (SELECT COUNT(*) FROM chick.employee) AS employees,
            (SELECT COUNT(*) FROM chick.zeh) AS zehs,
            (SELECT COUNT(*) FROM chick.cell) AS cells';
  $result4 = $dbh->query($sql4);
  $result4->setFetchMode(PDO::FETCH_ASSOC);

    
?>
<!DOCTYPE html>
<style>
    body {background-color: pink;}
    h1   {color: red;}
    th {text-align: left;}
    table, th, td {border: 1px solid black;}
</style>
<html>
    <head>
        <title>PHP MySQL Query Data Chickens</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <div id="container">
        <h1>Databases tables</h1>
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
        <h1>Chickens table</h1>
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>chicken_id</th>
                    <th>breed</th>
                    <th>weight</th>
                    <th>birth_date</th>
                    <th>productivity</th>
                    <th>cell</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['chicken_id']) ?></td>
                        <td><?php echo htmlspecialchars($row['breed']); ?></td>
                        <td><?php echo htmlspecialchars($row['weight']); ?></td>
                        <td><?php echo htmlspecialchars($row['birth_date']); ?></td>
                        <td><?php echo htmlspecialchars($row['productivity']); ?></td>
                        <td><?php echo htmlspecialchars($row['cell']); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <h1>Work with data</h1>
        <form action="add.php" method="post">
            <h2> Add data </h2>
            chicken_id: <input type="text" name="chicken_id"><br>
            breed: <input type="text" name="breed"><br>
            weight: <input type="text" name="weight"><br>
            birth_date: <input type="text" name="birth_date"><br>
            productivity: <input type="text" name="productivity"><br>
            cell: <input type="text" name="cell"><br>
            <input type="submit" value="Add">
        </form>

        <form action="edit.php" method="post">
            <h2> Edit data </h2>
            chicken_id: <input type="text" name="chicken_id"><br>
            breed: <input type="text" name="breed"><br>
            weight: <input type="text" name="weight"><br>
            birth_date: <input type="text" name="birth_date"><br>
            productivity: <input type="text" name="productivity"><br>
            cell: <input type="text" name="cell"><br>
            <input type="submit" value="Edit">
        </form>

        <form action="delete.php" method="post">
            <h2> Delete data </h2>
            chicken_id: <input type="text" name="chicken_id"><br>
            <input type="submit" value="Delete">
        </form>
        <h1>Request 1</h1>
        SELECT * FROM chick.chicken WHERE chicken.weight > 4 
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>chicken_id</th>
                    <th>breed</th>
                    <th>weight</th>
                    <th>birth_date</th>
                    <th>productivity</th>
                    <th>cell</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result5->fetch()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['chicken_id']) ?></td>
                        <td><?php echo htmlspecialchars($row['breed']); ?></td>
                        <td><?php echo htmlspecialchars($row['weight']); ?></td>
                        <td><?php echo htmlspecialchars($row['birth_date']); ?></td>
                        <td><?php echo htmlspecialchars($row['productivity']); ?></td>
                        <td><?php echo htmlspecialchars($row['cell']); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <h1>Request 2</h1>
        SELECT breed.breed_name from chick.breed, chick.diet WHERE diet.diet_id = 1 AND breed.diet = diet.diet_id GROUP BY diet.diet_id, breed.breed_name
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>breed</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result1->fetch()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['breed_name']); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <h1>Request 3</h1>
        SELECT chicken_id, weight, breed, productivity FROM chick.chicken WHERE weight > 3 AND breed LIKE 'русская белая' AND productivity > 26
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>chicken_id</th>
                    <th>breed</th>
                    <th>weight</th>
                    <th>productivity</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result2->fetch()): ?>
                    <tr>
                    <td><?php echo htmlspecialchars($row['chicken_id']) ?></td>
                    <td><?php echo htmlspecialchars($row['breed']); ?></td>
                    <td><?php echo htmlspecialchars($row['weight']); ?></td>
                    <td><?php echo htmlspecialchars($row['productivity']); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <h1>Request 4</h1>
        SELECT employee.name, CHAR_LENGTH (employee.name) AS name_length FROM chick.employee ORDER BY name_length  DESC
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>name</th>
                    <th>name_length</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result3->fetch()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['name']) ?></td>
                        <td><?php echo htmlspecialchars($row['name_length']) ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <h1>Request 5</h1>
        SELECT (SELECT COUNT(*) FROM chick.chicken) AS chickens,
            (SELECT COUNT(*) FROM chick.employee) AS employees,
            (SELECT COUNT(*) FROM chick.zeh) AS zehs,
            (SELECT COUNT(*) FROM chick.cell) AS cells
        <table text-align="center" style="width:50%" class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>chickens</th>
                    <th>employees</th>
                    <th>zehs</th>
                    <th>cells</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result4->fetch()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['chickens']) ?></td>
                        <td><?php echo htmlspecialchars($row['employees']); ?></td>
                        <td><?php echo htmlspecialchars($row['zehs']); ?></td>
                        <td><?php echo htmlspecialchars($row['cells']); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </body>
</div>
</html>
