

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
			<form name="insert" action="tovari.php" method="POST" >
				<ul>Номер товара:</ul><ul><input type="int" name="Номер_товара"/></ul>
				<ul>Наименование:</ul><ul><input type="text" name="Наименование"/></ul>
				<ul>Единица измерения:</ul><ul><input type="money" name="Единица_измерения"/></ul>
				<ul>Цена:</ul><ul><input type="int" name="Цена_товара"/></ul>
				<ul>Дата:</ul><ul><input type="data" name="Дата_производства"/></ul>
				<ul>Срок годности:</ul><ul><input type="int" name="Срок_годности"/></ul>
				<ul>Номер фирмы:</ul><ul><input type="int" name="Номер_фирмы"/></ul>
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
$ClientTable = '"Товары"';
$db = pg_connect("host=$host dbname=$dbname user=$dbuser password=$dbpass");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (isset($_POST["Add"])) {
            $infoA = "insert into $ClientTable values ('$_POST[Номер_товара]', '$_POST[Наименование]', '$_POST[Единица_измерения]', '$_POST[Цена_товара]', '$_POST[Дата_производства]', '$_POST[Срок_годности]', '$_POST[Номер_фирмы]')";
            $result = pg_query($db, $infoA);
			$result = pg_fetch_all($result);
			pg_close($db);
         }
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (isset($_POST["Delete"])) {
            $infoA = "delete from $ClientTable where \"Номер_товара\"='$_POST[Номер_товара]'";
            $result = pg_query($db, $infoA);
			$result = pg_fetch_all($result);
			pg_close($db);
         }
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (isset($_POST["upd"])) {
            $infoA = "update $ClientTable set \"Наименование\"='$_POST[Наименование]', \"Единица_измерения\"='$_POST[Единица_измерения]', \"Цена_товара\"='$_POST[Цена_товара]', \"Дата_производства\"='$_POST[Дата_производства]', \"Срок_годности\"='$_POST[Срок_годности]', \"Номер_фирмы\"='$_POST[Номер_фирмы]' where \"Номер_товара\"='$_POST[Номер_товара]'";
            $result = pg_query($db, $infoA);
			$result = pg_fetch_all($result);
			pg_close($db);
         }
}

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