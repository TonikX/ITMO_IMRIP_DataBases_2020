--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

-- Started on 2020-05-11 18:58:50 EEST

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: luch_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA luch_schema;


ALTER SCHEMA luch_schema OWNER TO postgres;

--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA luch_schema; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA luch_schema IS 'standard public schema';


--
-- TOC entry 624 (class 1247 OID 16548)
-- Name: status_payment; Type: TYPE; Schema: luch_schema; Owner: postgres
--

CREATE TYPE luch_schema.status_payment AS (
	paid character varying,
	"non-paid" character varying
);


ALTER TYPE luch_schema.status_payment OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16395)
-- Name: client; Type: TABLE; Schema: luch_schema; Owner: postgres
--

CREATE TABLE luch_schema.client (
    id integer NOT NULL,
    full_name character varying NOT NULL,
    email character varying NOT NULL,
    phone_number character varying NOT NULL
);


ALTER TABLE luch_schema.client OWNER TO postgres;

--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE client; Type: COMMENT; Schema: luch_schema; Owner: postgres
--

COMMENT ON TABLE luch_schema.client IS 'Таблица содержит список клиентов агентства Луч. Каждому клиенту соответствует уникальный номер, имя заказчика и контактная информация. ';


--
-- TOC entry 202 (class 1259 OID 16481)
-- Name: content_material; Type: TABLE; Schema: luch_schema; Owner: postgres
--

CREATE TABLE luch_schema.content_material (
    material_id integer NOT NULL,
    order_description character varying NOT NULL,
    price integer NOT NULL
);


ALTER TABLE luch_schema.content_material OWNER TO postgres;

--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE content_material; Type: COMMENT; Schema: luch_schema; Owner: postgres
--

COMMENT ON TABLE luch_schema.content_material IS 'Таблица содержит подробное описание материалов, которые используются в заказе, и их общая стоимость. ';


--
-- TOC entry 201 (class 1259 OID 16474)
-- Name: content_order; Type: TABLE; Schema: luch_schema; Owner: postgres
--

CREATE TABLE luch_schema.content_order (
    order_id integer NOT NULL,
    service_id integer NOT NULL,
    final_price integer NOT NULL,
    date_forming date NOT NULL,
    description character varying NOT NULL,
    worker_id integer NOT NULL
);


ALTER TABLE luch_schema.content_order OWNER TO postgres;

--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE content_order; Type: COMMENT; Schema: luch_schema; Owner: postgres
--

COMMENT ON TABLE luch_schema.content_order IS 'Таблица содержит полную информацию о заказе со ссылками на таблицы с прайс-листом, исполнителем, материалами и номером заказа.';


--
-- TOC entry 197 (class 1259 OID 16400)
-- Name: material_list; Type: TABLE; Schema: luch_schema; Owner: postgres
--

CREATE TABLE luch_schema.material_list (
    id integer NOT NULL,
    measure character varying NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE luch_schema.material_list OWNER TO postgres;

--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE material_list; Type: COMMENT; Schema: luch_schema; Owner: postgres
--

COMMENT ON TABLE luch_schema.material_list IS 'Таблица содержит список материалов, которые будут использованы в заказе, их измерения и количество. ';


--
-- TOC entry 200 (class 1259 OID 16471)
-- Name: order; Type: TABLE; Schema: luch_schema; Owner: postgres
--

CREATE TABLE luch_schema."order" (
    id integer NOT NULL,
    status character varying NOT NULL,
    date_payment date,
    client_id integer NOT NULL
);


ALTER TABLE luch_schema."order" OWNER TO postgres;

--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE "order"; Type: COMMENT; Schema: luch_schema; Owner: postgres
--

COMMENT ON TABLE luch_schema."order" IS 'Таблица содержит детали заказа со ссылкой на клиентскую базу по номеру клиента. ';


--
-- TOC entry 198 (class 1259 OID 16405)
-- Name: price_list; Type: TABLE; Schema: luch_schema; Owner: postgres
--

CREATE TABLE luch_schema.price_list (
    id integer NOT NULL,
    service character varying NOT NULL,
    price integer NOT NULL
);


ALTER TABLE luch_schema.price_list OWNER TO postgres;

--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE price_list; Type: COMMENT; Schema: luch_schema; Owner: postgres
--

COMMENT ON TABLE luch_schema.price_list IS 'Таблица содержит прайс-лист агентства. ';


--
-- TOC entry 199 (class 1259 OID 16410)
-- Name: worker; Type: TABLE; Schema: luch_schema; Owner: postgres
--

CREATE TABLE luch_schema.worker (
    id integer NOT NULL,
    full_name character varying NOT NULL,
    email character varying NOT NULL,
    phone_number character varying NOT NULL,
    profession character varying NOT NULL
);


ALTER TABLE luch_schema.worker OWNER TO postgres;

--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE worker; Type: COMMENT; Schema: luch_schema; Owner: postgres
--

COMMENT ON TABLE luch_schema.worker IS 'Таблица содержит данные по сотрудникам агентства Луч. Каждому сотруднику соответствует уникальный номер, имя заказчика, контактная информация а также профиль сотрудника. ';


--
-- TOC entry 3180 (class 0 OID 16395)
-- Dependencies: 196
-- Data for Name: client; Type: TABLE DATA; Schema: luch_schema; Owner: postgres
--

COPY luch_schema.client (id, full_name, email, phone_number) FROM stdin;
2045	Steve Handerson	12345@gmail.com	+1-921-8729402
76739	Maria Lubyatova	678910@gmail.com	+1-921-2933810
8294	Caren Smith	76782@gmail.com	+1-921-6663027
87450	Robert Perkinson	9278932@gmail.com	+1-921-5102946
932894	Stewart Lee	9847294@gmail.com	+1-921-7710378
\.


--
-- TOC entry 3186 (class 0 OID 16481)
-- Dependencies: 202
-- Data for Name: content_material; Type: TABLE DATA; Schema: luch_schema; Owner: postgres
--

COPY luch_schema.content_material (material_id, order_description, price) FROM stdin;
3	description 1	500
2	description 2	600
5	description 3	200
1	description 4	700
4	description 5	900
\.


--
-- TOC entry 3185 (class 0 OID 16474)
-- Dependencies: 201
-- Data for Name: content_order; Type: TABLE DATA; Schema: luch_schema; Owner: postgres
--

COPY luch_schema.content_order (order_id, service_id, final_price, date_forming, description, worker_id) FROM stdin;
2	165	1000	2018-01-23	description 2	786374
3	77203	900	2018-01-20	description 3	47292
1	77403	800	2018-01-18	description 1	90328
4	99834	700	2018-01-19	description 4	635273
5	77485	600	2018-01-02	description 5	635273
\.


--
-- TOC entry 3181 (class 0 OID 16400)
-- Dependencies: 197
-- Data for Name: material_list; Type: TABLE DATA; Schema: luch_schema; Owner: postgres
--

COPY luch_schema.material_list (id, measure, amount) FROM stdin;
1	22 x 1080 inch	3
2	150 x 350 inch	6
3	64 x 1080 inch	1
4	22 x 1080 inch	7
5	70 x 50 m	2
\.


--
-- TOC entry 3184 (class 0 OID 16471)
-- Dependencies: 200
-- Data for Name: order; Type: TABLE DATA; Schema: luch_schema; Owner: postgres
--

COPY luch_schema."order" (id, status, date_payment, client_id) FROM stdin;
2	non-paid	\N	76739
3	non-paid	\N	8294
1	paid	2019-03-23	2045
4	paid	2018-04-12	87450
5	paid	2019-03-25	932894
\.


--
-- TOC entry 3182 (class 0 OID 16405)
-- Dependencies: 198
-- Data for Name: price_list; Type: TABLE DATA; Schema: luch_schema; Owner: postgres
--

COPY luch_schema.price_list (id, service, price) FROM stdin;
77485	Poster	75
165	Ad video	92
77203	Ad audio	90
77403	Wall ad	100
99834	Online ad	50
\.


--
-- TOC entry 3183 (class 0 OID 16410)
-- Dependencies: 199
-- Data for Name: worker; Type: TABLE DATA; Schema: luch_schema; Owner: postgres
--

COPY luch_schema.worker (id, full_name, email, phone_number, profession) FROM stdin;
283095	Margarett Tetcher	tetcher@gmail.com	+1-911-8730275	designer
786374	George Washington	washington@gmail.com	+1-911-9961082	designer
635273	Robert E. Lee	lee@gmail.com	+1-911-7710936	designer
47292	Richard Nixon	nixon@gmail.com	+1-911-9902745	designer
90328	Boris Eltsin	eltsin@gmail.com	+1-911-8209564	designer
\.


--
-- TOC entry 3038 (class 2606 OID 16399)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 3050 (class 2606 OID 16525)
-- Name: content_material content_material_order_description_key; Type: CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.content_material
    ADD CONSTRAINT content_material_order_description_key UNIQUE (order_description);


--
-- TOC entry 3052 (class 2606 OID 16555)
-- Name: content_material content_material_pkey; Type: CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.content_material
    ADD CONSTRAINT content_material_pkey PRIMARY KEY (order_description);


--
-- TOC entry 3048 (class 2606 OID 16557)
-- Name: content_order content_order_pkey; Type: CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.content_order
    ADD CONSTRAINT content_order_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3040 (class 2606 OID 16404)
-- Name: material_list material_list_pkey; Type: CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.material_list
    ADD CONSTRAINT material_list_pkey PRIMARY KEY (id);


--
-- TOC entry 3046 (class 2606 OID 16493)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 3042 (class 2606 OID 16409)
-- Name: price_list price_list_pkey; Type: CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.price_list
    ADD CONSTRAINT price_list_pkey PRIMARY KEY (id);


--
-- TOC entry 3044 (class 2606 OID 16417)
-- Name: worker worker_pkey; Type: CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (id);


--
-- TOC entry 3058 (class 2606 OID 16549)
-- Name: content_material content_material_material_id_fkey; Type: FK CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.content_material
    ADD CONSTRAINT content_material_material_id_fkey FOREIGN KEY (material_id) REFERENCES luch_schema.material_list(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3057 (class 2606 OID 16526)
-- Name: content_order content_order_description_fkey; Type: FK CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.content_order
    ADD CONSTRAINT content_order_description_fkey FOREIGN KEY (description) REFERENCES luch_schema.content_material(order_description) NOT VALID;


--
-- TOC entry 3054 (class 2606 OID 16509)
-- Name: content_order content_order_order_id_fkey; Type: FK CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.content_order
    ADD CONSTRAINT content_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES luch_schema."order"(id) NOT VALID;


--
-- TOC entry 3055 (class 2606 OID 16514)
-- Name: content_order content_order_service_id_fkey; Type: FK CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.content_order
    ADD CONSTRAINT content_order_service_id_fkey FOREIGN KEY (service_id) REFERENCES luch_schema.price_list(id) NOT VALID;


--
-- TOC entry 3056 (class 2606 OID 16519)
-- Name: content_order content_order_worker_id_fkey; Type: FK CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema.content_order
    ADD CONSTRAINT content_order_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES luch_schema.worker(id) NOT VALID;


--
-- TOC entry 3053 (class 2606 OID 16531)
-- Name: order order_client_id_fkey; Type: FK CONSTRAINT; Schema: luch_schema; Owner: postgres
--

ALTER TABLE ONLY luch_schema."order"
    ADD CONSTRAINT order_client_id_fkey FOREIGN KEY (client_id) REFERENCES luch_schema.client(id) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-05-11 18:58:50 EEST

--
-- PostgreSQL database dump complete
--

