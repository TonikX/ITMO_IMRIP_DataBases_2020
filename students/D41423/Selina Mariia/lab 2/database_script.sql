  
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: AdvertAgencySchema; Type: SCHEMA; Schema: -; Owner: vladiknaska
--


CREATE DATABASE "WORK_ENVIRONMENT" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE "WORK_ENVIRONMENT" OWNER TO postgres;

\connect "WORK_ENVIRONMENT"


CREATE SCHEMA work_market;


ALTER SCHEMA work_market OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Создание таблицы "Агенство"
--

CREATE TABLE work_market.agency (
    agency_id integer NOT NULL,
    name character varying(30) NOT NULL,
    address character varying(60) NOT NULL
	vacancy_id integer NOT NULL,
	employers_id integer NOT NULL,
	profession_id integer NOT NUll,
	course_id integer NOT NULL
);


ALTER TABLE work_market.agency OWNER TO postgres;

--
-- Создание таблицы "Резюме"
--

CREATE TABLE work_market.resume (
    resume_id integer NOT NULL,
    name_jobseeker character varying(60) NOT NULL
	jobseeker_id integer NOT NULL,
	vacancy_id integer NOT NULL,
	employers_id integer NOT NULL,
	profession_id integer NOT NULL
);


ALTER TABLE work_market.resume OWNER TO postgres;

--
-- Создание таблицы "Школа"
--

CREATE TABLE work_market.school (	
    school_id integer NOT NULL,
    jobseeker_id integer NOT NULL,
    course_id integer NOT NULL,
    address character varying(30) NOT NULL
);


ALTER TABLE work_market.school OWNER TO postgres;

--
-- Создание таблицы "Курсы"
--

CREATE TABLE work_market.course (
    course_id integer NOT NULL,
    group_number integer NOT NULL,
    list_of_students character varying(30) NOT NULL,
    lasting_of_course character varying(10) NOT NULL
);


ALTER TABLE work_market.course OWNER TO postgres;

--
-- Создание таблицы "Соискатели"
--

CREATE TABLE work_market.jobseeker (
    jobseeker_id integer NOT NULL,
    fullname character varying(30) NOT NULL,
	contacts character varying(30) NOT NULL,
	age integer NOT NULL,
	last_salary integer NOT NULL,
	created_at character varying(30) NOT NULL,
	end_of_allowance integer NOT NULL,
	begin_of_allowance integer NOT NULL
);


ALTER TABLE work_market.jobseeker OWNER TO postgres;

--
-- Создание таблицы "Наниматели"
--

CREATE TABLE work_market.employers (
    employers_id integer NOT NULL,
    name character varying(60) NOT NULL,
	contact_name character varying(60) NOT NULL,
	address character varying(60) NOT NULL,
	email character varying(30) NOT NULL,
	phone_number integer NOT NULL
);


ALTER TABLE work_market.employers OWNER TO postgres;

--
-- Создание таблицы "Профессии"
--

CREATE TABLE work_market.profession (
    profession_id integer NOT NULL,
	course_id integer NOT NULL,
    list_of_courses character varying(60) NOT NULL
);


ALTER TABLE work_market.profession OWNER TO postgres;

--
-- Создание таблицы "Вакансии"
--

CREATE TABLE work_market.vacancy (
    vacancy_id integer NOT NULL,
	employers_id integer NOT NULL,
	date_of_publication date NOT NULL,
	profession_id integer NOT NULL,
	course_id integer NOT NULL,
	salary character varying(60) NOT NULL,
	experience integer NOT NULL,
	education character varying(60) NOT NULL,
	qualification character varying(60) NOT NULL,
	extra_info character varying(60) NOT NULL,
	kind_of_vacancy character varying(60) NOT NULL
);


ALTER TABLE work_market.vacancy OWNER TO postgres;


--
-- Добавление данных в таблицу "Агенство"
--

INSERT INTO work_market.agency VALUES (1, 'Lights agency', 'Grazhdanskiy pr 100', 2, 1, 3, 5);
INSERT INTO work_market.agency VALUES (2, 'Do the best', 'Lensoveta 10', 3, 2, 4, 4);
INSERT INTO work_market.agency VALUES (3, 'Faster Better', 'Parashutnaya 7', 5, 3, 1, 3);
INSERT INTO work_market.agency VALUES (4, 'The first', 'Bolshevikov 56', 1, 4, 5, 2);
INSERT INTO work_market.agency VALUES (5, 'Great applause', 'Kirochnaya 16', 4, 5, 2, 1);


--
-- Добавление данных в таблицу "Резюме"
--

INSERT INTO work_market.resume VALUES (1, 'Vasiliy Boyko', 5, 2, 1, 4);
INSERT INTO work_market.resume VALUES (2, 'Vlad Aksenov', 2, 3, 2, 1);
INSERT INTO work_market.resume VALUES (3, 'Natasha Vaskova', 4, 1, 3, 5);
INSERT INTO work_market.resume VALUES (4, 'Olga Mikhailova', 5, 4, 4, 3);
INSERT INTO work_market.resume VALUES (5, 'Vasiliy Boyko', 3, 1, 5, 2);


--
-- Добавление данных в таблицу "Школа"
--

INSERT INTO work_market.school VALUES (1, 5, 4, 'Vosstania 8');
INSERT INTO work_market.school VALUES (2, 1, 3, 'Shkolnaya 12');
INSERT INTO work_market.school VALUES (3, 3, 1, 'Klinskiy 21');
INSERT INTO work_market.school VALUES (4, 2, 5, 'Lomonosova 3');
INSERT INTO work_market.school VALUES (5, 4, 2, 'Malaya monetnaya 9');


--
-- Добавление данных в таблицу "Курсы"
--

INSERT INTO work_market.course VALUES (1, 1, 'List 1', '1 semester');
INSERT INTO work_market.course VALUES (2, 2, 'List 2', '2 semesters');
INSERT INTO work_market.course VALUES (3, 3, 'List 3', '1 semester');
INSERT INTO work_market.course VALUES (4, 4, 'List 4', '1 semester');
INSERT INTO work_market.course VALUES (5, 5, 'List 5', '3 semesters');


--
-- Добавление данных в таблицу "Соискатели"
--

INSERT INTO work_market.jobseeker VALUES (1, 'Vaskob Nikolay Alekseevich', '9318789348', 22, 30000, 'Jobs.com', 1, 6);
INSERT INTO work_market.jobseeker VALUES (2, 'Aksenova Olga Nikolaevna', '9318789823', 34, 70000, 'Jobs.com', 2, 7);
INSERT INTO work_market.jobseeker VALUES (3, 'Kuprin Anton Andreevich', '9318789132', 18, 0, 'Jobs.com', '4', 3, 10);
INSERT INTO work_market.jobseeker VALUES (4, 'Loginov Valeriy Vasilievoch', '9318789345', 40, 50000, 'hh.ru', 8, 11);
INSERT INTO work_market.jobseeker VALUES (5, 'Laplovskiy Fedor Mikhaylovich', '9318789234', 24, 40000, 'hh.ru', 1, 12);


--
-- Добавление данных в таблицу "Наниматели"
--

INSERT INTO work_market.employers VALUES (1, 'Vlada Andreeva', 'Vlada', 'Malaya monetnaya 20', 'vlada@mail.ru', 9875675656);
INSERT INTO work_market.employers VALUES (2, 'Nikita Vasiliev', 'Nikita', 'Shkolnaya 11', 'nikita@mail.ru', 9763453434);
INSERT INTO work_market.employers VALUES (3, 'Natasha Vaskova', 'Natasha', 'Lomonosova 9', 'natasha@gmail.com', 9998887766);
INSERT INTO work_market.employers VALUES (4, 'Andrey Mikhailov', 'Andrey', 'Klinskiy 13', 'andrey@mail.ru', 9568763434);
INSERT INTO work_market.employers VALUES (5, 'Olga Mikhailova', 'Olga', 'Shkolnaya 50', 'olga@gmail.com', 9908785454);


--
-- Добавление данных в таблицу "Профессии"
--

INSERT INTO work_market.profession VALUES (1, 3, 'Course 1 2 3');
INSERT INTO work_market.profession VALUES (2, 2, 'Lots of courses');
INSERT INTO work_market.profession VALUES (3, 4, 'Long, hard courses');
INSERT INTO work_market.profession VALUES (4, 1, 'Big course');
INSERT INTO work_market.profession VALUES (5, 5, 'The hardest course');


--
-- Добавление данных в таблицу "Вакансии"
--

INSERT INTO work_market.vacancy VALUES (1, 3, '2020-03-05', 1, 4, '30000', 1, 'School', 'For begginers', 'Documentations');
INSERT INTO work_market.vacancy VALUES (2, 1, '2020-03-14', 2, 3, '60000', 3, 'Higher', 'Best company!', 'Data engineer');
INSERT INTO work_market.vacancy VALUES (3, 4, '2020-03-21', 3, 1, '100000', 10, 'Maths masters', 'We are professionals', 'Computer science');
INSERT INTO work_market.vacancy VALUES (4, 2, '2020-04-01', 4, 5, '90000', 7, 'Masters degree', 'Come to us!', 'Computer Science');
INSERT INTO work_market.vacancy VALUES (5, 5, '2020-02-28', 5, 2, '70000', 8, 'Law school', 'Easiest solutions', 'Consultance');



--
-- Установка первичных ключей и ограничений целостности
--

ALTER TABLE ONLY work_market.agency
    ADD CONSTRAINT agency_id UNIQUE (agency_id);

ALTER TABLE ONLY work_market.agency
    ADD CONSTRAINT agency_pkey PRIMARY KEY (agency_id);



ALTER TABLE ONLY work_market.resume
    ADD CONSTRAINT resume_id UNIQUE (resume_id);

ALTER TABLE ONLY work_market.resume
    ADD CONSTRAINT resume_pkey PRIMARY KEY (resume_id);



ALTER TABLE ONLY work_market.school
    ADD CONSTRAINT school_id UNIQUE (school_id);

ALTER TABLE ONLY work_market.school
    ADD CONSTRAINT school_id PRIMARY KEY (school_id);



ALTER TABLE ONLY work_market.course
    ADD CONSTRAINT course_id UNIQUE (course_id);

ALTER TABLE ONLY work_market.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);



ALTER TABLE ONLY work_market.jobseeker
    ADD CONSTRAINT jobseeker_id UNIQUE (jobseeker_id);

ALTER TABLE ONLY work_market.jobseeker
    ADD CONSTRAINT jobseeker_pkey PRIMARY KEY (jobseeker_id);



ALTER TABLE ONLY work_market.employers
    ADD CONSTRAINT employers_id UNIQUE (employers_id);

ALTER TABLE ONLY work_market.employers
    ADD CONSTRAINT employers_pkey PRIMARY KEY (employers_id);



ALTER TABLE ONLY work_market.profession
    ADD CONSTRAINT profession_id UNIQUE (profession_id);

ALTER TABLE ONLY work_market.profession
    ADD CONSTRAINT profession_pkey PRIMARY KEY (profession_idm course_id);



ALTER TABLE ONLY work_market.vacancy
    ADD CONSTRAINT vacancy_id UNIQUE (vacancy_id);

ALTER TABLE ONLY work_market.vacancy
    ADD CONSTRAINT vacancy_pkey PRIMARY KEY (vacancy_id, employers_id, profession_id, course_id);


--
-- Установка внешних ключей
--

ALTER TABLE ONLY work_market.agency
    ADD CONSTRAINT vacancy_id FOREIGN KEY (vacancy_id) REFERENCES work_market.vacancy(vacancy_id);
	

ALTER TABLE ONLY work_market.resume
    ADD CONSTRAINT vacancy_id FOREIGN KEY (vacancy_id) REFERENCES work_market.vacancy(vacancy_id);
	
	
ALTER TABLE ONLY work_market.vacancy
    ADD CONSTRAINT employers_id FOREIGN KEY (employers_id) REFERENCES work_market.employers(employers_id);
	
	
ALTER TABLE ONLY work_market.vacancy
    ADD CONSTRAINT profession_id FOREIGN KEY (profession_id) REFERENCES work_market.profession(profession_id);
	

ALTER TABLE ONLY work_market.resume
    ADD CONSTRAINT jobseeker_id FOREIGN KEY (jobseeker_id) REFERENCES work_market.jobseeker(jobseeker_id);
	
	
ALTER TABLE ONLY work_market.school
    ADD CONSTRAINT jobseeker_id FOREIGN KEY (jobseeker_id) REFERENCES work_market.jobseeker(jobseeker_id);


ALTER TABLE ONLY work_market.school
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES work_market.course(course_id);
	
	
ALTER TABLE ONLY work_market.profession
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES work_market.course(course_id);

