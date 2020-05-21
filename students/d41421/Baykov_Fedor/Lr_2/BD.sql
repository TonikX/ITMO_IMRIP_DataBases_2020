--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

-- Started on 2020-05-14 19:33:43

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

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16412)
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    author_id integer NOT NULL,
    firstname character varying(30) NOT NULL,
    middlename character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16433)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    book_id integer NOT NULL,
    example_id integer NOT NULL,
    date_of_fixing_to_reader timestamp with time zone
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16420)
-- Name: book_example; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_example (
    example_id integer NOT NULL,
    book_name character varying NOT NULL,
    author_id integer NOT NULL,
    publisher character varying,
    year_of_publishing date,
    genre character varying
);


ALTER TABLE public.book_example OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16398)
-- Name: reader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reader (
    academic_degree boolean,
    address character varying,
    date_of_birth date,
    date_of_registration timestamp with time zone,
    full_name character varying NOT NULL,
    passport bigint NOT NULL,
    reader_id integer NOT NULL,
    telephone bigint NOT NULL,
    reading_room_id integer,
    education character varying
);


ALTER TABLE public.reader OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16453)
-- Name: reading_room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reading_room (
    name character varying,
    capacity integer,
    reading_room_id integer NOT NULL
);


ALTER TABLE public.reading_room OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16443)
-- Name: taking_a_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taking_a_book (
    reader integer NOT NULL,
    book integer NOT NULL,
    date_of_taking timestamp with time zone NOT NULL
);


ALTER TABLE public.taking_a_book OWNER TO postgres;

--
-- TOC entry 2858 (class 0 OID 16412)
-- Dependencies: 197
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (author_id, firstname, middlename, lastname) FROM stdin;
1	Александр	Сергеевич	Пушкин
2	Фёдор	Михайлович	Достоевский
3	Лев	Николаевич	Толстой
4	Антон	Павлович	Чехов
\.


--
-- TOC entry 2860 (class 0 OID 16433)
-- Dependencies: 199
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (book_id, example_id, date_of_fixing_to_reader) FROM stdin;
2	2	2019-11-25 11:34:00+03
3	3	2020-02-10 13:09:00+03
4	4	2018-11-01 15:01:00+03
5	5	2017-07-30 09:57:00+03
1	1	2019-09-13 12:17:00+03
\.


--
-- TOC entry 2859 (class 0 OID 16420)
-- Dependencies: 198
-- Data for Name: book_example; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_example (example_id, book_name, author_id, publisher, year_of_publishing, genre) FROM stdin;
1	Скучная история	4	Отечественная проза	1986-09-01	Повесть
2	Руслан и Людмила	1	Отечественная проза	1977-09-01	Поэма
3	Война и мир	3	Азбука	2009-09-01	Роман-эпопея
4	Преступление и наказание	2	Азбука	2018-05-01	Роман
5	Идиот	2	Азбука	2018-05-01	Роман
\.


--
-- TOC entry 2857 (class 0 OID 16398)
-- Dependencies: 196
-- Data for Name: reader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reader (academic_degree, address, date_of_birth, date_of_registration, full_name, passport, reader_id, telephone, reading_room_id, education) FROM stdin;
t	г. Москва, ул. Пушкина д.3, кв. 130	1987-05-23	2011-01-01 12:00:00+03	Петр Петрович Петров	12	1	89211113322	2	Высшее
f	г. Москва, ул. Пушкина д.4, кв. 120	2000-01-13	2014-02-10 14:09:00+04	Федор Федорович Федоров	13	2	89111236589	1	Среднее
t	г. Москва, ул. Ленина д.10, кв. 23	1976-12-01	2017-09-16 14:04:00+03	Владимир Владимирович Владимиров	14	3	89211234567	1	Высшее
t	г. Санкт-Петербург, ул. Сталина, д.23, кв.130	1945-02-06	2007-10-16 17:25:00+04	Дмитрий Дмитриевич Дмитриев	15	4	89210000000	2	Высшее
\.


--
-- TOC entry 2862 (class 0 OID 16453)
-- Dependencies: 201
-- Data for Name: reading_room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reading_room (name, capacity, reading_room_id) FROM stdin;
Малый читательный зал	50	1
Большой читательный зал	150	2
\.


--
-- TOC entry 2861 (class 0 OID 16443)
-- Dependencies: 200
-- Data for Name: taking_a_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taking_a_book (reader, book, date_of_taking) FROM stdin;
1	3	2020-02-10 13:09:00+03
4	2	2019-11-25 11:34:00+03
2	4	2018-11-01 15:01:00+03
3	5	2017-07-30 09:57:00+03
4	1	2019-09-13 12:17:00+03
\.


--
-- TOC entry 2711 (class 2606 OID 16419)
-- Name: author author_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_id PRIMARY KEY (author_id);


--
-- TOC entry 2713 (class 2606 OID 16527)
-- Name: author author_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_id_unique UNIQUE (author_id);


--
-- TOC entry 2723 (class 2606 OID 16523)
-- Name: taking_a_book book_; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taking_a_book
    ADD CONSTRAINT book_ UNIQUE (book);


--
-- TOC entry 2719 (class 2606 OID 16437)
-- Name: book book_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_id PRIMARY KEY (book_id) INCLUDE (book_id);


--
-- TOC entry 2721 (class 2606 OID 16525)
-- Name: book book_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_id_unique UNIQUE (book_id);


--
-- TOC entry 2725 (class 2606 OID 16447)
-- Name: taking_a_book date_of_taking; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taking_a_book
    ADD CONSTRAINT date_of_taking PRIMARY KEY (date_of_taking) INCLUDE (date_of_taking);


--
-- TOC entry 2715 (class 2606 OID 16427)
-- Name: book_example example_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_example
    ADD CONSTRAINT example_id PRIMARY KEY (example_id);


--
-- TOC entry 2717 (class 2606 OID 16529)
-- Name: book_example example_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_example
    ADD CONSTRAINT example_id_unique UNIQUE (example_id);


--
-- TOC entry 2727 (class 2606 OID 16531)
-- Name: reading_room read_room_id_unq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reading_room
    ADD CONSTRAINT read_room_id_unq UNIQUE (reading_room_id);


--
-- TOC entry 2707 (class 2606 OID 16405)
-- Name: reader reader_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader
    ADD CONSTRAINT reader_id PRIMARY KEY (reader_id);


--
-- TOC entry 2709 (class 2606 OID 16533)
-- Name: reader reader_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader
    ADD CONSTRAINT reader_id_unique UNIQUE (reader_id);


--
-- TOC entry 2729 (class 2606 OID 16460)
-- Name: reading_room reading_room_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reading_room
    ADD CONSTRAINT reading_room_id PRIMARY KEY (reading_room_id) INCLUDE (reading_room_id);


--
-- TOC entry 2731 (class 2606 OID 16461)
-- Name: book_example author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_example
    ADD CONSTRAINT author_id FOREIGN KEY (author_id) REFERENCES public.author(author_id) NOT VALID;


--
-- TOC entry 2735 (class 2606 OID 16486)
-- Name: taking_a_book book; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taking_a_book
    ADD CONSTRAINT book FOREIGN KEY (book) REFERENCES public.book(book_id) NOT VALID;


--
-- TOC entry 2733 (class 2606 OID 16550)
-- Name: book date_of_fixing_to_reader; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT date_of_fixing_to_reader FOREIGN KEY (date_of_fixing_to_reader) REFERENCES public.taking_a_book(date_of_taking) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2732 (class 2606 OID 16438)
-- Name: book example_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT example_id FOREIGN KEY (book_id) REFERENCES public.book_example(example_id);


--
-- TOC entry 2734 (class 2606 OID 16481)
-- Name: taking_a_book reader; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taking_a_book
    ADD CONSTRAINT reader FOREIGN KEY (reader) REFERENCES public.reader(reader_id) NOT VALID;


--
-- TOC entry 2730 (class 2606 OID 16476)
-- Name: reader reading_room_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader
    ADD CONSTRAINT reading_room_id FOREIGN KEY (reading_room_id) REFERENCES public.reading_room(reading_room_id) NOT VALID;


-- Completed on 2020-05-14 19:33:44

--
-- PostgreSQL database dump complete
--

