<!DOCTYPE html>
	<head>
		<meta charset="UTF-8">
		<title>Выбор данных</title>
	</head>
	<body>
		<hr>
		<h3>Введите ID собаки, чтобы получить информацию о ней</h3>
		<ul>
			<form name="select" action="select.php" method="POST" >
				<ul>ID собаки:</ul><ul><input type="int" name="doc_id"/></ul>
				<br/>
				<ul><input type="submit" name="Select" /></ul>
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
				if (isset($_POST["Select"])) {
						$sql = "select * from $table where \"ID_dog\"='$_POST[doc_id]'";
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
		<a href="main.html">На главную</a><br/>
	</body>
</html>