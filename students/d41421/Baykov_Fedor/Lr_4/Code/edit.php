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

    $sql = 'SELECT * FROM author where author_id = ' . $_POST["author_id"];
    $result = $db->query($sql);
    $row = $result->fetch();

    $id = $row['author_id'];
    $firstname = $row['firstname'];
    $middlename = $row['middlename'];
    $lastname = $row['lastname'];

    echo '<form action="" method="post">
      <h3> Edit data </h3>
      id: <input type="text" name="author_id" value="' . $id . '"><br>
      first_name: <input type="text" name="firstname" value="' . $firstname . '"><br>
      middle_name: <input type="text" name="middlename" value="' . $middlename . '"><br>
      last_name: <input type="text" name="lastname" value="' . $lastname . '"><br>
      <input type="submit" value="Edit" name="new">
    </form>';

    if (isset($_POST['new'])){
      $sql_update = 'UPDATE author SET firstname =  \'' . $_POST["firstname"] . '\', middlename =  \'' . $_POST["middlename"] . '\', lastname =  \'' . $_POST["lastname"] . '\'  WHERE author_id = ' . $_POST["author_id"] . ';';
      $result = $db->query($sql_update);
        if (!$sql_update){
            echo "Update failed!!";
        }
        else {
            echo "Update successfull;";
            $page = "index.php";
            header("Refresh: 1; " . $page);
        }
    };
?>

