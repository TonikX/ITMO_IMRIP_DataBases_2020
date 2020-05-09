--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-09 23:19:44 MSK

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
-- TOC entry 6 (class 2615 OID 24577)
-- Name: hmm; Type: SCHEMA; Schema: -; Owner: fowku
--

CREATE SCHEMA hmm;


ALTER SCHEMA hmm OWNER TO fowku;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 207 (class 1259 OID 32796)
-- Name: Class; Type: TABLE; Schema: hmm; Owner: fowku
--

CREATE TABLE hmm."Class" (
    id integer NOT NULL,
    name character varying(30),
    teacher_id integer NOT NULL
);


ALTER TABLE hmm."Class" OWNER TO fowku;

--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE "Class"; Type: COMMENT; Schema: hmm; Owner: fowku
--

COMMENT ON TABLE hmm."Class" IS 'Список учебных классов (10б, 3а и т.д.)';


--
-- TOC entry 205 (class 1259 OID 32792)
-- Name: Class_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Class_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Class_id_seq" OWNER TO fowku;

--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 205
-- Name: Class_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Class_id_seq" OWNED BY hmm."Class".id;


--
-- TOC entry 206 (class 1259 OID 32794)
-- Name: Class_teacher_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Class_teacher_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Class_teacher_id_seq" OWNER TO fowku;

--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 206
-- Name: Class_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Class_teacher_id_seq" OWNED BY hmm."Class".teacher_id;


--
-- TOC entry 215 (class 1259 OID 32836)
-- Name: Classroom; Type: TABLE; Schema: hmm; Owner: fowku
--

CREATE TABLE hmm."Classroom" (
    id integer NOT NULL,
    number integer,
    teacher_id integer
);


ALTER TABLE hmm."Classroom" OWNER TO fowku;

--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE "Classroom"; Type: COMMENT; Schema: hmm; Owner: fowku
--

COMMENT ON TABLE hmm."Classroom" IS 'Список кабинетов';


--
-- TOC entry 213 (class 1259 OID 32832)
-- Name: Classroom_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Classroom_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Classroom_id_seq" OWNER TO fowku;

--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 213
-- Name: Classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Classroom_id_seq" OWNED BY hmm."Classroom".id;


--
-- TOC entry 214 (class 1259 OID 32834)
-- Name: Classroom_teacher_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Classroom_teacher_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Classroom_teacher_id_seq" OWNER TO fowku;

--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 214
-- Name: Classroom_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Classroom_teacher_id_seq" OWNED BY hmm."Classroom".teacher_id;


--
-- TOC entry 212 (class 1259 OID 32826)
-- Name: Course; Type: TABLE; Schema: hmm; Owner: fowku
--

CREATE TABLE hmm."Course" (
    id integer NOT NULL,
    type character varying(10) NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE hmm."Course" OWNER TO fowku;

--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE "Course"; Type: COMMENT; Schema: hmm; Owner: fowku
--

COMMENT ON TABLE hmm."Course" IS 'Список курсов (уроков)';


--
-- TOC entry 211 (class 1259 OID 32824)
-- Name: Course_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Course_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Course_id_seq" OWNER TO fowku;

--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 211
-- Name: Course_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Course_id_seq" OWNED BY hmm."Course".id;


--
-- TOC entry 218 (class 1259 OID 32852)
-- Name: Mark; Type: TABLE; Schema: hmm; Owner: fowku
--

CREATE TABLE hmm."Mark" (
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    mark integer NOT NULL,
    module integer NOT NULL
);


ALTER TABLE hmm."Mark" OWNER TO fowku;

--
-- TOC entry 3309 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE "Mark"; Type: COMMENT; Schema: hmm; Owner: fowku
--

COMMENT ON TABLE hmm."Mark" IS 'Таблица с оценками учеников по модулям';


--
-- TOC entry 217 (class 1259 OID 32850)
-- Name: Mark_course_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Mark_course_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Mark_course_id_seq" OWNER TO fowku;

--
-- TOC entry 3310 (class 0 OID 0)
-- Dependencies: 217
-- Name: Mark_course_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Mark_course_id_seq" OWNED BY hmm."Mark".course_id;


--
-- TOC entry 216 (class 1259 OID 32848)
-- Name: Mark_student_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Mark_student_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Mark_student_id_seq" OWNER TO fowku;

--
-- TOC entry 3311 (class 0 OID 0)
-- Dependencies: 216
-- Name: Mark_student_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Mark_student_id_seq" OWNED BY hmm."Mark".student_id;


--
-- TOC entry 223 (class 1259 OID 32877)
-- Name: Schedule; Type: TABLE; Schema: hmm; Owner: fowku
--

CREATE TABLE hmm."Schedule" (
    teacher_id integer NOT NULL,
    course_id integer NOT NULL,
    classroom_id integer NOT NULL,
    class_id integer NOT NULL,
    "time" time(6) with time zone NOT NULL,
    course_number integer NOT NULL,
    day character varying NOT NULL
);


ALTER TABLE hmm."Schedule" OWNER TO fowku;

--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE "Schedule"; Type: COMMENT; Schema: hmm; Owner: fowku
--

COMMENT ON TABLE hmm."Schedule" IS 'Таблица с расписанием занятий';


--
-- TOC entry 222 (class 1259 OID 32875)
-- Name: Schedule_class_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Schedule_class_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Schedule_class_id_seq" OWNER TO fowku;

--
-- TOC entry 3313 (class 0 OID 0)
-- Dependencies: 222
-- Name: Schedule_class_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Schedule_class_id_seq" OWNED BY hmm."Schedule".class_id;


--
-- TOC entry 221 (class 1259 OID 32873)
-- Name: Schedule_classroom_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Schedule_classroom_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Schedule_classroom_id_seq" OWNER TO fowku;

--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 221
-- Name: Schedule_classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Schedule_classroom_id_seq" OWNED BY hmm."Schedule".classroom_id;


--
-- TOC entry 220 (class 1259 OID 32871)
-- Name: Schedule_course_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Schedule_course_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Schedule_course_id_seq" OWNER TO fowku;

--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 220
-- Name: Schedule_course_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Schedule_course_id_seq" OWNED BY hmm."Schedule".course_id;


--
-- TOC entry 219 (class 1259 OID 32869)
-- Name: Schedule_teacher_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Schedule_teacher_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Schedule_teacher_id_seq" OWNER TO fowku;

--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 219
-- Name: Schedule_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Schedule_teacher_id_seq" OWNED BY hmm."Schedule".teacher_id;


--
-- TOC entry 210 (class 1259 OID 32812)
-- Name: Student; Type: TABLE; Schema: hmm; Owner: fowku
--

CREATE TABLE hmm."Student" (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    date_of_birth date NOT NULL,
    surname character varying(30) NOT NULL,
    class_id integer NOT NULL,
    sex character varying(6) NOT NULL
);


ALTER TABLE hmm."Student" OWNER TO fowku;

--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE "Student"; Type: COMMENT; Schema: hmm; Owner: fowku
--

COMMENT ON TABLE hmm."Student" IS 'Список учеников';


--
-- TOC entry 209 (class 1259 OID 32810)
-- Name: Student_class_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Student_class_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Student_class_id_seq" OWNER TO fowku;

--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 209
-- Name: Student_class_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Student_class_id_seq" OWNED BY hmm."Student".class_id;


--
-- TOC entry 208 (class 1259 OID 32808)
-- Name: Student_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Student_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Student_id_seq" OWNER TO fowku;

--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 208
-- Name: Student_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Student_id_seq" OWNED BY hmm."Student".id;


--
-- TOC entry 204 (class 1259 OID 32786)
-- Name: Teacher; Type: TABLE; Schema: hmm; Owner: fowku
--

CREATE TABLE hmm."Teacher" (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    surname character varying(30) NOT NULL
);


ALTER TABLE hmm."Teacher" OWNER TO fowku;

--
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE "Teacher"; Type: COMMENT; Schema: hmm; Owner: fowku
--

COMMENT ON TABLE hmm."Teacher" IS 'Список учителей';


--
-- TOC entry 203 (class 1259 OID 32784)
-- Name: Teacher_id_seq; Type: SEQUENCE; Schema: hmm; Owner: fowku
--

CREATE SEQUENCE hmm."Teacher_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmm."Teacher_id_seq" OWNER TO fowku;

--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 203
-- Name: Teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: hmm; Owner: fowku
--

ALTER SEQUENCE hmm."Teacher_id_seq" OWNED BY hmm."Teacher".id;


--
-- TOC entry 3113 (class 2604 OID 32799)
-- Name: Class id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Class" ALTER COLUMN id SET DEFAULT nextval('hmm."Class_id_seq"'::regclass);


--
-- TOC entry 3114 (class 2604 OID 32800)
-- Name: Class teacher_id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Class" ALTER COLUMN teacher_id SET DEFAULT nextval('hmm."Class_teacher_id_seq"'::regclass);


--
-- TOC entry 3118 (class 2604 OID 32839)
-- Name: Classroom id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Classroom" ALTER COLUMN id SET DEFAULT nextval('hmm."Classroom_id_seq"'::regclass);


--
-- TOC entry 3119 (class 2604 OID 32840)
-- Name: Classroom teacher_id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Classroom" ALTER COLUMN teacher_id SET DEFAULT nextval('hmm."Classroom_teacher_id_seq"'::regclass);


--
-- TOC entry 3117 (class 2604 OID 32829)
-- Name: Course id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Course" ALTER COLUMN id SET DEFAULT nextval('hmm."Course_id_seq"'::regclass);


--
-- TOC entry 3120 (class 2604 OID 32855)
-- Name: Mark student_id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Mark" ALTER COLUMN student_id SET DEFAULT nextval('hmm."Mark_student_id_seq"'::regclass);


--
-- TOC entry 3121 (class 2604 OID 32856)
-- Name: Mark course_id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Mark" ALTER COLUMN course_id SET DEFAULT nextval('hmm."Mark_course_id_seq"'::regclass);


--
-- TOC entry 3122 (class 2604 OID 32880)
-- Name: Schedule teacher_id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Schedule" ALTER COLUMN teacher_id SET DEFAULT nextval('hmm."Schedule_teacher_id_seq"'::regclass);


--
-- TOC entry 3123 (class 2604 OID 32881)
-- Name: Schedule course_id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Schedule" ALTER COLUMN course_id SET DEFAULT nextval('hmm."Schedule_course_id_seq"'::regclass);


--
-- TOC entry 3124 (class 2604 OID 32882)
-- Name: Schedule classroom_id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Schedule" ALTER COLUMN classroom_id SET DEFAULT nextval('hmm."Schedule_classroom_id_seq"'::regclass);


--
-- TOC entry 3125 (class 2604 OID 32883)
-- Name: Schedule class_id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Schedule" ALTER COLUMN class_id SET DEFAULT nextval('hmm."Schedule_class_id_seq"'::regclass);


--
-- TOC entry 3115 (class 2604 OID 32815)
-- Name: Student id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Student" ALTER COLUMN id SET DEFAULT nextval('hmm."Student_id_seq"'::regclass);


--
-- TOC entry 3116 (class 2604 OID 32816)
-- Name: Student class_id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Student" ALTER COLUMN class_id SET DEFAULT nextval('hmm."Student_class_id_seq"'::regclass);


--
-- TOC entry 3112 (class 2604 OID 32789)
-- Name: Teacher id; Type: DEFAULT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Teacher" ALTER COLUMN id SET DEFAULT nextval('hmm."Teacher_id_seq"'::regclass);


--
-- TOC entry 3279 (class 0 OID 32796)
-- Dependencies: 207
-- Data for Name: Class; Type: TABLE DATA; Schema: hmm; Owner: fowku
--

COPY hmm."Class" (id, name, teacher_id) FROM stdin;
0	5А	2
1	7Б	1
2	3В	3
3	9А	5
4	11А	0
\.


--
-- TOC entry 3287 (class 0 OID 32836)
-- Dependencies: 215
-- Data for Name: Classroom; Type: TABLE DATA; Schema: hmm; Owner: fowku
--

COPY hmm."Classroom" (id, number, teacher_id) FROM stdin;
0	215	0
1	253	1
2	216	2
3	246	4
4	365	3
\.


--
-- TOC entry 3284 (class 0 OID 32826)
-- Dependencies: 212
-- Data for Name: Course; Type: TABLE DATA; Schema: hmm; Owner: fowku
--

COPY hmm."Course" (id, type, name) FROM stdin;
0	common	Русский язык
1	extra	Экономика
2	common	Математика
3	extra	Религиоведение
4	common	Литература
\.


--
-- TOC entry 3290 (class 0 OID 32852)
-- Dependencies: 218
-- Data for Name: Mark; Type: TABLE DATA; Schema: hmm; Owner: fowku
--

COPY hmm."Mark" (student_id, course_id, mark, module) FROM stdin;
0	0	4	2
1	2	3	3
0	4	5	4
2	1	5	1
4	0	4	2
\.


--
-- TOC entry 3295 (class 0 OID 32877)
-- Dependencies: 223
-- Data for Name: Schedule; Type: TABLE DATA; Schema: hmm; Owner: fowku
--

COPY hmm."Schedule" (teacher_id, course_id, classroom_id, class_id, "time", course_number, day) FROM stdin;
0	3	1	2	08:00:00+03	1	monday
2	0	4	4	09:00:00+03	2	tuesday
4	2	2	1	08:00:00+03	1	wednesday
1	4	0	3	10:15:00+03	3	thursday
3	1	3	0	09:00:00+03	2	monday
\.


--
-- TOC entry 3282 (class 0 OID 32812)
-- Dependencies: 210
-- Data for Name: Student; Type: TABLE DATA; Schema: hmm; Owner: fowku
--

COPY hmm."Student" (id, name, date_of_birth, surname, class_id, sex) FROM stdin;
0	Чара	2000-03-21	Гусева	1	female
3	Шамиль	2005-12-23	Гаврилов	1	male
1	Кир	2003-11-04	Колобов	0	male
2	Инна	2000-03-04	Пархоменко	3	female
4	Йолика	2000-07-27	Козлова	2	female
\.


--
-- TOC entry 3276 (class 0 OID 32786)
-- Dependencies: 204
-- Data for Name: Teacher; Type: TABLE DATA; Schema: hmm; Owner: fowku
--

COPY hmm."Teacher" (id, name, surname) FROM stdin;
1	Иван	Иванов
2	Олег	Кирсанов
3	Анна	Бердник
4	Анастасия	Яковлева
5	Семен	Цебро
0	Мария	Викторова
\.


--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 205
-- Name: Class_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Class_id_seq"', 1, false);


--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 206
-- Name: Class_teacher_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Class_teacher_id_seq"', 1, false);


--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 213
-- Name: Classroom_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Classroom_id_seq"', 1, false);


--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 214
-- Name: Classroom_teacher_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Classroom_teacher_id_seq"', 1, false);


--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 211
-- Name: Course_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Course_id_seq"', 1, false);


--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 217
-- Name: Mark_course_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Mark_course_id_seq"', 1, false);


--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 216
-- Name: Mark_student_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Mark_student_id_seq"', 1, false);


--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 222
-- Name: Schedule_class_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Schedule_class_id_seq"', 1, false);


--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 221
-- Name: Schedule_classroom_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Schedule_classroom_id_seq"', 1, false);


--
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 220
-- Name: Schedule_course_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Schedule_course_id_seq"', 1, false);


--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 219
-- Name: Schedule_teacher_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Schedule_teacher_id_seq"', 1, false);


--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 209
-- Name: Student_class_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Student_class_id_seq"', 1, false);


--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 208
-- Name: Student_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Student_id_seq"', 1, false);


--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 203
-- Name: Teacher_id_seq; Type: SEQUENCE SET; Schema: hmm; Owner: fowku
--

SELECT pg_catalog.setval('hmm."Teacher_id_seq"', 1, false);


--
-- TOC entry 3137 (class 2606 OID 32858)
-- Name: Mark Mark_pkey; Type: CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Mark"
    ADD CONSTRAINT "Mark_pkey" PRIMARY KEY (student_id, course_id);


--
-- TOC entry 3139 (class 2606 OID 32885)
-- Name: Schedule Schedule_pkey; Type: CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Schedule"
    ADD CONSTRAINT "Schedule_pkey" PRIMARY KEY (teacher_id, course_id, classroom_id, class_id);


--
-- TOC entry 3129 (class 2606 OID 32802)
-- Name: Class class_id; Type: CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Class"
    ADD CONSTRAINT class_id PRIMARY KEY (id);


--
-- TOC entry 3135 (class 2606 OID 32842)
-- Name: Classroom classroom_id; Type: CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Classroom"
    ADD CONSTRAINT classroom_id PRIMARY KEY (id);


--
-- TOC entry 3133 (class 2606 OID 32831)
-- Name: Course course_id; Type: CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Course"
    ADD CONSTRAINT course_id PRIMARY KEY (id);


--
-- TOC entry 3131 (class 2606 OID 32818)
-- Name: Student student_it; Type: CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Student"
    ADD CONSTRAINT student_it PRIMARY KEY (id);


--
-- TOC entry 3127 (class 2606 OID 32791)
-- Name: Teacher teacher_id; Type: CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Teacher"
    ADD CONSTRAINT teacher_id PRIMARY KEY (id);


--
-- TOC entry 3141 (class 2606 OID 32819)
-- Name: Student class_id; Type: FK CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Student"
    ADD CONSTRAINT class_id FOREIGN KEY (class_id) REFERENCES hmm."Class"(id);


--
-- TOC entry 3148 (class 2606 OID 32901)
-- Name: Schedule class_id; Type: FK CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Schedule"
    ADD CONSTRAINT class_id FOREIGN KEY (class_id) REFERENCES hmm."Class"(id);


--
-- TOC entry 3147 (class 2606 OID 32896)
-- Name: Schedule classroom_id; Type: FK CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Schedule"
    ADD CONSTRAINT classroom_id FOREIGN KEY (classroom_id) REFERENCES hmm."Classroom"(id);


--
-- TOC entry 3144 (class 2606 OID 32864)
-- Name: Mark course_id; Type: FK CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Mark"
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES hmm."Course"(id);


--
-- TOC entry 3146 (class 2606 OID 32891)
-- Name: Schedule course_id; Type: FK CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Schedule"
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES hmm."Course"(id);


--
-- TOC entry 3143 (class 2606 OID 32859)
-- Name: Mark student_id; Type: FK CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Mark"
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES hmm."Student"(id);


--
-- TOC entry 3140 (class 2606 OID 32803)
-- Name: Class teacher_id; Type: FK CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Class"
    ADD CONSTRAINT teacher_id FOREIGN KEY (teacher_id) REFERENCES hmm."Teacher"(id);


--
-- TOC entry 3142 (class 2606 OID 32843)
-- Name: Classroom teacher_id; Type: FK CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Classroom"
    ADD CONSTRAINT teacher_id FOREIGN KEY (teacher_id) REFERENCES hmm."Teacher"(id);


--
-- TOC entry 3145 (class 2606 OID 32886)
-- Name: Schedule teacher_id; Type: FK CONSTRAINT; Schema: hmm; Owner: fowku
--

ALTER TABLE ONLY hmm."Schedule"
    ADD CONSTRAINT teacher_id FOREIGN KEY (teacher_id) REFERENCES hmm."Teacher"(id);


-- Completed on 2020-05-09 23:19:44 MSK

--
-- PostgreSQL database dump complete
--

