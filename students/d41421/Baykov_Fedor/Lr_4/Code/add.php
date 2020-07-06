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
  
    $sql = 'INSERT INTO author VALUES (\'' . $_POST["author_id"] . ' \', \'' . $_POST["firstname"] . '\', \'' . $_POST["middlename"] . '\', \'' . $_POST["lastname"] . '\');';
    $result = $db->query($sql);
    echo "<br> Values are inserted";
    $page = "index.php";
    header("Refresh: 1; " . $page);
  ?>
	
?>

