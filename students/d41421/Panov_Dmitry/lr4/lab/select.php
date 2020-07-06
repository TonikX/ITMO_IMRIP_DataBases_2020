<!DOCTYPE html>
	<head>
		<meta charset="UTF-8">
		<title>Выбор данных</title>
	</head>
	<body>
		<hr>
		<h3>Введите ID врача, чтобы получить информацию о нем</h3>
		<ul>
			<form name="select" action="select.php" method="POST" >
				<ul>ID врача:</ul><ul><input type="int" name="doc_id"/></ul>
				<br/>
				<ul><input type="submit" name="Select" /></ul>
			</form>
		</ul>
		<hr>

		<?php
			echo "<br/>";
			$dbuser = "postgres";
			$dbpass = "123";
			$host = "localhost";
			$dbname= "hospital";
			$table = '"hospitalDB".doctors';
			$db = pg_connect("host=$host dbname=$dbname user=$dbuser password=$dbpass");

			if ($_SERVER['REQUEST_METHOD'] == 'POST') {
				if (isset($_POST["Select"])) {
						$sql = "select * from $table where \"doc_id\"='$_POST[doc_id]'";
						$result = pg_query($db, $sql);
						$result = pg_fetch_all($result);
						foreach ($result as $value) {
								foreach ($value as $key => $value) {
										echo " $key: $value <br/>";
								}
						}
					}
				
			}
			
		?>
		</br>
		<a href="index.html">На главную</a><br/>
	</body>
</html>
