--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-11 14:25:01

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16609)
-- Name: Брокер; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Брокер" (
    "Номер_брокера" integer NOT NULL,
    "ФИО" character varying(30) NOT NULL,
    "Телефон" integer,
    "Номер_конторы" integer NOT NULL
);


ALTER TABLE public."Брокер" OWNER TO postgres;

--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE "Брокер"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Брокер" IS 'Брокер выставляет партии товаров на продажу и заключает договора с фирмами и покупателями. 
Таблица "Брокер" содержит идентификационный номер, ФИО, контактные данные брокера и номер конторы, в которой он работает.
';


--
-- TOC entry 209 (class 1259 OID 16639)
-- Name: Договор_П_Б; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Договор_П_Б" (
    "Номер_договора" integer NOT NULL,
    "Номер_брокера" integer NOT NULL,
    "Номер_покупателя" integer NOT NULL
);


ALTER TABLE public."Договор_П_Б" OWNER TO postgres;

--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE "Договор_П_Б"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Договор_П_Б" IS 'Договор_П_Б  заключается между покупателем и брокером на покупку товара. 
Таблица "Договор_П_Б" содержит идентификационный номер договора, номер покупателя и номер брокера. ';


--
-- TOC entry 210 (class 1259 OID 16644)
-- Name: Договор_Ф_Б ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Договор_Ф_Б " (
    "Номер_договора" integer NOT NULL,
    "Номер_брокера " integer NOT NULL,
    "Номер_фирмы" integer NOT NULL
);


ALTER TABLE public."Договор_Ф_Б " OWNER TO postgres;

--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE "Договор_Ф_Б "; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Договор_Ф_Б " IS 'Договор_Ф_Б заключается между фирмой и брокером на продажу товара. 
Таблица "Договор_Ф_Б" содержит идентификационный номер договора, номер фирмы и номер брокера. ';


--
-- TOC entry 202 (class 1259 OID 16604)
-- Name: Контора; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Контора" (
    "Номер_конторы" integer NOT NULL,
    "Название" character varying(30) NOT NULL
);


ALTER TABLE public."Контора" OWNER TO postgres;

--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE "Контора"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Контора" IS 'На контору работают брокеры, контора начисляет брокерам зарплату согласно продажам. 
Таблица "Контора" содержит идентификационный номер конторы и ее название.';


--
-- TOC entry 204 (class 1259 OID 16614)
-- Name: Партия; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Партия" (
    "Номер_партии" integer NOT NULL,
    "Дата_начала_торгов" date NOT NULL,
    "Предоплата" boolean NOT NULL,
    "Номер_брокера" integer NOT NULL
);


ALTER TABLE public."Партия" OWNER TO postgres;

--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE "Партия"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Партия" IS 'Партии различных товаров объединяются в одну партию, которую брокер выставляет на продажу.
Таблица "Партия" содержит идентификационный номер партии,  номер брокера, дату начала торгов и сведения по предоплате. ';


--
-- TOC entry 205 (class 1259 OID 16619)
-- Name: Партия_товара; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Партия_товара" (
    "Номер_партии" integer NOT NULL,
    "Номер_партии_товара" integer NOT NULL,
    "Номер_товара" integer NOT NULL,
    "Количество" integer NOT NULL
);


ALTER TABLE public."Партия_товара" OWNER TO postgres;

--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE "Партия_товара"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Партия_товара" IS 'Отдельный товар поставляется партией товара. Партии различных товаров объединяются в партию и выставляются брокером на продажу.
Таблица "Партия_товара" содержит идентификационный номер партии товара, номер партии, номер товара и количество товара.';


--
-- TOC entry 208 (class 1259 OID 16634)
-- Name: Покупатель; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Покупатель" (
    "Номер_покупателя" integer NOT NULL,
    "ФИО" character varying(30) NOT NULL,
    "Телефон" integer
);


ALTER TABLE public."Покупатель" OWNER TO postgres;

--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE "Покупатель"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Покупатель" IS 'Покупатель покупает товар, заключая договор с брокером.
Таблица "Покупатель" содержит идентификационный номер покупателя, ФИО, контактные данные. ';


--
-- TOC entry 211 (class 1259 OID 16649)
-- Name: Покупка; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Покупка" (
    "Номер_покупки" integer NOT NULL,
    "Номер договора_П_Б " integer NOT NULL,
    "Номер договора_Ф_Б" integer NOT NULL,
    "Номер _партии " integer NOT NULL
);


ALTER TABLE public."Покупка" OWNER TO postgres;

--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE "Покупка"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Покупка" IS 'Покупка возникает, когда покупатель и брокер заключаются договор и фирма и брокер также заключают договор. В покупку поставляется партия. 
Таблица "Покупка" содержит идентификационный номер покупки, номер договора между покупателем и брокером, номер договора между фирмой и брокером, номер партии, выставленной на продажу. ';


--
-- TOC entry 206 (class 1259 OID 16624)
-- Name: Товары; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Товары" (
    "Номер_товара" integer NOT NULL,
    "Наименование" character varying(30) NOT NULL,
    "Единица_измерения" character varying(30) NOT NULL,
    "Цена_товара" integer NOT NULL,
    "Дата_производства" date NOT NULL,
    "Срок_годности" integer NOT NULL,
    "Номер_фирмы" integer NOT NULL
);


ALTER TABLE public."Товары" OWNER TO postgres;

--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE "Товары"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Товары" IS 'Товары производятся фирмами.
Таблица "Товары" содержит идентификационный номер товара, его наименование, единицу измерения, цену, дату производства, срок годности и номер фирмы производителя. ';


--
-- TOC entry 207 (class 1259 OID 16629)
-- Name: Фирмы; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Фирмы" (
    "Номер_фирмы" integer NOT NULL,
    "Название" character varying(30) NOT NULL
);


ALTER TABLE public."Фирмы" OWNER TO postgres;

--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE "Фирмы"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Фирмы" IS 'Фирмы производят товары.
Таблица "Фирмы" содержит идентификационные номер фирмы и ее название. ';


--
-- TOC entry 2892 (class 0 OID 16609)
-- Dependencies: 203
-- Data for Name: Брокер; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Брокер" ("Номер_брокера", "ФИО", "Телефон", "Номер_конторы") FROM stdin;
1	Власов Гурий Валентинович	683378	1
2	Лазарев Иван Ярославович	735652	2
3	Гордеев Овидий Викторович	739987	3
4	Мельников Парамон Богданович	665072	4
5	Фадеев Максим Натанович	702944	5
\.


--
-- TOC entry 2898 (class 0 OID 16639)
-- Dependencies: 209
-- Data for Name: Договор_П_Б; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Договор_П_Б" ("Номер_договора", "Номер_брокера", "Номер_покупателя") FROM stdin;
3242	1	1
4834	4	4
2342	5	5
4342	2	6
7653	3	7
\.


--
-- TOC entry 2899 (class 0 OID 16644)
-- Dependencies: 210
-- Data for Name: Договор_Ф_Б ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Договор_Ф_Б " ("Номер_договора", "Номер_брокера ", "Номер_фирмы") FROM stdin;
324	1	2
776	2	3
558	3	4
467	4	5
439	5	1
\.


--
-- TOC entry 2891 (class 0 OID 16604)
-- Dependencies: 202
-- Data for Name: Контора; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Контора" ("Номер_конторы", "Название") FROM stdin;
1	ООО Портной
2	ОАО Табаковод
3	ИП Диетолог
4	ОАО Кинолог\n
5	ООО Портье
\.


--
-- TOC entry 2893 (class 0 OID 16614)
-- Dependencies: 204
-- Data for Name: Партия; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Партия" ("Номер_партии", "Дата_начала_торгов", "Предоплата", "Номер_брокера") FROM stdin;
23	2020-10-22	t	1
34	2020-10-03	f	2
32	2020-05-26	t	3
35	2020-07-28	t	4
2	2020-07-01	f	5
\.


--
-- TOC entry 2894 (class 0 OID 16619)
-- Dependencies: 205
-- Data for Name: Партия_товара; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Партия_товара" ("Номер_партии", "Номер_партии_товара", "Номер_товара", "Количество") FROM stdin;
213	23	43534	50
321	32	64564	12
258	34	35468	58
896	2	75535	33
345	35	65786	2
\.


--
-- TOC entry 2897 (class 0 OID 16634)
-- Dependencies: 208
-- Data for Name: Покупатель; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Покупатель" ("Номер_покупателя", "ФИО", "Телефон") FROM stdin;
5	Лыткин Авраам Парфеньевич	63240
6	Сидоров Леонтий Аркадьевич	16484
4	Федотов Мирон Петрович	13783
7	Ширяев Гаянэ Федотович\n	17344
1	Фадеев Леонид Дмитриевич	13123
\.


--
-- TOC entry 2900 (class 0 OID 16649)
-- Dependencies: 211
-- Data for Name: Покупка; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Покупка" ("Номер_покупки", "Номер договора_П_Б ", "Номер договора_Ф_Б", "Номер _партии ") FROM stdin;
244	3242	467	2
534	4342	324	23
556	7653	776	32
872	4834	558	34
485	2342	439	35
\.


--
-- TOC entry 2895 (class 0 OID 16624)
-- Dependencies: 206
-- Data for Name: Товары; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Товары" ("Номер_товара", "Наименование", "Единица_измерения", "Цена_товара", "Дата_производства", "Срок_годности", "Номер_фирмы") FROM stdin;
43534	Доски	Штук	514	2020-03-19	365	2
64564	Картошка	Килограмм	47	2020-08-15	30	4
35468	Стол\n	Штук	1224	2020-01-09	480	1
75535	Дверь	Штук	2473	2020-01-21	440	5
65786	Бензин	Литр	26	2020-11-28	80	3
\.


--
-- TOC entry 2896 (class 0 OID 16629)
-- Dependencies: 207
-- Data for Name: Фирмы; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Фирмы" ("Номер_фирмы", "Название") FROM stdin;
1	ООО Шкипер
2	ИП Ветеринар\n
3	ОАО Сметчик
4	ИП Флорист
5	ОАО Трансфузиолог
\.


--
-- TOC entry 2743 (class 2606 OID 16643)
-- Name: Договор_П_Б Договор_П_Б_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Договор_П_Б"
    ADD CONSTRAINT "Договор_П_Б_pkey" PRIMARY KEY ("Номер_договора");


--
-- TOC entry 2747 (class 2606 OID 16648)
-- Name: Договор_Ф_Б  Договор_Ф_Б _пк; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Договор_Ф_Б "
    ADD CONSTRAINT "Договор_Ф_Б _пк" PRIMARY KEY ("Номер_договора");


--
-- TOC entry 2725 (class 2606 OID 16613)
-- Name: Брокер Номер_брокера_пк; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Брокер"
    ADD CONSTRAINT "Номер_брокера_пк" PRIMARY KEY ("Номер_брокера");


--
-- TOC entry 2722 (class 2606 OID 16608)
-- Name: Контора Номер_конторы_пк; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Контора"
    ADD CONSTRAINT "Номер_конторы_пк" PRIMARY KEY ("Номер_конторы");


--
-- TOC entry 2732 (class 2606 OID 16963)
-- Name: Партия_товара Номер_партии_товара; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Партия_товара"
    ADD CONSTRAINT "Номер_партии_товара" PRIMARY KEY ("Номер_партии_товара");


--
-- TOC entry 2728 (class 2606 OID 16618)
-- Name: Партия Партия_пк; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Партия"
    ADD CONSTRAINT "Партия_пк" PRIMARY KEY ("Номер_партии");


--
-- TOC entry 2739 (class 2606 OID 16638)
-- Name: Покупатель Покупатель_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Покупатель"
    ADD CONSTRAINT "Покупатель_pkey" PRIMARY KEY ("Номер_покупателя");


--
-- TOC entry 2752 (class 2606 OID 16653)
-- Name: Покупка Покупка_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Покупка"
    ADD CONSTRAINT "Покупка_pkey" PRIMARY KEY ("Номер_покупки");


--
-- TOC entry 2735 (class 2606 OID 16628)
-- Name: Товары Товары_пк; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Товары"
    ADD CONSTRAINT "Товары_пк" PRIMARY KEY ("Номер_товара");


--
-- TOC entry 2737 (class 2606 OID 16633)
-- Name: Фирмы Фирмы_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Фирмы"
    ADD CONSTRAINT "Фирмы_pkey" PRIMARY KEY ("Номер_фирмы");


--
-- TOC entry 2740 (class 1259 OID 16709)
-- Name: fki_Номер_брокера_дог_п_б; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Номер_брокера_дог_п_б" ON public."Договор_П_Б" USING btree ("Номер_брокера");


--
-- TOC entry 2744 (class 1259 OID 16721)
-- Name: fki_Номер_брокера_дог_ф_б_; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Номер_брокера_дог_ф_б_" ON public."Договор_Ф_Б " USING btree ("Номер_брокера ");


--
-- TOC entry 2748 (class 1259 OID 16757)
-- Name: fki_Номер_дог_п_б_покупка; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Номер_дог_п_б_покупка" ON public."Покупка" USING btree ("Номер договора_П_Б ");


--
-- TOC entry 2749 (class 1259 OID 16763)
-- Name: fki_Номер_договора_ф_б_покупка; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Номер_договора_ф_б_покупка" ON public."Покупка" USING btree ("Номер договора_Ф_Б");


--
-- TOC entry 2723 (class 1259 OID 16715)
-- Name: fki_Номер_конторы_Брокер; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Номер_конторы_Брокер" ON public."Брокер" USING btree ("Номер_конторы");


--
-- TOC entry 2750 (class 1259 OID 16769)
-- Name: fki_Номер_партии_покупка; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Номер_партии_покупка" ON public."Покупка" USING btree ("Номер _партии ");


--
-- TOC entry 2729 (class 1259 OID 16739)
-- Name: fki_Номер_товара_партов; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Номер_товара_партов" ON public."Партия_товара" USING btree ("Номер_партии_товара");


--
-- TOC entry 2745 (class 1259 OID 16727)
-- Name: fki_Номер_фирмы_дог_ф_б; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Номер_фирмы_дог_ф_б" ON public."Договор_Ф_Б " USING btree ("Номер_фирмы");


--
-- TOC entry 2726 (class 1259 OID 16733)
-- Name: fki_номер_брокера_партия; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_номер_брокера_партия" ON public."Партия" USING btree ("Номер_брокера");


--
-- TOC entry 2730 (class 1259 OID 16745)
-- Name: fki_номер_партии_партов; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_номер_партии_партов" ON public."Партия_товара" USING btree ("Номер_товара");


--
-- TOC entry 2741 (class 1259 OID 16703)
-- Name: fki_номер_покупателя_дог_п_б; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_номер_покупателя_дог_п_б" ON public."Договор_П_Б" USING btree ("Номер_покупателя");


--
-- TOC entry 2733 (class 1259 OID 16751)
-- Name: fki_номер_фирмы; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_номер_фирмы" ON public."Товары" USING btree ("Номер_фирмы");


--
-- TOC entry 2759 (class 2606 OID 16704)
-- Name: Договор_П_Б Номер_брокера_дог_п_б; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Договор_П_Б"
    ADD CONSTRAINT "Номер_брокера_дог_п_б" FOREIGN KEY ("Номер_брокера") REFERENCES public."Брокер"("Номер_брокера");


--
-- TOC entry 2760 (class 2606 OID 16716)
-- Name: Договор_Ф_Б  Номер_брокера_дог_ф_б_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Договор_Ф_Б "
    ADD CONSTRAINT "Номер_брокера_дог_ф_б_" FOREIGN KEY ("Номер_брокера ") REFERENCES public."Брокер"("Номер_брокера");


--
-- TOC entry 2762 (class 2606 OID 16752)
-- Name: Покупка Номер_дог_п_б_покупка; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Покупка"
    ADD CONSTRAINT "Номер_дог_п_б_покупка" FOREIGN KEY ("Номер договора_П_Б ") REFERENCES public."Договор_П_Б"("Номер_договора");


--
-- TOC entry 2763 (class 2606 OID 16758)
-- Name: Покупка Номер_договора_ф_б_покупка; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Покупка"
    ADD CONSTRAINT "Номер_договора_ф_б_покупка" FOREIGN KEY ("Номер договора_Ф_Б") REFERENCES public."Договор_Ф_Б "("Номер_договора");


--
-- TOC entry 2753 (class 2606 OID 16710)
-- Name: Брокер Номер_конторы_Брокер; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Брокер"
    ADD CONSTRAINT "Номер_конторы_Брокер" FOREIGN KEY ("Номер_конторы") REFERENCES public."Брокер"("Номер_брокера");


--
-- TOC entry 2764 (class 2606 OID 16764)
-- Name: Покупка Номер_партии_покупка; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Покупка"
    ADD CONSTRAINT "Номер_партии_покупка" FOREIGN KEY ("Номер _партии ") REFERENCES public."Партия"("Номер_партии");


--
-- TOC entry 2755 (class 2606 OID 16734)
-- Name: Партия_товара Номер_товара_партов; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Партия_товара"
    ADD CONSTRAINT "Номер_товара_партов" FOREIGN KEY ("Номер_партии_товара") REFERENCES public."Партия"("Номер_партии");


--
-- TOC entry 2761 (class 2606 OID 16722)
-- Name: Договор_Ф_Б  Номер_фирмы_дог_ф_б; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Договор_Ф_Б "
    ADD CONSTRAINT "Номер_фирмы_дог_ф_б" FOREIGN KEY ("Номер_фирмы") REFERENCES public."Фирмы"("Номер_фирмы");


--
-- TOC entry 2754 (class 2606 OID 16728)
-- Name: Партия номер_брокера_партия; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Партия"
    ADD CONSTRAINT "номер_брокера_партия" FOREIGN KEY ("Номер_брокера") REFERENCES public."Брокер"("Номер_брокера");


--
-- TOC entry 2756 (class 2606 OID 16740)
-- Name: Партия_товара номер_партии_партов; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Партия_товара"
    ADD CONSTRAINT "номер_партии_партов" FOREIGN KEY ("Номер_товара") REFERENCES public."Товары"("Номер_товара");


--
-- TOC entry 2758 (class 2606 OID 16698)
-- Name: Договор_П_Б номер_покупателя_дог_п_б; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Договор_П_Б"
    ADD CONSTRAINT "номер_покупателя_дог_п_б" FOREIGN KEY ("Номер_покупателя") REFERENCES public."Покупатель"("Номер_покупателя");


--
-- TOC entry 2757 (class 2606 OID 16746)
-- Name: Товары номер_фирмы; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Товары"
    ADD CONSTRAINT "номер_фирмы" FOREIGN KEY ("Номер_фирмы") REFERENCES public."Фирмы"("Номер_фирмы");


-- Completed on 2020-05-11 14:25:01

--
-- PostgreSQL database dump complete
--

