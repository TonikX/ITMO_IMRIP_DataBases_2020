
 <?php 
 $dbuser = "postgres";
$dbpass = '67206720';
$host = 'localhost';
$dbname= 'Record_GSM';



// $db = pg_connect("host=$host dbname=$dbname user=$dbuser password=$dbpass");
// $query = "select 'Привет!' as field_1, 123 as field_2";
// $result = pg_query($db, $query);
// $result = pg_fetch_assoc($result);
// echo $result['field_1'] . '<br>'. $result['field_2'];
// pg_close($db);

$pdo = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
$stmt = $pdo->query("SELECT * FROM autobases.autobase");
while ($row = $stmt->fetch())
{
echo $row[1] .": ".$row['name'] . "<br>" . $stmt->rowCount() . "<br>";
}
 ?>
