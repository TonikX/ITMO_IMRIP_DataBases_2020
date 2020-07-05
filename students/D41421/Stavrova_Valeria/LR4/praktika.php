
<a href = 'index.php'>Главная</a> 
<a href = 'praktika.php'>Практика</a> 
<a href = 'pokupateli.php'>Покупатели</a> 
<a href = 'tovari.php'>Товары</a> 
<a href = 'brokeri.php'>Брокеры</a> 
<a href = 'kontori.php'>Конторы</a> 
<a href = 'firmi.php'>Фирмы</a> 
<br>
<br>
<br>


<?php
echo "<br/>- Переменные различных типов данных <br/>";
$num1 = 10;
$num2 = 1.5;
$str = "Привет мир";
$arr = array('911', 'туц', 'труц', '3,14');
echo "num1 = $num1, <br/> num2 = $num2, <br/> str = $str <br/> ";
echo "<br/>- Условные операторы<br/>";
if ($num1 < $num2) {
	echo "$num1 < $num2 <br/>";
}elseif ($num1 > $num2){
	echo "$num1 > $num2 <br/>";
}else{
	echo "$num1 = $num2 <br/>";
}
echo "<br/>- Массивы<br/>";
echo "Массив: ";
for ($i = 0; $i < sizeof($arr); $i++) {
	echo $arr[$i], ", ";
} echo "<br/>";

echo "<br/>- Циклы <br/>";
while ($num1 > 0) {
	$num1-=10;
	echo $num1, ", ";
}
echo "<br/>";
do {
	$num1+=10;
	echo $num1, ", ";
} while ($num1 < 100);
echo "<br/>";
foreach ($arr as $val) {
	echo $val, ", ";
} echo "<br/>";
for ($i = 0; $i < sizeof($arr); $i++) {
	if ($arr[$i] == 'hit'){
		echo "BREAK";
		break;
	} elseif ($arr[$i] == '911'){
		continue;
	}
	echo $arr[$i], ", ";
} echo "<br/>";
echo "<br/>- Пользовательске функции<br/>";
function Square($a){
	echo "Квадрат $a: ", $a*=$a, "<br/>";
}
Square(11);
echo "<br/>";

session_start();
echo "Время сессии: ";
echo date('Y m d H:i:s', $_SESSION['Время']);
$_SESSION['Время'] = time();

?>

