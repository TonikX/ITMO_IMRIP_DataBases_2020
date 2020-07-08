<?php
    session_start();
?>
<?php
    if (isset($_POST['a'])){ $a = $_POST['a']; }
    if (isset($_POST['c'])){ $c = $_POST['c']; }

    $s = 1/2*$a*$c;

    echo "Площадь равна: $s";
?>