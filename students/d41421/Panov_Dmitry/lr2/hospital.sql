PGDMP                         x            hospital    12.2    12.2 "    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    16393    hospital    DATABASE     �   CREATE DATABASE hospital WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE hospital;
                postgres    false                        2615    16432 
   hospitalDB    SCHEMA        CREATE SCHEMA "hospitalDB";
    DROP SCHEMA "hospitalDB";
                postgres    false            �            1259    16438    cabinets    TABLE     �   CREATE TABLE "hospitalDB".cabinets (
    cab_id integer NOT NULL,
    cab_phone text NOT NULL,
    "cab_leader(FK)" integer NOT NULL
);
 "   DROP TABLE "hospitalDB".cabinets;
    
   hospitalDB         heap    postgres    false    6            �            1259    16629    consultation    TABLE     T  CREATE TABLE "hospitalDB".consultation (
    cons_id integer NOT NULL,
    "cons_doc(FK)" integer NOT NULL,
    "med_id(FK)" integer NOT NULL,
    "cab_id(FK)" integer NOT NULL,
    "price_id(FK)" integer NOT NULL,
    cons_date date NOT NULL,
    cons_status text NOT NULL,
    cons_treat text NOT NULL,
    pay_status boolean NOT NULL
);
 &   DROP TABLE "hospitalDB".consultation;
    
   hospitalDB         heap    postgres    false    6            �            1259    16545 	   diagnoses    TABLE     e   CREATE TABLE "hospitalDB".diagnoses (
    diagn_id integer NOT NULL,
    diagn_name text NOT NULL
);
 #   DROP TABLE "hospitalDB".diagnoses;
    
   hospitalDB         heap    postgres    false    6            �            1259    16433    doctors    TABLE       CREATE TABLE "hospitalDB".doctors (
    doc_id integer NOT NULL,
    doc_name text NOT NULL,
    doc_gender text NOT NULL,
    doc_birth date NOT NULL,
    doc_spec text NOT NULL,
    doc_edu text NOT NULL,
    doc_start date NOT NULL,
    doc_finish date
);
 !   DROP TABLE "hospitalDB".doctors;
    
   hospitalDB         heap    postgres    false    6            �            1259    16573    medfiles    TABLE       CREATE TABLE "hospitalDB".medfiles (
    client_id integer NOT NULL,
    client_name text NOT NULL,
    client_birth date NOT NULL,
    client_gender text NOT NULL,
    client_adress text NOT NULL,
    client_phone text NOT NULL,
    "client_diagn(FK)" integer NOT NULL
);
 "   DROP TABLE "hospitalDB".medfiles;
    
   hospitalDB         heap    postgres    false    6            �            1259    16537    price    TABLE     �   CREATE TABLE "hospitalDB".price (
    price_id integer NOT NULL,
    price_val integer NOT NULL,
    price_descript text NOT NULL
);
    DROP TABLE "hospitalDB".price;
    
   hospitalDB         heap    postgres    false    6            �            1259    16553 	   timetable    TABLE     �   CREATE TABLE "hospitalDB".timetable (
    line_id integer NOT NULL,
    weekday date NOT NULL,
    day_of date NOT NULL,
    "cab_id(FK)" integer NOT NULL,
    "doc_id(FK)" integer NOT NULL
);
 #   DROP TABLE "hospitalDB".timetable;
    
   hospitalDB         heap    postgres    false    6            1          0    16438    cabinets 
   TABLE DATA           M   COPY "hospitalDB".cabinets (cab_id, cab_phone, "cab_leader(FK)") FROM stdin;
 
   hospitalDB          postgres    false    204   �*       6          0    16629    consultation 
   TABLE DATA           �   COPY "hospitalDB".consultation (cons_id, "cons_doc(FK)", "med_id(FK)", "cab_id(FK)", "price_id(FK)", cons_date, cons_status, cons_treat, pay_status) FROM stdin;
 
   hospitalDB          postgres    false    209   �*       3          0    16545 	   diagnoses 
   TABLE DATA           ?   COPY "hospitalDB".diagnoses (diagn_id, diagn_name) FROM stdin;
 
   hospitalDB          postgres    false    206   D,       0          0    16433    doctors 
   TABLE DATA           z   COPY "hospitalDB".doctors (doc_id, doc_name, doc_gender, doc_birth, doc_spec, doc_edu, doc_start, doc_finish) FROM stdin;
 
   hospitalDB          postgres    false    203   �,       5          0    16573    medfiles 
   TABLE DATA           �   COPY "hospitalDB".medfiles (client_id, client_name, client_birth, client_gender, client_adress, client_phone, "client_diagn(FK)") FROM stdin;
 
   hospitalDB          postgres    false    208   �-       2          0    16537    price 
   TABLE DATA           J   COPY "hospitalDB".price (price_id, price_val, price_descript) FROM stdin;
 
   hospitalDB          postgres    false    205   �.       4          0    16553 	   timetable 
   TABLE DATA           _   COPY "hospitalDB".timetable (line_id, weekday, day_of, "cab_id(FK)", "doc_id(FK)") FROM stdin;
 
   hospitalDB          postgres    false    207   O/       �
           2606    16442    cabinets cabinets_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY "hospitalDB".cabinets
    ADD CONSTRAINT cabinets_pkey PRIMARY KEY (cab_id);
 F   ALTER TABLE ONLY "hospitalDB".cabinets DROP CONSTRAINT cabinets_pkey;
    
   hospitalDB            postgres    false    204            �
           2606    16636    consultation consultation_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY "hospitalDB".consultation
    ADD CONSTRAINT consultation_pkey PRIMARY KEY (cons_id);
 N   ALTER TABLE ONLY "hospitalDB".consultation DROP CONSTRAINT consultation_pkey;
    
   hospitalDB            postgres    false    209            �
           2606    16552    diagnoses diagnoses_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "hospitalDB".diagnoses
    ADD CONSTRAINT diagnoses_pkey PRIMARY KEY (diagn_id);
 H   ALTER TABLE ONLY "hospitalDB".diagnoses DROP CONSTRAINT diagnoses_pkey;
    
   hospitalDB            postgres    false    206            �
           2606    16437    doctors doctors_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY "hospitalDB".doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doc_id);
 D   ALTER TABLE ONLY "hospitalDB".doctors DROP CONSTRAINT doctors_pkey;
    
   hospitalDB            postgres    false    203            �
           2606    16580    medfiles med_files_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "hospitalDB".medfiles
    ADD CONSTRAINT med_files_pkey PRIMARY KEY (client_id);
 G   ALTER TABLE ONLY "hospitalDB".medfiles DROP CONSTRAINT med_files_pkey;
    
   hospitalDB            postgres    false    208            �
           2606    16544    price price_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY "hospitalDB".price
    ADD CONSTRAINT price_pkey PRIMARY KEY (price_id);
 @   ALTER TABLE ONLY "hospitalDB".price DROP CONSTRAINT price_pkey;
    
   hospitalDB            postgres    false    205            �
           2606    16557    timetable timetable_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "hospitalDB".timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (line_id);
 H   ALTER TABLE ONLY "hospitalDB".timetable DROP CONSTRAINT timetable_pkey;
    
   hospitalDB            postgres    false    207            �
           2606    16563    timetable cab_id    FK CONSTRAINT     �   ALTER TABLE ONLY "hospitalDB".timetable
    ADD CONSTRAINT cab_id FOREIGN KEY ("cab_id(FK)") REFERENCES "hospitalDB".cabinets(cab_id) NOT VALID;
 @   ALTER TABLE ONLY "hospitalDB".timetable DROP CONSTRAINT cab_id;
    
   hospitalDB          postgres    false    207    204    2719            �
           2606    16647    consultation cab_id    FK CONSTRAINT     �   ALTER TABLE ONLY "hospitalDB".consultation
    ADD CONSTRAINT cab_id FOREIGN KEY ("cab_id(FK)") REFERENCES "hospitalDB".cabinets(cab_id) NOT VALID;
 C   ALTER TABLE ONLY "hospitalDB".consultation DROP CONSTRAINT cab_id;
    
   hospitalDB          postgres    false    2719    204    209            �
           2606    16624    cabinets cab_leader    FK CONSTRAINT     �   ALTER TABLE ONLY "hospitalDB".cabinets
    ADD CONSTRAINT cab_leader FOREIGN KEY ("cab_leader(FK)") REFERENCES "hospitalDB".doctors(doc_id) NOT VALID;
 C   ALTER TABLE ONLY "hospitalDB".cabinets DROP CONSTRAINT cab_leader;
    
   hospitalDB          postgres    false    2717    204    203            �
           2606    16601    medfiles client_diagnosis    FK CONSTRAINT     �   ALTER TABLE ONLY "hospitalDB".medfiles
    ADD CONSTRAINT client_diagnosis FOREIGN KEY ("client_diagn(FK)") REFERENCES "hospitalDB".diagnoses(diagn_id) NOT VALID;
 I   ALTER TABLE ONLY "hospitalDB".medfiles DROP CONSTRAINT client_diagnosis;
    
   hospitalDB          postgres    false    2723    208    206            �
           2606    16568    timetable doc_id    FK CONSTRAINT     �   ALTER TABLE ONLY "hospitalDB".timetable
    ADD CONSTRAINT doc_id FOREIGN KEY ("doc_id(FK)") REFERENCES "hospitalDB".doctors(doc_id) NOT VALID;
 @   ALTER TABLE ONLY "hospitalDB".timetable DROP CONSTRAINT doc_id;
    
   hospitalDB          postgres    false    2717    207    203            �
           2606    16637    consultation doc_id    FK CONSTRAINT     �   ALTER TABLE ONLY "hospitalDB".consultation
    ADD CONSTRAINT doc_id FOREIGN KEY ("cons_doc(FK)") REFERENCES "hospitalDB".doctors(doc_id) NOT VALID;
 C   ALTER TABLE ONLY "hospitalDB".consultation DROP CONSTRAINT doc_id;
    
   hospitalDB          postgres    false    203    209    2717            �
           2606    16642    consultation med_id    FK CONSTRAINT     �   ALTER TABLE ONLY "hospitalDB".consultation
    ADD CONSTRAINT med_id FOREIGN KEY ("med_id(FK)") REFERENCES "hospitalDB".medfiles(client_id) NOT VALID;
 C   ALTER TABLE ONLY "hospitalDB".consultation DROP CONSTRAINT med_id;
    
   hospitalDB          postgres    false    208    209    2727            �
           2606    16652    consultation price_id    FK CONSTRAINT     �   ALTER TABLE ONLY "hospitalDB".consultation
    ADD CONSTRAINT price_id FOREIGN KEY ("price_id(FK)") REFERENCES "hospitalDB".price(price_id) NOT VALID;
 E   ALTER TABLE ONLY "hospitalDB".consultation DROP CONSTRAINT price_id;
    
   hospitalDB          postgres    false    2721    209    205            1   <   x�%˹�0���%9���K���:�D��?j���"�e�}
��熵�Y~/�י%      6   ?  x�}��N�0���)� wU�!$F+K���S�з�m��!�e����y��6��y��\�";f�1�3ar��'��'�@:�����z��@��15����!���Bc���cԪ�G�Ek�aO祝D���P�C�G�C����!�pb���λZ���%�3�mU��i���eK�	M��KS*�Tpa�?���?O�0ZO���<��\-֌=5a@J���Οm�WyV����o���u!�晃S�Mz�qZ��^=����0�[+!ߢ��<����h
�K���0�|c��zN�0��$I�Z̡�      3   E   x�3���+����,�,�2�t�/��K,�,*-�2�t,(H�K�LK�p�V�d&r�red��b���� /�      0   �   x�U�Mj�0FףS�*��] ���@ �d�*�����mJ��Ќ޼or8�q�!;c��V�f��#��G� o���s	��in3t���^SA
�sQq�cz�Uv�����{�%%��4n2�[V���:A��{��ωV��pFMj'���ÐQr{^�aUq��`Sr��'��ѻM����]$Ў�P�����/"MvЏ���!F�E��H�.E#�-ZG��=[K���aI�l�'��7�-h�      5     x�=��j�0���z�č}�`+���6z�EK�b�Z�ay��]��A��_�R�M
�a��p��8��@ˉ��ֵJ�j-��}��)� �0R8�Ҧ�k�-�8`
���3ޥ�B�!g[%�b���&,�p:���pA���3Z�m'4kFlrF�N�f~�)�S��t�6�N��R8\��4]�J'9	aG�T���U�R���9�[i[��q�9sŜS�;/:�,G'��>�F\���Zhf��7����|�0����ZY/l�j���6l      2   y   x�Uͱ
1�z�+��\<{���&�Y�M��+�{s��<ff�c�u*NK�Ml}{qn����i�4U�;!�68�N�peg���3�u�>fH<����H� ̓����_�"� F9,2      4   H   x�U���0ߢg@�r����^��egps:c�x�(s�BgE��U(�(N[h�'*k@��O���= l��     