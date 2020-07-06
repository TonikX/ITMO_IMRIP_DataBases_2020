<?php
	header("Content-Type: text/plain; charset=utf-8");

	// Примеры переменных разных типов
	$bool = true;
	echo 'Логический тип ', $bool, "\n";
	$a = 5;
    $b = 13;
	echo 'Целые числа ', $a, ' ', $b, "\n";
	$double = 0.9;
	echo 'Дробные числа ', $double, "\n";
    	$string = 'Добрый вечерочек';
    	$string .= ' дружочек';
    	echo $string, "\n";
	$arr = array('пам', 5, 'эпарам', 3, 8, 2, 3, 9);
    // Условные операторы 
    if ($a > $b) {
		echo 'Деление переменной a на переменную b', "\n";
    		$e = $a * $b;
    		echo $e, "\n";
	} elseif ($a < $b) {
		echo 'Деление переменной b на переменную a', "\n";
    		$e = $b / $a;
    		echo $e, "\n";
	} else {
		echo 'a и b равны', "\n";
	}
	
	if ($bool) echo 'Done', "\n";
    	
	
	// Использование циклов, выводит от 1 до 20 
	$x=0;
	while ($x++<20) echo $x, ' ';
	echo "\n";
    
    // Возведение в степень 
    function power($number, $exponent) {
        if ($exponent == 1) {
            return $number;
        }
        $tmp = power($number, (int)($exponent / 2));
        return ($exponent & 1 ? $number : 1) * $tmp * $tmp;
    }
    echo 'Возведение в степень ';
    echo power(4,5)



?>