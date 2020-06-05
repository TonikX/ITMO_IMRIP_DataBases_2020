SELECT breed.breed_name from chick.breed, chick.diet
WHERE diet.diet_id = 1 AND breed.diet = diet.diet_id
GROUP BY diet.diet_id, breed.breed_name;


SELECT chicken_id, weight, breed, productivity FROM chick.chicken WHERE weight > 3 AND breed LIKE 'русская белая' AND productivity > 26;

SELECT COUNT(chicken) AS nb_chickens, cell.zeh, chicken.breed FROM chick.cell 
INNER JOIN chick.chicken ON cell.cell_id = chicken.cell
GROUP BY cell.zeh, chicken.breed;


SELECT COUNT(chicken) AS nb_chicken, chicken.breed, cell.zeh FROM chick.chicken
INNER JOIN chick.cell ON chicken.cell = cell.cell_id
GROUP BY chicken.breed, cell.zeh
ORDER BY nb_chicken DESC
LIMIT 1;


SELECT ROUND(SUM(chicken.productivity) / 30, 2) AS egg_per_day, employee.name, maintenance.cell
FROM chick.chicken, chick.employee, chick.maintenance
WHERE employee.employee_id = maintenance.employee AND chicken.cell = maintenance.cell
GROUP BY employee.name, maintenance.cell;


SELECT chicken.chicken_id, CASE WHEN chicken.productivity >= breed.av_productivity THEN 'productive' 
ELSE 'unproductive' END AS status
FROM chick.chicken, chick.breed
WHERE breed.breed_name = chicken.breed;


SELECT COUNT (*) AS num_white_chickens FROM chick.chicken WHERE chicken.breed LIKE '%белая%' OR chicken.breed LIKE '%уайт%';


SELECT chicken.chicken_id,
CASE WHEN chicken.birth_date < '2017-01-01'
THEN 'old'
ELSE 'young' END AS age
FROM chick.chicken;


SELECT employee.name, CHAR_LENGTH (employee.name) AS name_length FROM chick.employee ORDER BY name_length  DESC;


SELECT CASE WHEN breed.av_weight > 3.5
THEN UPPER(breed.breed_name)
ELSE breed.breed_name END, breed.av_weight
FROM chick.breed;


SELECT round(avg(weight)), productivity FROM chick.chicken 
GROUP BY productivity HAVING productivity > 27;



SELECT ROUND(AVG(E.salary)) AS avg_salary FROM (
	SELECT E.name, S.nb_cells, E.salary FROM chick.employee E
	INNER JOIN (
		SELECT employee.name, COUNT(employee.name) AS nb_cells FROM chick.employee
		INNER JOIN chick.maintenance ON maintenance.employee = employee.employee_id
		GROUP BY employee.name) S ON E.name = S.name
	WHERE S.nb_cells >= 2) AS E;




SELECT chicken.chicken_id, breed.breed_name, breed.av_weight AS avg_breed_weight, chicken.weight AS actual_weight, breed.diet
FROM chick.breed
INNER JOIN chick.chicken ON breed.breed_name = chicken.breed
WHERE chicken.weight = ANY (SELECT chicken.weight FROM chick.chicken WHERE chicken.weight <= breed.av_weight);



SELECT COUNT(*) AS nb_empty_cells FROM (
	SELECT cell.cell_id, chicken.chicken_id FROM chick.cell
	LEFT JOIN chick.chicken ON chicken.cell = cell.cell_id
	WHERE chicken.chicken_id ISNULL) AS E;



SELECT ROUND(AVG(E.nb_cells), 2) AS avg_employee_cells FROM (
	SELECT employee.name, COUNT(employee.name) AS nb_cells FROM chick.employee
	INNER JOIN chick.maintenance ON maintenance.employee = employee.employee_id
	GROUP BY employee.name) AS E;



SELECT (SELECT COUNT(*) FROM chick.chicken) AS chickens,
	(SELECT COUNT(*) FROM chick.employee) AS employees,
	(SELECT COUNT(*) FROM chick.zeh) AS zehs,
	(SELECT COUNT(*) FROM chick.cell) AS cells;






