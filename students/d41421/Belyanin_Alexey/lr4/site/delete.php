<?php    
    $dbuser = 'fowku';
    $dbpass = '203400';
    $host = 'localhost';
    $dbname = 'School';

    try {
        $dbh = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
    
    $sql = "DELETE FROM hmm.\"Student\" WHERE id={$_POST['id']}";

    $dbh->exec($sql);

    $page = "index.php";
    header("Refresh: 1; " . $page);
?>