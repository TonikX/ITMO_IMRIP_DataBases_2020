<?php
    session_start();
?>
<?php
    function two_solutions($a, $b, $d){
        $x1 = ((-$b + sqrt($d)) / (2*$a));
        $x2 = ((-$b - sqrt($d)) / (2*$a));
        return array($x1, $x2);
    }
    echo "Action is " . $_SESSION["action_name"] . ".<br>";
    if (isset($_POST['a'])){ $a = $_POST['a']; }
    if (isset($_POST['b'])){ $b = $_POST['b']; }
    if (isset($_POST['c'])){ $c = $_POST['c']; }

    $d = $b*$b - 4*$a*$c;

    if ($d < 0) {
        echo "The equation has no real solutions!";
    } elseif($d == 0) {
        echo "x = ";
        echo (-$b / 2*$a);
    } else  {
        $results = two_solutions($a, $b, $d);

        foreach($results as $i => $item){
            echo "x$i = $item";
            echo "<br>";
        }
    }
?>
