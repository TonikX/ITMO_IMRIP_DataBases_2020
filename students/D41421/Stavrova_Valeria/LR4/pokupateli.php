
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
			<form name="insert" action="pokupateli.php" method="POST" >
				<ul>Номер покупателя:</ul><ul><input type="int" name="Номер_покупателя"/></ul>
				<ul>ФИО:</ul><ul><input type="text" name="ФИО"/></ul>
				<ul>Телефон</ul><ul><input type="money" name="Телефон"/></ul>
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
$ClientTable = '"Покупатель"';
$db = pg_connect("host=$host dbname=$dbname user=$dbuser password=$dbpass");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (isset($_POST["Add"])) {
            $infoA = "insert into $ClientTable values ('$_POST[Номер_покупателя]', '$_POST[ФИО]', '$_POST[Телефон]')";
            $result = pg_query($db, $infoA);
			$result = pg_fetch_all($result);
			pg_close($db);
         }
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (isset($_POST["Delete"])) {
            $infoA = "delete from $ClientTable where \"Номер_покупателя\"='$_POST[Номер_покупателя]'";
            $result = pg_query($db, $infoA);
			$result = pg_fetch_all($result);
			pg_close($db);
         }
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (isset($_POST["upd"])) {
            $infoA = "update $ClientTable set \"ФИО\"='$_POST[ФИО]', \"Телефон\"='$_POST[Телефон]' where \"Номер_покупателя\"='$_POST[Номер_покупателя]'";
            $result = pg_query($db, $infoA);
			$result = pg_fetch_all($result);
			pg_close($db);
         }
}
$dbuser = 'postgres';
$dbpass = '123';
$host = 'localhost';
$dbname ='laba';
$ClientTable = '"Покупатель"';
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