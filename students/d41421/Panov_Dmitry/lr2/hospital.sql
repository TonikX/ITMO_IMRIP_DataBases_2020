-- Таблицы создавались и заполнялись в графическом интерфейсе pgadmin4
-- Затем сгенерированный sql-код созданных таблиц оформлен в данный отдельный файл


-- Таблица диагнозов
CREATE TABLE "hospitalDB".diagnoses
(
    diagn_id integer NOT NULL,
    diagn_name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT diagnoses_pkey PRIMARY KEY (diagn_id)
)

TABLESPACE pg_default;

ALTER TABLE "hospitalDB".diagnoses
    OWNER to postgres;

INSERT INTO "hospitalDB".diagnoses VALUES
(1, 'Тонзиллит'),
(2, 'Коронавирус'),
(3, 'Аппендицит'),
(4, 'Миопия'),
(5, 'Ринит')

-- Таблица прейскуранта

CREATE TABLE "hospitalDB".price
(
    price_id integer NOT NULL,
    price_val integer NOT NULL,
    price_descript text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT price_pkey PRIMARY KEY (price_id)
)

TABLESPACE pg_default;

ALTER TABLE "hospitalDB".price
    OWNER to postgres;

INSERT INTO "hospitalDB".price VALUES
(1, 1500, 'Первичная консультация'),
(2, 1000, 'Вторичная консультация'),
(3, 24000, 'Лазерная коррекция зрения'),
(4, 16000, 'Операция по удалению аппендикса'),
(5, 33000, 'Стационарное лечение')

-- Таблица кабинетов

CREATE TABLE "hospitalDB".cabinets
(
    cab_id integer NOT NULL,
    cab_phone text COLLATE pg_catalog."default" NOT NULL,
    "cab_leader(FK)" integer NOT NULL,
    CONSTRAINT cabinets_pkey PRIMARY KEY (cab_id),
    CONSTRAINT cab_leader FOREIGN KEY ("cab_leader(FK)")
        REFERENCES "hospitalDB".doctors (doc_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE "hospitalDB".cabinets
    OWNER to postgres;

INSERT INTO "hospitalDB".cabinets VALUES
(100, '293-123', 1),
(101, '293-456', 3),
(102, '293-789', 5),
(103, '293-357', 2),
(104, '293-159', 4)

-- Таблица врачей

CREATE TABLE "hospitalDB".doctors
(
    doc_id integer NOT NULL,
    doc_name text COLLATE pg_catalog."default" NOT NULL,
    doc_gender text COLLATE pg_catalog."default" NOT NULL,
    doc_birth date NOT NULL,
    doc_spec text COLLATE pg_catalog."default" NOT NULL,
    doc_edu text COLLATE pg_catalog."default" NOT NULL,
    doc_start date NOT NULL,
    doc_finish date,
    CONSTRAINT doctors_pkey PRIMARY KEY (doc_id)
)

TABLESPACE pg_default;

ALTER TABLE "hospitalDB".doctors
    OWNER to postgres;

INSERT INTO "hospitalDB".doctors VALUES
(1, 'Виктор Евгеньевич Петров', 'муж', 1967-02-12, 'Терапевт', 'МГУ', 1986-12-12, 2001-06-04),
(2, 'Ольга Ивановна Иванова', 'жен', 1972-05-28, 'Оториноларинголог', 'СПбГУ', 1993-11-05),
(3, 'Егор Владимирович Кудрявцев', 'муж', 1985-09-11, 'Хирург', 'МГУ', 2000-02-13),
(4, 'Олег Евгеньевич Минеев', 'муж', 1993-12-05, 'Окулист', 'СПбГУ', 2008-03-20),
(5, 'Инга Игоревна Морозова', 'жен', 1995-07-07, 'Терапевт', 'СПбГУ', 2008-07-03)

-- Таблица графика работы

CREATE TABLE "hospitalDB".timetable
(
    line_id integer NOT NULL,
    weekday date NOT NULL,
    day_of date NOT NULL,
    "cab_id(FK)" integer NOT NULL,
    "doc_id(FK)" integer NOT NULL,
    CONSTRAINT timetable_pkey PRIMARY KEY (line_id),
    CONSTRAINT cab_id FOREIGN KEY ("cab_id(FK)")
        REFERENCES "hospitalDB".cabinets (cab_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT doc_id FOREIGN KEY ("doc_id(FK)")
        REFERENCES "hospitalDB".doctors (doc_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE "hospitalDB".timetable
    OWNER to postgres;

INSERT INTO "hospitalDB".timetable VALUES
(1, 2020-05-08, 2020-05-09, 100, 5),
(2, 2020-05-07, 2020-05-08, 101, 2),
(3, 2020-05-06, 2020-05-07, 102, 3),
(4, 2020-05-05, 2020-05-06, 103, 4),
(5, 2020-05-04, 2020-05-05, 104, 5)

-- Таблица медкарт

CREATE TABLE "hospitalDB".medfiles
(
    client_id integer NOT NULL,
    client_name text COLLATE pg_catalog."default" NOT NULL,
    client_birth date NOT NULL,
    client_gender text COLLATE pg_catalog."default" NOT NULL,
    client_adress text COLLATE pg_catalog."default" NOT NULL,
    client_phone text COLLATE pg_catalog."default" NOT NULL,
    "client_diagn(FK)" integer NOT NULL,
    CONSTRAINT med_files_pkey PRIMARY KEY (client_id),
    CONSTRAINT client_diagnosis FOREIGN KEY ("client_diagn(FK)")
        REFERENCES "hospitalDB".diagnoses (diagn_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE "hospitalDB".medfiles
    OWNER to postgres;

INSERT INTO "hospitalDB".medfiles VALUES
(201, 'Алексей Семенович Бойко', 1958-12-16, 'муж', '9-линия ВО д. 30', '8999123456', 1),
(202, 'Валентин Иванович Цой', 1985-10-12, 'муж', 'ул. Красноармейская д. 12', '8978321654', 2),
(203, 'Анна Григорьевна Моль', 1985-10-01, 'жен',  'ул. Космонавтов д. 8а', '8912456654', 3),
(204, 'Елена Константиновна Головач', 1999-05-07, 'жен', 'ул. Академиков д. 1', '8981321789', 4),
(205, 'Андрей Михайлович Воронцов', 1970-05-03, 'муж', 'ул. Андрея Рублева д. 56', '8913852159', 5)

-- Таблица приема пациента

CREATE TABLE "hospitalDB".consultation
(
    cons_id integer NOT NULL,
    "cons_doc(FK)" integer NOT NULL,
    "med_id(FK)" integer NOT NULL,
    "cab_id(FK)" integer NOT NULL,
    "price_id(FK)" integer NOT NULL,
    cons_date date NOT NULL,
    cons_status text COLLATE pg_catalog."default" NOT NULL,
    cons_treat text COLLATE pg_catalog."default" NOT NULL,
    pay_status boolean NOT NULL,
    CONSTRAINT consultation_pkey PRIMARY KEY (cons_id),
    CONSTRAINT cab_id FOREIGN KEY ("cab_id(FK)")
        REFERENCES "hospitalDB".cabinets (cab_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT doc_id FOREIGN KEY ("cons_doc(FK)")
        REFERENCES "hospitalDB".doctors (doc_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT med_id FOREIGN KEY ("med_id(FK)")
        REFERENCES "hospitalDB".medfiles (client_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT price_id FOREIGN KEY ("price_id(FK)")
        REFERENCES "hospitalDB".price (price_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE "hospitalDB".consultation
    OWNER to postgres;

INSERT INTO "hospitalDB".consultation VALUES
(1001, 5, 201, 100, 1, 2020-05-08, 'Кашель, отек в горле, увеличенные миндалины', 'Эргоферон 3 раза в день, постельный режим, обильное питье', 'true'),
(1002, 5, 202, 104, 5, 2020-05-04, 'Кашель, затрудненное дыхание, высокая температура', 'Обильное питье, постельный режим, определение в стационар на карантин', 'false'),
(1003, 3, 203, 102, 4, 2020-05-06, 'Острые боли в правом боку живота', 'Операционное вмешательство', 'false'),
(1004, 4, 204, 103, 3, 2020-05-05, 'Прогрессирующее ухудшение зрения левого глаза', 'Операционное вмешательство', 'false'),
(1005, 2, 205, 101, 2, 2020-05-07, 'Сильный насморк', 'Риностоп по 3 капли 2 раза в день', 'true'),






