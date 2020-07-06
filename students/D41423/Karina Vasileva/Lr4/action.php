<!DOCTYPE html>
<head> <title> Данные </title> </head> 
<body>
Здравствуйте, <?php 
echo htmlspecialchars($_POST['name']); ?>!
<br>Сейчас вам <?php 
$age=2020-$_POST['year'];
echo $age;
$digit=substr($age,-1);
$letArray=[0,5,6,7,8,9];
if(in_array($digit,$letArray)) echo ' лет.';
elseif ($digit==1) echo ' год.'; 
else echo ' года.';
echo '<br>Дата: ' . date("d/m/y") . "<br>";
if ($_POST['singer']='Меладзе') echo 'Сто шагов назад, тихо на пальцах...';
else 'Но тайно вы все равно любите Меладзе...';

$String=$_POST['number'];
function my_func($String, $c){
		return ($String*$String)/$c;
	}
	$c = 100;
	
	//WHILE
	echo '<br>';
	$i = 1; 
	while ($i <= 10){
	echo $i++;
	}
	echo "<br>";

	//DO WHILE
	$m = 10;
	do{
	echo $m--;
	} while($m > 0);
	echo "<br>";


	
$array = array("Surname" => $_POST['name'],
    "Birth year" => $age,
	"Music taste" => $_POST['name']
	);
?>

</body>
</html>
