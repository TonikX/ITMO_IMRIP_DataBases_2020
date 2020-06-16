--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

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
-- Name: DBHotel; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "DBHotel";


ALTER SCHEMA "DBHotel" OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Administrator; Type: TABLE; Schema: DBHotel; Owner: postgres

--Таблица содержит в себе данные об администраторе, подтверждающем бронирования. 

CREATE TABLE "DBHotel"."Administrator" (
    "Admin_id" integer NOT NULL,
    "Name" character varying
);


ALTER TABLE "DBHotel"."Administrator" OWNER TO postgres;

--
-- Name: Administrator_Admin_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Administrator_Admin_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Administrator_Admin_id_seq" OWNER TO postgres;

--
-- Name: Administrator_Admin_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Administrator_Admin_id_seq" OWNED BY "DBHotel"."Administrator"."Admin_id";


--
-- Name: Booking; Type: TABLE; Schema: DBHotel; Owner: postgres
--

-- В таблице содержатся данные о номере и госте, совершившем бронирование. 

CREATE TABLE "DBHotel"."Booking" (
    booking_id bigint NOT NULL,
    checkin_date date,
    checkout_date date,
    guest_id bigint NOT NULL,
    room_id bigint NOT NULL,
    admin_id bigint NOT NULL,
    floor_id bigint NOT NULL
);


ALTER TABLE "DBHotel"."Booking" OWNER TO postgres;

--
-- Name: TABLE "Booking"; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel"."Booking" IS 'Бронирование номера';


--
-- Name: Booking_Guest_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Booking_Guest_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Booking_Guest_id_seq" OWNER TO postgres;

--
-- Name: Booking_Guest_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Booking_Guest_id_seq" OWNED BY "DBHotel"."Booking".guest_id;


--
-- Name: Booking_admin_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Booking_admin_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Booking_admin_id_seq" OWNER TO postgres;

--
-- Name: Booking_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Booking_admin_id_seq" OWNED BY "DBHotel"."Booking".admin_id;


--
-- Name: Booking_booking_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Booking_booking_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Booking_booking_id_seq" OWNER TO postgres;

--
-- Name: Booking_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Booking_booking_id_seq" OWNED BY "DBHotel"."Booking".booking_id;


--
-- Name: Booking_floor_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Booking_floor_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Booking_floor_id_seq" OWNER TO postgres;

--
-- Name: Booking_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Booking_floor_id_seq" OWNED BY "DBHotel"."Booking".floor_id;


--
-- Name: Booking_room_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Booking_room_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Booking_room_id_seq" OWNER TO postgres;

--
-- Name: Booking_room_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Booking_room_id_seq" OWNED BY "DBHotel"."Booking".room_id;


--
-- Name: Cleaning; Type: TABLE; Schema: DBHotel; Owner: postgres
--

-- Данные об уборке, такие как дата, этаж, сотрудник и в соответствие с каким расписанием. 

CREATE TABLE "DBHotel"."Cleaning" (
    cleaning_id bigint NOT NULL,
    cleaning_date date,
    floor_id bigint NOT NULL,
    employee_id bigint NOT NULL,
    schedule_id bigint NOT NULL
);


ALTER TABLE "DBHotel"."Cleaning" OWNER TO postgres;

--
-- Name: TABLE "Cleaning"; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel"."Cleaning" IS 'Уборка';


--
-- Name: Cleaning_cleaning_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Cleaning_cleaning_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Cleaning_cleaning_id_seq" OWNER TO postgres;

--
-- Name: Cleaning_cleaning_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Cleaning_cleaning_id_seq" OWNED BY "DBHotel"."Cleaning".cleaning_id;


--
-- Name: Cleaning_employee_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Cleaning_employee_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Cleaning_employee_id_seq" OWNER TO postgres;

--
-- Name: Cleaning_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Cleaning_employee_id_seq" OWNED BY "DBHotel"."Cleaning".employee_id;


--
-- Name: Cleaning_floor_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Cleaning_floor_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Cleaning_floor_id_seq" OWNER TO postgres;

--
-- Name: Cleaning_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Cleaning_floor_id_seq" OWNED BY "DBHotel"."Cleaning".floor_id;


--
-- Name: Cleaning_schedule_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Cleaning_schedule_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Cleaning_schedule_id_seq" OWNER TO postgres;

--
-- Name: Cleaning_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Cleaning_schedule_id_seq" OWNED BY "DBHotel"."Cleaning".schedule_id;


--
-- Name: Floor; Type: TABLE; Schema: DBHotel; Owner: postgres
--

CREATE TABLE "DBHotel"."Floor" (
    floor_id integer NOT NULL,
    floor_number integer NOT NULL
);


ALTER TABLE "DBHotel"."Floor" OWNER TO postgres;

--
-- Name: TABLE "Floor"; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel"."Floor" IS 'Этаж';


--
-- Name: Floor_floor_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Floor_floor_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Floor_floor_id_seq" OWNER TO postgres;

--
-- Name: Floor_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Floor_floor_id_seq" OWNED BY "DBHotel"."Floor".floor_id;


--
-- Name: Guest; Type: TABLE; Schema: DBHotel; Owner: postgres
--

CREATE TABLE "DBHotel"."Guest" (
    "Guest_id" bigint NOT NULL,
    "Name" character varying(255) NOT NULL,
    "Passport_number" integer,
    "Where_from" character varying(255)
);


ALTER TABLE "DBHotel"."Guest" OWNER TO postgres;

--
-- Name: TABLE "Guest"; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel"."Guest" IS 'Гость отеля';


--
-- Name: Guest_Guest_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Guest_Guest_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Guest_Guest_id_seq" OWNER TO postgres;

--
-- Name: Guest_Guest_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Guest_Guest_id_seq" OWNED BY "DBHotel"."Guest"."Guest_id";


--
-- Name: Room; Type: TABLE; Schema: DBHotel; Owner: postgres
--

CREATE TABLE "DBHotel"."Room" (
    room_id bigint NOT NULL,
    telephone integer,
    floor_id bigint NOT NULL,
    type_id bigint NOT NULL
);


ALTER TABLE "DBHotel"."Room" OWNER TO postgres;

--
-- Name: TABLE "Room"; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel"."Room" IS 'Номер';


--
-- Name: Room_floor_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Room_floor_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Room_floor_id_seq" OWNER TO postgres;

--
-- Name: Room_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Room_floor_id_seq" OWNED BY "DBHotel"."Room".floor_id;


--
-- Name: Room_room_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Room_room_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Room_room_id_seq" OWNER TO postgres;

--
-- Name: Room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Room_room_id_seq" OWNED BY "DBHotel"."Room".room_id;


--
-- Name: Room_type_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel"."Room_type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel"."Room_type_id_seq" OWNER TO postgres;

--
-- Name: Room_type_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Room_type_id_seq" OWNED BY "DBHotel"."Room".type_id;


--
-- Name: cleaning_schedule; Type: TABLE; Schema: DBHotel; Owner: postgres
--

CREATE TABLE "DBHotel".cleaning_schedule (
    schedule_id bigint NOT NULL,
    weekday character varying,
    floor_number integer,
    empoyee_id bigint NOT NULL,
    admin_id bigint NOT NULL
);


ALTER TABLE "DBHotel".cleaning_schedule OWNER TO postgres;

--
-- Name: TABLE cleaning_schedule; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel".cleaning_schedule IS 'график уборки';


--
-- Name: cleaning_schedule_admin_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel".cleaning_schedule_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel".cleaning_schedule_admin_id_seq OWNER TO postgres;

--
-- Name: cleaning_schedule_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel".cleaning_schedule_admin_id_seq OWNED BY "DBHotel".cleaning_schedule.admin_id;


--
-- Name: cleaning_schedule_empoyee_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel".cleaning_schedule_empoyee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel".cleaning_schedule_empoyee_id_seq OWNER TO postgres;

--
-- Name: cleaning_schedule_empoyee_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel".cleaning_schedule_empoyee_id_seq OWNED BY "DBHotel".cleaning_schedule.empoyee_id;


--
-- Name: cleaning_schedule_schedule_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel".cleaning_schedule_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel".cleaning_schedule_schedule_id_seq OWNER TO postgres;

--
-- Name: cleaning_schedule_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel".cleaning_schedule_schedule_id_seq OWNED BY "DBHotel".cleaning_schedule.schedule_id;


--
-- Name: employee; Type: TABLE; Schema: DBHotel; Owner: postgres
--

CREATE TABLE "DBHotel".employee (
    employee_id bigint NOT NULL,
    employee_surname character varying,
    employee_name character varying,
    admin_id bigint NOT NULL
);


ALTER TABLE "DBHotel".employee OWNER TO postgres;

--
-- Name: TABLE employee; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel".employee IS 'сотрудник гостииницы';


--
-- Name: employee_admin_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel".employee_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel".employee_admin_id_seq OWNER TO postgres;

--
-- Name: employee_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel".employee_admin_id_seq OWNED BY "DBHotel".employee.admin_id;


--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

CREATE SEQUENCE "DBHotel".employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DBHotel".employee_employee_id_seq OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel".employee_employee_id_seq OWNED BY "DBHotel".employee.employee_id;


--
-- Name: room_type; Type: TABLE; Schema: DBHotel; Owner: postgres
--

CREATE TABLE "DBHotel".room_type (
    "Capacity" character varying,
    "Price" money,
    type_id integer NOT NULL
);


ALTER TABLE "DBHotel".room_type OWNER TO postgres;

--
-- Name: TABLE room_type; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel".room_type IS 'тип номера';


--
-- Name: room_type_type_id_seq; Type: SEQUENCE; Schema: DBHotel; Owner: postgres
--

ALTER TABLE "DBHotel".room_type ALTER COLUMN type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "DBHotel".room_type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 5
    CACHE 1
);


--
-- Name: Guest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Guest" (
    guest_id bigint NOT NULL,
    name character varying(255),
    passport_number integer,
    where_from character varying(255)
);


ALTER TABLE public."Guest" OWNER TO postgres;

--
-- Name: TABLE "Guest"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Guest" IS 'Id гостя';


--
-- Name: Guest_guest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Guest_guest_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Guest_guest_id_seq" OWNER TO postgres;

--
-- Name: Guest_guest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Guest_guest_id_seq" OWNED BY public."Guest".guest_id;


--
-- Name: Administrator Admin_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Administrator" ALTER COLUMN "Admin_id" SET DEFAULT nextval('"DBHotel"."Administrator_Admin_id_seq"'::regclass);


--
-- Name: Booking booking_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking" ALTER COLUMN booking_id SET DEFAULT nextval('"DBHotel"."Booking_booking_id_seq"'::regclass);


--
-- Name: Booking guest_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking" ALTER COLUMN guest_id SET DEFAULT nextval('"DBHotel"."Booking_Guest_id_seq"'::regclass);


--
-- Name: Booking room_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking" ALTER COLUMN room_id SET DEFAULT nextval('"DBHotel"."Booking_room_id_seq"'::regclass);


--
-- Name: Booking admin_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking" ALTER COLUMN admin_id SET DEFAULT nextval('"DBHotel"."Booking_admin_id_seq"'::regclass);


--
-- Name: Booking floor_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking" ALTER COLUMN floor_id SET DEFAULT nextval('"DBHotel"."Booking_floor_id_seq"'::regclass);


--
-- Name: Cleaning cleaning_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning" ALTER COLUMN cleaning_id SET DEFAULT nextval('"DBHotel"."Cleaning_cleaning_id_seq"'::regclass);


--
-- Name: Cleaning floor_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning" ALTER COLUMN floor_id SET DEFAULT nextval('"DBHotel"."Cleaning_floor_id_seq"'::regclass);


--
-- Name: Cleaning employee_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning" ALTER COLUMN employee_id SET DEFAULT nextval('"DBHotel"."Cleaning_employee_id_seq"'::regclass);


--
-- Name: Cleaning schedule_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning" ALTER COLUMN schedule_id SET DEFAULT nextval('"DBHotel"."Cleaning_schedule_id_seq"'::regclass);


--
-- Name: Floor floor_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Floor" ALTER COLUMN floor_id SET DEFAULT nextval('"DBHotel"."Floor_floor_id_seq"'::regclass);


--
-- Name: Guest Guest_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Guest" ALTER COLUMN "Guest_id" SET DEFAULT nextval('"DBHotel"."Guest_Guest_id_seq"'::regclass);


--
-- Name: Room room_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room" ALTER COLUMN room_id SET DEFAULT nextval('"DBHotel"."Room_room_id_seq"'::regclass);


--
-- Name: Room floor_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room" ALTER COLUMN floor_id SET DEFAULT nextval('"DBHotel"."Room_floor_id_seq"'::regclass);


--
-- Name: Room type_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room" ALTER COLUMN type_id SET DEFAULT nextval('"DBHotel"."Room_type_id_seq"'::regclass);


--
-- Name: cleaning_schedule schedule_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule ALTER COLUMN schedule_id SET DEFAULT nextval('"DBHotel".cleaning_schedule_schedule_id_seq'::regclass);


--
-- Name: cleaning_schedule empoyee_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule ALTER COLUMN empoyee_id SET DEFAULT nextval('"DBHotel".cleaning_schedule_empoyee_id_seq'::regclass);


--
-- Name: cleaning_schedule admin_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule ALTER COLUMN admin_id SET DEFAULT nextval('"DBHotel".cleaning_schedule_admin_id_seq'::regclass);


--
-- Name: employee employee_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".employee ALTER COLUMN employee_id SET DEFAULT nextval('"DBHotel".employee_employee_id_seq'::regclass);


--
-- Name: employee admin_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".employee ALTER COLUMN admin_id SET DEFAULT nextval('"DBHotel".employee_admin_id_seq'::regclass);


--
-- Name: Guest guest_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Guest" ALTER COLUMN guest_id SET DEFAULT nextval('public."Guest_guest_id_seq"'::regclass);


--
-- Data for Name: Administrator; Type: TABLE DATA; Schema: DBHotel; Owner: postgres
--

COPY "DBHotel"."Administrator" ("Admin_id", "Name") FROM stdin;
1	Sergei Elyseev
2	Oleg Mihailov
3	Chan Von Kho
4	Stefani Buyers
5	Luci Liu
\.


--
-- Data for Name: Booking; Type: TABLE DATA; Schema: DBHotel; Owner: postgres
--

COPY "DBHotel"."Booking" (booking_id, checkin_date, checkout_date, guest_id, room_id, admin_id, floor_id) FROM stdin;
1	2020-05-04	2020-05-09	1	1	1	1
2	2020-05-04	2020-05-06	2	2	2	2
3	2020-05-05	2020-05-15	3	3	3	3
4	2020-05-03	2020-05-07	4	4	4	4
5	2020-05-07	2020-05-14	5	5	5	5
6	2020-05-03	2020-05-10	6	6	6	6
\.


--
-- Data for Name: Cleaning; Type: TABLE DATA; Schema: DBHotel; Owner: postgres
--

COPY "DBHotel"."Cleaning" (cleaning_id, cleaning_date, floor_id, employee_id, schedule_id) FROM stdin;
1	2020-05-02	1	1	1
2	2020-05-03	2	2	2
3	2020-05-04	3	3	3
4	2020-05-05	4	4	4
5	2020-05-06	5	5	5
\.


--
-- Data for Name: Floor; Type: TABLE DATA; Schema: DBHotel; Owner: postgres
--

COPY "DBHotel"."Floor" (floor_id, floor_number) FROM stdin;
1	1
2	2
3	3
4	4
5	5
\.


--
-- Data for Name: Guest; Type: TABLE DATA; Schema: DBHotel; Owner: postgres
--

COPY "DBHotel"."Guest" ("Guest_id", "Name", "Passport_number", "Where_from") FROM stdin;
1	Ivan Nikolaev	56893056	Moscow
2	Ivan Nikolaev	56893056	Moscow
3	Daniela Espinoza	12344533	Lima
4	Robert Stevens Jr.	78334506	Austin
5	Ngolo Wan-Bissaka	1002003	Mogadisho
6	Chon Guk	23463443	Seul
\.


--
-- Data for Name: Room; Type: TABLE DATA; Schema: DBHotel; Owner: postgres
--

COPY "DBHotel"."Room" (room_id, telephone, floor_id, type_id) FROM stdin;
1	101	1	1
2	212	2	2
3	309	3	3
4	425	4	4
5	503	5	5
\.


--
-- Data for Name: cleaning_schedule; Type: TABLE DATA; Schema: DBHotel; Owner: postgres
--

COPY "DBHotel".cleaning_schedule (schedule_id, weekday, floor_number, empoyee_id, admin_id) FROM stdin;
1	monday	3	1	1
2	tuesday	1	2	2
3	wednesday	4	3	3
4	thursday	2	4	4
5	friday	5	5	5
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: DBHotel; Owner: postgres
--

COPY "DBHotel".employee (employee_id, employee_surname, employee_name, admin_id) FROM stdin;
1	Dzhamaleva	Nadina	1
2	Petrova	Natalia	2
3	Lichko	Svetlana	3
4	Inchmalieva	Dinara	4
5	Dorokhov	Igor	5
\.


--
-- Data for Name: room_type; Type: TABLE DATA; Schema: DBHotel; Owner: postgres
--

COPY "DBHotel".room_type ("Capacity", "Price", type_id) FROM stdin;
single	7 590,00 ?	1
double	9 990,00 ?	2
double plus	11 990,00 ?	3
deluxe for four	14 990,00 ?	4
luxe double	19 900,00 ?	5
\.


--
-- Data for Name: Guest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Guest" (guest_id, name, passport_number, where_from) FROM stdin;
\.


--
-- Name: Administrator_Admin_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Administrator_Admin_id_seq"', 5, true);


--
-- Name: Booking_Guest_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Booking_Guest_id_seq"', 6, true);


--
-- Name: Booking_admin_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Booking_admin_id_seq"', 6, true);


--
-- Name: Booking_booking_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Booking_booking_id_seq"', 6, true);


--
-- Name: Booking_floor_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Booking_floor_id_seq"', 6, true);


--
-- Name: Booking_room_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Booking_room_id_seq"', 6, true);


--
-- Name: Cleaning_cleaning_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Cleaning_cleaning_id_seq"', 5, true);


--
-- Name: Cleaning_employee_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Cleaning_employee_id_seq"', 5, true);


--
-- Name: Cleaning_floor_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Cleaning_floor_id_seq"', 5, true);


--
-- Name: Cleaning_schedule_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Cleaning_schedule_id_seq"', 5, true);


--
-- Name: Floor_floor_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Floor_floor_id_seq"', 5, true);


--
-- Name: Guest_Guest_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Guest_Guest_id_seq"', 6, true);


--
-- Name: Room_floor_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Room_floor_id_seq"', 5, true);


--
-- Name: Room_room_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Room_room_id_seq"', 5, true);


--
-- Name: Room_type_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Room_type_id_seq"', 5, true);


--
-- Name: cleaning_schedule_admin_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".cleaning_schedule_admin_id_seq', 5, true);


--
-- Name: cleaning_schedule_empoyee_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".cleaning_schedule_empoyee_id_seq', 5, true);


--
-- Name: cleaning_schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".cleaning_schedule_schedule_id_seq', 5, true);


--
-- Name: employee_admin_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".employee_admin_id_seq', 5, true);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".employee_employee_id_seq', 5, true);


--
-- Name: room_type_type_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".room_type_type_id_seq', 5, true);


--
-- Name: Guest_guest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Guest_guest_id_seq"', 1, false);


--
-- Name: Administrator Administrator_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Administrator"
    ADD CONSTRAINT "Administrator_pkey" PRIMARY KEY ("Admin_id");


--
-- Name: Booking Booking_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking"
    ADD CONSTRAINT "Booking_pkey" PRIMARY KEY (booking_id);


--
-- Name: Cleaning Cleaning_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning"
    ADD CONSTRAINT "Cleaning_pkey" PRIMARY KEY (cleaning_id);


--
-- Name: Floor Floor_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Floor"
    ADD CONSTRAINT "Floor_pkey" PRIMARY KEY (floor_id);


--
-- Name: Guest Guest_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Guest"
    ADD CONSTRAINT "Guest_pkey" PRIMARY KEY ("Guest_id");


--
-- Name: Room Room_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room"
    ADD CONSTRAINT "Room_pkey" PRIMARY KEY (room_id);


--
-- Name: cleaning_schedule cleaning_schedule_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule
    ADD CONSTRAINT cleaning_schedule_pkey PRIMARY KEY (schedule_id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: room_type type_idPK; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".room_type
    ADD CONSTRAINT "type_idPK" PRIMARY KEY (type_id);


--
-- Name: Guest Guest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Guest"
    ADD CONSTRAINT "Guest_pkey" PRIMARY KEY (guest_id);


--
-- Name: cleaning_schedule admin_id; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule
    ADD CONSTRAINT admin_id FOREIGN KEY (admin_id) REFERENCES "DBHotel"."Administrator"("Admin_id") NOT VALID;


--
-- Name: employee admin_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".employee
    ADD CONSTRAINT "admin_id_FK" FOREIGN KEY (admin_id) REFERENCES "DBHotel"."Administrator"("Admin_id") NOT VALID;


--
-- Name: Cleaning employee_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning"
    ADD CONSTRAINT "employee_id_FK" FOREIGN KEY (employee_id) REFERENCES "DBHotel".employee(employee_id) NOT VALID;


--
-- Name: cleaning_schedule employee_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule
    ADD CONSTRAINT "employee_id_FK" FOREIGN KEY (empoyee_id) REFERENCES "DBHotel".employee(employee_id) NOT VALID;


--
-- Name: Room floor_id; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room"
    ADD CONSTRAINT floor_id FOREIGN KEY (floor_id) REFERENCES "DBHotel"."Floor"(floor_id) NOT VALID;


--
-- Name: Cleaning floor_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning"
    ADD CONSTRAINT "floor_id_FK" FOREIGN KEY (floor_id) REFERENCES "DBHotel"."Floor"(floor_id) NOT VALID;


--
-- Name: Booking guest_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking"
    ADD CONSTRAINT "guest_id_FK" FOREIGN KEY (guest_id) REFERENCES "DBHotel"."Guest"("Guest_id") NOT VALID;


--
-- Name: Cleaning schedule_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning"
    ADD CONSTRAINT "schedule_id_FK" FOREIGN KEY (schedule_id) REFERENCES "DBHotel".cleaning_schedule(schedule_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

