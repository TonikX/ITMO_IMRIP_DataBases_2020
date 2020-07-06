--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 11.8

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
-- Name: sh; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sh;


ALTER SCHEMA sh OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Avto; Type: TABLE; Schema: sh; Owner: postgres
--

CREATE TABLE sh."Avto" (
    id integer NOT NULL,
    marka text NOT NULL,
    gosnomer text NOT NULL,
    avtobaza_id integer NOT NULL
);


ALTER TABLE sh."Avto" OWNER TO postgres;

--
-- Name: Avtobaza; Type: TABLE; Schema: sh; Owner: postgres
--

CREATE TABLE sh."Avtobaza" (
    id integer NOT NULL,
    avtobaza_name text,
    avtobaza_adress text
);


ALTER TABLE sh."Avtobaza" OWNER TO postgres;

--
-- Name: GSM; Type: TABLE; Schema: sh; Owner: postgres
--

CREATE TABLE sh."GSM" (
    id integer NOT NULL,
    gsm_name text NOT NULL
);


ALTER TABLE sh."GSM" OWNER TO postgres;

--
-- Name: Garazh; Type: TABLE; Schema: sh; Owner: postgres
--

CREATE TABLE sh."Garazh" (
    id integer NOT NULL,
    avtobaza_id integer NOT NULL,
    garazh_adress text NOT NULL
);


ALTER TABLE sh."Garazh" OWNER TO postgres;

--
-- Name: Ostatki; Type: TABLE; Schema: sh; Owner: postgres
--

CREATE TABLE sh."Ostatki" (
    id integer NOT NULL,
    garazh_id integer NOT NULL,
    gsm_id integer NOT NULL,
    gsm_l integer NOT NULL,
    gsm_kg integer NOT NULL
);


ALTER TABLE sh."Ostatki" OWNER TO postgres;

--
-- Name: Price; Type: TABLE; Schema: sh; Owner: postgres
--

CREATE TABLE sh."Price" (
    id integer NOT NULL,
    date_ date NOT NULL,
    gsm_id integer NOT NULL,
    price real NOT NULL
);


ALTER TABLE sh."Price" OWNER TO postgres;

--
-- Name: Putevoy_list; Type: TABLE; Schema: sh; Owner: postgres
--

CREATE TABLE sh."Putevoy_list" (
    id integer NOT NULL,
    punkt_pogruzki text NOT NULL,
    punkt_razgruzki text NOT NULL,
    obshiy_probeg integer NOT NULL,
    probeg_s_gruzom integer NOT NULL,
    gruzootpr_name text NOT NULL,
    gruzopuch_name text NOT NULL,
    vremya_v_naryade integer NOT NULL
);


ALTER TABLE sh."Putevoy_list" OWNER TO postgres;

--
-- Name: Sotrudnik_id; Type: TABLE; Schema: sh; Owner: postgres
--

CREATE TABLE sh."Sotrudnik_id" (
    id integer NOT NULL,
    fio text NOT NULL,
    dolzhnost text NOT NULL
);


ALTER TABLE sh."Sotrudnik_id" OWNER TO postgres;

--
-- Name: Vedomost; Type: TABLE; Schema: sh; Owner: postgres
--

CREATE TABLE sh."Vedomost" (
    id integer NOT NULL,
    num integer NOT NULL,
    created_at date NOT NULL,
    garazh_id integer NOT NULL,
    zapravshik_id integer NOT NULL
);


ALTER TABLE sh."Vedomost" OWNER TO postgres;

--
-- Name: Zapisi; Type: TABLE; Schema: sh; Owner: postgres
--

CREATE TABLE sh."Zapisi" (
    id integer NOT NULL,
    vedomost_id integer NOT NULL,
    putevoy_list_id integer NOT NULL,
    voditeli_id integer NOT NULL,
    avto_id integer NOT NULL,
    gsm_id integer NOT NULL,
    gsm_l integer,
    gsm_kg integer
);


ALTER TABLE sh."Zapisi" OWNER TO postgres;

--
-- Data for Name: Avto; Type: TABLE DATA; Schema: sh; Owner: postgres
--

COPY sh."Avto" (id, marka, gosnomer, avtobaza_id) FROM stdin;
1	skoda	3OPX78	3
2	tesla	E389HH	2
3	volvo	A398AB	3
4	land rover	K098OO	4
5	lada	O278OT	5
\.


--
-- Data for Name: Avtobaza; Type: TABLE DATA; Schema: sh; Owner: postgres
--

COPY sh."Avtobaza" (id, avtobaza_name, avtobaza_adress) FROM stdin;
1	Автобаза 1	СПб, ул. Типанова, 24
2	Автобаза 2	СПб, пр. Мечникова, 30
3	Автобаза 3	СПб, ул. Бухарестская, 65
4	Автобаза 4	СПб, Турку, 28
5	Автобаза 5	СПб, ул. Бассейная, 25
\.


--
-- Data for Name: GSM; Type: TABLE DATA; Schema: sh; Owner: postgres
--

COPY sh."GSM" (id, gsm_name) FROM stdin;
1	АИ-80
2	АИ-92
3	АИ-95
4	АИ-98
5	ДТ
\.


--
-- Data for Name: Garazh; Type: TABLE DATA; Schema: sh; Owner: postgres
--

COPY sh."Garazh" (id, avtobaza_id, garazh_adress) FROM stdin;
1	1	СПб, ул. Типанова, 23
2	4	СПб, наб. Обводного канала, 102
3	3	СПб, ул. Народная, 6
4	5	СПб, Октябрьская наб., 104б
5	5	СПб, Уральская ул., 4
\.


--
-- Data for Name: Ostatki; Type: TABLE DATA; Schema: sh; Owner: postgres
--

COPY sh."Ostatki" (id, garazh_id, gsm_id, gsm_l, gsm_kg) FROM stdin;
1	4	1	100	73
2	4	3	1000	750
3	2	3	1000	750
4	3	2	2000	1520
5	1	2	1500	1140
\.


--
-- Data for Name: Price; Type: TABLE DATA; Schema: sh; Owner: postgres
--

COPY sh."Price" (id, date_, gsm_id, price) FROM stdin;
1	2020-02-29	1	31.2999992
2	2020-02-29	3	45.8899994
3	2020-04-14	1	32
4	2020-04-25	4	51.9000015
5	2020-05-29	2	43.2000008
\.


--
-- Data for Name: Putevoy_list; Type: TABLE DATA; Schema: sh; Owner: postgres
--

COPY sh."Putevoy_list" (id, punkt_pogruzki, punkt_razgruzki, obshiy_probeg, probeg_s_gruzom, gruzootpr_name, gruzopuch_name, vremya_v_naryade) FROM stdin;
1	Санкт-Петербург	Всеволожск	70	35	А.Н. Май	Ф.Е.Враль	90
2	Всеволожск	Гатчина	150	74	А.П. Рель	О.К. Тябрь	120
3	Выборг	Всеволожск	315	152	Н.О. Ябрь	А.В. Густ	245
4	Пушкин	Саблино	62	30	Я.Н. Варь	Ф.Е. Враль	64
5	Гатчина	Ивангород	260	128	О.Т. Май	И.И. Юль	200
\.


--
-- Data for Name: Sotrudnik_id; Type: TABLE DATA; Schema: sh; Owner: postgres
--

COPY sh."Sotrudnik_id" (id, fio, dolzhnost) FROM stdin;
1	Гуськов Евгений Михайлович	заправщик
2	Струминская Мария Викторовна	водитель
3	Иванов Константин Игоревич	водитель
4	Трескунов Анатолий Станиславович	заправщик
5	Береговой Олег Дмитриевич	заправщик
\.


--
-- Data for Name: Vedomost; Type: TABLE DATA; Schema: sh; Owner: postgres
--

COPY sh."Vedomost" (id, num, created_at, garazh_id, zapravshik_id) FROM stdin;
1	46782	2020-05-20	3	2
2	47290	2020-05-22	4	1
3	38050	2020-05-23	1	5
4	87820	2020-05-25	2	3
5	12342	2020-05-28	5	4
\.


--
-- Data for Name: Zapisi; Type: TABLE DATA; Schema: sh; Owner: postgres
--

COPY sh."Zapisi" (id, vedomost_id, putevoy_list_id, voditeli_id, avto_id, gsm_id, gsm_l, gsm_kg) FROM stdin;
1	1	1	3	2	2	25	19
2	2	2	5	1	3	40	30
3	3	3	2	3	2	25	19
4	4	4	1	4	1	40	31
5	5	5	4	5	2	25	19
\.


--
-- Name: Avto Avto_pkey; Type: CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Avto"
    ADD CONSTRAINT "Avto_pkey" PRIMARY KEY (id);


--
-- Name: Avtobaza Avtobaza_pkey; Type: CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Avtobaza"
    ADD CONSTRAINT "Avtobaza_pkey" PRIMARY KEY (id);


--
-- Name: GSM GSM_pkey; Type: CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."GSM"
    ADD CONSTRAINT "GSM_pkey" PRIMARY KEY (id);


--
-- Name: Garazh Garazh_pkey; Type: CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Garazh"
    ADD CONSTRAINT "Garazh_pkey" PRIMARY KEY (id);


--
-- Name: Ostatki Ostatki_pkey; Type: CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Ostatki"
    ADD CONSTRAINT "Ostatki_pkey" PRIMARY KEY (id);


--
-- Name: Price Price_pkey; Type: CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Price"
    ADD CONSTRAINT "Price_pkey" PRIMARY KEY (id);


--
-- Name: Putevoy_list Putevoy_list_pkey; Type: CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Putevoy_list"
    ADD CONSTRAINT "Putevoy_list_pkey" PRIMARY KEY (id);


--
-- Name: Sotrudnik_id Sotrudnik_id_pkey; Type: CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Sotrudnik_id"
    ADD CONSTRAINT "Sotrudnik_id_pkey" PRIMARY KEY (id);


--
-- Name: Vedomost Vedomost_pkey; Type: CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Vedomost"
    ADD CONSTRAINT "Vedomost_pkey" PRIMARY KEY (id);


--
-- Name: Zapisi Zapisi_pkey; Type: CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Zapisi"
    ADD CONSTRAINT "Zapisi_pkey" PRIMARY KEY (id);


--
-- Name: Vedomost Vedomost_zapravshik_id_fkey; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Vedomost"
    ADD CONSTRAINT "Vedomost_zapravshik_id_fkey" FOREIGN KEY (zapravshik_id) REFERENCES sh."Sotrudnik_id"(id) NOT VALID;


--
-- Name: Zapisi avto_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Zapisi"
    ADD CONSTRAINT avto_id FOREIGN KEY (avto_id) REFERENCES sh."Avto"(id) NOT VALID;


--
-- Name: Garazh avtobaza_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Garazh"
    ADD CONSTRAINT avtobaza_id FOREIGN KEY (avtobaza_id) REFERENCES sh."Avtobaza"(id);


--
-- Name: Avto avtobaza_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Avto"
    ADD CONSTRAINT avtobaza_id FOREIGN KEY (avtobaza_id) REFERENCES sh."Avtobaza"(id) NOT VALID;


--
-- Name: Ostatki garazh_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Ostatki"
    ADD CONSTRAINT garazh_id FOREIGN KEY (garazh_id) REFERENCES sh."Garazh"(id);


--
-- Name: Vedomost garazh_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Vedomost"
    ADD CONSTRAINT garazh_id FOREIGN KEY (garazh_id) REFERENCES sh."Garazh"(id) NOT VALID;


--
-- Name: Price gsm_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Price"
    ADD CONSTRAINT gsm_id FOREIGN KEY (gsm_id) REFERENCES sh."GSM"(id);


--
-- Name: Ostatki gsm_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Ostatki"
    ADD CONSTRAINT gsm_id FOREIGN KEY (gsm_id) REFERENCES sh."GSM"(id);


--
-- Name: Zapisi gsm_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Zapisi"
    ADD CONSTRAINT gsm_id FOREIGN KEY (gsm_id) REFERENCES sh."GSM"(id) NOT VALID;


--
-- Name: Zapisi putevoy_list_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Zapisi"
    ADD CONSTRAINT putevoy_list_id FOREIGN KEY (putevoy_list_id) REFERENCES sh."Putevoy_list"(id) NOT VALID;


--
-- Name: Zapisi vedomost_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Zapisi"
    ADD CONSTRAINT vedomost_id FOREIGN KEY (vedomost_id) REFERENCES sh."Vedomost"(id) NOT VALID;


--
-- Name: Zapisi voditel_id; Type: FK CONSTRAINT; Schema: sh; Owner: postgres
--

ALTER TABLE ONLY sh."Zapisi"
    ADD CONSTRAINT voditel_id FOREIGN KEY (voditeli_id) REFERENCES sh."Sotrudnik_id"(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

