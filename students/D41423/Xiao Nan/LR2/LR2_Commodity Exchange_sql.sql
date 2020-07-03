--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-06-29 05:28:46

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
-- TOC entry 209 (class 1259 OID 16732)
-- Name: Broker_fee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Broker_fee" (
    "Broker_fee" numeric NOT NULL,
    "Fixed_fee" numeric,
    "Date_fee" date,
    "Brokers_ID" numeric,
    "Office_ID" numeric
);


ALTER TABLE public."Broker_fee" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16408)
-- Name: Brokers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brokers" (
    "Brokers_ID" numeric NOT NULL,
    "Brokers_Name" text,
    "Contact" numeric
);


ALTER TABLE public."Brokers" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16413)
-- Name: Brokers_Office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brokers_Office" (
    "Office_ID" integer NOT NULL,
    "Office_Name" text
);


ALTER TABLE public."Brokers_Office" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16438)
-- Name: Company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Company" (
    "Company_ID" integer NOT NULL,
    "Company_Name" name NOT NULL COLLATE pg_catalog."default"
);


ALTER TABLE public."Company" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16403)
-- Name: Contract; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Contract" (
    "Contract_ID" numeric NOT NULL,
    "Date_Contract" date,
    "Lot_number" numeric,
    "Customer_ID" numeric
);


ALTER TABLE public."Contract" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16585)
-- Name: Customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Customer" (
    "Customer_ID" numeric NOT NULL,
    "Customer_Name" text,
    "Contact" numeric
);


ALTER TABLE public."Customer" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16433)
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
-- TOC entry 205 (class 1259 OID 16418)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    "Product_ID" numeric NOT NULL,
    "Product_Name" name NOT NULL COLLATE pg_catalog."default",
    "Date_production" date,
    "Storage_period" integer,
    "Price_unit" double precision NOT NULL,
    "Company_ID" integer NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 2877 (class 0 OID 16732)
-- Dependencies: 209
-- Data for Name: Broker_fee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Broker_fee" ("Broker_fee", "Fixed_fee", "Date_fee", "Brokers_ID", "Office_ID") FROM stdin;
101	600	2020-04-01	888	14147
102	650	2020-04-07	999	14148
103	700	2020-04-15	596	14156
104	550	2020-04-19	777	16565
105	600	2020-04-26	654	18978
\.


--
-- TOC entry 2871 (class 0 OID 16408)
-- Dependencies: 203
-- Data for Name: Brokers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Brokers" ("Brokers_ID", "Brokers_Name", "Contact") FROM stdin;
888	Adamin	89877891111
999	Vivian	89877892222
596	Piter	89877893333
777	Zenny	89877895555
654	Lucia	89877896666
\.


--
-- TOC entry 2872 (class 0 OID 16413)
-- Dependencies: 204
-- Data for Name: Brokers_Office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Brokers_Office" ("Office_ID", "Office_Name") FROM stdin;
14147	SV Company
14148	DND Company
14156	P-SK Company
16565	Two-Two SV Company
18978	Coop Company
\.


--
-- TOC entry 2875 (class 0 OID 16438)
-- Dependencies: 207
-- Data for Name: Company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Company" ("Company_ID", "Company_Name") FROM stdin;
7071	PPD Company
7072	SSD Company
7073	SCXZ Company
7074	PSDAZ Company
7075	John Company
7076	SVIP Company
\.


--
-- TOC entry 2870 (class 0 OID 16403)
-- Dependencies: 202
-- Data for Name: Contract; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Contract" ("Contract_ID", "Date_Contract", "Lot_number", "Customer_ID") FROM stdin;
10001	2020-04-07	101	1
10002	2020-04-09	102	1
10003	2020-04-13	103	2
10004	2020-04-19	104	2
10005	2020-04-22	105	3
\.


--
-- TOC entry 2876 (class 0 OID 16585)
-- Dependencies: 208
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Customer" ("Customer_ID", "Customer_Name", "Contact") FROM stdin;
1	Anna	89998887777
2	Anni	89998886666
3	Kannet	89998885555
4	Kevin	89998883333
5	Tony	89998882222
\.


--
-- TOC entry 2874 (class 0 OID 16433)
-- Dependencies: 206
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
-- TOC entry 2873 (class 0 OID 16418)
-- Dependencies: 205
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" ("Product_ID", "Product_Name", "Date_production", "Storage_period", "Price_unit", "Company_ID") FROM stdin;
707101	Gloves	2020-04-01	90	35	7071
707202	Fruits	2020-04-03	15	30	7072
707301	Tshirt	2020-04-07	120	100	7073
707401	Tea	2020-04-12	30	150	7074
707102	Cookie	2020-04-01	20	10.5	7071
707201	Noodle	2020-04-01	30	5	7072
707402	Phone	2020-04-30	360	3000	7074
\.


--
-- TOC entry 2740 (class 2606 OID 16739)
-- Name: Broker_fee Broker_fee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Broker_fee"
    ADD CONSTRAINT "Broker_fee_pkey" PRIMARY KEY ("Broker_fee");


--
-- TOC entry 2724 (class 2606 OID 16612)
-- Name: Brokers Brokers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brokers"
    ADD CONSTRAINT "Brokers_pkey" PRIMARY KEY ("Brokers_ID");


--
-- TOC entry 2726 (class 2606 OID 16417)
-- Name: Brokers_Office Brokers’_Office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brokers_Office"
    ADD CONSTRAINT "Brokers’_Office_pkey" PRIMARY KEY ("Office_ID");


--
-- TOC entry 2735 (class 2606 OID 16442)
-- Name: Company Company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT "Company_pkey" PRIMARY KEY ("Company_ID");


--
-- TOC entry 2738 (class 2606 OID 16592)
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY ("Customer_ID");


--
-- TOC entry 2733 (class 2606 OID 16437)
-- Name: Orders_records Orders_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders_records"
    ADD CONSTRAINT "Orders_records_pkey" PRIMARY KEY ("Lot_number");


--
-- TOC entry 2730 (class 2606 OID 16649)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("Product_ID");


--
-- TOC entry 2721 (class 2606 OID 16540)
-- Name: Contract Sell_Records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contract"
    ADD CONSTRAINT "Sell_Records_pkey" PRIMARY KEY ("Contract_ID");


--
-- TOC entry 2722 (class 1259 OID 16613)
-- Name: Brokers_ID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Brokers_ID" ON public."Brokers" USING btree ("Brokers_ID") INCLUDE ("Brokers_ID");


--
-- TOC entry 2719 (class 1259 OID 16633)
-- Name: Contract_ID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Contract_ID" ON public."Contract" USING btree ("Contract_ID");


--
-- TOC entry 2736 (class 1259 OID 16600)
-- Name: Customer_ID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Customer_ID" ON public."Customer" USING btree ("Customer_ID");


--
-- TOC entry 2731 (class 1259 OID 16561)
-- Name: Lot_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Lot_number" ON public."Orders_records" USING btree ("Lot_number");


--
-- TOC entry 2727 (class 1259 OID 16563)
-- Name: Office_ID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Office_ID" ON public."Brokers_Office" USING btree ("Office_ID");


--
-- TOC entry 2728 (class 1259 OID 16650)
-- Name: Product_ID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_ID" ON public."Product" USING btree ("Product_ID");


--
-- TOC entry 2741 (class 2606 OID 16606)
-- Name: Contract Contract_Customer_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contract"
    ADD CONSTRAINT "Contract_Customer_ID_fkey" FOREIGN KEY ("Customer_ID") REFERENCES public."Customer"("Customer_ID");


--
-- TOC entry 2743 (class 2606 OID 16651)
-- Name: Orders_records Orders_records_Product_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders_records"
    ADD CONSTRAINT "Orders_records_Product_ID_fkey" FOREIGN KEY ("Product_ID") REFERENCES public."Product"("Product_ID");


--
-- TOC entry 2742 (class 2606 OID 16672)
-- Name: Product Product_Company_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_Company_ID_fkey" FOREIGN KEY ("Company_ID") REFERENCES public."Company"("Company_ID");


-- Completed on 2020-06-29 05:28:47

--
-- PostgreSQL database dump complete
--

