--
-- PostgreSQL database dump
--

\restrict QiijFmFffGLLICqTlVdapq11NeabXTpohjVBzTiWeeIsErUVu4cMecrFnbx7QA0

-- Dumped from database version 17.10
-- Dumped by pg_dump version 17.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: brigade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.brigade (
    id integer NOT NULL,
    building_id integer NOT NULL,
    specialty_id integer NOT NULL,
    stage_name character varying(150) NOT NULL,
    foreman_worker_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    CONSTRAINT chk_brigade_dates CHECK ((end_date >= start_date))
);


--
-- Name: brigade_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.brigade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brigade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.brigade_id_seq OWNED BY public.brigade.id;


--
-- Name: brigade_member; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.brigade_member (
    brigade_id integer NOT NULL,
    worker_id integer NOT NULL
);


--
-- Name: building; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.building (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    building_type_id integer NOT NULL
);


--
-- Name: building_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.building_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: building_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.building_id_seq OWNED BY public.building.id;


--
-- Name: building_material; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.building_material (
    building_id integer NOT NULL,
    material_id integer NOT NULL,
    required_quantity numeric(12,2) NOT NULL,
    CONSTRAINT chk_building_material_quantity CHECK ((required_quantity > (0)::numeric))
);


--
-- Name: building_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.building_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- Name: building_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.building_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: building_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.building_type_id_seq OWNED BY public.building_type.id;


--
-- Name: material; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.material (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    unit character varying(30) NOT NULL
);


--
-- Name: material_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.material_id_seq OWNED BY public.material.id;


--
-- Name: specialty; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.specialty (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- Name: specialty_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.specialty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: specialty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.specialty_id_seq OWNED BY public.specialty.id;


--
-- Name: worker; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.worker (
    id integer NOT NULL,
    full_name character varying(150) NOT NULL,
    personal_number character varying(30) NOT NULL
);


--
-- Name: worker_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.worker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: worker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.worker_id_seq OWNED BY public.worker.id;


--
-- Name: worker_specialty; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.worker_specialty (
    worker_id integer NOT NULL,
    specialty_id integer NOT NULL
);


--
-- Name: brigade id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brigade ALTER COLUMN id SET DEFAULT nextval('public.brigade_id_seq'::regclass);


--
-- Name: building id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.building ALTER COLUMN id SET DEFAULT nextval('public.building_id_seq'::regclass);


--
-- Name: building_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.building_type ALTER COLUMN id SET DEFAULT nextval('public.building_type_id_seq'::regclass);


--
-- Name: material id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material ALTER COLUMN id SET DEFAULT nextval('public.material_id_seq'::regclass);


--
-- Name: specialty id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specialty ALTER COLUMN id SET DEFAULT nextval('public.specialty_id_seq'::regclass);


--
-- Name: worker id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worker ALTER COLUMN id SET DEFAULT nextval('public.worker_id_seq'::regclass);


--
-- Data for Name: brigade; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.brigade (id, building_id, specialty_id, stage_name, foreman_worker_id, start_date, end_date) FROM stdin;
1	1	1	Армирование фундамента	1	2026-09-01	2026-09-10
2	1	2	Бетонирование фундамента	3	2026-09-11	2026-09-18
3	1	3	Кладка наружных стен	4	2026-09-19	2026-10-05
4	2	5	Монтаж конструкций	7	2026-10-06	2026-10-21
5	3	2	Устройство бетонного пола	8	2026-10-22	2026-11-01
\.


--
-- Data for Name: brigade_member; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.brigade_member (brigade_id, worker_id) FROM stdin;
1	1
1	2
2	1
2	3
2	8
3	4
3	5
3	8
4	3
4	7
5	3
5	8
\.


--
-- Data for Name: building; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.building (id, name, building_type_id) FROM stdin;
1	Жилой дом № 1	1
2	Административный корпус	2
3	Склад № 1	3
\.


--
-- Data for Name: building_material; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.building_material (building_id, material_id, required_quantity) FROM stdin;
1	1	850.00
1	2	95.00
1	3	42000.00
1	4	7600.00
2	1	430.00
2	2	52.00
2	6	14500.00
2	4	3900.00
3	1	280.00
3	2	31.00
3	5	2400.00
\.


--
-- Data for Name: building_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.building_type (id, name) FROM stdin;
1	Многоквартирный жилой дом
2	Административное здание
3	Складское здание
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.material (id, name, unit) FROM stdin;
1	Бетон	м3
2	Арматура	т
3	Кирпич	шт
4	Штукатурная смесь	кг
5	Цемент	кг
6	Газобетонный блок	шт
\.


--
-- Data for Name: specialty; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.specialty (id, name) FROM stdin;
1	Арматурщик
2	Бетонщик
3	Каменщик
4	Штукатур
5	Монтажник
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.worker (id, full_name, personal_number) FROM stdin;
1	Иванов Сергей Петрович	W001
2	Петров Алексей Николаевич	W002
3	Сидоров Михаил Андреевич	W003
4	Кузнецов Илья Олегович	W004
5	Смирнов Павел Викторович	W005
6	Волков Дмитрий Сергеевич	W006
7	Морозов Антон Игоревич	W007
8	Федоров Роман Евгеньевич	W008
\.


--
-- Data for Name: worker_specialty; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.worker_specialty (worker_id, specialty_id) FROM stdin;
1	1
1	2
2	1
3	2
3	5
4	3
5	3
5	4
6	4
7	5
8	2
8	3
\.


--
-- Name: brigade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.brigade_id_seq', 5, true);


--
-- Name: building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.building_id_seq', 3, true);


--
-- Name: building_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.building_type_id_seq', 3, true);


--
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.material_id_seq', 6, true);


--
-- Name: specialty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.specialty_id_seq', 5, true);


--
-- Name: worker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.worker_id_seq', 8, true);


--
-- Name: brigade brigade_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brigade
    ADD CONSTRAINT brigade_pkey PRIMARY KEY (id);


--
-- Name: building building_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_pkey PRIMARY KEY (id);


--
-- Name: building_type building_type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.building_type
    ADD CONSTRAINT building_type_name_key UNIQUE (name);


--
-- Name: building_type building_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.building_type
    ADD CONSTRAINT building_type_pkey PRIMARY KEY (id);


--
-- Name: material material_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_name_key UNIQUE (name);


--
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- Name: brigade_member pk_brigade_member; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brigade_member
    ADD CONSTRAINT pk_brigade_member PRIMARY KEY (brigade_id, worker_id);


--
-- Name: building_material pk_building_material; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.building_material
    ADD CONSTRAINT pk_building_material PRIMARY KEY (building_id, material_id);


--
-- Name: worker_specialty pk_worker_specialty; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worker_specialty
    ADD CONSTRAINT pk_worker_specialty PRIMARY KEY (worker_id, specialty_id);


--
-- Name: specialty specialty_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_name_key UNIQUE (name);


--
-- Name: specialty specialty_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_pkey PRIMARY KEY (id);


--
-- Name: worker worker_personal_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_personal_number_key UNIQUE (personal_number);


--
-- Name: worker worker_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (id);


--
-- Name: brigade fk_brigade_building; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brigade
    ADD CONSTRAINT fk_brigade_building FOREIGN KEY (building_id) REFERENCES public.building(id) ON DELETE CASCADE;


--
-- Name: brigade fk_brigade_foreman; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brigade
    ADD CONSTRAINT fk_brigade_foreman FOREIGN KEY (foreman_worker_id) REFERENCES public.worker(id);


--
-- Name: brigade_member fk_brigade_member_brigade; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brigade_member
    ADD CONSTRAINT fk_brigade_member_brigade FOREIGN KEY (brigade_id) REFERENCES public.brigade(id) ON DELETE CASCADE;


--
-- Name: brigade_member fk_brigade_member_worker; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brigade_member
    ADD CONSTRAINT fk_brigade_member_worker FOREIGN KEY (worker_id) REFERENCES public.worker(id) ON DELETE CASCADE;


--
-- Name: brigade fk_brigade_specialty; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brigade
    ADD CONSTRAINT fk_brigade_specialty FOREIGN KEY (specialty_id) REFERENCES public.specialty(id);


--
-- Name: building_material fk_building_material_building; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.building_material
    ADD CONSTRAINT fk_building_material_building FOREIGN KEY (building_id) REFERENCES public.building(id) ON DELETE CASCADE;


--
-- Name: building_material fk_building_material_material; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.building_material
    ADD CONSTRAINT fk_building_material_material FOREIGN KEY (material_id) REFERENCES public.material(id);


--
-- Name: building fk_building_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT fk_building_type FOREIGN KEY (building_type_id) REFERENCES public.building_type(id);


--
-- Name: worker_specialty fk_worker_specialty_specialty; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worker_specialty
    ADD CONSTRAINT fk_worker_specialty_specialty FOREIGN KEY (specialty_id) REFERENCES public.specialty(id) ON DELETE CASCADE;


--
-- Name: worker_specialty fk_worker_specialty_worker; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worker_specialty
    ADD CONSTRAINT fk_worker_specialty_worker FOREIGN KEY (worker_id) REFERENCES public.worker(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict QiijFmFffGLLICqTlVdapq11NeabXTpohjVBzTiWeeIsErUVu4cMecrFnbx7QA0

