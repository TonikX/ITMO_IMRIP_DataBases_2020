<?php
session_start();

$_SESSION['pesnya'] = "Но я тысячу раз обрывал провода <br/>
Сам себе кричал: Ухожу навсегда <br/>
Непонятно, как доживал до утра. Салют, Вера! <br/>
Но я буду с тобой или буду один <br/>
Дальше не сбежать, ближе не подойти <br/>
Прежде чем навек поменять номера... Салют, Вера! <br/>";	

	function my_func($a, $b){
		return ($a / $b) * 50;
	}

	$a = 100;
	$b = 2.28;
	$beer = "baltika";
	$d = True;

	$array = array(
    "Surname" => "Meladze",
    "Name" => "Valera",
	);
	
	echo $a, PHP_EOL, $b, PHP_EOL, $d, PHP_EOL, "<br/>";
	
	foreach ($array as $key => $value) {
	echo "$key : $value <br/>";
	}

	if ($d){
		echo "d = True <br/>";
	} else {
		echo "d = False <br/>";
	}

	switch ($beer) {
		case "tuborg":
		case "carlsberg":
		case "heineken":
			echo "Good choice <br/>";
			break;
		case "baltika":
			echo "Choose only 0 <br/>";
			break;
		default:
			echo "Please, make a choice... <br/>";
			break;
	}

	$i = 0;
	while ($i <= 5) {
		echo "$i <br/>";
		$i++;
	}

	do {
    echo "$i <br/>";
    $i--;
  	} while ($i >= 0);

	for ($i=0; $i<5; $i++) echo $i, PHP_EOL;

	echo "<br/>";

	echo my_func(20, 10);
?>
