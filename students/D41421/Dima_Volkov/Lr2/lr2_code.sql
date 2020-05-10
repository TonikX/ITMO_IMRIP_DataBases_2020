
-- Создаём таблицу с информацией о хозяевах собак


-- Table: "Dog_EXB"."Dog_owner"

-- DROP TABLE "Dog_EXB"."Dog_owner";

CREATE TABLE "Dog_EXB"."Dog_owner"
(
    "ID_Owner" integer NOT NULL,
    CONSTRAINT "Dog_owner_pkey" PRIMARY KEY ("ID_Owner"),
	"Owner_passport" text COLLATE pg_catalog."default" NOT NULL,
    "Owner_name" text COLLATE pg_catalog."default" NOT NULL,
	"Owner_surname" text COLLATE pg_catalog."default" NOT NULL,
	"Owner_fname" text COLLATE pg_catalog."default" NOT NULL,
	"Payment" boolean NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "Dog_EXB"."Dog_owner"
    OWNER to postgres;

-- Заполняем таблицу хозяев
INSERT INTO "Dog_EXB"."Dog_owner"("ID_Owner","Owner_passport", "Owner_name","Owner_surname","Owner_fname","Payment") VALUES 
(1,101010, 'Dima','Dimov','Dimovich','1'),
(2,202020, 'Victor','Victorov','Victorovich','0'),
(3,303030, 'Masha','Mashova','Mashovna','1'),
(4,404040, 'Vanya','Vanovichev','Vanovichevich','0'),
(5,505050, 'Misha','Mishov','Mishovich','1');


-- Создаём таблицу с информацией о клубах

CREATE TABLE "Dog_EXB"."Club"
(
    "Club_number" integer NOT NULL,
    "Club_name" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Club_pkey" PRIMARY KEY ("Club_number")
)

TABLESPACE pg_default;

ALTER TABLE "Dog_EXB"."Club"
    OWNER to postgres;

-- Заполняем таблицу клубов
INSERT INTO "Dog_EXB"."Club"("Club_number", "Club_name") VALUES 
(1, 'Dog Wars'),
(2, 'Expendogs'),
(3, 'Superwolves'),
(4, 'Moon'),
(5, 'Romul and Rem');

-- Создаём таблицу с информацией о рингах

CREATE TABLE "Dog_EXB"."Ring"
(
    "Ring_number" integer NOT NULL,
    "Ring_name" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Ring_pkey" PRIMARY KEY ("Ring_number")
)

TABLESPACE pg_default;

ALTER TABLE "Dog_EXB"."Ring"
    OWNER to postgres;

-- Заполняем таблицу рингов
INSERT INTO "Dog_EXB"."Ring"("Ring_number", "Ring_name") VALUES 
(1, 'Lenexpo - 1'),
(2, 'Lenexpo - 2'),
(3, 'Lenexpo - 3'),
(4, 'Lenexpo - 4'),
(5, 'Lenexpo - 5');


-- Создаём таблицу с информацией о породе

CREATE TABLE "Dog_EXB"."Breed"
(
	"ID_breed" integer NOT NULL,
    "Breed_name" text COLLATE pg_catalog."default" NOT NULL,
    "Ring_number" integer,
    CONSTRAINT "Breed_pkey" PRIMARY KEY ("ID_breed"),
    CONSTRAINT "Ring_number_breed" FOREIGN KEY ("Ring_number")
        REFERENCES "Dog_EXB"."Ring" ("Ring_number") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
TABLESPACE pg_default;
ALTER TABLE "Dog_EXB"."Breed"
    OWNER to postgres;
-- Index: fki_Ring_number
-- DROP INDEX "Dog_EXB"."fki_Ring_number";
CREATE INDEX "fki_Ring_number"
    ON "Dog_EXB"."Breed" USING btree
    ("Ring_number" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Заполняем таблицу пород
INSERT INTO "Dog_EXB"."Breed"("ID_breed","Ring_number", "Breed_name") VALUES 
(1,1, 'Shepherd'),
(2,2, 'Terrier'),
(3,3, 'Doberman'),
(4,4, 'Pit bull'),
(5,5, 'Labrador');


-- Создаём таблицу с информацией о собаках

CREATE TABLE "Dog_EXB"."Dog"
(
    "ID_dog" integer NOT NULL,
    "ID_breed" integer NOT NULL,
    "Dog_name" text COLLATE pg_catalog."default" NOT NULL,
    "Dog_age" integer NOT NULL,
    "Club_number" integer NOT NULL,
    "Father_name" text COLLATE pg_catalog."default" NOT NULL,
    "Last_vaccination_date" date NOT NULL,
    "Med_check" boolean NOT NULL,
    "ID_Owner" integer NOT NULL,
    CONSTRAINT "Dog_pkey" PRIMARY KEY ("ID_dog"),
    CONSTRAINT "ID_breed" FOREIGN KEY ("ID_breed")
        REFERENCES "Dog_EXB"."Breed" ("ID_breed") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "ID_Owner" FOREIGN KEY ("ID_Owner")
        REFERENCES "Dog_EXB"."Dog_owner" ("ID_Owner") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
	CONSTRAINT "Club_number" FOREIGN KEY ("Club_number")
        REFERENCES "Dog_EXB"."Club" ("Club_number") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;
ALTER TABLE "Dog_EXB"."Dog"
    OWNER to postgres;
	
-- Index: fki_ID_breed
-- DROP INDEX "Dog_EXB"."fki_ID_breed";
CREATE INDEX "fki_ID_breed"
    ON "Dog_EXB"."Dog" USING btree
    ("ID_breed"ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_ID_Owner
-- DROP INDEX "Dog_EXB"."fki_ID_Owner";
CREATE INDEX "fki_ID_Owner"
    ON "Dog_EXB"."Dog" USING btree
    ("ID_Owner" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_Club_number
-- DROP INDEX "Dog_EXB"."fki_Club_number";
CREATE INDEX "fki_Club_number"
    ON "Dog_EXB"."Dog" USING btree
    ("Club_number" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Заполняем таблицу про собак
INSERT INTO "Dog_EXB"."Dog"("ID_dog", "ID_breed", "Dog_name", "Dog_age", "Club_number", "Father_name", "Last_vaccination_date","Med_check", "ID_Owner") VALUES 
	(1, 2, 'Pirozhok', 2,1,'Cheburek', '11/07/2020', '1', 1),
	(2, 1, 'Sliva', 1, 1 , 'Yabloko', '12/12/2019', '1', 2),
	(3, 3, 'Kolobok', 7,5,'Wolf', '02/12/2020', '1', 3),
	(4, 3, 'Erwin', 12,4, 'Data', '01/09/2020', '1', 4),
	(5, 4, 'Sunny', 5,3,'Rainy', '12/07/2019', '1', 5);



-- Создаём таблицу экспертов

CREATE TABLE "Dog_EXB"."Expert"
(
	"ID_expert" integer NOT NULL,
    "Expert_name" text COLLATE pg_catalog."default" NOT NULL,
	"Expert_surname" text COLLATE pg_catalog."default" NOT NULL,
    "Club_number" integer,
    "Ring_number" integer,
    CONSTRAINT "Expert_pkey" PRIMARY KEY ("ID_expert"),
    CONSTRAINT "Ring_number" FOREIGN KEY ("Ring_number")
        REFERENCES "Dog_EXB"."Ring" ("Ring_number") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Ring_number_expert" FOREIGN KEY ("Ring_number")
        REFERENCES "Dog_EXB"."Ring" ("Ring_number") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
	CONSTRAINT "Club_number" FOREIGN KEY ("Club_number")
		REFERENCES "Dog_EXB"."Club" ("Club_number") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Club_number_expert" FOREIGN KEY ("Club_number")
        REFERENCES "Dog_EXB"."Club" ("Club_number") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
TABLESPACE pg_default;
ALTER TABLE "Dog_EXB"."Expert"
    OWNER to postgres;
-- Index: fki_Ring_number_expert
-- DROP INDEX "Dog_EXB"."fki_Ring_number_expert";
CREATE INDEX "fki_Ring_number_expert"
    ON "Dog_EXB"."Expert" USING btree
    ("Ring_number" ASC NULLS LAST)
    TABLESPACE pg_default;
CREATE INDEX "fki_Club_number_expert"
    ON "Dog_EXB"."Expert" USING btree
    ("Club_number" ASC NULLS LAST)
    TABLESPACE pg_default;


-- Заполняем таблицу экспертов
INSERT INTO "Dog_EXB"."Expert"("ID_expert","Expert_name","Expert_surname", "Club_number", "Ring_number") VALUES 
(1,'Dima', 'Solnce', 1,1),
(2,'Vital', 'Lukin', 2,2),
(3,'Simon', 'Bolivar', 3,3),
(4,'Danila', 'Solkolov', 4,4),
(5,'Lokun', 'Mon', 5,5);


-- Создаём таблицу выставки

CREATE TABLE "Dog_EXB"."EXB"
(
    "ID_Exb" integer NOT NULL,
    "Exb_name" text COLLATE pg_catalog."default",
    "Location" text COLLATE pg_catalog."default" NOT NULL,
    "Date" date NOT NULL,
    CONSTRAINT "Exb_pkey" PRIMARY KEY ("ID_Exb")
)
TABLESPACE pg_default;
ALTER TABLE "Dog_EXB"."EXB"
    OWNER to postgres;

-- Заполняем таблицу выставки
INSERT INTO "Dog_EXB"."EXB"("ID_Exb", "Exb_name", "Location", "Date")
	VALUES 
	(1, 'Dog Lovers', 'Saint-Petersburg', '02/11/2020'),
	(2, 'Power Dog', 'Saint-Petersburg', '20/02/2020'),
	(3, 'Dog Hills', 'Saint-Petersburg', '11/04/2020'),
	(4, 'WAGGHH', 'Saint-Petersburg', '03/05/2020'),
	(5, 'Power of dog', 'Saint-Petersburg', '01/01/2020');



-- Создаём таблицу регистрации

CREATE TABLE "Dog_EXB"."Registration"
(
    "ID_reg" integer NOT NULL,
    "ID_dog" integer NOT NULL,
    "Ring_number" integer NOT NULL,
    "ID_Exb" integer,
    CONSTRAINT "Registration_pkey" PRIMARY KEY ("ID_reg"),
    CONSTRAINT "Ring_number_registartion" FOREIGN KEY ("Ring_number")
        REFERENCES "Dog_EXB"."Ring" ("Ring_number") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "ID_Dog_registration" FOREIGN KEY ("ID_dog")
        REFERENCES "Dog_EXB"."Dog" ("ID_dog") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "ID_Exb" FOREIGN KEY ("ID_Exb")
        REFERENCES "Dog_EXB"."EXB" ("ID_Exb") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
TABLESPACE pg_default;
ALTER TABLE "Dog_EXB"."Registration"
    OWNER to postgres;

-- Index: fki_Ring_number_registartion
-- DROP INDEX "Dog_EXB"."fki_Ring_number_registartion";
CREATE INDEX "fki_Ring_number_registartion"
    ON "Dog_EXB"."Registration" USING btree
    ("Ring_number" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_ID_Dog_number_registration
-- DROP INDEX "Dog_EXB"."fki_ID_Dog_registration";
CREATE INDEX "fki_ID_Dog_registration"
    ON "Dog_EXB"."Registration" USING btree
    ("ID_dog" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_ID_Exb_reg
-- DROP INDEX "Dog_EXB"."fki_ID_Exb_reg";
CREATE INDEX "fki_ID_Exb_reg"
    ON "Dog_EXB"."Registration" USING btree
    ("ID_Exb" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Заполняем таблицу регистрации	
INSERT INTO "Dog_EXB"."Registration"("ID_reg", "ID_dog", "Ring_number", "ID_Exb")
	VALUES 
	(1, 1, 2, 1),
	(2, 1, 4, 5),
	(3, 2, 5, 3),
	(4, 3, 2, 4),
	(5, 4, 1, 2);


-- Создаём таблицу выступления 

CREATE TABLE "Dog_EXB"."Сompetition"
(
    "ID_competition" integer NOT NULL,
    "Exercise_1_points" integer NOT NULL,
	"Exercise_2_points" integer NOT NULL,
	"Exercise_3_points" integer NOT NULL,
    "ID_reg" integer NOT NULL,
    "Score" integer NOT NULL,
    CONSTRAINT "ID_Сompetition_pkey" PRIMARY KEY ("ID_competition"),
    CONSTRAINT "ID_reg" FOREIGN KEY ("ID_reg")
        REFERENCES "Dog_EXB"."Registration" ("ID_reg") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
TABLESPACE pg_default;
ALTER TABLE "Dog_EXB"."Сompetition"
    OWNER to postgres;
	
-- Index: fki_ID_show
-- DROP INDEX show."fki_ID_show";
CREATE INDEX "fki_ID_reg"
    ON "Dog_EXB"."Сompetition" USING btree
    ("ID_reg" ASC NULLS LAST)
    TABLESPACE pg_default;


-- Заполняем таблицу выступления
INSERT INTO "Dog_EXB"."Сompetition"("ID_competition", "Exercise_1_points","Exercise_2_points","Exercise_3_points", "ID_reg", "Score")
	VALUES 
	(1, 2, 3, 7,1,12),
	(2, 4, 5,2,3,11),
	(3, 3, 2, 1,5,6),
	(4, 7, 5, 6,2,18),
	(5, 5, 2, 8,4,15);