<?php

error_reporting(E_ALL);
ini_set("display_errors", 1);
ini_set("display_startup_errors", 1);

$dbuser = 'postgres';
$dbpass = 'popaosla';
$host = 'localhost';
$dbname= 'Vedomosti';

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
			$query="select * from sh.\"".$db_name."\"";
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
			$query="select * from sh.\"".$db_name."\" Where id='".$_POST["id"]."'";

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
	$query="delete from sh.\"".$db_name."\" Where id='".$id."'";
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
	$query="INSERT INTO sh.\"".$all["db_name"]."\"";
	$query.="(";
	// foreach($tables as $key => $item){
	// if ($item == "id"){
		// unset($tables[$key]);
		// }
	// }
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
	echo $query;
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
			$query="select v.num, to_char(v.created_at, 'dd.mm.YYYY') as dates, s.fio from sh.\"Vedomost\" as v 
left join sh.\"Sotrudnik_id\" as s on v.zapravshik_id = s.id
where v.created_at between '2020-05-19' and '2020-05-25'
order by s.fio";

$result .="1) Список ведомостей за заданный промежуток дат с сортировкой по водителю";
$result .="<table border=1> <tr><td>Номер</td><td>Дата</td><td>ФИО</td></tr>";

			foreach ($pdo->query($query) as $row) {
				$result .="<tr>";
			$result .= "<td>".$row['num'] . "</td>";
			$result .=  "<td>".$row['dates'] . "</td>";
			$result .=  "<td>".$row['fio']. "</td>";
			
			$result .="</tr>";
		
			}
			$result .="</table>";
			break;
		}
		case 2:{
			$query="select s.fio, sum(z.gsm_l) as total_l, round( CAST(sum(z.gsm_l * p.price) as numeric),2) || ' руб.' as total_money, sum(pl.obshiy_probeg) as obshiy_probeg
from sh.\"Zapisi\" as z
left join sh.\"Sotrudnik_id\" as s on z.voditeli_id = s.id
left join sh.\"GSM\" as g on z.gsm_id = g.id
left join sh.\"Price\" as p on p.gsm_id = g.id
left join sh.\"Putevoy_list\" as pl on pl.id = z.putevoy_list_id
group by fio
having sum(pl.obshiy_probeg) > 100;";
$result .="2) Расход топлива по водителям с общим пробегом более 100";
$result .="<table border=1> <tr><td>ФИО</td><td>Количество литров</td><td>Всего денег</td><td>Весь пробег</td></tr>";
			foreach ($pdo->query($query) as $row) {
				$result .="<tr>";
			$result .= "<td>".$row['fio'] . "</td>";
			$result .=  "<td>".$row['total_l'] . "</td>";
			$result .=  "<td>".$row['total_money']. "</td>";
			$result .=  "<td>".$row['obshiy_probeg']. "</td>";
			
			$result .="</tr>";
		
			}
			$result .="</table>";
			break;
		}
		case 3:{
			$query="select * from sh.\"Putevoy_list\"
where id in (select putevoy_list_id from sh.\"Zapisi\" as z
             inner join sh.\"Avto\" as a on a.id = z.avto_id
             inner join sh.\"Avtobaza\" as ab on a.avtobaza_id = ab.id
             where cast(right(avtobaza_adress, 1) as int) % 2 = 0
            )
and gruzootpr_name ~* '(а).*(н).*(май)'";
$result .="3) Путевые листы, у которых адрес автобазы четный, с заданным отправителем";
$result .="<table border=1> <tr><td>ID</td><td>Пункт погрузки</td><td>Общий пробег</td><td>Пробег с грузом</td><td>Прогрузчик имя</td><td>Время в наряде</td><td>Разгрузчик имя</td><td>Пункт назанчения</td></tr>";
			foreach ($pdo->query($query) as $row) {
				$result .="<tr>";
			$result .= "<td>".$row['id'] . "</td>";
			$result .= "<td>".$row['punkt_pogruzki'] . "</td>";
			$result .= "<td>".$row['obshiy_probeg'] . "</td>";
			$result .= "<td>".$row['probeg_s_gruzom'] . "</td>";
			$result .= "<td>".$row['gruzootpr_name'] . "</td>";
			$result .= "<td>".$row['vremya_v_naryade'] . "</td>";
			$result .= "<td>".$row['gruzopuch_name'] . "</td>";
			$result .=  "<td>".$row['punkt_razgruzki'] . "</td>";
			$result .="</tr>";
			}
			$result .="</table>";
			break;
		}
		case 4:{
			$query="select fio, max(age(created_at)) from sh.\"Vedomost\" as v
join sh.\"Zapisi\" as z on z.vedomost_id = v.id
join sh.\"Sotrudnik_id\" as s on s.id = z.voditeli_id
group by fio;";
$result .="4) Время с последней поездки по водителям";
$result .="<table border=1> <tr><td>Номер офиса</td><td>Адрес</td></tr>";

			foreach ($pdo->query($query) as $row) {

			$result .="<tr>";
			$result .= "<td>".$row['fio'] . "</td>";
			$result .=  "<td>".$row['max'] . "</td>";
			$result .="</tr>";
		
			}
			$result .="</table>";
			break;
		}
		case 5:{
			$query="select a.*, b.price, case
when price > (select avg(price) from sh.\"GSM\" as gg
join sh.\"Price\" as pp on gg.id = pp.GSM_id where a.gsm_name = gg.gsm_name) then 'high price'
else 'low price' end as price_curse
from (select v.num, v.created_at, gsm_name, max(date_) date_ from sh.\"Zapisi\" as z
join sh.\"Vedomost\" as v on z.Vedomost_id = v.id
join sh.\"GSM\" as g on z.gsm_id = g.id
inner join sh.\"Price\" as p on (p.GSM_id = g.id and p.date_ <= v.created_at)
group by v.num, v.created_at, gsm_name) as a
join (select * from sh.\"GSM\" as g
join sh.\"Price\" as p on g.id = p.GSM_id) as b
on a.gsm_name = b.gsm_name and a.date_ = b.date_;";
$result .="5) Сведения по записям ведомостей о сравнительной стоимости топлива в сравнении со среднеей ценой на данный вид топлива";
$result .="<table border=1> <tr><td>Номер</td><td>Дата</td><td>GSM</td><td>Дата</td><td>Цена</td><td>Уровень цены</td></tr>";

			foreach ($pdo->query($query) as $row) {
			$result .="<tr>";
			$result .= "<td>".$row['num'] . "</td>";
			$result .=  "<td>".$row['created_at'] . "</td>";
			$result .=  "<td>".$row['gsm_name'] . "</td>";
			$result .=  "<td>".$row['date_'] . "</td>";
			$result .=  "<td>".$row['price'] . "</td>";
			$result .=  "<td>".$row['price_curse'] . "</td>";
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
<a href="laba.php?qwery=1"><input type="button" value="Запрос 1"></a>
<a href="laba.php?qwery=2"><input type="button" value="Запрос 2"></a>
<a href="laba.php?qwery=3"><input type="button" value="Запрос 3"></a>
<a href="laba.php?qwery=4"><input type="button" value="Запрос 4"></a>
<a href="laba.php?qwery=5"><input type="button" value="Запрос 5"></a>
<table>
<tr>
<td>
<form action="laba.php" method="post">
Таблица Ostatki</br>
<input type="hidden" name="db_name"  value="Ostatki">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id
<input type="text" name="garazh_id">garazh_id
<input type="text" name="gsm_id">gsm_id
<input type="text" name="gsm_l">gsm_l
<input type="text" name="gsm_kg">gsm_kg</br>
<input type="submit" name="Отправить запрос">
</form>
</td>
</tr>
<tr>
<td>
<form action="laba.php" method="post">
Таблица Putevoy_list</br>
<input type="hidden" name="db_name"  value="Putevoy_list">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id
<input type="text" name="punkt_pogruzki">punkt_pogruzki
<input type="text" name="punkt_razgruzki">punkt_razgruzki
<input type="text" name="obshiy_probeg">obshiy_probeg
<input type="text" name="probeg_s_gruzom">probeg_s_gruzom
<input type="text" name="gruzootpr_name">gruzootpr_name
<input type="text" name="gruzopuch_name">gruzopuch_name
<input type="text" name="vremya_v_naryade">vremya_v_naryade</br>
<input type="submit" name="Отправить запрос">
</form>
</td>
</tr>
<tr>
<td>
<form action="laba.php" method="post">
Таблица Zapisi</br>
<input type="hidden" name="db_name"  value="Zapisi">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id
<input type="text" name="vedomost_id">vedomost_id
<input type="text" name="putevoy_list_id">putevoy_list_id
<input type="text" name="voditeli_id">voditeli_id
<input type="text" name="avto_id">avto_id
<input type="text" name="gsm_id">gsm_id
<input type="text" name="gsm_l">gsm_l
<input type="text" name="gsm_kg">gsm_kg</br>
<input type="submit" name="Отправить запрос">
</form>
</td>
</tr>
<tr>
<td>
<form action="laba.php" method="post">
Таблица Vedomost</br>
<input type="hidden" name="db_name"  value="Vedomost">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id
<input type="text" name="num">num
<input type="text" name="created_at">created_at
<input type="text" name="garazh_id">garazh_id
<input type="text" name="zapravshik_id">zapravshik_id</br>
<input type="submit" name="Отправить запрос">
</form>
</td>
</tr>
<tr>
<td>
<form action="laba.php" method="post">
Таблица Avto</br>
<input type="hidden" name="db_name"  value="Avto">
<input type="radio" name="type_of_request" value="view_all" id="view_all" checked>показать все
<input type="radio" name="type_of_request" value="view_one" id="view_one">показать один по id
<input type="radio" name="type_of_request" value="add_one" id="add_one">добавить один
<input type="radio" name="type_of_request" value="delete_one" id="delete_one">удалить один</br>
<input type="text" name="id">id
<input type="text" name="marka">marka
<input type="text" name="gosnomer">gosnomer
<input type="text" name="avtobaza_id">avtobaza_id</br>
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