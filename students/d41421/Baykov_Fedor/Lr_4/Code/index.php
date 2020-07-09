<html>
    <body>
        <h2> Select data </h2>
        <?php
          $dbuser = 'postgres';
		  $dbpass = '1234';
		  $host = 'localhost';
		  $dbname='Library';
	  
		  try {
			  $db = new PDO("pgsql:host=$host;port=5432;dbname=$dbname;user=$dbuser;password=$dbpass");
			  echo "PDO connection object created<br>";
			}
			catch(PDOException $e) {
			  echo $e->getMessage();
			}
		  
          $sql = 'SELECT * FROM author ORDER BY author_id;';
          $result = $db->query($sql);

          while ($row = $result->fetch())
            {
                echo $row['author_id'] . ' ' . $row['firstname'] . ' ' . $row['middlename'] . ' ' . $row['lastname'] . " " . "<br>";
            }
        ?>
        <form action="add.php" method="post">
            <h2> Add data </h2>
            id: <input type="text" name="author_id"><br>
            first_name: <input type="text" name="firstname"><br>
            middle_name: <input type="text" name="middlename"><br>
            last_name: <input type="text" name="lastname"><br>
            <input type="submit" value="Add">
        </form>

        <form action="edit.php" method="post">
            <h2> Edit data </h2>
            <p> Enter author id which should be edited</p>
            id: <input type="text" name="author_id"><br>
            <input type="submit" value="Enter">
        </form>

        <form action="delete.php" method="post">
            <h2> Delete data </h2>
            <p> Choose rows which should be deleted</p>

        <?php
            try {
			  $db = new PDO("pgsql:host=$host;port=5432;dbname=$dbname;user=$dbuser;password=$dbpass");
			  echo "PDO connection object created<br>";
			}
			catch(PDOException $e) {
			  echo $e->getMessage();
			}

            $sql = 'SELECT * FROM author ORDER BY author_id';
            $result = $db->query($sql);
            $i = 1;
            echo "<table>
        <tr>
        <th>author_id</th>
        <th>first_name</th>
        <th>middle_name</th>
        <th>last_name</th>
        </tr>";
        while ($row = $result->fetch()){
            echo "<tr>";
            echo "<td>" . $row['author_id'] . "</td>";
            echo "<td>" . $row['firstname'] . "</td>";
            echo "<td>" . $row['middlename'] . "</td>";
            echo "<td>" . $row['lastname'] . "</td>";
            echo '<td><input type="checkbox" name="checkboxstatus[' . $i . ']" value="' . $row["author_id"] . '"  /></td>';
            echo "</tr>";
            $i++;
        };
        echo "</table>";
        ?>

            <input type="submit" value="Delete" name="Delete" />
        </form>

		<?php
			$dbuser = 'postgres';
			$dbpass = '1234';
			$host = 'localhost';
			$dbname='Library';

			try {
				$db = new PDO("pgsql:host=$host;port=5432;dbname=$dbname;user=$dbuser;password=$dbpass");
				echo "PDO connection object created<br>";
			}
			catch(PDOException $e) {
				echo $e->getMessage();
			}

			

			echo '<h3>Формулировка запроса: Вывести общее кол-во читателей, записанных в библиотеку, которые зарегистрировались в ней до 31.12.2013</h3>';
			$sql = "SELECT count(reader_id) FROM reader WHERE date_of_registration <= '31.12.2013'";
			$result = $db->query($sql);
			while ($row = $result->fetch())
			{
				echo "Ответ: " . $row['count'] . "<br>";
			}

			echo '<h3>Формулировка запроса: Вывести имена читателей, записанных в «большой читательный зал»</h3>';
			$sql = "SELECT  R.full_name, RR.name 
			FROM reader R 
			LEFT JOIN reading_room RR ON  R.reading_room_id=RR.reading_room_id 
			WHERE RR.name='Большой читательный зал' ORDER BY R.full_name";
			$result = $db->query($sql);
			echo "Ответ: ";
			while ($row = $result->fetch())
			{
				echo $row['full_name'] . '; ';
			}

			echo '<h3>Формулировка запроса: Вывести имена читателей, взявших книгу более двух лет назад, от текущей даты.</h3>';
			$sql = "SELECT R.full_name, TB.date_of_taking
			FROM reader R 
			LEFT JOIN taking_a_book TB
			ON R.reader_id=TB.reader
			WHERE TB.date_of_taking <= CURRENT_DATE - INTERVAL '2' YEAR
			";
			$result = $db->query($sql);
			echo "Ответ: ";
			while ($row = $result->fetch())
			{
				echo $row['full_name'] . '; ';
			}

			echo '<h3>Формулировка запроса: Вывести сумму читателей в библиотеке старше 21 года и имеющих высшее образование.</h3>';
			$sql = "SELECT count(reader_id) FROM reader 
			WHERE date_of_birth <= CURRENT_DATE - INTERVAL '21' YEAR
			AND education='Высшее'";
			$result = $db->query($sql);
			echo "Ответ: ";
			while ($row = $result->fetch())
			{
				echo $row['count'] . '; ';
			}

			echo '<h3>Формулировка запроса: Вывести процентное отношение читателей, имеющих начальное, среднее или высшее образование.</h3>';
			$sql = "SELECT education, (COUNT(education)* 100 / (select count(*) from reader)) AS Score
			FROM reader	GROUP BY education";
			$result = $db->query($sql);
			echo "Ответ: ";
			echo "<table>
			<tr>
			<th>education</th>
			<th>score</th>
			</tr>";
			while ($row = $result->fetch()){
				echo "<tr>";
				echo "<td>" . $row['education'] . "</td>";
				echo "<td>" . $row['score'] . "</td>";
				echo "</tr>";
			};

		?>
    </body>
</html>

