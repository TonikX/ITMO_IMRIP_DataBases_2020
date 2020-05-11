CREATE DATABASE "Record_GSM" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE "Record_GSM" OWNER TO postgres;

\connect "Record_GSM"


CREATE SCHEMA autobases;


ALTER SCHEMA autobases OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Создание таблицы "Автобаза"
--

CREATE TABLE autobases.autobase (
    autobase_id integer NOT NULL,
    name character varying(30) NOT NULL,
    address character varying(60) NOT NULL
);


ALTER TABLE autobases.autobase OWNER TO postgres;

--
-- Создание таблицы "Гараж"
--

CREATE TABLE autobases.garage (
    garage_id integer NOT NULL,
	autobase_id integer NOT NULL,
    address character varying(60) NOT NULL
);


ALTER TABLE clients.garage OWNER TO postgres;

--
-- Создание таблицы "Автомобиль"
--

CREATE TABLE autobases.car (
    gov_reg_number integer NOT NULL,
    garage_id integer NOT NULL,
    autobase_id integer NOT NULL,
    brand character varying(30) NOT NULL
);


ALTER TABLE autobases.car OWNER TO postgres;

--
-- Создание таблицы "ГСМ"
--

CREATE TABLE autobases.gsm (
    gsm_id integer NOT NULL,
    type_gsm character varying(30) NOT NULL,
    price_liter character varying(10) NOT NULL,
    price_kg character varying(10) NOT NULL
);


ALTER TABLE autobases.gsm OWNER TO postgres;

--
-- Создание таблицы "Путевой лист"
--

CREATE TABLE autobases.road_list (
    road_list_id integer NOT NULL,
    loading_point character varying(30) NOT NULL,
	discharge_point character varying(30) NOT NULL,
	total_mileage character varying (10) NOT NULL,
	mileage_with_cargo character varying(10) NOT NULL,
	shipper_name character varying(30) NOT NULL,
	consignee_name character varying(30) NOT NULL,
	work_time_hours character varying(10) NOT NULL,
	garage_id integer NOT NULL,
	gov_reg_number integer NOT NULL,
	autobase_id integer NOT NULL
);


ALTER TABLE autobases.road_list OWNER TO postgres;

--
-- Создание таблицы "Водитель"
--

CREATE TABLE autobases.driver (
    driver_id integer NOT NULL,
    full_name character varying(60) NOT NULL
);


ALTER TABLE autobases.driver OWNER TO postgres;

--
-- Создание таблицы "Заправщик"
--

CREATE TABLE autobases.refueller (
    refueller_id integer NOT NULL,
    full_name character varying(60) NOT NULL
);


ALTER TABLE autobases.refueller OWNER TO postgres;

--
-- Создание таблицы "Раздаточная ведомость"
--

CREATE TABLE autobases.payroll (
    payroll_id integer NOT NULL,
	road_list_id integer NOT NULL,
	date_payroll date NOT NULL,
	payroll_number integer NOT NULL,
	amount_gsm_liter integer NOT NULL,
	amount_gsm_kg integer NOT NULL,
	gsm_id integer NOT NULL
);


ALTER TABLE autobases.payroll OWNER TO postgres;

--
-- Создание таблицы "Водитель Путевой лист"
--

CREATE TABLE autobases.driver_road (
    driver_id integer NOT NULL,
    road_list_id integer NOT NULL
);


ALTER TABLE autobases.driver_road OWNER TO postgres;



--
-- Добавление данных в таблицу "Автобаза"
--

INSERT INTO autobases.autobase VALUES (1, 'Northern autobase', 'Grazhdanskiy pr 100');
INSERT INTO autobases.autobase VALUES (2, 'Southern autobase', 'Lensoveta 10');
INSERT INTO autobases.autobase VALUES (3, 'Western autobase', 'Parashutnaya 7');
INSERT INTO autobases.autobase VALUES (4, 'Eastern autobase', 'Bolshevikov 56');
INSERT INTO autobases.autobase VALUES (5, 'Great autobase', 'Kirochnaya 16');


--
-- Добавление данных в таблицу "Гараж"
--

INSERT INTO autobases.garage VALUES (1, 5, 'Vosstania 8');
INSERT INTO autobases.garage VALUES (2, 2, 'Shkolnaya 12');
INSERT INTO autobases.garage VALUES (3, 1, 'Klinskiy 21');
INSERT INTO autobases.garage VALUES (4, 4, 'Lomonosova 3');
INSERT INTO autobases.garage VALUES (5, 3, 'Malaya monetnaya 9');


--
-- Добавление данных в таблицу "Автомобиль"
--

INSERT INTO autobases.car VALUES (1123, 5, 4, 'Nissan');
INSERT INTO autobases.car VALUES (2121, 1, 3, 'Skoda');
INSERT INTO autobases.car VALUES (33323, 3, 1, 'Zhiguli');
INSERT INTO autobases.car VALUES (4111, 2, 5, 'Lada');
INSERT INTO autobases.car VALUES (523, 4, 2, 'Nissan 6');


--
-- Добавление данных в таблицу "ГСМ"
--

INSERT INTO autobases.gsm VALUES (1, 'gasolyne', '1', '2.2');
INSERT INTO autobases.gsm VALUES (2, 'diesel fuel', '2', '1.1');
INSERT INTO autobases.gsm VALUES (3, 'autol', '0.5', '0.7');
INSERT INTO autobases.gsm VALUES (4, 'solidol', '1.3', '1.5');
INSERT INTO autobases.gsm VALUES (5, 'nigrol', '2.1', '2.1');


--
-- Добавление данных в таблицу "Путевой лист"
--

INSERT INTO autobases.road_list VALUES (1, '10', '9', '1.66', '0.8', 'Vasiliy Boyko', 'Vlada Andreeva', '7', 33323, 3, 1);
INSERT INTO autobases.road_list VALUES (2, '21', '13', '1.09', '0.9', 'Vlad Aksenov', 'Nikita Vasiliev', '4', 523, 4, 2);
INSERT INTO autobases.road_list VALUES (3, '3', '4', '3.66', '2.8', 'Natasha Vaskova', 'Vlada Andreeva', '10', 1123, 5, 4);
INSERT INTO autobases.road_list VALUES (4, '8', '5', '10.61', '9', 'Olga Mikhailova', 'Andrey Mikhailov', '12', 4111, 2, 5);
INSERT INTO autobases.road_list VALUES (5, '9', '6', '0.5', '0.2', 'Vasiliy Boyko', 'Nikita Vasiliev', '3', 2121, 1, 3);


--
-- Добавление данных в таблицу "Водитель"
--

INSERT INTO autobases.driver VALUES (1, 'Vaskob Nikolay Alekseevich');
INSERT INTO autobases.driver VALUES (2, 'Aksenova Olga Nikolaevna');
INSERT INTO autobases.driver VALUES (3, 'Kuprin Anton Andreevich');
INSERT INTO autobases.driver VALUES (4, 'Loginov Valeriy Vasilievoch');
INSERT INTO autobases.driver VALUES (5, 'Laplovskiy Fedor Mikhaylovich');


--
-- Добавление данных в таблицу "Заправщик"
--

INSERT INTO autobases.refueller VALUES (1, 'Popov Anton Eduardovich');
INSERT INTO autobases.refueller VALUES (2, 'Ichina Mariya Andreevna');
INSERT INTO autobases.refueller VALUES (3, 'Novaya Anna Antonovna');
INSERT INTO autobases.refueller VALUES (4, 'Kholodov Andrey Mikhalich');
INSERT INTO autobases.refueller VALUES (5, 'Nechaev Evgeniy Antonovich');


--
-- Добавление данных в таблицу "Раздаточная ведомость"
--

INSERT INTO autobases.payroll VALUES (1, 3, '2020-03-05', 777, 2, 2, 4);
INSERT INTO autobases.payroll VALUES (2, 1, '2020-03-14', 100, 19, 20, 3);
INSERT INTO autobases.payroll VALUES (3, 4, '2020-03-21', 211, 13, 12, 5);
INSERT INTO autobases.payroll VALUES (4, 2, '2020-04-01', 7, 5, 5, 1);
INSERT INTO autobases.payroll VALUES (5, 5, '2020-02-28', 137, 6, 6, 2);


--
-- Добавление данных в таблицу "Водитель Путевой лист"
--

INSERT INTO autobases.driver_road VALUES (1, 4);
INSERT INTO autobases.driver_road VALUES (3, 2);
INSERT INTO autobases.driver_road VALUES (5, 3);
INSERT INTO autobases.driver_road VALUES (4, 1);
INSERT INTO autobases.driver_road VALUES (2, 5);



--
-- Установка первичных ключей и ограничений целостности
--

ALTER TABLE ONLY autobases.autobase
    ADD CONSTRAINT autobase_id UNIQUE (autobase_id);

ALTER TABLE ONLY autobases.autobase
    ADD CONSTRAINT autobase_pkey PRIMARY KEY (autobase_id);



ALTER TABLE ONLY autobases.garage
    ADD CONSTRAINT garage_id UNIQUE (garage_id);

ALTER TABLE ONLY autobases.garage
    ADD CONSTRAINT garage_pkey PRIMARY KEY (garage_id, autobase_id);



ALTER TABLE ONLY autobases.car
    ADD CONSTRAINT gov_reg_number UNIQUE (gov_reg_number);

ALTER TABLE ONLY autobases.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (gov_reg_number, garage_id, autobase_id);



ALTER TABLE ONLY autobases.gsm
    ADD CONSTRAINT gsm_id UNIQUE (gsm_id);

ALTER TABLE ONLY autobases.gsm
    ADD CONSTRAINT gsm_pkey PRIMARY KEY (gsm_id);



ALTER TABLE ONLY autobases.road_list
    ADD CONSTRAINT road_list_id UNIQUE (road_list_id);

ALTER TABLE ONLY autobases.road_list
    ADD CONSTRAINT road_list_pkey PRIMARY KEY (road_list_id);



ALTER TABLE ONLY autobases.driver
    ADD CONSTRAINT driver_id UNIQUE (driver_id);

ALTER TABLE ONLY autobases.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (driver_id);



ALTER TABLE ONLY autobases.refueller
    ADD CONSTRAINT refueller_id UNIQUE (refueller_id);

ALTER TABLE ONLY autobases.refueller
    ADD CONSTRAINT refueller_pkey PRIMARY KEY (refueller_id);



ALTER TABLE ONLY autobases.payroll
    ADD CONSTRAINT payroll_id UNIQUE (payroll_id);

ALTER TABLE ONLY autobases.payroll
    ADD CONSTRAINT payroll_pkey PRIMARY KEY (payroll_id);



ALTER TABLE ONLY autobases.driver_road
    ADD CONSTRAINT driver_road_pkey PRIMARY KEY (driver_id, road_list_id);



--
-- Установка внешних ключей
--

ALTER TABLE ONLY autobases.road_list
    ADD CONSTRAINT garage_id FOREIGN KEY (garage_id) REFERENCES autobases.garage(garage_id);



ALTER TABLE ONLY autobases.road_list
    ADD CONSTRAINT gov_reg_number FOREIGN KEY (gov_reg_number) REFERENCES autobases.car(gov_reg_number);



ALTER TABLE ONLY autobases.road_list
    ADD CONSTRAINT autobase_id FOREIGN KEY (autobase_id) REFERENCES autobases.autobase(autobase_id);



ALTER TABLE ONLY autobases.payroll
    ADD CONSTRAINT road_list_id FOREIGN KEY (road_list_id) REFERENCES autobases.road_list(road_list_id);



ALTER TABLE ONLY autobases.payroll
    ADD CONSTRAINT gsm_id FOREIGN KEY (gsm_id) REFERENCES autobases.gsm(gsm_id);
