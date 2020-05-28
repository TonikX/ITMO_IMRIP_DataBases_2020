--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

-- Started on 2020-05-28 10:51:39

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
-- Name: DBHotel; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "DBHotel";


ALTER SCHEMA "DBHotel" OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 16424)
-- Name: Administrator; Type: TABLE; Schema: DBHotel; Owner: postgres
--

CREATE TABLE "DBHotel"."Administrator" (
    "Admin_id" integer NOT NULL,
    "Name" character varying
);


ALTER TABLE "DBHotel"."Administrator" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16422)
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
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 197
-- Name: Administrator_Admin_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Administrator_Admin_id_seq" OWNED BY "DBHotel"."Administrator"."Admin_id";


--
-- TOC entry 200 (class 1259 OID 16442)
-- Name: Booking; Type: TABLE; Schema: DBHotel; Owner: postgres
--

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
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE "Booking"; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel"."Booking" IS 'Бронирование номера';


--
-- TOC entry 218 (class 1259 OID 16593)
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
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 218
-- Name: Booking_Guest_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Booking_Guest_id_seq" OWNED BY "DBHotel"."Booking".guest_id;


--
-- TOC entry 220 (class 1259 OID 16632)
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
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 220
-- Name: Booking_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Booking_admin_id_seq" OWNED BY "DBHotel"."Booking".admin_id;


--
-- TOC entry 199 (class 1259 OID 16440)
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
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 199
-- Name: Booking_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Booking_booking_id_seq" OWNED BY "DBHotel"."Booking".booking_id;


--
-- TOC entry 221 (class 1259 OID 16639)
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
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 221
-- Name: Booking_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Booking_floor_id_seq" OWNED BY "DBHotel"."Booking".floor_id;


--
-- TOC entry 219 (class 1259 OID 16625)
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
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 219
-- Name: Booking_room_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Booking_room_id_seq" OWNED BY "DBHotel"."Booking".room_id;


--
-- TOC entry 204 (class 1259 OID 16458)
-- Name: Cleaning; Type: TABLE; Schema: DBHotel; Owner: postgres
--

CREATE TABLE "DBHotel"."Cleaning" (
    cleaning_id bigint NOT NULL,
    cleaning_date date,
    floor_id bigint NOT NULL,
    employee_id bigint NOT NULL,
    schedule_id bigint NOT NULL
);


ALTER TABLE "DBHotel"."Cleaning" OWNER TO postgres;

--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE "Cleaning"; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel"."Cleaning" IS 'Уборка';


--
-- TOC entry 203 (class 1259 OID 16456)
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
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 203
-- Name: Cleaning_cleaning_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Cleaning_cleaning_id_seq" OWNED BY "DBHotel"."Cleaning".cleaning_id;


--
-- TOC entry 223 (class 1259 OID 16653)
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
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 223
-- Name: Cleaning_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Cleaning_employee_id_seq" OWNED BY "DBHotel"."Cleaning".employee_id;


--
-- TOC entry 222 (class 1259 OID 16646)
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
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 222
-- Name: Cleaning_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Cleaning_floor_id_seq" OWNED BY "DBHotel"."Cleaning".floor_id;


--
-- TOC entry 224 (class 1259 OID 16660)
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
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 224
-- Name: Cleaning_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Cleaning_schedule_id_seq" OWNED BY "DBHotel"."Cleaning".schedule_id;


--
-- TOC entry 202 (class 1259 OID 16450)
-- Name: Floor; Type: TABLE; Schema: DBHotel; Owner: postgres
--

CREATE TABLE "DBHotel"."Floor" (
    floor_id integer NOT NULL,
    floor_number integer NOT NULL
);


ALTER TABLE "DBHotel"."Floor" OWNER TO postgres;

--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE "Floor"; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel"."Floor" IS 'Этаж';


--
-- TOC entry 201 (class 1259 OID 16448)
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
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 201
-- Name: Floor_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Floor_floor_id_seq" OWNED BY "DBHotel"."Floor".floor_id;


--
-- TOC entry 211 (class 1259 OID 16507)
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
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE "Guest"; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel"."Guest" IS 'Гость отеля';


--
-- TOC entry 210 (class 1259 OID 16505)
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
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 210
-- Name: Guest_Guest_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Guest_Guest_id_seq" OWNED BY "DBHotel"."Guest"."Guest_id";


--
-- TOC entry 215 (class 1259 OID 16563)
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
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE "Room"; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel"."Room" IS 'Номер';


--
-- TOC entry 216 (class 1259 OID 16574)
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
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 216
-- Name: Room_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Room_floor_id_seq" OWNED BY "DBHotel"."Room".floor_id;


--
-- TOC entry 214 (class 1259 OID 16561)
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
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 214
-- Name: Room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Room_room_id_seq" OWNED BY "DBHotel"."Room".room_id;


--
-- TOC entry 217 (class 1259 OID 16581)
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
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 217
-- Name: Room_type_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel"."Room_type_id_seq" OWNED BY "DBHotel"."Room".type_id;


--
-- TOC entry 206 (class 1259 OID 16466)
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
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE cleaning_schedule; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel".cleaning_schedule IS 'график уборки';


--
-- TOC entry 226 (class 1259 OID 16692)
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
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 226
-- Name: cleaning_schedule_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel".cleaning_schedule_admin_id_seq OWNED BY "DBHotel".cleaning_schedule.admin_id;


--
-- TOC entry 225 (class 1259 OID 16682)
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
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 225
-- Name: cleaning_schedule_empoyee_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel".cleaning_schedule_empoyee_id_seq OWNED BY "DBHotel".cleaning_schedule.empoyee_id;


--
-- TOC entry 205 (class 1259 OID 16464)
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
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 205
-- Name: cleaning_schedule_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel".cleaning_schedule_schedule_id_seq OWNED BY "DBHotel".cleaning_schedule.schedule_id;


--
-- TOC entry 208 (class 1259 OID 16477)
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
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE employee; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel".employee IS 'сотрудник гостииницы';


--
-- TOC entry 227 (class 1259 OID 16713)
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
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 227
-- Name: employee_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel".employee_admin_id_seq OWNED BY "DBHotel".employee.admin_id;


--
-- TOC entry 207 (class 1259 OID 16475)
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
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 207
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: DBHotel; Owner: postgres
--

ALTER SEQUENCE "DBHotel".employee_employee_id_seq OWNED BY "DBHotel".employee.employee_id;


--
-- TOC entry 209 (class 1259 OID 16488)
-- Name: room_type; Type: TABLE; Schema: DBHotel; Owner: postgres
--

CREATE TABLE "DBHotel".room_type (
    "Capacity" character varying,
    "Price" money,
    type_id integer NOT NULL
);


ALTER TABLE "DBHotel".room_type OWNER TO postgres;

--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE room_type; Type: COMMENT; Schema: DBHotel; Owner: postgres
--

COMMENT ON TABLE "DBHotel".room_type IS 'тип номера';


--
-- TOC entry 228 (class 1259 OID 16732)
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
-- TOC entry 213 (class 1259 OID 16518)
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
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE "Guest"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Guest" IS 'Id гостя';


--
-- TOC entry 212 (class 1259 OID 16516)
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
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 212
-- Name: Guest_guest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Guest_guest_id_seq" OWNED BY public."Guest".guest_id;


--
-- TOC entry 2770 (class 2604 OID 16427)
-- Name: Administrator Admin_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Administrator" ALTER COLUMN "Admin_id" SET DEFAULT nextval('"DBHotel"."Administrator_Admin_id_seq"'::regclass);


--
-- TOC entry 2771 (class 2604 OID 16445)
-- Name: Booking booking_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking" ALTER COLUMN booking_id SET DEFAULT nextval('"DBHotel"."Booking_booking_id_seq"'::regclass);


--
-- TOC entry 2772 (class 2604 OID 16595)
-- Name: Booking guest_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking" ALTER COLUMN guest_id SET DEFAULT nextval('"DBHotel"."Booking_Guest_id_seq"'::regclass);


--
-- TOC entry 2773 (class 2604 OID 16627)
-- Name: Booking room_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking" ALTER COLUMN room_id SET DEFAULT nextval('"DBHotel"."Booking_room_id_seq"'::regclass);


--
-- TOC entry 2774 (class 2604 OID 16634)
-- Name: Booking admin_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking" ALTER COLUMN admin_id SET DEFAULT nextval('"DBHotel"."Booking_admin_id_seq"'::regclass);


--
-- TOC entry 2775 (class 2604 OID 16641)
-- Name: Booking floor_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking" ALTER COLUMN floor_id SET DEFAULT nextval('"DBHotel"."Booking_floor_id_seq"'::regclass);


--
-- TOC entry 2777 (class 2604 OID 16461)
-- Name: Cleaning cleaning_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning" ALTER COLUMN cleaning_id SET DEFAULT nextval('"DBHotel"."Cleaning_cleaning_id_seq"'::regclass);


--
-- TOC entry 2778 (class 2604 OID 16648)
-- Name: Cleaning floor_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning" ALTER COLUMN floor_id SET DEFAULT nextval('"DBHotel"."Cleaning_floor_id_seq"'::regclass);


--
-- TOC entry 2779 (class 2604 OID 16655)
-- Name: Cleaning employee_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning" ALTER COLUMN employee_id SET DEFAULT nextval('"DBHotel"."Cleaning_employee_id_seq"'::regclass);


--
-- TOC entry 2780 (class 2604 OID 16662)
-- Name: Cleaning schedule_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning" ALTER COLUMN schedule_id SET DEFAULT nextval('"DBHotel"."Cleaning_schedule_id_seq"'::regclass);


--
-- TOC entry 2776 (class 2604 OID 16453)
-- Name: Floor floor_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Floor" ALTER COLUMN floor_id SET DEFAULT nextval('"DBHotel"."Floor_floor_id_seq"'::regclass);


--
-- TOC entry 2786 (class 2604 OID 16510)
-- Name: Guest Guest_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Guest" ALTER COLUMN "Guest_id" SET DEFAULT nextval('"DBHotel"."Guest_Guest_id_seq"'::regclass);


--
-- TOC entry 2788 (class 2604 OID 16566)
-- Name: Room room_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room" ALTER COLUMN room_id SET DEFAULT nextval('"DBHotel"."Room_room_id_seq"'::regclass);


--
-- TOC entry 2789 (class 2604 OID 16576)
-- Name: Room floor_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room" ALTER COLUMN floor_id SET DEFAULT nextval('"DBHotel"."Room_floor_id_seq"'::regclass);


--
-- TOC entry 2790 (class 2604 OID 16583)
-- Name: Room type_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room" ALTER COLUMN type_id SET DEFAULT nextval('"DBHotel"."Room_type_id_seq"'::regclass);


--
-- TOC entry 2781 (class 2604 OID 16469)
-- Name: cleaning_schedule schedule_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule ALTER COLUMN schedule_id SET DEFAULT nextval('"DBHotel".cleaning_schedule_schedule_id_seq'::regclass);


--
-- TOC entry 2782 (class 2604 OID 16684)
-- Name: cleaning_schedule empoyee_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule ALTER COLUMN empoyee_id SET DEFAULT nextval('"DBHotel".cleaning_schedule_empoyee_id_seq'::regclass);


--
-- TOC entry 2783 (class 2604 OID 16694)
-- Name: cleaning_schedule admin_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule ALTER COLUMN admin_id SET DEFAULT nextval('"DBHotel".cleaning_schedule_admin_id_seq'::regclass);


--
-- TOC entry 2784 (class 2604 OID 16480)
-- Name: employee employee_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".employee ALTER COLUMN employee_id SET DEFAULT nextval('"DBHotel".employee_employee_id_seq'::regclass);


--
-- TOC entry 2785 (class 2604 OID 16715)
-- Name: employee admin_id; Type: DEFAULT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".employee ALTER COLUMN admin_id SET DEFAULT nextval('"DBHotel".employee_admin_id_seq'::regclass);


--
-- TOC entry 2787 (class 2604 OID 16521)
-- Name: Guest guest_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Guest" ALTER COLUMN guest_id SET DEFAULT nextval('public."Guest_guest_id_seq"'::regclass);


--
-- TOC entry 2949 (class 0 OID 16424)
-- Dependencies: 198
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
-- TOC entry 2951 (class 0 OID 16442)
-- Dependencies: 200
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
-- TOC entry 2955 (class 0 OID 16458)
-- Dependencies: 204
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
-- TOC entry 2953 (class 0 OID 16450)
-- Dependencies: 202
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
-- TOC entry 2962 (class 0 OID 16507)
-- Dependencies: 211
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
-- TOC entry 2966 (class 0 OID 16563)
-- Dependencies: 215
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
-- TOC entry 2957 (class 0 OID 16466)
-- Dependencies: 206
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
-- TOC entry 2959 (class 0 OID 16477)
-- Dependencies: 208
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
-- TOC entry 2960 (class 0 OID 16488)
-- Dependencies: 209
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
-- TOC entry 2964 (class 0 OID 16518)
-- Dependencies: 213
-- Data for Name: Guest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Guest" (guest_id, name, passport_number, where_from) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 197
-- Name: Administrator_Admin_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Administrator_Admin_id_seq"', 5, true);


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 218
-- Name: Booking_Guest_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Booking_Guest_id_seq"', 6, true);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 220
-- Name: Booking_admin_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Booking_admin_id_seq"', 6, true);


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 199
-- Name: Booking_booking_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Booking_booking_id_seq"', 6, true);


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 221
-- Name: Booking_floor_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Booking_floor_id_seq"', 6, true);


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 219
-- Name: Booking_room_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Booking_room_id_seq"', 6, true);


--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 203
-- Name: Cleaning_cleaning_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Cleaning_cleaning_id_seq"', 5, true);


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 223
-- Name: Cleaning_employee_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Cleaning_employee_id_seq"', 5, true);


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 222
-- Name: Cleaning_floor_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Cleaning_floor_id_seq"', 5, true);


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 224
-- Name: Cleaning_schedule_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Cleaning_schedule_id_seq"', 5, true);


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 201
-- Name: Floor_floor_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Floor_floor_id_seq"', 5, true);


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 210
-- Name: Guest_Guest_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Guest_Guest_id_seq"', 6, true);


--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 216
-- Name: Room_floor_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Room_floor_id_seq"', 5, true);


--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 214
-- Name: Room_room_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Room_room_id_seq"', 5, true);


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 217
-- Name: Room_type_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel"."Room_type_id_seq"', 5, true);


--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 226
-- Name: cleaning_schedule_admin_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".cleaning_schedule_admin_id_seq', 5, true);


--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 225
-- Name: cleaning_schedule_empoyee_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".cleaning_schedule_empoyee_id_seq', 5, true);


--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 205
-- Name: cleaning_schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".cleaning_schedule_schedule_id_seq', 5, true);


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 227
-- Name: employee_admin_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".employee_admin_id_seq', 5, true);


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 207
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".employee_employee_id_seq', 5, true);


--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 228
-- Name: room_type_type_id_seq; Type: SEQUENCE SET; Schema: DBHotel; Owner: postgres
--

SELECT pg_catalog.setval('"DBHotel".room_type_type_id_seq', 5, true);


--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 212
-- Name: Guest_guest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Guest_guest_id_seq"', 1, false);


--
-- TOC entry 2792 (class 2606 OID 16432)
-- Name: Administrator Administrator_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Administrator"
    ADD CONSTRAINT "Administrator_pkey" PRIMARY KEY ("Admin_id");


--
-- TOC entry 2794 (class 2606 OID 16447)
-- Name: Booking Booking_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking"
    ADD CONSTRAINT "Booking_pkey" PRIMARY KEY (booking_id);


--
-- TOC entry 2801 (class 2606 OID 16463)
-- Name: Cleaning Cleaning_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning"
    ADD CONSTRAINT "Cleaning_pkey" PRIMARY KEY (cleaning_id);


--
-- TOC entry 2799 (class 2606 OID 16455)
-- Name: Floor Floor_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Floor"
    ADD CONSTRAINT "Floor_pkey" PRIMARY KEY (floor_id);


--
-- TOC entry 2809 (class 2606 OID 16515)
-- Name: Guest Guest_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Guest"
    ADD CONSTRAINT "Guest_pkey" PRIMARY KEY ("Guest_id");


--
-- TOC entry 2813 (class 2606 OID 16568)
-- Name: Room Room_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room"
    ADD CONSTRAINT "Room_pkey" PRIMARY KEY (room_id);


--
-- TOC entry 2803 (class 2606 OID 16474)
-- Name: cleaning_schedule cleaning_schedule_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule
    ADD CONSTRAINT cleaning_schedule_pkey PRIMARY KEY (schedule_id);


--
-- TOC entry 2805 (class 2606 OID 16485)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 2807 (class 2606 OID 16741)
-- Name: room_type type_idPK; Type: CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".room_type
    ADD CONSTRAINT "type_idPK" PRIMARY KEY (type_id);


--
-- TOC entry 2811 (class 2606 OID 16526)
-- Name: Guest Guest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Guest"
    ADD CONSTRAINT "Guest_pkey" PRIMARY KEY (guest_id);


--
-- TOC entry 2795 (class 1259 OID 16774)
-- Name: fki_admin_id_FK; Type: INDEX; Schema: DBHotel; Owner: postgres
--

CREATE INDEX "fki_admin_id_FK" ON "DBHotel"."Booking" USING btree (admin_id);


--
-- TOC entry 2796 (class 1259 OID 16780)
-- Name: fki_floor_id_FK; Type: INDEX; Schema: DBHotel; Owner: postgres
--

CREATE INDEX "fki_floor_id_FK" ON "DBHotel"."Booking" USING btree (floor_id);


--
-- TOC entry 2797 (class 1259 OID 16768)
-- Name: fki_room_id_FK; Type: INDEX; Schema: DBHotel; Owner: postgres
--

CREATE INDEX "fki_room_id_FK" ON "DBHotel"."Booking" USING btree (room_id);


--
-- TOC entry 2814 (class 1259 OID 16762)
-- Name: fki_type_id_FK; Type: INDEX; Schema: DBHotel; Owner: postgres
--

CREATE INDEX "fki_type_id_FK" ON "DBHotel"."Room" USING btree (type_id);


--
-- TOC entry 2823 (class 2606 OID 16708)
-- Name: cleaning_schedule admin_id; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule
    ADD CONSTRAINT admin_id FOREIGN KEY (admin_id) REFERENCES "DBHotel"."Administrator"("Admin_id") NOT VALID;


--
-- TOC entry 2824 (class 2606 OID 16723)
-- Name: employee admin_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".employee
    ADD CONSTRAINT "admin_id_FK" FOREIGN KEY (admin_id) REFERENCES "DBHotel"."Administrator"("Admin_id") NOT VALID;


--
-- TOC entry 2817 (class 2606 OID 16769)
-- Name: Booking admin_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking"
    ADD CONSTRAINT "admin_id_FK" FOREIGN KEY (admin_id) REFERENCES "DBHotel"."Administrator"("Admin_id") NOT VALID;


--
-- TOC entry 2820 (class 2606 OID 16672)
-- Name: Cleaning employee_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning"
    ADD CONSTRAINT "employee_id_FK" FOREIGN KEY (employee_id) REFERENCES "DBHotel".employee(employee_id) NOT VALID;


--
-- TOC entry 2822 (class 2606 OID 16703)
-- Name: cleaning_schedule employee_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel".cleaning_schedule
    ADD CONSTRAINT "employee_id_FK" FOREIGN KEY (empoyee_id) REFERENCES "DBHotel".employee(employee_id) NOT VALID;


--
-- TOC entry 2825 (class 2606 OID 16588)
-- Name: Room floor_id; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room"
    ADD CONSTRAINT floor_id FOREIGN KEY (floor_id) REFERENCES "DBHotel"."Floor"(floor_id) NOT VALID;


--
-- TOC entry 2819 (class 2606 OID 16667)
-- Name: Cleaning floor_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning"
    ADD CONSTRAINT "floor_id_FK" FOREIGN KEY (floor_id) REFERENCES "DBHotel"."Floor"(floor_id) NOT VALID;


--
-- TOC entry 2818 (class 2606 OID 16775)
-- Name: Booking floor_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking"
    ADD CONSTRAINT "floor_id_FK" FOREIGN KEY (floor_id) REFERENCES "DBHotel"."Floor"(floor_id) NOT VALID;


--
-- TOC entry 2815 (class 2606 OID 16601)
-- Name: Booking guest_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking"
    ADD CONSTRAINT "guest_id_FK" FOREIGN KEY (guest_id) REFERENCES "DBHotel"."Guest"("Guest_id") NOT VALID;


--
-- TOC entry 2816 (class 2606 OID 16763)
-- Name: Booking room_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Booking"
    ADD CONSTRAINT "room_id_FK" FOREIGN KEY (room_id) REFERENCES "DBHotel"."Room"(room_id) NOT VALID;


--
-- TOC entry 2821 (class 2606 OID 16677)
-- Name: Cleaning schedule_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Cleaning"
    ADD CONSTRAINT "schedule_id_FK" FOREIGN KEY (schedule_id) REFERENCES "DBHotel".cleaning_schedule(schedule_id) NOT VALID;


--
-- TOC entry 2826 (class 2606 OID 16757)
-- Name: Room type_id_FK; Type: FK CONSTRAINT; Schema: DBHotel; Owner: postgres
--

ALTER TABLE ONLY "DBHotel"."Room"
    ADD CONSTRAINT "type_id_FK" FOREIGN KEY (type_id) REFERENCES "DBHotel".room_type(type_id) NOT VALID;


-- Completed on 2020-05-28 10:51:39

--
-- PostgreSQL database dump complete
--

