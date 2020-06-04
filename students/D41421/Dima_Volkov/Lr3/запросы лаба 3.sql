SELECT "Dog"."Dog_name" FROM exb."Dog" WHERE "Dog"."Dog_age" > 3 AND "Dog"."ID_breed" = 3
#Вывести имена всех собак, которые старше 3 и порода равна 3

SELECT "Dog"."Dog_name", "Breed"."Breed_name", "Ring"."Ring_name" 
FROM exb."Dog", exb."Breed", exb."Ring" 
WHERE "Dog"."ID_breed" = "Breed"."ID_breed" AND "Breed"."Ring_number" = "Ring"."Ring_number"
#Вывести клички всех собак, их породы и ринг, на котором они выступают

SELECT "Breed"."Breed_name", COUNT("Dog"."ID_breed") AS Number_of_dogs
FROM exb."Breed", exb."Dog" WHERE "Dog"."ID_breed" = "Breed"."ID_breed" GROUP BY "Breed"."Breed_name"
#Вывести количество участников по каждой породе

SELECT "Expert"."Expert_name", "Club"."Club_name" FROM exb."Expert", exb."Club" 
WHERE "Club"."Club_number" = "Expert"."Club_number" AND "Expert"."Expert_name" LIKE 'D%' 
AND "Club"."Club_name" LIKE '%n'
#Вывести имена экспертов, если они начинаются на “D” и название их клуба заканчивается на “n”

SELECT "Dog"."Dog_name", "Сompetition"."Score" FROM exb."Сompetition", exb."Dog", exb."Registration" 
WHERE "Registration"."ID_reg" = "Сompetition"."ID_reg" AND "Dog"."ID_dog" = "Registration"."ID_dog" ORDER BY "Сompetition"."Score"
#Вывести клички собак и их сумму очков за соревнование в порядке возрастания

SELECT "Dog"."Dog_name", "Dog_owner"."Owner_surname", "Ring_name" 
FROM exb."Dog", exb."Dog_owner", exb."Ring", exb."Breed" 
WHERE "Dog"."ID_Owner" = "Dog_owner"."ID_Owner" AND "Dog"."ID_breed" = "Breed"."ID_breed" AND "Breed"."Ring_number" = "Ring"."Ring_number"
#Вывести на каком ринге выступает заданный хозяин со своей собакой

SELECT "Breed"."Breed_name", "Club"."Club_name" 
FROM exb."Dog",exb."Breed",exb."Club" WHERE "Dog"."ID_breed" = "Breed"."ID_breed" AND "Dog"."Club_number" = "Club"."Club_number"
#Вывести какими породами представлен каждый клуб

SELECT COUNT("Dog"."Dog_name") FROM exb."Dog", exb."Dog_owner" 
WHERE "Dog"."ID_Owner" = "Dog_owner"."ID_Owner" AND "Dog_owner"."Payment" = false OR "Dog"."Med_check" = false
#Сколько собак были отстранены от участия в выставке

SELECT "Expert"."Expert_name","Expert"."Expert_surname", "Breed"."Breed_name" 
FROM exb."Expert", exb."Breed" WHERE "Expert"."Ring_number" = "Breed"."Ring_number"
#Какие эксперты обслуживают породу

SELECT "Dog"."Father_name" FROM exb."Dog" 
WHERE "Dog"."Dog_age" > 3 AND "Dog"."Last_vaccination_date" BETWEEN '2019-08-20' AND '2020-12-04' 
ORDER BY "Dog"."Dog_age"DESC
#Вывести клички отца каждой собаки чей возраст больше 3 и последняя вакцинация была между 2019-08-20 и 20-12-04, упорядочив их по возрасту

SELECT AVG("Сompetition"."Exercise_1_points"), AVG("Сompetition"."Exercise_2_points"), AVG("Сompetition"."Exercise_3_points") 
FROM exb."Сompetition" WHERE "Сompetition"."ID_competition" = 1
#Вывести средние значение за каждое упражение, полученные участниками на выставке номер 1

SELECT "Dog"."Dog_name" FROM exb."Dog" WHERE "Dog"."ID_dog" = ANY (SELECT "Registration"."ID_dog" from exb."Registration")
#Вывести имена собак, которые зарегистрированы хотя бы на одной выставке и старше 1 года

SELECT "Dog_owner"."Owner_name", "Dog"."Dog_name", CASE WHEN "Dog"."Dog_age" > 10 THEN 'Old' ELSE 'Young' END AS Age 
FROM exb."Dog_owner", exb."Dog" where "Dog_owner"."ID_Owner" = "Dog"."ID_Owner"
#Вывести имена хозяев и клички их собак, и обозначить собак старше 10 старыми, а остальных молодыми

SELECT "Club"."Club_name", COUNT("Breed"."Breed_name") 
FROM exb."Dog",exb."Breed",exb."Club" WHERE "Dog"."ID_breed" = "Breed"."ID_breed" AND "Dog"."Club_number" = "Club"."Club_number" 
GROUP BY "Club"."Club_name" ORDER BY COUNT("Breed"."Breed_name")
#Вывести количество собак в каждом клубе и расположить их в порядке возрастания

SELECT "EXB"."Exb_name" FROM exb."EXB" 
WHERE "EXB"."Location" = 'Saint-Petersburg' AND "EXB"."Date" BETWEEN '2020-01-01' AND '2020-09-30'
#Вывести названия выставок, которые проходят в Петербурге, и их дата находится между 20-01-01 и 20-09-30

SELECT "Dog"."Dog_name", "Breed"."Breed_name" 
FROM exb."Dog" INNER JOIN exb."Breed" ON "Dog"."ID_breed" = "Breed"."ID_breed" WHERE "Dog"."Dog_age" < 11 ORDER BY "Dog"."Dog_age"
#Вывести клички собак и их породы, если им меньше 11 лет, в порядке возрастания

SELECT "Dog_owner"."Owner_name","Dog"."Dog_name" 
FROM exb."Dog_owner" INNER JOIN exb."Dog" ON "Dog_owner"."ID_Owner" = "Dog"."ID_Owner" 
WHERE "Dog_owner"."Payment" = 'true' AND "Dog_owner"."Owner_surname" LIKE '%v'
#Вывести имена хозяев и клички собак, если хозяева оплатили взнос и их фамилия заканчивается на “v”

SELECT "Expert"."Expert_surname", "Ring"."Ring_name" FROM exb."Expert" INNER JOIN exb."Ring" ON "Expert"."Ring_number" = "Ring"."Ring_number"
#Вывести фамилия экспертов и ринг, который они обслуживают

SELECT "Expert"."Expert_name", "EXB"."Exb_name" 
FROM exb."Expert", exb."Registration", exb."EXB" 
WHERE "Expert"."Ring_number" = "Registration"."Ring_number" AND "Registration"."ID_Exb" = "EXB"."ID_Exb"
#Вывести имена экспертов и выставки, на которых они работали

SELECT "Dog"."Dog_name", "Club"."Club_name" FROM exb."Dog" INNER JOIN exb."Club" ON "Dog"."Club_number" = "Club"."Club_number" 
WHERE "Dog"."Med_check" = 'true' AND "Club"."Club_number" > 2
#Вывести собак, если они прошли медосмотр, и их клубы, если их номер больше 2 
