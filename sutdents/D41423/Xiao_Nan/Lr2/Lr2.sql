--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-12 01:02:11

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
-- TOC entry 204 (class 1259 OID 16408)
-- Name: Brokers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brokers" (
    "Brokers_ID" integer NOT NULL,
    "Fixed_fee" integer,
    "Office_ID" integer NOT NULL,
    "Brokers_Name" text
);


ALTER TABLE public."Brokers" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16413)
-- Name: Brokers’_Office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brokers’_Office" (
    "Office_ID" integer NOT NULL,
    "Office_Name" text
);


ALTER TABLE public."Brokers’_Office" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16397)
-- Name: Commodity_exchanges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Commodity_exchanges" (
    "Bidding_ID" integer NOT NULL,
    "Data_end" date,
    "Data_start" date,
    "Lot_number" integer
);


ALTER TABLE public."Commodity_exchanges" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16438)
-- Name: Company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Company" (
    "Company_ID" integer NOT NULL,
    "Company_Name" name NOT NULL COLLATE pg_catalog."default",
    "Product_ID" integer
);


ALTER TABLE public."Company" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16433)
-- Name: Orders_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders_records" (
    "Lot_number" integer NOT NULL,
    "Product_ID" integer NOT NULL,
    "Number_deals" integer NOT NULL,
    "Price_unit" double precision,
    "Price_total" double precision,
    "Date_contract" date,
    "Date_shipment" date,
    "Is_Payment" character(1),
    "Payment_amount" integer,
    "Brokers_ID" integer
);


ALTER TABLE public."Orders_records" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16418)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    "Product_ID" integer NOT NULL,
    "Product_Name" name NOT NULL COLLATE pg_catalog."default",
    "Date_production" date,
    "Storage_period" integer,
    "Price_unit" double precision NOT NULL,
    "Company_ID" integer NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16403)
-- Name: Sell_Records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sell_Records" (
    "Sell_ID" numeric NOT NULL,
    "Date_Sell" date,
    "Bidding_ID" integer
);


ALTER TABLE public."Sell_Records" OWNER TO postgres;

--
-- TOC entry 2862 (class 0 OID 16408)
-- Dependencies: 204
-- Data for Name: Brokers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Brokers" ("Brokers_ID", "Fixed_fee", "Office_ID", "Brokers_Name") FROM stdin;
888	6000	14148	Adamin
999	6500	14156	Vivian
596	7000	18978	Piter
777	5500	14147	Zenny
654	6000	14148	Lucia
\.


--
-- TOC entry 2863 (class 0 OID 16413)
-- Dependencies: 205
-- Data for Name: Brokers’_Office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Brokers’_Office" ("Office_ID", "Office_Name") FROM stdin;
14147	SV Company
14148	DND Company
14156	P-SK Company
16565	Two-Two SV Company
18978	Coop Company
\.


--
-- TOC entry 2860 (class 0 OID 16397)
-- Dependencies: 202
-- Data for Name: Commodity_exchanges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Commodity_exchanges" ("Bidding_ID", "Data_end", "Data_start", "Lot_number") FROM stdin;
123	2020-04-01	2020-04-09	101
234	2020-04-02	2020-04-15	102
345	2020-04-03	2020-04-15	103
456	2020-04-07	2020-04-21	104
567	2020-04-15	2020-04-30	105
\.


--
-- TOC entry 2866 (class 0 OID 16438)
-- Dependencies: 208
-- Data for Name: Company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Company" ("Company_ID", "Company_Name", "Product_ID") FROM stdin;
7071	PPD Company	707101
7072	SSD Company	707201
7073	SCXZ Company	707301
7074	PSDAZ Company	707401
7075	John Company	707501
7076	SVIP Company	707601
\.


--
-- TOC entry 2865 (class 0 OID 16433)
-- Dependencies: 207
-- Data for Name: Orders_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders_records" ("Lot_number", "Product_ID", "Number_deals", "Price_unit", "Price_total", "Date_contract", "Date_shipment", "Is_Payment", "Payment_amount", "Brokers_ID") FROM stdin;
101	707101	20	35	700	2020-03-25	2020-04-01	Y	700	654
103	707201	300	5	1500	2020-04-01	2020-04-02	Y	1500	777
104	707202	60	30	1800	2020-04-04	2020-04-06	Y	1800	999
105	707301	20	100	2000	2020-04-06	2020-04-13	Y	2000	596
106	707401	5	150	750	2020-04-14	2020-04-20	Y	750	654
102	707102	100	10.5	1050	2020-03-27	2020-04-01	Y	1050	888
\.


--
-- TOC entry 2864 (class 0 OID 16418)
-- Dependencies: 206
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" ("Product_ID", "Product_Name", "Date_production", "Storage_period", "Price_unit", "Company_ID") FROM stdin;
707101	Gloves	2020-04-01	90	35	7071
707202	Fruits	2020-04-03	15	30	7072
707301	Tshirt	2020-04-07	120	100	7073
707401	Tea	2020-04-12	30	150	7074
707102	Cookie	2020-04-01	20	10.5	7071
707201	Noodle	2020-04-01	30	5	7072
\.


--
-- TOC entry 2861 (class 0 OID 16403)
-- Dependencies: 203
-- Data for Name: Sell_Records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sell_Records" ("Sell_ID", "Date_Sell", "Bidding_ID") FROM stdin;
10001	2020-04-07	123
10002	2020-04-09	234
10003	2020-04-13	345
10004	2020-04-19	456
10005	2020-04-22	567
\.


--
-- TOC entry 2720 (class 2606 OID 16412)
-- Name: Brokers Brokers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brokers"
    ADD CONSTRAINT "Brokers_pkey" PRIMARY KEY ("Brokers_ID");


--
-- TOC entry 2722 (class 2606 OID 16417)
-- Name: Brokers’_Office Brokers’_Office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brokers’_Office"
    ADD CONSTRAINT "Brokers’_Office_pkey" PRIMARY KEY ("Office_ID");


--
-- TOC entry 2714 (class 2606 OID 16401)
-- Name: Commodity_exchanges Commodity_exchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Commodity_exchanges"
    ADD CONSTRAINT "Commodity_exchanges_pkey" PRIMARY KEY ("Bidding_ID");


--
-- TOC entry 2731 (class 2606 OID 16442)
-- Name: Company Company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT "Company_pkey" PRIMARY KEY ("Company_ID");


--
-- TOC entry 2729 (class 2606 OID 16437)
-- Name: Orders_records Orders_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders_records"
    ADD CONSTRAINT "Orders_records_pkey" PRIMARY KEY ("Lot_number");


--
-- TOC entry 2726 (class 2606 OID 16422)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("Product_ID");


--
-- TOC entry 2717 (class 2606 OID 16540)
-- Name: Sell_Records Sell_Records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sell_Records"
    ADD CONSTRAINT "Sell_Records_pkey" PRIMARY KEY ("Sell_ID");


--
-- TOC entry 2712 (class 1259 OID 16560)
-- Name: Bidding_ID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Bidding_ID" ON public."Commodity_exchanges" USING btree ("Bidding_ID");


--
-- TOC entry 2718 (class 1259 OID 16559)
-- Name: Brokers_ID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Brokers_ID" ON public."Brokers" USING btree ("Brokers_ID") INCLUDE ("Brokers_ID");


--
-- TOC entry 2727 (class 1259 OID 16561)
-- Name: Lot_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Lot_number" ON public."Orders_records" USING btree ("Lot_number");


--
-- TOC entry 2723 (class 1259 OID 16563)
-- Name: Office_ID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Office_ID" ON public."Brokers’_Office" USING btree ("Office_ID");


--
-- TOC entry 2724 (class 1259 OID 16562)
-- Name: Product_ID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_ID" ON public."Product" USING btree ("Product_ID");


--
-- TOC entry 2715 (class 1259 OID 16564)
-- Name: Sell_ID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Sell_ID" ON public."Sell_Records" USING btree ("Sell_ID");


--
-- TOC entry 2732 (class 2606 OID 16570)
-- Name: Brokers’_Office Brokers’_Office_Office_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brokers’_Office"
    ADD CONSTRAINT "Brokers’_Office_Office_ID_fkey" FOREIGN KEY ("Office_ID") REFERENCES public."Brokers"("Brokers_ID") NOT VALID;


--
-- TOC entry 2733 (class 2606 OID 16575)
-- Name: Product Product_Product_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_Product_ID_fkey" FOREIGN KEY ("Product_ID") REFERENCES public."Company"("Company_ID") NOT VALID;


-- Completed on 2020-05-12 01:02:12

--
-- PostgreSQL database dump complete
--

