<?php

	# переменные
	echo "переменные разных типов:", "<br/>";
	$bool = true;
	echo 'логический тип: ', $bool, "<br/>";
	$int_a = 5;
	$int_b = 10;
	echo 'целые числа: ', $int_a, ', ', $int_b, "<br/>";
	$float = 0.15;
	echo 'дробные числа: ', $float, "<br/>";
	$str = 'текст';
	echo 'строка: ', $str, "<br/>";
	$arr= array('один' ,'два', 'три', 'четыре', 'пять');
	echo ' ', "<br/>";

	# условные операторы
	if ($int_a > $int_b) {
		echo 'деление a на b:', "<br/>";
		$res = $int_a / $int_b;
		echo $res, "<br/>";
	} elseif ($int_a < $int_b) {
		echo 'деление b на a:', "<br/>";
		$res = $int_b / $int_a;
		echo $res, "<br/>";
	} else {
		echo 'a и b равны', "<br/>";
	}	
	echo ' ', "<br/>";

	echo "проверка числа на четность:", "<br/>";
	if(($int_a % 2) == 0){
		echo $int_a, "- четное число", "<br/>";
	}else{
		echo $int_a, " - нечетное число", "<br/>";
	}
	echo "<br/>";

	# циклы
	# while
	$i = 0;
	while ($i <= 10) echo $i++, ' ';
	echo "<br/>";
	echo "<br/>";
	
	# do while
	$i--;
	do {
		echo $i--, ' ';
	} while ($i >= 0);
	echo "<br/>";
	echo "<br/>";
	
	# for
	$cnt = count($arr);
	for ($counter=0; $counter < $cnt; $counter++){
		echo $arr[$counter], ' ';
	}
	echo "<br/>";
	echo "<br/>";
	
	# foreach
    $service[] = ['name' => 'операция', 'price' => 7000];
    $service[] = ['name' => 'первичный прием', 'price' => 1500];
    $service[] = ['name' => 'повторный прием', 'price' => 1000];

    foreach($service as $serv) {
        if($serv['price'] > 1000)
            echo $serv['name'], '<br>';
	}
	echo "<br/>";
	echo "<br/>";
	
	# функции
	function get_avg($num) {
		$avg = array_sum($num)/count($num);
		return $avg;
	}

	echo 'среднее значение равно ', get_avg(array(1, 5, 100, 6, 452, 10, 15)), "<br/>";

	# сессии
	session_start();
	$_SESSION['time'] = date("H:i:s");
?>