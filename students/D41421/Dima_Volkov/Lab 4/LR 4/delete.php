<!DOCTYPE html>
	<head>
		<meta charset="UTF-8">
		<title>Удаление данных</title>
	</head>
	<body>
		<hr>
		<h3>Введите ID собаки, информацию о котором нужно удалить</h3>
		<ul>
			<form name="delete" action="delete.php" method="POST" >
				<ul>ID собаки:</ul><ul><input type="int" name="ID_dog"/></ul>
				<br/>
				<ul><input type="submit" name="Delete" /></ul>
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
				if (isset($_POST["Delete"])) {
						$sql = "delete from $table where \"ID_dog\"='$_POST[ID_dog]'";
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