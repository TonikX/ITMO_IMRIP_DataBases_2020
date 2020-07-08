<html>
<head>
	<meta charset="utf-8">
	<style type="text/css">
	body {
		background-color:
	}
	h3 {
		text-align:center
	}
	#back {
		position: absolute; 
		top: 15px; 
		right: 15px; 
	}

	</style>
</head>
<body>

	<h3>Лабораторная 4</h3>
	<h3>Часть 1</h3>

	<h4>Введение в пхп</h4>
<?php
	//математические операторы
	echo "1. Математические операторы";
	echo"<br>";
	$a = 555;
	$b = 111;
	$c = $a + $b;
	echo "a) $a + $b = $c";
	echo"<br>";
	$fl = 0.0008765;
	$flo = $fl * 10;
	echo "b) $fl * 10 = $flo";
	echo"<br><br>";

	//строки
	$String = 'Hello, world';
	echo "2. Строковые операторы: <br> $String";
	echo"<br><br>";

	//условия
	echo"3. Условные операторы<br>";
	$a = 65436;
	$b = 8759;
	
	if ($a == $b) echo "$a равно $b";
	else if ($a > $b) echo "$a больше чем $b";
	else echo "$b больше чем $a";
	echo "<br> <br>";

	//массивы
	echo"4. Массивы <br>";
	$Zveri = array('толстый' => 'Морж',  'милый' => 'Котик', 'пушистый' => 'Енот');
	var_dump($Zveri);
	echo "<br>Кто самый пушистый? --$Zveri[пушистый] <br> <br>";


	//циклы
	//WHILE
	echo '5. Циклы';
	$i = 1; 
	while ($i <= 4){
	echo $i++;
	}
	echo "<br>";

	//DO WHILE
	$m = 9;
	do{
	echo $m--;
	} while($m > 0);
	echo "<br>";

	//FOR
	for ($j = 1; $j <= 5; $j++){
	echo $j;
	}
	echo "<br>";

	//FOREACH
	$Array4 = array(1, 2, 3, 4, 5, 6);
	foreach($Array4 as $value){
	echo $value;
	}
	echo "<br>";

	//FOR AND BREAK
	for ($g = 1; $g <= 100; $g++){
	if ($g == 8) break;
	echo $g;
	}
	echo "<br>";

	//FOR AND CONTINUE
	for ($g = 1; $g <= 10; $g++){
	if ($g == 5) continue;
	echo $g;
	}
	echo "<br>";

	//функции
	echo'6. ФУнкции <br>';
	$p1 = 'пожалуйста';
	function fu($p1) {
		echo "проверьте лабу, $p1 <br>";
	}
	fu($p1);
?>
