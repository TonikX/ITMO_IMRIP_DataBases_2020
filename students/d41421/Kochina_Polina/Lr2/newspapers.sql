--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-11 00:50:39

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
-- TOC entry 206 (class 1259 OID 16690)
-- Name: delivery; Type: TABLE; Schema: public; Owner: postgres
--

--Таблица описывает доставку газеты
--до почтового отделения
--Имеет поля:
--	Номер доставки
--	Номер тиража
--	Название газеты
--	Номер почтового отеделния
--	Кол-во доставляемых экземляров издания


CREATE TABLE public.delivery (
    delivery_num integer NOT NULL,
    edition_num integer NOT NULL,
    newspaper_name text NOT NULL,
    post_office_num integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.delivery OWNER TO postgres;

--
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE delivery; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.delivery IS 'Таблица описывает доставку тиража газеты в почтовое отделение';

--
-- TOC entry 205 (class 1259 OID 16677)
-- Name: edition; Type: TABLE; Schema: public; Owner: postgres
--

--Таблица описывает тираж газеты
--Имеет поля:
--	Номер тиража газеты
--	Название газеты
--	Цена экземляра
--	Кол-во экземляров


CREATE TABLE public.edition (
    edition_num integer NOT NULL,
    newspaper_name text NOT NULL,
    price money NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.edition OWNER TO postgres;

--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE edition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.edition IS 'Таблица описывает тираж газеты';


--
-- TOC entry 202 (class 1259 OID 16653)
-- Name: newspaper; Type: TABLE; Schema: public; Owner: postgres
--

--Таблица описывает сущность газеты
--Имеет поля:
--	Название Газеты
--	Индекс газеты
--	Имя редактора
--	Фамилия редактора
--	Отчество редактора

CREATE TABLE public.newspaper (
    newspaper_name text NOT NULL,
    index integer NOT NULL,
    editor_name text NOT NULL,
    editor_surname text NOT NULL,
    editor_patronymic text
);


ALTER TABLE public.newspaper OWNER TO postgres;

--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE newspaper; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.newspaper IS 'Таблица описывает газету';


--
-- TOC entry 203 (class 1259 OID 16661)
-- Name: post_office; Type: TABLE; Schema: public; Owner: postgres
--

--Таблица описывает сущность почтового отделения
--Имеет поля:
--	Номер почтового отеделния
--	Адрес почтового отделения


CREATE TABLE public.post_office (
    post_office_num integer NOT NULL,
    post_office_adress text NOT NULL
);


ALTER TABLE public.post_office OWNER TO postgres;

--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE post_office; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.post_office IS 'Таблица описывает почтовое отделение';


--
-- TOC entry 207 (class 1259 OID 16706)
-- Name: print; Type: TABLE; Schema: public; Owner: postgres
--

--Таблица описывает сущность заказа на печать
--тиража газеты в типографии
--Имеет поля:
--	Номер заказа
--	Номер тиража
--	Название типографии
--	Название газеты
--	Кол-во экземляров издания для печати


CREATE TABLE public.print (
    print_order_num integer NOT NULL,
    edition_num integer NOT NULL,
    printing_office_name text NOT NULL,
    newspaper_name text NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.print OWNER TO postgres;

--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE print; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.print IS 'Таблица описывает заказ на печать тиража газеты в типографии';


--
-- TOC entry 204 (class 1259 OID 16669)
-- Name: printing_office; Type: TABLE; Schema: public; Owner: postgres
--

--Таблица описывает сущность типографии
--Имеет поля:
--	Название типографии
--	Адрес типографии


CREATE TABLE public.printing_office (
    printing_office_name text NOT NULL,
    printing_office_adress text NOT NULL
);


ALTER TABLE public.printing_office OWNER TO postgres;

--
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE printing_office; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.printing_office IS 'Таблица описывает типографию';


--
-- TOC entry 2854 (class 0 OID 16690)
-- Dependencies: 206
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.delivery (delivery_num, edition_num, newspaper_name, post_office_num, amount) VALUES (747488, 2, 'Газета Пятая', 2020, 24676);
INSERT INTO public.delivery (delivery_num, edition_num, newspaper_name, post_office_num, amount) VALUES (413210, 1, 'Газета Первая', 904, 287);
INSERT INTO public.delivery (delivery_num, edition_num, newspaper_name, post_office_num, amount) VALUES (376763, 1, 'Газета Третья', 2222, 54392);
INSERT INTO public.delivery (delivery_num, edition_num, newspaper_name, post_office_num, amount) VALUES (393975, 1, 'Газета Первая', 904, 9820);
INSERT INTO public.delivery (delivery_num, edition_num, newspaper_name, post_office_num, amount) VALUES (284848, 1, 'Газета Вторая', 8737, 26670);


--
-- TOC entry 2853 (class 0 OID 16677)
-- Dependencies: 205
-- Data for Name: edition; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.edition (edition_num, newspaper_name, price, amount) VALUES (1, 'Газета Пятая', '10 000,00 ?', 700);
INSERT INTO public.edition (edition_num, newspaper_name, price, amount) VALUES (1, 'Газета Первая', '138 990,00 ?', 140000);
INSERT INTO public.edition (edition_num, newspaper_name, price, amount) VALUES (1, 'Газета Вторая', '13 120,00 ?', 1000);
INSERT INTO public.edition (edition_num, newspaper_name, price, amount) VALUES (1, 'Газета Третья', '7 230,00 ?', 250);
INSERT INTO public.edition (edition_num, newspaper_name, price, amount) VALUES (2, 'Газета Пятая', '11 250,00 ?', 750);


--
-- TOC entry 2850 (class 0 OID 16653)
-- Dependencies: 202
-- Data for Name: newspaper; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.newspaper (newspaper_name, index, editor_name, editor_surname, editor_patronymic) VALUES ('Газета Первая', 197089, 'Матвей', 'Матвеев', 'Матвеевич');
INSERT INTO public.newspaper (newspaper_name, index, editor_name, editor_surname, editor_patronymic) VALUES ('Газета Вторая', 257784, 'Антон', 'Антонов', 'Антонович');
INSERT INTO public.newspaper (newspaper_name, index, editor_name, editor_surname, editor_patronymic) VALUES ('Газета Третья', 189938, 'Владимир', 'Владимиров', 'Владимирович');
INSERT INTO public.newspaper (newspaper_name, index, editor_name, editor_surname, editor_patronymic) VALUES ('Газета Четвертая', 237485, 'Михаил', 'Михайлов', 'Михайлович');
INSERT INTO public.newspaper (newspaper_name, index, editor_name, editor_surname, editor_patronymic) VALUES ('Газета Пятая', 132242, 'Сергей', 'Сергеев', 'Сергеевич');


--
-- TOC entry 2851 (class 0 OID 16661)
-- Dependencies: 203
-- Data for Name: post_office; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.post_office (post_office_num, post_office_adress) VALUES (2020, 'Улица Маяковского, 25');
INSERT INTO public.post_office (post_office_num, post_office_adress) VALUES (3540, 'Улица Ленина, 3');
INSERT INTO public.post_office (post_office_num, post_office_adress) VALUES (8737, 'Проспект Ветеранов, 44');
INSERT INTO public.post_office (post_office_num, post_office_adress) VALUES (904, 'Улица Мира, 31');
INSERT INTO public.post_office (post_office_num, post_office_adress) VALUES (2222, 'Московский проспект, 11');


--
-- TOC entry 2855 (class 0 OID 16706)
-- Dependencies: 207
-- Data for Name: print; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.print (print_order_num, edition_num, printing_office_name, newspaper_name, amount) VALUES (1, 1, 'Типография Вторая', 'Газета Первая', 37373);
INSERT INTO public.print (print_order_num, edition_num, printing_office_name, newspaper_name, amount) VALUES (2, 1, 'Типография Третья', 'Газета Вторая', 48380);
INSERT INTO public.print (print_order_num, edition_num, printing_office_name, newspaper_name, amount) VALUES (3, 2, 'Типография Пятая', 'Газета Пятая', 477);
INSERT INTO public.print (print_order_num, edition_num, printing_office_name, newspaper_name, amount) VALUES (4, 1, 'Типография Вторая', 'Газета Третья', 9900);
INSERT INTO public.print (print_order_num, edition_num, printing_office_name, newspaper_name, amount) VALUES (5, 1, 'Типография Первая', 'Газета Пятая', 450);


--
-- TOC entry 2852 (class 0 OID 16669)
-- Dependencies: 204
-- Data for Name: printing_office; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.printing_office (printing_office_name, printing_office_adress) VALUES ('Типография Первая', '1-ая линия ВО, 55');
INSERT INTO public.printing_office (printing_office_name, printing_office_adress) VALUES ('Типография Вторая', 'Большеохтинский проспект, 45');
INSERT INTO public.printing_office (printing_office_name, printing_office_adress) VALUES ('Типография Третья', 'Московский проспект, 15');
INSERT INTO public.printing_office (printing_office_name, printing_office_adress) VALUES ('Типография Чевертая', '3-я улица Строителей, 5');
INSERT INTO public.printing_office (printing_office_name, printing_office_adress) VALUES ('Типография Пятая', 'Улица Ленина, 22');


--
-- TOC entry 2718 (class 2606 OID 16684)
-- Name: edition edition_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edition
    ADD CONSTRAINT edition_pk PRIMARY KEY (edition_num, newspaper_name);


--
-- TOC entry 2712 (class 2606 OID 16660)
-- Name: newspaper newspaper_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newspaper
    ADD CONSTRAINT newspaper_pk PRIMARY KEY (newspaper_name);


--
-- TOC entry 2714 (class 2606 OID 16668)
-- Name: post_office post_office_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office
    ADD CONSTRAINT post_office_pk PRIMARY KEY (post_office_num);


--
-- TOC entry 2716 (class 2606 OID 16676)
-- Name: printing_office printing_office_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.printing_office
    ADD CONSTRAINT printing_office_pk PRIMARY KEY (printing_office_name);


--
-- TOC entry 2720 (class 2606 OID 16696)
-- Name: delivery delivery_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_fk FOREIGN KEY (edition_num, newspaper_name) REFERENCES public.edition(edition_num, newspaper_name) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2719 (class 2606 OID 16685)
-- Name: edition edition_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edition
    ADD CONSTRAINT edition_fk FOREIGN KEY (newspaper_name) REFERENCES public.newspaper(newspaper_name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2721 (class 2606 OID 16701)
-- Name: delivery post_office_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT post_office_fk FOREIGN KEY (post_office_num) REFERENCES public.post_office(post_office_num) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2722 (class 2606 OID 16712)
-- Name: print print_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.print
    ADD CONSTRAINT print_fk FOREIGN KEY (edition_num, newspaper_name) REFERENCES public.edition(edition_num, newspaper_name) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2723 (class 2606 OID 16717)
-- Name: print printing_office_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.print
    ADD CONSTRAINT printing_office_fk FOREIGN KEY (printing_office_name) REFERENCES public.printing_office(printing_office_name) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2020-05-11 00:50:40

--
-- PostgreSQL database dump complete
--

