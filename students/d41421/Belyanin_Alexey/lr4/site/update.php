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

    $id = $_POST['id'];
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $date = $_POST['date_of_birth'];
    $sex = $_POST['sex'];
    $classId = $_POST['class_id'];

    if ($id && $name && $surname && $date && $sex && $classId) {
        $sql = "UPDATE hmm.\"Student\" SET name='{$name}', surname='{$surname}', date_of_birth='{$date}', sex='{$sex}', class_id={$classId} WHERE id={$id}";
        $stmt = $dbh->prepare($sql);
        $stmt->execute();
    }

    $page = "index.php";
    header("Refresh: 1; " . $page);
?>