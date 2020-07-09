<?php

session_start();

$dbh = new PDO('pgsql:host=' . $_SESSION['host'] . ';port=' . $_SESSION['port'] . ';dbname=' . $_SESSION['dbname'] . ';user=' . $_SESSION['dbuser'] . ';password=' . $_SESSION['dbpass'] . '');

echo '1. Запрос выводит суммарную протяжённость всех маршрутов, обслуживаемых каждой водительницей (то есть выведены только женщины)<br>';

$sql1 = "select driver_name, sum(route_length) sum_length from bus_bd_schema.routes 
inner join bus_bd_schema.drivers on bus_bd_schema.routes.route_number = bus_bd_schema.drivers.route_number 
where bus_bd_schema.drivers.driver_sex = 'f' 
group by bus_bd_schema.drivers.driver_id";
$result1 = $dbh->query($sql1);
$result1->setFetchMode(PDO::FETCH_ASSOC);

while ($row = $result1->fetch()) {
	echo $row['driver_name'].' '.$row['sum_length']."<br>";
}; 

echo "<br><br>";

echo '2. Запрос выводит госномера автобусов, которые не ломались ни разу<br>';

$sql2 = "select license_plate from bus_bd_schema.buses 
where not exists (select * from bus_bd_schema.malfunctions 
where bus_bd_schema.buses.license_plate = bus_bd_schema.malfunctions.license_plate)";
$result2 = $dbh->query($sql2);
$result2->setFetchMOde(PDO::FETCH_ASSOC);

while ($row = $result2->fetch()) {
	echo $row['license_plate']."<br>";
};

echo "<br><br>";

echo "3. Запрос выводит имена водителей, чья фамилия начинается на «И»<br>";

$sql3 = "select driver_name from bus_bd_schema.drivers where driver_name like 'И%'";
$result3 = $dbh->query($sql3);
$result3->setFetchMode(PDO::FETCH_ASSOC);

while ($row = $result3->fetch()) {
	echo $row['driver_name']."<br>";
};

echo "<br><br>";

echo "4. Этот запрос выводит информацию о водителях и их зарплатах для водителей которым платят больше 30000<br>";

$sql4 = "select driver_name, bus_bd_schema.wages.wage from bus_bd_schema.drivers 
left join bus_bd_schema.wages on bus_bd_schema.drivers.rank = bus_bd_schema.wages.rank and bus_bd_schema.drivers.experience = bus_bd_schema.wages.experience
where bus_bd_schema.wages.wage = some (select wage from bus_bd_schema.wages where wage > 30000)
order by wage desc";
$result4 = $dbh->query($sql4);
$result4->setFetchMode(PDO::FETCH_ASSOC);


while ($row = $result4->fetch()) {
	echo $row['driver_name'].' '.$row['wage']."<br>";
};

echo "<br><br>";

echo "5. Этот запрос выводит номер маршрута и среднюю вместимость автобусов, ходящих по нему для каждого маршрута<br>";

$sql5 = "select route_number, round(avg(capacity)) avg_cap
from bus_bd_schema.buses inner join bus_bd_schema.bus_types 
on bus_bd_schema.buses.bus_type = bus_bd_schema.bus_types.bus_type
group by route_number
order by avg_cap desc";
$result5 = $dbh->query($sql5);
$result5->setFetchMode(PDO::FETCH_ASSOC);

while ($row = $result5->fetch()) {
	echo $row['route_number'].' '.$row['avg_cap']."<br>";
	};

?>