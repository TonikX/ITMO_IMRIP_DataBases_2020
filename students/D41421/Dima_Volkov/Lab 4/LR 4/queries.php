<?php
	header("Content-Type: text/plain; charset=utf-8");
	
//	echo 123;

	$dbuser = 'postgres';
	$dbpass = '10101996';
	$host = 'localhost';
	$dbname= 'Dog_Exhibition';

	$db = pg_connect("host=$host dbname=$dbname user=$dbuser password=$dbpass");
	
	$st1 = 'Вывести количество участников по каждой породе';
	$query1 = 'SELECT "Breed"."Breed_name", COUNT("Dog"."ID_breed") AS Number_of_dogs 
        FROM exb."Breed", exb."Dog" 
        WHERE "Dog"."ID_breed" = "Breed"."ID_breed" 
        GROUP BY "Breed"."Breed_name"';
	
	$st2 = 'Вывести количество собак в каждом клубе и расположить их в порядке возрастания';
	$query2 = 'SELECT "Club"."Club_name", COUNT("Breed"."Breed_name") 
        FROM exb."Dog",exb."Breed",exb."Club" WHERE "Dog"."ID_breed" = "Breed"."ID_breed" 
        AND "Dog"."Club_number" = "Club"."Club_number" GROUP BY "Club"."Club_name" 
        ORDER BY COUNT("Breed"."Breed_name")';
		
	$st3 = 'Вывести имена экспертов и выставки, на которых они работали';
	$query3 = 'SELECT "Expert"."Expert_name", "EXB"."Exb_name" 
        FROM exb."Expert", exb."Registration", exb."EXB" WHERE "Expert"."Ring_number" = "Registration"."Ring_number" 
        AND "Registration"."ID_Exb" = "EXB"."ID_Exb"';

	$st4 = 'Вывести клички всех собак, их породы и ринг, на котором они выступают';
	$query4 = 'SELECT "Dog"."Dog_name", "Breed"."Breed_name", "Ring"."Ring_name" 
        FROM exb."Dog", exb."Breed", exb."Ring" WHERE "Dog"."ID_breed" = "Breed"."ID_breed" 
        AND "Breed"."Ring_number" = "Ring"."Ring_number"';
	
	$st5 = 'Вывести клички собак и их сумму очков за соревнование в порядке возрастания';
	$query5 = 'SELECT "Dog"."Dog_name", "Сompetition"."Score" 
        FROM exb."Сompetition", exb."Dog", exb."Registration" 
        WHERE "Registration"."ID_reg" = "Сompetition"."ID_reg" 
        AND "Dog"."ID_dog" = "Registration"."ID_dog" ORDER BY "Сompetition"."Score"';
	
	$queries = array($query1, $query2, $query3, $query4, $query5);
	$strs = array($st1, $st2, $st3, $st4, $st5);
	
	for($i=0; $i<5; $i++) {
		$result = pg_query($db, $queries[$i]);
		$NumFields = pg_num_fields($result);
		echo $strs[$i], "\n";
		
		while ($row = pg_fetch_assoc($result)) {
//			print_r($row);
			foreach ($row as $data) {
				echo $data, ' ';
			}
			echo "\n";
		}
		echo "\n";
		echo "\n";
	}
	
	
	pg_close($db);
	
?>