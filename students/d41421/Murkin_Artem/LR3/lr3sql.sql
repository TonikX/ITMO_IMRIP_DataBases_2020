/*суммарная протяжённость маршрутов обслуживаемых каждой водительницей*/
select driver_name, sum(route_length) sum_length 
from bus_bd_schema.routes 
inner join bus_bd_schema.drivers on bus_bd_schema.routes.route_number = bus_bd_schema.drivers.route_number 
where bus_bd_schema.drivers.driver_sex = 'f' 
group by bus_bd_schema.drivers.driver_id

/*номера автобусов которые не ломались*/
select license_plate 
from bus_bd_schema.buses 
where not exists 
(select * from bus_bd_schema.malfunctions 
where bus_bd_schema.buses.license_plate = bus_bd_schema.malfunctions.license_plate)

/*водители которые не выходили на работу больше одного раза и водители которые не выходили меньше одного раза (то есть не имеют пропусков)*/
select driver_name, count(absence_date) from bus_bd_schema.drivers 
left join bus_bd_schema.absences on bus_bd_schema.drivers.driver_id = bus_bd_schema.absences.driver_id
group by bus_bd_schema.drivers.driver_id
having count(absence_date) > 1
union 
select driver_name, count(absence_date) from bus_bd_schema.drivers 
left join bus_bd_schema.absences on bus_bd_schema.drivers.driver_id = bus_bd_schema.absences.driver_id
group by bus_bd_schema.drivers.driver_id
having count(absence_date) < 1

/*водители чья фамилия начинается на 'И'*/
select driver_name from bus_bd_schema.drivers where driver_name like 'И%'

/*водители которые не выходили в смену в течение двух недель с 28.10 по 10.11 и причина невыхода*/
select bus_bd_schema.drivers.driver_name, malfunction_date D, malfunction_cause from bus_bd_schema.malfunctions 
inner join bus_bd_schema.buses on bus_bd_schema.malfunctions.license_plate = bus_bd_schema.buses.license_plate
inner join bus_bd_schema.drivers on bus_bd_schema.buses.license_plate = bus_bd_schema.drivers.license_plate
where malfunction_date between '2019-10-28' and '2019-11-10'
union
select bus_bd_schema.drivers.driver_name, absence_date D, absence_cause from bus_bd_schema.absences
inner join bus_bd_schema.drivers on bus_bd_schema.absences.driver_id = bus_bd_schema.drivers.driver_id
where absence_date between '2019-10-28' and '2019-11-10'
order by D desc

/*зарплаты водителей выше 30000*/
select driver_name, bus_bd_schema.wages.wage from bus_bd_schema.drivers 
left join bus_bd_schema.wages on bus_bd_schema.drivers.rank = bus_bd_schema.wages.rank and bus_bd_schema.drivers.experience = bus_bd_schema.wages.experience
where bus_bd_schema.wages.wage = some (select wage from bus_bd_schema.wages where wage > 30000)
order by wage desc

/*разделение на высокий (>40000) и средний (<40000) доход водителей*/
select driver_name,
case
when bus_bd_schema.wages.wage > 40000 then 'Высокий доход' else 'Средний доход' 
end as wage
from bus_bd_schema.drivers 
left join bus_bd_schema.wages on bus_bd_schema.drivers.rank = bus_bd_schema.wages.rank and bus_bd_schema.drivers.experience = bus_bd_schema.wages.experience

/*средняя протяжённость маршрутов по которым ходят двухэтажные автобусы и автобусы "с гармошкой"*/
select bus_bd_schema.bus_types.bus_type, round(avg(route_length))
from bus_bd_schema.bus_types left join bus_bd_schema.buses on bus_bd_schema.bus_types.bus_type = bus_bd_schema.buses.bus_type
left join bus_bd_schema.routes on bus_bd_schema.routes.route_number = bus_bd_schema.buses.route_number
where bus_bd_schema.bus_types.bus_type in ('doubledeck', 'middlebend')
group by bus_bd_schema.bus_types.bus_type 

/*средняя вместимость автобусов, ходящих по каждому маршруту*/
select route_number, round(avg(capacity)) avg_cap
from bus_bd_schema.buses inner join bus_bd_schema.bus_types 
on bus_bd_schema.buses.bus_type = bus_bd_schema.bus_types.bus_type
group by route_number
order by avg_cap desc

/*число случаев каждого типа поломки для каждого типа автобуса*/
select bus_bd_schema.bus_types.bus_type, bus_bd_schema.malfunctions.malfunction_cause, count(bus_bd_schema.malfunctions.malfunction_cause) C
from bus_bd_schema.bus_types
left join bus_bd_schema.buses on bus_bd_schema.buses.bus_type = bus_bd_schema.bus_types.bus_type
left join bus_bd_schema.malfunctions on bus_bd_schema.malfunctions.license_plate = bus_bd_schema.buses.license_plate
group by bus_bd_schema.bus_types.bus_type, bus_bd_schema.malfunctions.malfunction_cause
order by C desc
