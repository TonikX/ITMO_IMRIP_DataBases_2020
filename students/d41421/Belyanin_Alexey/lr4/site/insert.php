<?php
    $dbuser = 'fowku';
    $dbpass = '203400';
    $host = 'localhost';
    $dbname = 'School';

    try {
        $dbh = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
    }
    catch(PDOException $e) {
        echo $e->getMessage();
    }

    $sql = 'INSERT INTO hmm."Student"
    VALUES
    (\'' . $_POST["id"] . '\', \'' . $_POST["name"] . '\', \'' . $_POST["date_of_birth"] . '\', \'' . $_POST["surname"] . '\', \'' . $_POST["class_id"] . '\', \'' . $_POST["sex"] . '\');';
    $result = $dbh->query($sql);
    
    $page = "index.php";
    header("Refresh: 1; " . $page);
?>