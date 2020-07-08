<?php

echo 'Задача: вывести только високосные года из пользовательского списка';
echo '<br / >';

function IsYearLeap(array $years) {
    $leapyears = array();
    foreach ($years as $year) {
        if ($year % 4 == 0){
            if (($year % 100 == 0) and ($year % 400 == 0)) {
                array_push($leapyears, $year);
            } else {
                array_push($leapyears, $year);
            }
        } else {
            continue;
        } 
    };
    return $leapyears;
};

echo 'Проверим года 2016, 1936, 1894, 2010, 1910, 1994, 2020';
echo '<br / >';
echo '<br / >';
echo 'Выведем високосные года:';
echo '<br / >';

$mainyear = array(2016, 1936, 1894, 2010, 1910, 1994, 2020);

echo implode(", ", IsYearLeap($mainyear));

?>