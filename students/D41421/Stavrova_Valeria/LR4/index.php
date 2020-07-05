
<a href = 'index.php'>Главная</a> 
<a href = 'praktika.php'>Практика</a> 
<a href = 'pokupateli.php'>Покупатели</a> 
<a href = 'tovari.php'>Товары</a> 
<a href = 'brokeri.php'>Брокеры</a> 
<a href = 'kontori.php'>Конторы</a> 
<a href = 'firmi.php'>Фирмы</a> 

<br>
<br>
<br><b>2. Какая фирма-производитель товаров за заданный период времени выручила максимальную сумму денег?</b>

<?php
$dbconn = pg_connect("host=localhost dbname=laba user=postgres password=123");
//
//$query = 'SELECT * FROM Контора';

$query= "
select Фирмы.Название,sum (Товары.Цена_товара * Партия_товара.Количество) 
from Фирмы join Товары on Фирмы.Номер_фирмы = Товары.Номер_фирмы
join Партия_товара on Товары.Номер_товара = Партия_товара.Номер_товара
join Партия on Партия.Номер_партии = Партия_товара.Номер_партии
where Партия.Дата_начала_торгов between '2020-02-01' and '2020-06-01'
group by Фирмы.Номер_фирмы
order by sum (Товары.Цена_товара * Партия_товара.Количество) desc
"; 
$result = pg_query($query) or die('Ошибка запроса: ' . pg_last_error());

// Вывод результатов в HTML
echo "<table>\n";
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

// Очистка результата
pg_free_result($result);

// Закрытие соединения
pg_close($dbconn);
?>

<br><b> 3. Найти зарплату брокеров заданной конторы.</b>

<?php
$dbconn = pg_connect("host=localhost dbname=laba user=postgres password=123");
//
//$query = 'SELECT * FROM Контора';
$query= "
select Брокер.ФИО, sum((Товары.Цена_товара * Партия_товара.Количество) * 0.1)
from Брокер join Контора on Брокер.Номер_конторы = Контора.Номер_конторы
join Партия on Партия.Номер_брокера = Брокер.Номер_брокера
join Партия_товара on Партия.Номер_партии = Партия_товара.Номер_партии
join Товары on Товары.Номер_товара = Партия_товара.Номер_товара
where Контора.Название = 'ИП Диетолог'
group by Брокер.ФИО"; 
$result = pg_query($query) or die('Ошибка запроса: ' . pg_last_error());

// Вывод результатов в HTML
echo "<table>\n";
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

// Очистка результата
pg_free_result($result);

// Закрытие соединения
pg_close($dbconn);
?>

<br><b>6. Выведем брокеров и на какие конторы они работают, отсортируем по ФИО.</b>

<?php
$dbconn = pg_connect("host=localhost dbname=laba user=postgres password=123");
//
//$query = 'SELECT * FROM Контора';
//$ip = "ИП Диетолог";
$query= '
select Брокер.ФИО, Контора.Название
from Брокер, Контора
where Брокер.Номер_конторы = Контора.Номер_конторы
order by Брокер.ФИО'; 

$result = pg_query($query) or die('Ошибка запроса: ' . pg_last_error());

// Вывод результатов в HTML
echo "<table>\n";
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

// Очистка результата
pg_free_result($result);

// Закрытие соединения
pg_close($dbconn);
?>



<br><b>9.	Показать проданные товары, единица измерения которых “штук” и количество проданных единиц больше 50.</b>

<?php
$dbconn = pg_connect("host=localhost dbname=laba user=postgres password=123");
//
//$query = 'SELECT * FROM Контора';

$query= "
select Товары.Наименование, sum(Партия_товара.Количество)
from Товары join Партия_товара on Товары.Номер_товара = Партия_товара.Номер_товара
where Товары.Единица_измерения = 'Штук'
group by Товары.Наименование
having sum(Партия_товара.Количество) > 50"; 
$result = pg_query($query) or die('Ошибка запроса: ' . pg_last_error());

// Вывод результатов в HTML
echo "<table>\n";
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

// Очистка результата
pg_free_result($result);

// Закрытие соединения
pg_close($dbconn);
?>

<br><b>12. Вывести те номера договоров между покупателями и брокерами, по которым была проведена предоплата.</b>

<?php
$dbconn = pg_connect("host=localhost dbname=laba user=postgres password=123");
//
//$query = 'SELECT * FROM Контора';
$query='select Договор_П_Б.Номер_договора from Договор_П_Б
where Договор_П_Б.Номер_договора in (
select Покупка.Номер_договора_П_Б from Покупка
join Партия on Покупка.Номер_партии = Партия.Номер_партии
where Партия.Предоплата = True)'; 
$result = pg_query($query) or die('Ошибка запроса: ' . pg_last_error());

// Вывод результатов в HTML
echo "<table>\n";
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

// Очистка результата
pg_free_result($result);

// Закрытие соединения
pg_close($dbconn);
?>








