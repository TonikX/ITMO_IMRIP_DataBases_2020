<?php
    session_start();
?>
<html>
    <body>
        <form action="findx.php" method="post">
            Find solution for: a*x^2 + b*x + c<br>
            a: <input type="text" name="a"><br>
            b: <input type="text" name="b"><br>
            c: <input type="text" name="c"><br>
            <input type="submit" value="Find x!">
        </form>
        <?php
            $_SESSION["action_name"] = "find_x";
            echo "Session variables set";
        ?>
    </body>
</html>
