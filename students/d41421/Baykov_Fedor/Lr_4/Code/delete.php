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

    if (isset($_POST['Delete'])){
        foreach($_POST['checkboxstatus'] as $val) {
            $sqldel = 'DELETE from author WHERE author_id = '. $val .';';
            $result = $db->query($sqldel);
        };
        echo "Row was deleted";
    }
    $page = "index.php";
    header("Refresh: 1; " . $page);
?>

