
 <?php 

	
echo '<h2>Query 1</h2>
<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">
---Для каждой автобазы указать количество закрепленных за ней автомобилей. 

select autobase.name, count(car_id) from autobases.autobase, autobases.car 
where autobase.autobase_id = car.autobase_id 
group by autobase.name
</textarea>';
echo overview("select autobase.name, count(car_id) from autobases.autobase, autobases.car 
where autobase.autobase_id = car.autobase_id 
group by autobase.name", false);

echo '<h2>Query 2</h2>
<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">
--- Вывести список водителей, заправлявшихся в те же дни, что и заданный водитель. 

select driver.full_name from autobases.driver 
join autobases.driver_road on driver.driver_id = driver_road.driver_id
join autobases.road_list on driver_road.road_list_id = road_list.road_list_id
join autobases.payroll on road_list.road_list_id = payroll.road_list_id
where payroll.date_payroll = "2020-03-21"
</textarea>';
echo overview("select driver.full_name from autobases.driver 
join autobases.driver_road on driver.driver_id = driver_road.driver_id
join autobases.road_list on driver_road.road_list_id = road_list.road_list_id
join autobases.payroll on road_list.road_list_id = payroll.road_list_id
where payroll.date_payroll = '2020-03-21'", false);

echo '<h2>Query 3</h2>
<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">
--- Для заданного водителя вывести информацию о всех его заправках указанием номеров 
--- путевых листом и общим объемом отпущенных ГСМ. 

select payroll.payroll_number, sum(payroll.amount_gsm_liter) + sum(payroll.amount_gsm_kg) as total_amount
from autobases.payroll
join autobases.road_list on payroll.road_list_id = road_list.road_list_id
join autobases.driver_road on road_list.road_list_id = driver_road.road_list_id
join autobases.driver on driver_road.driver_id = driver.driver_id
where driver.full_name = "Vaskob Nikolay Alekseevich"
group by payroll.payroll_number
</textarea>';
echo overview("select payroll.payroll_number, sum(payroll.amount_gsm_liter) + sum(payroll.amount_gsm_kg) as total_amount
from autobases.payroll
join autobases.road_list on payroll.road_list_id = road_list.road_list_id
join autobases.driver_road on road_list.road_list_id = driver_road.road_list_id
join autobases.driver on driver_road.driver_id = driver.driver_id
where driver.full_name = 'Vaskob Nikolay Alekseevich'
group by payroll.payroll_number", false);

echo '<h2>Query 4</h2>
<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">
---Необходимо предусмотреть возможность получения отчета, в котором для каждой
---автобазы указывается список раздаточных ведомостей с указанием количества
---автомобилей, количества и стоимости отпущенного топлива по каждому типу топлива и автобазе, общей стоимости топлива по предприятию.
---Сортировка по возрастанию.

select autobase.name, payroll.payroll_number, count(gov_reg_number) as cars, gsm.type_gsm,
sum(payroll.amount_gsm_liter) + sum(payroll.amount_gsm_kg) as gsm_amount, 
count(gsm.price_liter) + count(gsm.price_kg) as gsm_price
from autobases.autobase
join autobases.road_list on autobase.autobase_id = road_list.autobase_id
join autobases.payroll on road_list.road_list_id = payroll.road_list_id
join autobases.car on autobase.autobase_id = car.autobase_id
join autobases.gsm on payroll.gsm_id = gsm.gsm_id
group by gsm.type_gsm, payroll.payroll_number, autobase.name
order by gsm_amount asc
</textarea>';
echo overview("select autobase.name, payroll.payroll_number, count(gov_reg_number) as cars, gsm.type_gsm,
sum(payroll.amount_gsm_liter) + sum(payroll.amount_gsm_kg) as gsm_amount, 
count(gsm.price_liter) + count(gsm.price_kg) as gsm_price
from autobases.autobase
join autobases.road_list on autobase.autobase_id = road_list.autobase_id
join autobases.payroll on road_list.road_list_id = payroll.road_list_id
join autobases.car on autobase.autobase_id = car.autobase_id
join autobases.gsm on payroll.gsm_id = gsm.gsm_id
group by gsm.type_gsm, payroll.payroll_number, autobase.name
order by gsm_amount asc", false);

echo '<h2>Query 5</h2>
<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">
---Вывести номера машин, которые находятся в гаражах по адресам, содержащим букву о. Отсортировать по убыванию гос. рег. номера машин.
select car.gov_reg_number from autobases.car 
where car.garage_id  = some 
(select garage.garage_id from autobases.garage 
 where garage.address like "%o%")
 order by car.gov_reg_number desc
</textarea>';
echo overview("select car.gov_reg_number from autobases.car 
where car.garage_id  = some 
(select garage.garage_id from autobases.garage 
 where garage.address like '%o%')
 order by car.gov_reg_number desc", false);


?>
