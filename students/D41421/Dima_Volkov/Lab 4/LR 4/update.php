<!DOCTYPE html>
	<head>
		<meta charset="UTF-8">
		<title>Изменение данных</title>
	</head>
	<body>
		<hr>
		<h3>Введите ID собаки и новые данные</h3>
		<ul>
			<form name="update" action="update.php" method="POST" >
            <ul>ID собаки:</ul><ul><input type="int" name="ID_dog"/></ul>
			<ul>ID породы:</ul><ul><input type="text" name="ID_breed"/></ul>
			<ul>Имя собаки:</ul><ul><input type="text" name="Dog_name"/></ul>
			<ul>Возраст собаки:</ul><ul><input type="text" name="Dog_age"/></ul>
			<ul>Номер клуба:</ul><ul><input type="text" name="Club_number"/></ul>
            <ul>Имя отца</ul><ul><input type="text" name="Father_name"/></ul>
            <ul>Дата вакцинации</ul><ul><input type="date" name="Last_vaccination_date"/></ul>
            <ul>Медосмотр</ul><ul><input type="text" name="Med_check"/></ul>
            <ul>ID хозяина</ul><ul><input type="text" name="ID_Owner"/></ul>
				<br/>
				<ul><input type="submit" name="Update" /></ul>
			</form>
		</ul>
		<hr>
	
		<?php
			echo "<br/>";
			$dbuser = "postgres";
			$dbpass = "10101996";
			$host = "localhost";
			$dbname= "Dog_Exhibition";
			$table = 'exb."Dog"';
			$db = pg_connect("host=$host dbname=$dbname user=$dbuser password=$dbpass");

			if ($_SERVER['REQUEST_METHOD'] == 'POST') {
				if (isset($_POST["Update"])) {
                        $sql = "update $table set \"Club_number\"='$_POST[Club_number]',\"Dog_name\"='$_POST[Dog_name]', \"Med_check\"='$_POST[Med_check]',
                        \"Dog_age\"='$_POST[Dog_age]', \"ID_Owner\"='$_POST[ID_Owner]', \"Father_name\"='$_POST[Father_name]',
                        \"Last_vaccination_date\"='$_POST[Last_vaccination_date]' where \"ID_dog\"='$_POST[ID_dog]'";
						$result = pg_query($db, $sql);
						$result = pg_fetch_all($result);
						pg_close($db);
					}
			}

			$dbuser = "postgres";
			$dbpass = "10101996";
			$host = "localhost";
			$dbname= "Dog_Exhibition";
			$table = 'exb."Dog"';
			$db = pg_connect("host=$host dbname=$dbname user=$dbuser password=$dbpass");
			$info = "select * from $table";
			$result = pg_query($db, $info);
			$result = pg_fetch_all($result);
		?>

		<table>
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
		</br>
		<a href="main.html">На главную</a><br/>
	</body>
</html>