---Для каждой автобазы указать количество закрепленных за ней автомобилей. 

select autobase.name, count(car_id) from autobases.autobase, autobases.car 
where autobase.autobase_id = car.autobase_id 
group by autobase.name

--- Вывести список водителей, заправлявшихся в те же дни, что и заданный водитель. 

select driver.full_name from autobases.driver 
join autobases.driver_road on driver.driver_id = driver_road.driver_id
join autobases.road_list on driver_road.road_list_id = road_list.road_list_id
join autobases.payroll on road_list.road_list_id = payroll.road_list_id
where payroll.date_payroll = '2020-03-21'

--- Для каждого рейса вывести общий объем топлива в литрах и килограммах в заданный промежуток времени. 

select payroll.payroll_number, sum(payroll.amount_gsm_liter) as liters, sum(payroll.amount_gsm_kg) as kgs
from autobases.payroll
where payroll.date_payroll between '2020-02-28' and '2020-03-21'  
group by payroll.payroll_number

--- Вывести общий объем отпущенного топлива на предприятии по каждому виду в заданный промежуток времени. 

select gsm.type_gsm, sum(payroll.amount_gsm_liter) + sum(payroll.amount_gsm_kg) as total_amount
from autobases.gsm
join autobases.payroll on gsm.gsm_id = payroll.gsm_id
where payroll.date_payroll between '2020-02-28' and '2020-03-21'  
group by gsm.type_gsm

--- Для заданного водителя вывести информацию о всех его заправках указанием номеров 
--- путевых листом и общим объемом отпущенных ГСМ. 

select payroll.payroll_number, sum(payroll.amount_gsm_liter) + sum(payroll.amount_gsm_kg) as total_amount
from autobases.payroll
join autobases.road_list on payroll.road_list_id = road_list.road_list_id
join autobases.driver_road on road_list.road_list_id = driver_road.road_list_id
join autobases.driver on driver_road.driver_id = driver.driver_id
where driver.full_name = 'Vaskob Nikolay Alekseevich'
group by payroll.payroll_number

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

---Посчитать количество водителей в каждом гараже с учетом неукомплектованных гаражей без штата водителей.

select garage.garage_id, count(driver_road.driver_id) from autobases.garage, autobases.car, 
autobases.road_list, autobases.driver_road, autobases.driver 
where garage.garage_id = car.garage_id and car.car_id = road_list.car_id
and road_list.road_list_id = driver_road.road_list_id 
group by garage.garage_id 
union 
select garage.garage_id, 0 from autobases.garage 
where garage.garage_id not in (select garage.garage_id from autobases.car)

---Вывести гос. номера и марки автомобилей, на которые были выписаны путевые листы с исключением незарегистрированных машин.

select car.gov_reg_number, car.brand from autobases.car 
where car.gov_reg_number is not NULL and exists 
(select * from autobases.road_list where car.car_id = road_list.car_id)

--- Для каждой автобазы вывести количество закрепленных за ней автомобилей с учетом того, 
--- что есть неукомплектванные автопарком автобазы.

select autobase.name, count(car.gov_reg_number) from autobases.autobase
left join autobases.garage on garage.autobase_id = autobase.autobase_id
left join autobases.car on car.garage_id = garage.garage_id
group by autobase.autobase_id

---Вывести информацию о гаражах и закрепленных за ними машинах. Отсортировать по возрастанию номера гаража.

select garage.garage_id, car.gov_reg_number from autobases.garage 
inner join autobases.car on garage.garage_id = car.garage_id
order by garage.garage_id asc

---Вывести номера машин, которые находятся в гаражах по адресам, содержащим букву о. Отсортировать по убыванию гос. рег. номера машин.
select car.gov_reg_number from autobases.car 
where car.garage_id  = some 
(select garage.garage_id from autobases.garage 
 where garage.address like '%o%')
 order by car.gov_reg_number desc

---Вывести номера путевых листов, выданных позже февраля и гос.номера автомобилей, на которые они выданы.

select payroll.payroll_number, car.gov_reg_number from autobases.payroll
join autobases.road_list on payroll.road_list_id = road_list.road_list_id
join autobases.car on road_list.car_id = car.car_id
where payroll.date_payroll > (select payroll.date_payroll from autobases.payroll
                  			where payroll.date_payroll = '2020-02-28')
							
---Вывести количество топлива, которое было отпущено по каждой марке, и его тип за каждый день c '2020-03-05' по '2020-04-01'. 

select payroll.date_payroll, gsm.type_gsm, amount_gsm_liter + amount_gsm_kg as gsm_qty 
from autobases.payroll, autobases.gsm
where payroll.gsm_id = gsm.gsm_id and
payroll.date_payroll between '2020-03-05' and '2020-04-01'

--- Вывести общий пробег по каждому путевому листу, где количество машин = 1. Отсортировать по возрастанию пробега.

select road_list.total_mileage from autobases.road_list
group by road_list.road_list_id
having count(road_list.car_id) = 1
order by road_list.total_mileage asc

---Вывести тип ГСМ и цену в килограммах, которая будет отражать, дорогой ли тип ГСМ или нет. 
---Если цена в кг > 1.5, то дорогой, в остальных случаях – дешёвый.

select gsm.type_gsm,
case
when gsm.price_kg > ‘1.5’ then ‘expensive’
else ‘cheap’
end as price_kg
from autobases.gsm




