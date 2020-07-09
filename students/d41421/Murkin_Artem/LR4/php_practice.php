<?php

	echo "1. Переменные разных типов<br>";
	echo "Integer<br>"; //Целые числа
	$odin = 1;
	$dva = 2;
	$tri = $odin + $dva;
	echo "$odin + $dva = $tri";
	
	echo "<br><br>";
	
	echo "Float<br>"; //Числа с плавающей запятой
	$cetvert = 0.25;
	$tret = 0.33;
	$raznost = $tret - $cetvert;
	echo "$tret - $cetvert = $raznost";
	
	echo"<br><br>";
	
	echo "String<br>"; //Строки
	$stroka = 'This is a string';
	echo "$stroka<br>";
	
	$stroka .= ', but now it is longer';
	echo "$stroka";
	
	echo"<br><br>";

	echo "Boolean<br>"; //Логические переменные
	$tru = True;
	$fols = False;
	if ($tru) echo "Works as intended";
	if ($fols) echo "What is the meaning of truth anyway?";
	
	echo "<br><br>";
	
	echo "2. Условия<br>";
	echo "Условие if<br>"; // Условие if-elseif-else

	if ($odin == $dva) echo "$odin равно $dva";
	elseif ($odin > $dva) echo "$odin больше чем $dva";
	else echo "$dva больше чем $odin";
	
	echo "<br><br>";

	echo "Switch-case<br>"; //Условие switch-case
	$val = 11;
	
	switch($val){
		case 10 :
		echo "It's ten";
		break;
		
		case $val!= 10 :
		echo "Not a ten at all";
		break;
	}
	
	echo "<br><br>";
	
	
	echo "3. Массивы<br>";
	$engfra = array('one' => 'un',  'two' => 'deux', 'three' => 'trois');
	var_dump($engfra);
	echo "<br>one in French is $engfra[one]";

	echo "<br><br>";
	
	echo "4. Циклы<br>";
	echo "while<br>"; // Цикл while
	$i1 = 1; 
	while ($i1 < 10) echo $i1++.' ';
	echo "<br>";

	echo "do while<br>"; // Цикл do while
	$i2 = 1;
	do{
		echo $i2++.' ';
	} while($i2 < 10);
	echo "<br>";

	echo "for<br>"; // Цикл for
	for ($i3 = 1; $i3 < 10; $i3++){
		echo $i3.' ';
	}
	echo "<br>";

	echo "foreach<br>"; // Цикл foreach
	$arr = array(1, 2, 3, 4, 5, 6, 7, 8, 9);
	foreach($arr as $i4){
		echo $i4.' ';
	}
	echo "<br>";

	echo "for break continue<br>"; // Цикл for с применением break и continue
	for ($i5 = 1; $i5 <= 100; $i5++){
		echo $i5.' ';
		if ($i5 == 5) {
			continue;
		}
		elseif ($i5 == 9) {
			break;
		}
	}

	echo "<br><br>";

	echo '5. Функции и сессии<br>';

	session_start();

	function add($uno, $dos) {
		$tres = $uno + $dos;
		echo "$uno plus $dos equals $tres";
	}
	add($_SESSION['first'], $_SESSION['second']);
?>
