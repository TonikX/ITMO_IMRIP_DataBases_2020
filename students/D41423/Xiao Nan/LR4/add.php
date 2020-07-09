<html>
    <body>
<?php

try {
    
    $MyPDO = new PDO("pgsql:host=localhost;port=5432;dbname=lw2","postgres","930301ly520");
    echo "ADD DATA<br><br>";
    
}
catch(PDOException $e) {
    
    echo $e->getMessage();
    
}
    
    $sql = 'INSERT INTO "public"."Brokers" VALUES (\'' . $_POST["Brokers_ID"] . ' \', \'' . $_POST["Brokers_Name"] . '\', \'' . $_POST["Contact"] .  '\');';
    $result = $MyPDO->query($sql);
    echo "Values are inserted <br><br>";
    
?>
   
    <form action="Index.php" method="post">
    <input type="submit" value="Back to Home">
    </form>
    
    </body>
</html>