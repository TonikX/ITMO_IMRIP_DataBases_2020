--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-11 19:22:02

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
-- TOC entry 2885 (class 1262 OID 16393)
-- Name: bus_park; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bus_park WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE bus_park OWNER TO postgres;

\connect bus_park

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
-- TOC entry 6 (class 2615 OID 16394)
-- Name: bus_bd_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bus_bd_schema;


ALTER SCHEMA bus_bd_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16472)
-- Name: absences; Type: TABLE; Schema: bus_bd_schema; Owner: postgres
--

CREATE TABLE bus_bd_schema.absences (
    absence_date date NOT NULL,
    driver_id integer NOT NULL,
    absence_cause character(20) NOT NULL
);


ALTER TABLE bus_bd_schema.absences OWNER TO postgres;

--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE absences; Type: COMMENT; Schema: bus_bd_schema; Owner: postgres
--

COMMENT ON TABLE bus_bd_schema.absences IS 'Таблица с информацией о невыходах водителей';


--
-- TOC entry 205 (class 1259 OID 16438)
-- Name: bus_types; Type: TABLE; Schema: bus_bd_schema; Owner: postgres
--

CREATE TABLE bus_bd_schema.bus_types (
    bus_type character(10) NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE bus_bd_schema.bus_types OWNER TO postgres;

--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE bus_types; Type: COMMENT; Schema: bus_bd_schema; Owner: postgres
--

COMMENT ON TABLE bus_bd_schema.bus_types IS 'Таблица с информацией о типах автобусов и их вместимости';


--
-- TOC entry 207 (class 1259 OID 16450)
-- Name: buses; Type: TABLE; Schema: bus_bd_schema; Owner: postgres
--

CREATE TABLE bus_bd_schema.buses (
    bus_number character(8) NOT NULL,
    route_number integer NOT NULL,
    bus_type character(10) NOT NULL
);


ALTER TABLE bus_bd_schema.buses OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE buses; Type: COMMENT; Schema: bus_bd_schema; Owner: postgres
--

COMMENT ON TABLE bus_bd_schema.buses IS 'Таблица с информацией об автобусах';


--
-- TOC entry 203 (class 1259 OID 16395)
-- Name: drivers; Type: TABLE; Schema: bus_bd_schema; Owner: postgres
--

CREATE TABLE bus_bd_schema.drivers (
    driver_age integer NOT NULL,
    driver_id integer NOT NULL,
    driver_name character varying(60) NOT NULL,
    driver_sex character(1) NOT NULL,
    passport_number bigint NOT NULL,
    shift_schedule character(10) NOT NULL,
    rank character(10) NOT NULL,
    experience integer NOT NULL,
    route_number integer,
    bus_number character(8)
);


ALTER TABLE bus_bd_schema.drivers OWNER TO postgres;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE drivers; Type: COMMENT; Schema: bus_bd_schema; Owner: postgres
--

COMMENT ON TABLE bus_bd_schema.drivers IS 'Таблица с информацией о водителях';


--
-- TOC entry 208 (class 1259 OID 16465)
-- Name: malfunctions; Type: TABLE; Schema: bus_bd_schema; Owner: postgres
--

CREATE TABLE bus_bd_schema.malfunctions (
    malfunction_date date NOT NULL,
    bus_number character(8) NOT NULL,
    malfunction_cause character(20) NOT NULL
);


ALTER TABLE bus_bd_schema.malfunctions OWNER TO postgres;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE malfunctions; Type: COMMENT; Schema: bus_bd_schema; Owner: postgres
--

COMMENT ON TABLE bus_bd_schema.malfunctions IS 'Таблица с информацией о невыходах автобусов';


--
-- TOC entry 206 (class 1259 OID 16445)
-- Name: routes; Type: TABLE; Schema: bus_bd_schema; Owner: postgres
--

CREATE TABLE bus_bd_schema.routes (
    route_number integer NOT NULL,
    start_point character(20) NOT NULL,
    end_point character(20) NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    "interval" integer NOT NULL,
    length integer NOT NULL
);


ALTER TABLE bus_bd_schema.routes OWNER TO postgres;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE routes; Type: COMMENT; Schema: bus_bd_schema; Owner: postgres
--

COMMENT ON TABLE bus_bd_schema.routes IS 'Таблица с информацией о маршрутах';


--
-- TOC entry 210 (class 1259 OID 16487)
-- Name: shift_journal; Type: TABLE; Schema: bus_bd_schema; Owner: postgres
--

CREATE TABLE bus_bd_schema.shift_journal (
    date date NOT NULL,
    driver_id integer NOT NULL,
    bus_number character(8) NOT NULL,
    route_number integer NOT NULL
);


ALTER TABLE bus_bd_schema.shift_journal OWNER TO postgres;

--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE shift_journal; Type: COMMENT; Schema: bus_bd_schema; Owner: postgres
--

COMMENT ON TABLE bus_bd_schema.shift_journal IS 'Таблица с информацией о выходах на работу';


--
-- TOC entry 204 (class 1259 OID 16424)
-- Name: wages; Type: TABLE; Schema: bus_bd_schema; Owner: postgres
--

CREATE TABLE bus_bd_schema.wages (
    rank character(10) NOT NULL,
    experience integer NOT NULL,
    wage integer NOT NULL
);


ALTER TABLE bus_bd_schema.wages OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE wages; Type: COMMENT; Schema: bus_bd_schema; Owner: postgres
--

COMMENT ON TABLE bus_bd_schema.wages IS 'Таблица расчёта заработной платы в зависимости от стажа и класса';


--
-- TOC entry 2878 (class 0 OID 16472)
-- Dependencies: 209
-- Data for Name: absences; Type: TABLE DATA; Schema: bus_bd_schema; Owner: postgres
--

INSERT INTO bus_bd_schema.absences (absence_date, driver_id, absence_cause) VALUES ('2019-09-25', 1, 'болезнь             ');
INSERT INTO bus_bd_schema.absences (absence_date, driver_id, absence_cause) VALUES ('2019-10-08', 2, 'прогул              ');
INSERT INTO bus_bd_schema.absences (absence_date, driver_id, absence_cause) VALUES ('2019-10-22', 4, 'болезнь             ');
INSERT INTO bus_bd_schema.absences (absence_date, driver_id, absence_cause) VALUES ('2019-11-04', 1, 'болезнь             ');
INSERT INTO bus_bd_schema.absences (absence_date, driver_id, absence_cause) VALUES ('2019-11-06', 3, 'прогул              ');


--
-- TOC entry 2874 (class 0 OID 16438)
-- Dependencies: 205
-- Data for Name: bus_types; Type: TABLE DATA; Schema: bus_bd_schema; Owner: postgres
--

INSERT INTO bus_bd_schema.bus_types (bus_type, capacity) VALUES ('singledeck', 40);
INSERT INTO bus_bd_schema.bus_types (bus_type, capacity) VALUES ('doubledeck', 80);
INSERT INTO bus_bd_schema.bus_types (bus_type, capacity) VALUES ('trolleybus', 40);
INSERT INTO bus_bd_schema.bus_types (bus_type, capacity) VALUES ('middlebend', 60);
INSERT INTO bus_bd_schema.bus_types (bus_type, capacity) VALUES ('minibus   ', 20);


--
-- TOC entry 2876 (class 0 OID 16450)
-- Dependencies: 207
-- Data for Name: buses; Type: TABLE DATA; Schema: bus_bd_schema; Owner: postgres
--

INSERT INTO bus_bd_schema.buses (bus_number, route_number, bus_type) VALUES ('а213бг78', 7, 'doubledeck');
INSERT INTO bus_bd_schema.buses (bus_number, route_number, bus_type) VALUES ('б114де78', 31, 'singledeck');
INSERT INTO bus_bd_schema.buses (bus_number, route_number, bus_type) VALUES ('у664он78', 124, 'minibus   ');
INSERT INTO bus_bd_schema.buses (bus_number, route_number, bus_type) VALUES ('о741ии78', 12, 'middlebend');
INSERT INTO bus_bd_schema.buses (bus_number, route_number, bus_type) VALUES ('а339ол78', 15, 'trolleybus');


--
-- TOC entry 2872 (class 0 OID 16395)
-- Dependencies: 203
-- Data for Name: drivers; Type: TABLE DATA; Schema: bus_bd_schema; Owner: postgres
--

INSERT INTO bus_bd_schema.drivers (driver_age, driver_id, driver_name, driver_sex, passport_number, shift_schedule, rank, experience, route_number, bus_number) VALUES (38, 1, 'Сергеев Иван Владимирович', 'm', 5006123456, '5/2       ', 'first     ', 10, 7, 'а213бг78');
INSERT INTO bus_bd_schema.drivers (driver_age, driver_id, driver_name, driver_sex, passport_number, shift_schedule, rank, experience, route_number, bus_number) VALUES (42, 2, 'Фёдоров Роман Алексеевич', 'm', 4975124563, '5/2       ', 'second    ', 20, 124, 'у664он78');
INSERT INTO bus_bd_schema.drivers (driver_age, driver_id, driver_name, driver_sex, passport_number, shift_schedule, rank, experience, route_number, bus_number) VALUES (56, 3, 'Петров Николай Николаевич', 'm', 4612357951, '3/1       ', 'first     ', 20, 12, 'о741ии78');
INSERT INTO bus_bd_schema.drivers (driver_age, driver_id, driver_name, driver_sex, passport_number, shift_schedule, rank, experience, route_number, bus_number) VALUES (60, 4, 'Иванов Максим Петрович', 'm', 4217852761, '5/2       ', 'third     ', 20, 31, 'б114де78');
INSERT INTO bus_bd_schema.drivers (driver_age, driver_id, driver_name, driver_sex, passport_number, shift_schedule, rank, experience, route_number, bus_number) VALUES (46, 5, 'Трофимова Ольга Игоревна', 'f', 4862842605, '3/1       ', 'second    ', 10, 15, 'а339ол78');


--
-- TOC entry 2877 (class 0 OID 16465)
-- Dependencies: 208
-- Data for Name: malfunctions; Type: TABLE DATA; Schema: bus_bd_schema; Owner: postgres
--

INSERT INTO bus_bd_schema.malfunctions (malfunction_date, bus_number, malfunction_cause) VALUES ('2019-10-16', 'у664он78', 'поломка аккумулятора');
INSERT INTO bus_bd_schema.malfunctions (malfunction_date, bus_number, malfunction_cause) VALUES ('2019-10-28', 'б114де78', 'поломка аккумулятора');
INSERT INTO bus_bd_schema.malfunctions (malfunction_date, bus_number, malfunction_cause) VALUES ('2019-11-10', 'а213бг78', 'поломка генератора  ');
INSERT INTO bus_bd_schema.malfunctions (malfunction_date, bus_number, malfunction_cause) VALUES ('2019-11-29', 'а339ол78', 'поломка стартера    ');
INSERT INTO bus_bd_schema.malfunctions (malfunction_date, bus_number, malfunction_cause) VALUES ('2019-12-18', 'у664он78', 'поломка аккумулятора');


--
-- TOC entry 2875 (class 0 OID 16445)
-- Dependencies: 206
-- Data for Name: routes; Type: TABLE DATA; Schema: bus_bd_schema; Owner: postgres
--

INSERT INTO bus_bd_schema.routes (route_number, start_point, end_point, start_time, end_time, "interval", length) VALUES (7, 'square              ', 'park                ', '06:10:00', '00:00:00', 8, 20);
INSERT INTO bus_bd_schema.routes (route_number, start_point, end_point, start_time, end_time, "interval", length) VALUES (12, 'n street            ', 'square              ', '06:30:00', '00:00:00', 7, 15);
INSERT INTO bus_bd_schema.routes (route_number, start_point, end_point, start_time, end_time, "interval", length) VALUES (124, 'beach               ', 'village             ', '07:00:00', '22:57:00', 27, 57);
INSERT INTO bus_bd_schema.routes (route_number, start_point, end_point, start_time, end_time, "interval", length) VALUES (31, 'a station           ', 'c station           ', '06:30:00', '23:30:00', 10, 22);
INSERT INTO bus_bd_schema.routes (route_number, start_point, end_point, start_time, end_time, "interval", length) VALUES (15, 'm street            ', 'a station           ', '06:20:00', '23:10:00', 12, 31);


--
-- TOC entry 2879 (class 0 OID 16487)
-- Dependencies: 210
-- Data for Name: shift_journal; Type: TABLE DATA; Schema: bus_bd_schema; Owner: postgres
--

INSERT INTO bus_bd_schema.shift_journal (date, driver_id, bus_number, route_number) VALUES ('2019-09-21', 1, 'а213бг78', 7);
INSERT INTO bus_bd_schema.shift_journal (date, driver_id, bus_number, route_number) VALUES ('2019-09-21', 2, 'у664он78', 124);
INSERT INTO bus_bd_schema.shift_journal (date, driver_id, bus_number, route_number) VALUES ('2019-09-21', 3, 'о741ии78', 12);
INSERT INTO bus_bd_schema.shift_journal (date, driver_id, bus_number, route_number) VALUES ('2019-09-21', 4, 'б114де78', 31);
INSERT INTO bus_bd_schema.shift_journal (date, driver_id, bus_number, route_number) VALUES ('2019-09-21', 5, 'а339ол78', 15);


--
-- TOC entry 2873 (class 0 OID 16424)
-- Dependencies: 204
-- Data for Name: wages; Type: TABLE DATA; Schema: bus_bd_schema; Owner: postgres
--

INSERT INTO bus_bd_schema.wages (rank, experience, wage) VALUES ('first     ', 10, 40000);
INSERT INTO bus_bd_schema.wages (rank, experience, wage) VALUES ('second    ', 10, 30000);
INSERT INTO bus_bd_schema.wages (rank, experience, wage) VALUES ('third     ', 10, 20000);
INSERT INTO bus_bd_schema.wages (rank, experience, wage) VALUES ('first     ', 20, 50000);
INSERT INTO bus_bd_schema.wages (rank, experience, wage) VALUES ('second    ', 20, 40000);
INSERT INTO bus_bd_schema.wages (rank, experience, wage) VALUES ('third     ', 20, 30000);


--
-- TOC entry 2735 (class 2606 OID 16476)
-- Name: absences absences_pkey; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.absences
    ADD CONSTRAINT absences_pkey PRIMARY KEY (absence_date, driver_id);


--
-- TOC entry 2723 (class 2606 OID 16444)
-- Name: bus_types bus_types_bus_type_key; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.bus_types
    ADD CONSTRAINT bus_types_bus_type_key UNIQUE (bus_type);


--
-- TOC entry 2725 (class 2606 OID 16442)
-- Name: bus_types bus_types_pkey; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.bus_types
    ADD CONSTRAINT bus_types_pkey PRIMARY KEY (bus_type);


--
-- TOC entry 2729 (class 2606 OID 16454)
-- Name: buses buses_pkey; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.buses
    ADD CONSTRAINT buses_pkey PRIMARY KEY (bus_number);


--
-- TOC entry 2715 (class 2606 OID 16437)
-- Name: drivers drivers_driver_id_key; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.drivers
    ADD CONSTRAINT drivers_driver_id_key UNIQUE (driver_id);


--
-- TOC entry 2717 (class 2606 OID 16399)
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (driver_id);


--
-- TOC entry 2731 (class 2606 OID 16471)
-- Name: malfunctions malfunctions_malfunction_date_bus_number_key; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.malfunctions
    ADD CONSTRAINT malfunctions_malfunction_date_bus_number_key UNIQUE (malfunction_date, bus_number);


--
-- TOC entry 2733 (class 2606 OID 16469)
-- Name: malfunctions malfunctions_pkey; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.malfunctions
    ADD CONSTRAINT malfunctions_pkey PRIMARY KEY (bus_number, malfunction_date);


--
-- TOC entry 2727 (class 2606 OID 16449)
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (route_number);


--
-- TOC entry 2737 (class 2606 OID 16491)
-- Name: shift_journal shift_journal_pkey; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.shift_journal
    ADD CONSTRAINT shift_journal_pkey PRIMARY KEY (date, driver_id);


--
-- TOC entry 2719 (class 2606 OID 16428)
-- Name: wages wages_pkey; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.wages
    ADD CONSTRAINT wages_pkey PRIMARY KEY (rank, experience);


--
-- TOC entry 2721 (class 2606 OID 16430)
-- Name: wages wages_rank_experience_key; Type: CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.wages
    ADD CONSTRAINT wages_rank_experience_key UNIQUE (rank, experience);


--
-- TOC entry 2742 (class 2606 OID 16477)
-- Name: absences absences_driver_id_fkey; Type: FK CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.absences
    ADD CONSTRAINT absences_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES bus_bd_schema.drivers(driver_id);


--
-- TOC entry 2740 (class 2606 OID 16460)
-- Name: buses buses_bus_type_fkey; Type: FK CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.buses
    ADD CONSTRAINT buses_bus_type_fkey FOREIGN KEY (bus_type) REFERENCES bus_bd_schema.bus_types(bus_type);


--
-- TOC entry 2739 (class 2606 OID 16455)
-- Name: buses buses_route_number_fkey; Type: FK CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.buses
    ADD CONSTRAINT buses_route_number_fkey FOREIGN KEY (route_number) REFERENCES bus_bd_schema.routes(route_number);


--
-- TOC entry 2738 (class 2606 OID 16431)
-- Name: drivers drivers_rank_experience_fkey; Type: FK CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.drivers
    ADD CONSTRAINT drivers_rank_experience_fkey FOREIGN KEY (rank, experience) REFERENCES bus_bd_schema.wages(rank, experience);


--
-- TOC entry 2741 (class 2606 OID 16482)
-- Name: malfunctions malfunctions_bus_number_fkey; Type: FK CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.malfunctions
    ADD CONSTRAINT malfunctions_bus_number_fkey FOREIGN KEY (bus_number) REFERENCES bus_bd_schema.buses(bus_number);


--
-- TOC entry 2744 (class 2606 OID 16517)
-- Name: shift_journal shift_journal_bus_number_fkey; Type: FK CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.shift_journal
    ADD CONSTRAINT shift_journal_bus_number_fkey FOREIGN KEY (bus_number) REFERENCES bus_bd_schema.buses(bus_number);


--
-- TOC entry 2743 (class 2606 OID 16512)
-- Name: shift_journal shift_journal_driver_id_fkey; Type: FK CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.shift_journal
    ADD CONSTRAINT shift_journal_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES bus_bd_schema.drivers(driver_id);


--
-- TOC entry 2745 (class 2606 OID 16522)
-- Name: shift_journal shift_journal_route_number_fkey; Type: FK CONSTRAINT; Schema: bus_bd_schema; Owner: postgres
--

ALTER TABLE ONLY bus_bd_schema.shift_journal
    ADD CONSTRAINT shift_journal_route_number_fkey FOREIGN KEY (route_number) REFERENCES bus_bd_schema.routes(route_number);


-- Completed on 2020-05-11 19:22:02

--
-- PostgreSQL database dump complete
--

