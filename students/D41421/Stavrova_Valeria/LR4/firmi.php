
<a href = 'index.php'>Главная</a> 
<a href = 'praktika.php'>Практика</a> 
<a href = 'pokupateli.php'>Покупатели</a> 
<a href = 'tovari.php'>Товары</a> 
<a href = 'brokeri.php'>Брокеры</a> 
<a href = 'kontori.php'>Конторы</a> 
<a href = 'firmi.php'>Фирмы</a> 


<!DOCTYPE html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>
	<body>
		<hr>
		<h3>Редактировать</h3>
		<ul>
			<form name="insert" action="firmi.php" method="POST" >
				<ul>Номер фирмы:</ul><ul><input type="int" name="Номер_фирмы"/></ul>
				<ul>Название:</ul><ul><input type="text" name="Название"/></ul>
				<br><br>
				<button type="submit" name="Add">Добавить</button>
				<button type="submit" name="upd">Редактировать</button>
				<button type="submit" name="Delete">Удалить</button>
			</form>
		</ul>
		<hr>
	</body>
</html>


<?php
echo "<br/>";
$dbuser = 'postgres';
$dbpass = '123';
$host = 'localhost';
$dbname ='laba';
$ClientTable = '"Фирмы"';
$db = pg_connect("host=$host dbname=$dbname user=$dbuser password=$dbpass");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (isset($_POST["Add"])) {
            $infoA = "insert into $ClientTable values ('$_POST[Номер_фирмы]', '$_POST[Название]')";
            $result = pg_query($db, $infoA);
			$result = pg_fetch_all($result);
			pg_close($db);
         }
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (isset($_POST["Delete"])) {
            $infoA = "delete from $ClientTable where \"Номер_фирмы\"='$_POST[Номер_фирмы]'";
            $result = pg_query($db, $infoA);
			$result = pg_fetch_all($result);
			pg_close($db);
         }
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (isset($_POST["upd"])) {
            $infoA = "update $ClientTable set \"Название\"='$_POST[Название]' where \"Номер_фирмы\"='$_POST[Номер_фирмы]'";
            $result = pg_query($db, $infoA);
			$result = pg_fetch_all($result);
			pg_close($db);
         }
}
$dbuser = 'postgres';
$dbpass = '123';
$host = 'localhost';
$dbname ='laba';
$ClientTable = '"Фирмы"';
$db = pg_connect("host=$host dbname=$dbname user=$dbuser password=$dbpass");
$info = "select * from $ClientTable";
$result = pg_query($db, $info);
$result = pg_fetch_all($result);

?>

 <h2 style="margin-top: 1px;"> Таблица <?php echo($ClientTable) ?> </h2>
    <table >
    <thead>
        <tr>
        <th><?php echo implode('</th><th>', array_keys($result[0])); ?></th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ($result as $row): array_map('htmlentities', $row); ?>
        <tr>
        <td><?php echo implode('</td><td>', $row); ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>
    </table>
<?php?>