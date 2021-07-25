--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: workout
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO workout;

--
-- Name: equipment; Type: TABLE; Schema: public; Owner: workout
--

CREATE TABLE public.equipment (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.equipment OWNER TO workout;

--
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: workout
--

CREATE SEQUENCE public.equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipment_id_seq OWNER TO workout;

--
-- Name: equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workout
--

ALTER SEQUENCE public.equipment_id_seq OWNED BY public.equipment.id;


--
-- Name: equipment_programs; Type: TABLE; Schema: public; Owner: workout
--

CREATE TABLE public.equipment_programs (
    equipment_id bigint NOT NULL,
    program_id bigint NOT NULL
);


ALTER TABLE public.equipment_programs OWNER TO workout;

--
-- Name: programs; Type: TABLE; Schema: public; Owner: workout
--

CREATE TABLE public.programs (
    id bigint NOT NULL,
    name character varying NOT NULL,
    sport_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.programs OWNER TO workout;

--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: workout
--

CREATE SEQUENCE public.programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programs_id_seq OWNER TO workout;

--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workout
--

ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: workout
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO workout;

--
-- Name: sports; Type: TABLE; Schema: public; Owner: workout
--

CREATE TABLE public.sports (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.sports OWNER TO workout;

--
-- Name: sports_id_seq; Type: SEQUENCE; Schema: public; Owner: workout
--

CREATE SEQUENCE public.sports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sports_id_seq OWNER TO workout;

--
-- Name: sports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: workout
--

ALTER SEQUENCE public.sports_id_seq OWNED BY public.sports.id;


--
-- Name: equipment id; Type: DEFAULT; Schema: public; Owner: workout
--

ALTER TABLE ONLY public.equipment ALTER COLUMN id SET DEFAULT nextval('public.equipment_id_seq'::regclass);


--
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: workout
--

ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- Name: sports id; Type: DEFAULT; Schema: public; Owner: workout
--

ALTER TABLE ONLY public.sports ALTER COLUMN id SET DEFAULT nextval('public.sports_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: workout
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-07-25 21:17:58.617585	2021-07-25 21:17:58.617585
\.


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: workout
--

COPY public.equipment (id, name, created_at, updated_at) FROM stdin;
1	band	2021-07-25 21:21:02.776597	2021-07-25 21:21:02.776597
2	barbell	2021-07-25 21:21:02.840734	2021-07-25 21:21:02.840734
3	bench	2021-07-25 21:21:02.845324	2021-07-25 21:21:02.845324
4	box	2021-07-25 21:21:02.849303	2021-07-25 21:21:02.849303
5	cable machine	2021-07-25 21:21:02.853121	2021-07-25 21:21:02.853121
6	dumbbell	2021-07-25 21:21:02.856994	2021-07-25 21:21:02.856994
7	glute-ham	2021-07-25 21:21:02.860511	2021-07-25 21:21:02.860511
8	incline bench	2021-07-25 21:21:02.863614	2021-07-25 21:21:02.863614
9	lat pulldown	2021-07-25 21:21:02.867265	2021-07-25 21:21:02.867265
10	medicine ball	2021-07-25 21:21:02.870743	2021-07-25 21:21:02.870743
11	pullup bar	2021-07-25 21:21:02.874595	2021-07-25 21:21:02.874595
12	squat rack	2021-07-25 21:21:02.878072	2021-07-25 21:21:02.878072
13	kettlebell	2021-07-25 21:21:02.880936	2021-07-25 21:21:02.880936
14	stability ball	2021-07-25 21:21:02.883761	2021-07-25 21:21:02.883761
\.


--
-- Data for Name: equipment_programs; Type: TABLE DATA; Schema: public; Owner: workout
--

COPY public.equipment_programs (equipment_id, program_id) FROM stdin;
4	1
2	2
6	3
7	3
10	3
14	3
11	3
1	3
12	3
13	3
3	3
9	3
8	3
4	3
3	4
8	4
10	5
13	5
1	5
9	5
5	5
14	5
3	5
12	5
6	5
11	5
4	6
6	6
10	6
5	6
12	6
7	6
1	6
11	6
14	6
3	6
9	6
13	6
8	6
3	7
9	7
4	7
6	7
12	7
10	7
3	8
9	9
6	9
14	9
11	9
4	9
7	9
5	9
5	10
10	10
13	10
2	10
11	10
1	10
12	10
14	10
4	10
7	10
6	10
3	10
9	10
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: workout
--

COPY public.programs (id, name, sport_id, created_at, updated_at) FROM stdin;
1	program0	1	2021-07-25 21:33:16.683609	2021-07-25 21:33:16.683609
2	program1	2	2021-07-25 21:33:16.692613	2021-07-25 21:33:16.692613
3	program2	3	2021-07-25 21:33:16.701874	2021-07-25 21:33:16.701874
4	program3	4	2021-07-25 21:33:16.720415	2021-07-25 21:33:16.720415
5	program4	5	2021-07-25 21:33:16.729374	2021-07-25 21:33:16.729374
6	program5	6	2021-07-25 21:33:16.748236	2021-07-25 21:33:16.748236
7	program6	7	2021-07-25 21:33:16.769966	2021-07-25 21:33:16.769966
8	program7	8	2021-07-25 21:33:16.78347	2021-07-25 21:33:16.78347
9	program8	9	2021-07-25 21:33:16.791174	2021-07-25 21:33:16.791174
10	program9	10	2021-07-25 21:33:16.807667	2021-07-25 21:33:16.807667
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: workout
--

COPY public.schema_migrations (version) FROM stdin;
20210723001517
20210723001526
20210723004151
20210723004725
\.


--
-- Data for Name: sports; Type: TABLE DATA; Schema: public; Owner: workout
--

COPY public.sports (id, name, created_at, updated_at) FROM stdin;
1	basketball	2021-07-25 21:23:42.812327	2021-07-25 21:23:42.812327
2	football	2021-07-25 21:23:42.824206	2021-07-25 21:23:42.824206
3	ice hockey	2021-07-25 21:23:42.831374	2021-07-25 21:23:42.831374
4	volleyball	2021-07-25 21:23:42.836634	2021-07-25 21:23:42.836634
5	lacrosse	2021-07-25 21:23:42.841174	2021-07-25 21:23:42.841174
6	skiing	2021-07-25 21:23:42.845345	2021-07-25 21:23:42.845345
7	swimming	2021-07-25 21:23:42.849126	2021-07-25 21:23:42.849126
8	surfing	2021-07-25 21:23:42.853116	2021-07-25 21:23:42.853116
9	track	2021-07-25 21:23:42.85683	2021-07-25 21:23:42.85683
10	wrestling	2021-07-25 21:23:42.859984	2021-07-25 21:23:42.859984
\.


--
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workout
--

SELECT pg_catalog.setval('public.equipment_id_seq', 14, true);


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workout
--

SELECT pg_catalog.setval('public.programs_id_seq', 10, true);


--
-- Name: sports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: workout
--

SELECT pg_catalog.setval('public.sports_id_seq', 10, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: workout
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: workout
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);


--
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: workout
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: workout
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sports sports_pkey; Type: CONSTRAINT; Schema: public; Owner: workout
--

ALTER TABLE ONLY public.sports
    ADD CONSTRAINT sports_pkey PRIMARY KEY (id);


--
-- Name: index_equipment_on_name; Type: INDEX; Schema: public; Owner: workout
--

CREATE INDEX index_equipment_on_name ON public.equipment USING btree (name);


--
-- Name: index_equipment_programs_on_equipment_id; Type: INDEX; Schema: public; Owner: workout
--

CREATE INDEX index_equipment_programs_on_equipment_id ON public.equipment_programs USING btree (equipment_id);


--
-- Name: index_equipment_programs_on_program_id; Type: INDEX; Schema: public; Owner: workout
--

CREATE INDEX index_equipment_programs_on_program_id ON public.equipment_programs USING btree (program_id);


--
-- Name: index_programs_on_name; Type: INDEX; Schema: public; Owner: workout
--

CREATE INDEX index_programs_on_name ON public.programs USING btree (name);


--
-- Name: index_programs_on_sport_id; Type: INDEX; Schema: public; Owner: workout
--

CREATE INDEX index_programs_on_sport_id ON public.programs USING btree (sport_id);


--
-- Name: index_sports_on_name; Type: INDEX; Schema: public; Owner: workout
--

CREATE INDEX index_sports_on_name ON public.sports USING btree (name);


--
-- PostgreSQL database dump complete
--

