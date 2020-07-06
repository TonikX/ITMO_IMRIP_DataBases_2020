<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Запросы</title>
	</head>
		<hr>
		<h3>Запросы лабораторной №3:</h3>
		<hr>
	</br>
	<?php
		$dbuser = "postgres";
		$dbpass = "123";
		$host = "localhost";
		$dbname= "hospital";
		$db = pg_connect("host=$host dbname=$dbname user=$dbuser password=$dbpass");
	
		$sq4 = 'Запрос №4. Количество приемов пациентов по датам:';
		$query1 = 'SELECT consultation.cons_date, COUNT(consultation.cons_id) FROM "hospitalDB".consultation
			GROUP BY consultation.cons_date ORDER BY consultation.cons_date';
	
		$sq9 = 'Запрос №9. Способы лечения, которые был назначены более, чем 1 раз:';
		$query2 = 'SELECT consultation.cons_treat, COUNT(consultation.cons_treat) FROM "hospitalDB".consultation
			GROUP BY consultation.cons_treat HAVING COUNT(consultation.cons_treat) > 1';
	
		$sq13 = 'Запрос №13. Номера кабинетов, которые совпадают с расписанием:';
		$query3 = 'SELECT "cab_id(FK)" FROM "hospitalDB".timetable UNION SELECT cab_id FROM "hospitalDB".cabinets
			ORDER BY "cab_id(FK)"';
		
	
		$sq10 = 'Запрос №10. Количество дней, прошедших с последней даты консультации:';
		$query4 = 'SELECT consultation.cons_date, (CURRENT_DATE - consultation.cons_date) AS "count days"
			FROM "hospitalDB".consultation ORDER BY consultation.cons_date';
		
		$sq20 = 'Запрос №20. Номера кабинетов и информация о выходных днях ответственных за кабинеты:';
		$query5 = 'SELECT cabinets.cab_id, doctors.doc_name, timetable.day_of
			FROM "hospitalDB".doctors, "hospitalDB".cabinets, "hospitalDB".timetable
			WHERE doctors.doc_id = cabinets."cab_leader(FK)" AND timetable."doc_id(FK)" = doctors.doc_id
			ORDER BY cabinets.cab_id';
	
		$queries = array($query1, $query2, $query3, $query4, $query5);
		$strs = array($sq4, $sq9, $sq13, $sq10, $sq20);
	
		for($i=0; $i<5; $i++) {
			$result = pg_query($db, $queries[$i]);
			echo $strs[$i], "<br/>";
		
			while ($row = pg_fetch_assoc($result)) {
				foreach ($row as $data) {

					echo $data, ' ';
				}
				echo "<br/>";
			}
			echo "<br/>";
			echo "<br/>";
		}
	
		pg_close($db);
	?>
	<a href="index.html">На главную</a><br/>
</html>