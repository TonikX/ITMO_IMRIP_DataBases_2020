
 <?php 
 
 $dbuser = "postgres";
$dbpass = '67206720';
$host = 'localhost';
$dbname= 'Record_GSM';
function overview($query, $add_section ){  $dbuser = "postgres"; $dbpass = '67206720'; $host = 'localhost'; $dbname= 'Record_GSM';
$toreturn = "";
$toreturn =  $toreturn.'<table class="table table-hover">';
$pdo = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
$stmt = $pdo->query($query);
$$toreturn =  $toreturn."<thead> <tr>  ";
$columnNames = array();
for($i=0;$i<$stmt->columnCount();$i++){
	$toreturn =  $toreturn.'<th scope="col">'.$stmt->getColumnMeta($i)["name"].'</th>';
	$columnNames[$i] = $stmt->getColumnMeta($i)["name"];
}
$toreturn =  $toreturn."</tr></thead><tbody>";
while ($row = $stmt->fetch())
{
$toreturn =  $toreturn."<tr>";
for($i=0;$i<$stmt->columnCount();$i++){
if($i==0 and strpos($columnNames[$i], "id")){ //http://localhost/task2/?mode=edit&table=garage&id=1
$toreturn =  $toreturn."<th ><a href='/task2/?mode=edit&table=".$_GET["table"]."&id=".$row[$i]."'>".$row[$i]."</a></th>"; continue;
}	
$toreturn =  $toreturn. "<td >".$row[$i]."</td>";	

}
$toreturn =  $toreturn.'</tr>';
}
if($add_section){
$toreturn =  $toreturn.'<tr><form method="POST" action="/task2/?mode=edit&table='.$_GET["table"].'&id='.($stmt->rowCount()+1).'">';
for($i=0;$i<$stmt->columnCount();$i++){
$toreturn =  $toreturn. '<td><input name="'.$columnNames[$i].'" class="form-control" type="text" placeholder="'.$columnNames[$i].'"></td>';
}
$toreturn =  $toreturn.'<td><input type="hidden" name="add" value="true"><button type="submit" class="btn btn-primary">Add</button> </td> </form></tr>';}
$toreturn =  $toreturn.'</tbody></table>';
return $toreturn;
}
?>
 <!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
<?php include "navbar.php"; ?>

<div class="container">
  <!-- Content here -->
  <div class="row">
  

	
	 <?php 
if(isset($_GET['mode'])){
if($_GET['mode'] == "overview"){
	
echo overview("SELECT * FROM autobases.".$_GET["table"]." order by ".$_GET["table"].'_id', true);

} elseif($_GET['mode'] == "edit") {
	
$future_query = "";
if(count($_POST) != 0){
if(isset($_POST['add'])){
	foreach($_POST as $key => $value){
		
	if($key == "add") {continue;}
	$future_query = $future_query."'". $value."',";	
}
$future_query = rtrim($future_query, ',');
$future_query = "INSERT INTO autobases.".$_GET["table"]." VALUES (".$future_query.")";
echo '<div class="alert alert-success" role="alert">
  <h4 class="alert-heading">Successfully edited</h4> <hr></div>';
echo $future_query;
} else {
foreach($_POST as $key => $value){
	$future_query = $future_query. $key. "='". $value."',";	
	 
}
$future_query = rtrim($future_query, ',');

$future_query = "UPDATE autobases.".$_GET["table"]."
SET ".$future_query."
where ".$_GET["table"]."_id=".$_GET["id"];
echo '<div class="alert alert-success" role="alert">
  <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
</div>';

}	
// echo $future_query; INSERT INTO autobases.garage VALUES ('1', '5','Vosstania 8');
	
$pdo = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
$stmt2 = $pdo->query($future_query);
}

$stmt = $pdo->query("SELECT * FROM autobases.".$_GET["table"]." where ".$_GET["table"]."_id=".$_GET["id"]);
$columnNames = array();
for($i=0;$i<$stmt->columnCount();$i++){
	$columnNames[$i] = $stmt->getColumnMeta($i)["name"];
}
while ($row = $stmt->fetch()){
echo '<form method="POST" action="/task2/?mode=edit&table='.$_GET["table"].'&id='.$_GET["id"].'">';
	for($i=0;$i<$stmt->columnCount();$i++){
		echo '<label for="exampleFormControlInput1">'.$columnNames[$i].'</label><input name="'.$columnNames[$i].'" class="form-control" type="text" value="'.$row[$i].'">';
	}
	echo '<button type="submit" class="btn btn-primary">Save</button>  
<a href="/task2/?mode=delete&table='.$_GET["table"].'&id='.$_GET["id"].'"><button type="button" class="btn btn-danger">Delete</button></a></form>';
}
	
} elseif($_GET['mode'] == "delete") {
	//<a href="/task2/?mode=edit&table='.$_GET["table"].'&id='.$row[$i].'">
	$pdo2 = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
	$pdo2->query("delete from autobases.".$_GET["table"]." where ".$_GET["table"]."_id=".$_GET["id"]);
	// echo "delete from autobases.".$_GET["table"]." where ".$_GET["table"]."_id=".$_GET["id"];
	echo '<div class="alert alert-danger" role="alert">
  Successfully deleted.
</div>';
}
	
} else {
	include "queries.php";
}

 ?>
</div>
</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
