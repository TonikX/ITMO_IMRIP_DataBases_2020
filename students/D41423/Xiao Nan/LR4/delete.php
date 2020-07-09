<html>
    <body>
<?php

try {   
    
    $MyPDO = new PDO("pgsql:host=localhost;port=5432;dbname=lw2","postgres","930301ly520");
    echo "DELETE DATA<br><br>";
    
} catch (PDOException $e) { 
    
    echo $e -> getMessage();
    
}

    $sql = 'DELETE from "public"."Brokers" WHERE "Brokers_ID" = \'' . $_POST["Brokers_ID"]. ' \'';
    $result = $MyPDO->query($sql);
    echo "Row was deleted<br><br>";

?>
   
    <form action="Index.php" method="post">
    <input type="submit" value="Back to Home">
    </form>
    
    </body>
</html>