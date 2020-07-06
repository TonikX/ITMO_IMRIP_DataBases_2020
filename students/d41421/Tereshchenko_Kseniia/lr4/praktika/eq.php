<?php
    session_start();
?>
<html>
    <body>
        <form action="x.php" method="post">
            Your name is: <br>
            first name: <input type="text" name="firstname"><br>
            surname: <input type="text" name="surname"><br>
            <input type="submit" value="add">
        </form>
        <?php
            $_SESSION["action_name"] = "x";
        ?>
    </body>
</html>