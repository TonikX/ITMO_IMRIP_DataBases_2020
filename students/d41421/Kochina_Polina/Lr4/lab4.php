<?php

$dbuser = 'postgres';
$dbpass = 'qwerty';
$host = 'localhost';
$dbname='my_base';

function view_all($query,$db_name,$pdo)
{
		$result="<table border=1>";
			$result.="<tr>";
			$i=0;
			$tables= array();
			foreach ($pdo->query($query) as $row) {
				$result.="<td>".$row["column_name"]."</td>";
				$tables[$i]=$row["column_name"];
				$i++;
			}
			$result.= "</tr>";
			$query="select * from ". $db_name;
			
			foreach ($pdo->query($query) as $row) {
				$result.= "<tr>";
				for($i=0; $i<count($tables); $i++)
				{
					$result.= "<td>".$row[$tables[$i]]."</td>";
				}
				$result.= "</tr>";
			}
			$result.="</table>";
			return $result;
}

function view_one($query,$db_name,$pdo)
{
	$result="<table border=1>";
			$result.="<tr>";
			$i=0;
			$tables= array();
			foreach ($pdo->query($query) as $row) {
				$result.="<td>".$row["column_name"]."</td>";
				$tables[$i]=$row["column_name"];
				$i++;
			}
			$result.= "</tr>";
			$query="select * from ". $db_name. " Where id='".$_POST["id"]."'";

			foreach ($pdo->query($query) as $row) {
				$result.= "<tr>";
				for($i=0; $i<count($tables); $i++)
				{
					$result.= "<td>".$row[$tables[$i]]."</td>";
				}
				$result.= "</tr>";
			}
			$result.="</table>";
			return $result;
}
function delete_one($id,$db_name,$pdo)
{
	$query="delete from ". $db_name. " Where id='".$id."'";
	$pdo->query($query);
}
function add_one($query,$all,$pdo)
{
	$tables= array();
	$i=0;
	foreach ($pdo->query($query) as $row) {
		$tables[$i]=$row["column_name"];
		$i++;
	}
	$query="INSERT INTO ".$all["db_name"];
	$query.="(";
	foreach($tables as $key => $item){
	if ($item == "id"){
		unset($tables[$key]);
		}
	}
	for($i=0;$i<count($tables)-1;$i++)
	{
		$query.=$tables[$i].", ";
	}
	$query.=$tables[count($tables)-1].")";
	$query.=" values(";
	for($i=0;$i<count($tables)-1;$i++)
	{
		$query.="'".$all[$tables[$i]]."', ";
	}
	$query.="'".$all[$tables[count($tables)-1]];
	$query.="')";
	//echo $query;
	$pdo->query($query);
}
//var_dump($_POST);

if (isset($_GET["qwery"]))
{
	$result="";
	$pdo = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, FALSE);
	switch($_GET["qwery"]){
		case 1:{
			$query="select delivery.newspaper_name, delivery.edition_num, edition.price, 
post_office.post_office_num 
from delivery, edition, post_office 
where post_office.post_office_num =delivery.post_office_num
group by delivery.newspaper_name, delivery.edition_num, edition.price, 
post_office.post_office_num";
$result .="1. Получение названий газет, номеров издания, цен и номеров почтовых отделений, в которые они доставляются";
$result .="<table border=1> <tr><td>Название газеты</td><td>Номер издания</td><td>Цена</td><td>Номер почтового отделения</td></tr>";

			foreach ($pdo->query($query) as $row) {
				$result .="<tr>";
			$result .= "<td>".$row['newspaper_name'] . "</td>";
			$result .=  "<td>".$row['edition_num'] . "</td>";
			$result .=  "<td>".$row['price']. "</td>";
			$result .=  "<td>".$row['post_office_num'] . "</td>";
			$result .="</tr>";
		
			}
			$result .="</table>";
			break;
		}
		case 2:{
			$query="select newspaper.newspaper_name, delivery.amount, edition.price 
from newspaper, delivery, edition
where delivery.newspaper_name=newspaper.newspaper_name 
and edition.edition_num=delivery.edition_num and delivery.amount > 500 
and edition.price > 10000
group by newspaper.newspaper_name, delivery.amount, edition.price";
$result .="2. Получение количества экземпляров для доставки по цене больше 10000, где количество больше 500, и названия этих газет";
$result .="<table border=1> <tr><td>Название газеты</td><td>Количество</td><td>Цена</td></tr>";
			foreach ($pdo->query($query) as $row) {
				
				$result .="<tr>";
			$result .= "<td>".$row['newspaper_name'] . "</td>";
			$result .=  "<td>".$row['amount'] . "</td>";
			$result .=  "<td>".$row['price']. "</td>";
			
			$result .="</tr>";
		
			}
			$result .="</table>";
			break;
		}
		case 3:{
			$query="select edition.edition_num, max(delivery.amount) as maximum
from edition, delivery where edition.edition_num=delivery.edition_num
group by edition.edition_num
having max(delivery.amount)>1000";
$result .="3. Получить наибольшее количество экземпляров (больше 1000) издания для доставки";
$result .="<table border=1> <tr><td>Номер издания</td><td>Количество</td></tr>";
			foreach ($pdo->query($query) as $row) {
				
				$result .="<tr>";
			$result .= "<td>".$row['edition_num'] . "</td>";
			
			$result .=  "<td>".$row['maximum'] . "</td>";
			
			$result .="</tr>";
		
			}
			$result .="</table>";
			break;
		}
		case 4:{
			$query="select post_office_num, post_office_adress
from post_office
where post_office_num in (
	select post_office_num
	from (
	select post_office_num, sum(amount)
from delivery
group by post_office_num )
as results 
where sum>1000)
order by post_office_num";
$result .="4. Вывести информацию по почтовым отделениям (номер, адрес), где количество доставок газет больше 1000.";
$result .="<table border=1> <tr><td>Номер офиса</td><td>Адрес</td></tr>";

			foreach ($pdo->query($query) as $row) {
				
				
				$result .="<tr>";
			$result .= "<td>".$row['post_office_num'] . "</td>";
			$result .=  "<td>".$row['post_office_adress'] . "</td>";
			$result .="</tr>";
		
			}
			$result .="</table>";
			break;
		}
		case 5:{
			$query="select printing_office.printing_office_name, newspaper.newspaper_name, 
newspaper.editor_surname, max(print.amount) as max_amount 
from printing_office 
inner join ((newspaper inner join edition on newspaper.newspaper_name=edition.newspaper_name) 
inner join print on (edition.edition_num=print.edition_num) 
and (edition.newspaper_name=print.newspaper_name)) 
on printing_office.printing_office_name=print.printing_office_name
group by printing_office.printing_office_name, newspaper.newspaper_name, 
newspaper.editor_surname
having printing_office.printing_office_name='Типография Вторая'
order by max(print.amount) desc
limit 1";
$result .="5. Фамилия редактора газеты, которая печатается в указанной типографии самым большим тиражом";
$result .="<table border=1> <tr><td>Типография</td><td>Название газеты</td><td>Фамилия редактора</td><td>Число</td></tr>";

			foreach ($pdo->query($query) as $row) {
			$result .="<tr>";
			$result .= "<td>".$row['printing_office_name'] . "</td>";
			$result .=  "<td>".$row['newspaper_name'] . "</td>";
			$result .=  "<td>".$row['editor_surname'] . "</td>";
			$result .=  "<td>".$row['max_amount'] . "</td>";
			$result .="</tr>";
		
			}
			$result .="</table>";
			break;
		}
	}
}
else if(isset($_POST["db_name"]))
{
	$result="";
	$pdo = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, FALSE);
	$query="SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '".$_POST["db_name"]."'";
	
	switch ($_POST["type_of_request"])
	{
		case "view_all":{
			$result.=view_all($query,$_POST["db_name"],$pdo);
			
			break;
		}
		case "view_one":{
			$result.=view_one($query,$_POST["db_name"],$pdo);
			break;
		}
		case "delete_one":
		{
			delete_one($_POST["id"],$_POST["db_name"],$pdo);
			
			break;
		}
		case "add_one":{
			add_one($query,$_POST,$pdo);
			break;
		}
		
	}
}
echo'
<html>
<body>
<a href="l2.php?qwery=1"><input type="button" value="Запрос 1"></a></br>
<a href="l2.php?qwery=2"><input type="button" value="Запрос 2"></a></br>
<a href="l2.php?qwery=3"><input type="button" value="Запрос 3"></a></br>
<a href="l2.php?qwery=4"><input type="button" value="Запрос 4"></a></br>
<a href="l2.php?qwery=5"><input type="button" value="Запрос 5"></a></br>
<table>
<tr>
<td>
<form action="l2.php" method="post">
Таблица newspaper</br>
<input type="hidden" name="db_name"  value="newspaper">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все</br>
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id</br>
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один</br>
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id</br>
<input type="text" name="newspaper_name">название издателя</br>
<input type="text" name="index">индекс издания</br>
<input type="text" name="editor_name">имя редактора</br>
<input type="text" name="editor_surname">фамилия редактора</br>
<input type="text" name="editor_patronymic">отчество редактора</br>
<input type="submit" name="Отправить запрос">
</form>
</td>
<td>
<form action="l2.php" method="post">
Таблица delivery</br>
<input type="hidden" name="db_name"  value="delivery">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все</br>
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id</br>
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один</br>
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id</br>
<input type="text" name="delivery_num">delivery_num</br>
<input type="text" name="edition_num">edition_num</br>
<input type="text" name="newspaper_name">newspaper_name</br>
<input type="text" name="post_office_num">post_office_num</br>
<input type="text" name="amount">amount</br>
<input type="submit" name="Отправить запрос">
</form>
</td>
<td>
<form action="l2.php" method="post">
Таблица edition</br>
<input type="hidden" name="db_name"  value="edition">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все</br>
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id</br>
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один</br>
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id</br>
<input type="text" name="edition_num">edition_num</br>
<input type="text" name="newspaper_name">newspaper_name</br>
<input type="text" name="price">price</br>
<input type="text" name="amount">amount</br>
<input type="submit" name="Отправить запрос">
</form>
</td>
<td>
<form action="l2.php" method="post">
Таблица post_office</br>
<input type="hidden" name="db_name"  value="post_office">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все</br>
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id</br>
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один</br>
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id</br>
<input type="text" name="post_office_num">post_office_num</br>
<input type="text" name="post_office_adress">post_office_adress</br>
<input type="submit" name="Отправить запрос">
</form>
</td>
<td>
<form action="l2.php" method="post">
Таблица print</br>
<input type="hidden" name="db_name"  value="print">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все</br>
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id</br>
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один</br>
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id</br>
<input type="text" name="print_order_num">print_order_num</br>
<input type="text" name="edition_num">edition_num</br>
<input type="text" name="printing_office_name">printing_office_name</br>
<input type="text" name="newspaper_name">newspaper_name</br>
<input type="text" name="amount">amount</br>
<input type="submit" name="Отправить запрос">
</form>
</td>
<td>
<form action="l2.php" method="post">
Таблица printing_office</br>
<input type="hidden" name="db_name"  value="printing_office">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все</br>
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id</br>
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один</br>
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id</br>
<input type="text" name="printing_office_name">printing_office_name</br>
<input type="text" name="printing_office_adress">printing_office_adress</br>
<input type="submit" name="Отправить запрос">
</form>
</td>
</tr>
</table>
';
if (isset($result))
{
	echo $result;
	
}


	

?>

</body>
</html>