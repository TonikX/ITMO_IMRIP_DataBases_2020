
 <?php 
	//  переменных различных типов;
	$a_bool = true;   
	$a_str = 'foo';  
	$an_int = 12;     
	$a_double = 1.234; 
	
//  массивов;

	$ar =array( $a_bool, $a_str, $an_int, $a_double+$an_int);
	var_dump($ar);
	prt('');
	$array = array(
    "key1"    => 1,
    "key2"    => 2,
    "key3"    => 3,
);
//  условных операторов всех типов;
		function c1 ($x, $y){
			return $y<(-pow($x,2)+4);
		}
		function c2 ($x, $y){
			return $y<=3;
		}	
		function c3 ($x, $y){
			return $y>-$x;
		}
		function c4 ($x, $y){
			return $x==$y;
		}
	function g ($x, $y){		
		return (c1 ($x, $y) and c2($x, $y) and c3($x, $y)) or c4($x, $y);
	}
	// ||
	$x = 1; $y = -0.9;
	if(c1 ($x, $y)){
		if(c2 ($x, $y)){
			if(c3($x, $y)) {
				prt('true');
			}
		}
	} elseif (c4($x, $y)) {
		prt('true');
	} else {
		prt('false');
	}
	
	// prt( g(1,-0.9) ? 'true' : 'false');
	// prt( g(0,3.5) ? 'true' : 'false');
	// prt( g(300,300) ? 'true' : 'false');
	
//  циклов всех типов;
	$counter = 1;
	while ($counter <= 5){
		prt($counter++);
	}
	
	foreach($array as $key => $value){
		prt($key.' => '.$value);
	}
	
	for ($i=0; ; $i++ ) {
	if ($i == 1) {
		continue; 
	}
    if ($i > 2) {
        break;
    }
    prt($i);
}
	
	
//  пользовательских функций;
	function fib($number){
		switch($number){
			case 0:
			return 0;
			break;
			case 1:
			return 1;
			break;
			default:
			return fib($number-1)+fib($number-2);
			break;
		}
	}
	
	prt( fib(8));
//  сессий.
	session_start();
	if(isset($_GET['a'])){ $_SESSION['a'] = $_GET['a']; }
	if(isset($_SESSION['a'])) { 
		prt($_SESSION['a']);
		// Удалить все переменные сессии.
		$_SESSION = array();
		// Разрушить сессию.
		session_destroy();
	} else {
		prt('<a href=?a=smth>?a=smth</a>');
	}
	

	
	function prt($str){
		echo $str;
		echo "<br>";
	}
	
 ?>
