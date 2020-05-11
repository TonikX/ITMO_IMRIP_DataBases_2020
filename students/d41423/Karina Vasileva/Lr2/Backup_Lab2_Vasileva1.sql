--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-11 09:43:20

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
-- Name: Hotel Scheme; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Hotel Scheme";


ALTER SCHEMA "Hotel Scheme" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 16404)
-- Name: Floors; Type: TABLE; Schema: Hotel Scheme; Owner: postgres
--

CREATE TABLE "Hotel Scheme"."Floors" (
    "Floor_num" numeric NOT NULL
);


ALTER TABLE "Hotel Scheme"."Floors" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16401)
-- Name: Rooms; Type: TABLE; Schema: Hotel Scheme; Owner: postgres
--

CREATE TABLE "Hotel Scheme"."Rooms" (
    id_room numeric NOT NULL,
    "Floor_num" numeric,
    "Price_per_night" numeric,
    "Phone" numeric,
    "Occupied" boolean
)
INHERITS ("Hotel Scheme"."Floors");


ALTER TABLE "Hotel Scheme"."Rooms" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16504)
-- Name: Bookings; Type: TABLE; Schema: Hotel Scheme; Owner: postgres
--

CREATE TABLE "Hotel Scheme"."Bookings" (
    id_client numeric NOT NULL,
    arrival_date date NOT NULL,
    departute_date date,
    "number of nights" numeric,
    id_worker numeric
)
INHERITS ("Hotel Scheme"."Rooms");


ALTER TABLE "Hotel Scheme"."Bookings" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16395)
-- Name: Clients; Type: TABLE; Schema: Hotel Scheme; Owner: postgres
--

CREATE TABLE "Hotel Scheme"."Clients" (
    "Full Name Client" character(50) NOT NULL,
    id_client numeric NOT NULL,
    "Passport" numeric NOT NULL,
    "City" character(50)
);


ALTER TABLE "Hotel Scheme"."Clients" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16564)
-- Name: Time Table; Type: TABLE; Schema: Hotel Scheme; Owner: postgres
--

CREATE TABLE "Hotel Scheme"."Time Table" (
    id_worker numeric NOT NULL,
    "Weekday" character(2) NOT NULL
)
INHERITS ("Hotel Scheme"."Floors");


ALTER TABLE "Hotel Scheme"."Time Table" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16410)
-- Name: Workers; Type: TABLE; Schema: Hotel Scheme; Owner: postgres
--

CREATE TABLE "Hotel Scheme"."Workers" (
    id_worker numeric NOT NULL,
    "Full_Name_Worker" character(100) NOT NULL,
    "Fired" boolean NOT NULL
);
ALTER TABLE ONLY "Hotel Scheme"."Workers" ALTER COLUMN "Full_Name_Worker" SET STORAGE PLAIN;


ALTER TABLE "Hotel Scheme"."Workers" OWNER TO postgres;

--
-- TOC entry 2866 (class 0 OID 16504)
-- Dependencies: 207
-- Data for Name: Bookings; Type: TABLE DATA; Schema: Hotel Scheme; Owner: postgres
--

COPY "Hotel Scheme"."Bookings" (id_room, "Floor_num", "Price_per_night", "Phone", "Occupied", id_client, arrival_date, departute_date, "number of nights", id_worker) FROM stdin;
100	1	1000	1100	f	1	2019-10-19	2019-10-29	10	5
101	1	1000	1101	f	2	2019-10-19	2019-10-29	10	5
102	1	1500	1101	f	2	2020-10-09	2020-10-10	1	5
103	1	2500	3100	f	4	2020-03-15	2020-03-20	5	5
104	1	5000	3241	f	5	2020-05-11	2020-05-20	5	5
\.


--
-- TOC entry 2862 (class 0 OID 16395)
-- Dependencies: 203
-- Data for Name: Clients; Type: TABLE DATA; Schema: Hotel Scheme; Owner: postgres
--

COPY "Hotel Scheme"."Clients" ("Full Name Client", id_client, "Passport", "City") FROM stdin;
Иван Иванович Иванов                              	1	1325245	Москва                                            
Коврова Прасковья Юльевна                         	2	3466244	Урюпинск                                          
Пабло Мария Иглесиас                              	3	5607243	Бильбао                                           
Патрисия де Лилль                                 	4	563443	Кейптаун                                          
Ремигиюс Шимашюс                                  	5	9889241	Вильнюс                                           
\.


--
-- TOC entry 2864 (class 0 OID 16404)
-- Dependencies: 205
-- Data for Name: Floors; Type: TABLE DATA; Schema: Hotel Scheme; Owner: postgres
--

COPY "Hotel Scheme"."Floors" ("Floor_num") FROM stdin;
1
2
3
\.


--
-- TOC entry 2863 (class 0 OID 16401)
-- Dependencies: 204
-- Data for Name: Rooms; Type: TABLE DATA; Schema: Hotel Scheme; Owner: postgres
--

COPY "Hotel Scheme"."Rooms" (id_room, "Floor_num", "Price_per_night", "Phone", "Occupied") FROM stdin;
100	1	1000	1100	f
101	1	1000	1101	f
102	1	1500	2100	f
103	1	2500	3100	f
104	1	5000	3241	t
\.


--
-- TOC entry 2867 (class 0 OID 16564)
-- Dependencies: 208
-- Data for Name: Time Table; Type: TABLE DATA; Schema: Hotel Scheme; Owner: postgres
--

COPY "Hotel Scheme"."Time Table" ("Floor_num", id_worker, "Weekday") FROM stdin;
1	1	Пн
1	1	Вт
1	2	Ср
1	2	Чт
1	3	Пт
2	2	Пн
2	3	Вт
2	3	Ср
2	2	Чт
2	4	Пт
3	4	Пн
3	4	Вт
3	2	Ср
3	3	Чт
3	4	Пт
\.


--
-- TOC entry 2865 (class 0 OID 16410)
-- Dependencies: 206
-- Data for Name: Workers; Type: TABLE DATA; Schema: Hotel Scheme; Owner: postgres
--

COPY "Hotel Scheme"."Workers" (id_worker, "Full_Name_Worker", "Fired") FROM stdin;
1	Ушакова Агля Петровна                                                                               	f
2	Пирогов Роберт Иоаннович                                                                            	f
3	Эпифанцева Марианна Серафимовна                                                                     	f
4	Троекруров Евгений Порфирьевич                                                                      	f
5	Гертруда Стайн                                                                                      	f
\.


--
-- TOC entry 2729 (class 2606 OID 16537)
-- Name: Bookings Bookings_pkey; Type: CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Bookings"
    ADD CONSTRAINT "Bookings_pkey" PRIMARY KEY (arrival_date, id_client);


--
-- TOC entry 2713 (class 2606 OID 16539)
-- Name: Clients Client_id_client_key; Type: CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Clients"
    ADD CONSTRAINT "Client_id_client_key" UNIQUE (id_client);


--
-- TOC entry 2721 (class 2606 OID 16524)
-- Name: Floors Floor_pkey; Type: CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Floors"
    ADD CONSTRAINT "Floor_pkey" PRIMARY KEY ("Floor_num");


--
-- TOC entry 2717 (class 2606 OID 16522)
-- Name: Rooms Room_pkey; Type: CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Rooms"
    ADD CONSTRAINT "Room_pkey" PRIMARY KEY (id_room);


--
-- TOC entry 2731 (class 2606 OID 16571)
-- Name: Time Table Time Table_pkey; Type: CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Time Table"
    ADD CONSTRAINT "Time Table_pkey" PRIMARY KEY ("Floor_num", "Weekday");


--
-- TOC entry 2725 (class 2606 OID 16550)
-- Name: Workers Workers_id_worker_key; Type: CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Workers"
    ADD CONSTRAINT "Workers_id_worker_key" UNIQUE (id_worker);


--
-- TOC entry 2723 (class 2606 OID 16588)
-- Name: Floors floor; Type: CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Floors"
    ADD CONSTRAINT floor UNIQUE ("Floor_num");


--
-- TOC entry 2719 (class 2606 OID 16611)
-- Name: Rooms room_parameters; Type: CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Rooms"
    ADD CONSTRAINT room_parameters UNIQUE (id_room, "Phone");


--
-- TOC entry 2715 (class 2606 OID 16419)
-- Name: Clients Клиент_pkey; Type: CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Clients"
    ADD CONSTRAINT "Клиент_pkey" PRIMARY KEY (id_client);


--
-- TOC entry 2727 (class 2606 OID 16430)
-- Name: Workers Сотрудник _pkey; Type: CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Workers"
    ADD CONSTRAINT "Сотрудник _pkey" PRIMARY KEY (id_worker);


--
-- TOC entry 2732 (class 2606 OID 16589)
-- Name: Rooms Room_Floor_#_fkey; Type: FK CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Rooms"
    ADD CONSTRAINT "Room_Floor_#_fkey" FOREIGN KEY ("Floor_num") REFERENCES "Hotel Scheme"."Floors"("Floor_num") NOT VALID;


--
-- TOC entry 2733 (class 2606 OID 16618)
-- Name: Bookings admin; Type: FK CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Bookings"
    ADD CONSTRAINT admin FOREIGN KEY (id_worker) REFERENCES "Hotel Scheme"."Workers"(id_worker) NOT VALID;


--
-- TOC entry 2734 (class 2606 OID 16582)
-- Name: Bookings client; Type: FK CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Bookings"
    ADD CONSTRAINT client FOREIGN KEY (id_client) REFERENCES "Hotel Scheme"."Clients"(id_client) NOT VALID;


--
-- TOC entry 2735 (class 2606 OID 16577)
-- Name: Time Table worker; Type: FK CONSTRAINT; Schema: Hotel Scheme; Owner: postgres
--

ALTER TABLE ONLY "Hotel Scheme"."Time Table"
    ADD CONSTRAINT worker FOREIGN KEY (id_worker) REFERENCES "Hotel Scheme"."Workers"(id_worker) NOT VALID;


-- Completed on 2020-05-11 09:43:21

--
-- PostgreSQL database dump complete
--

