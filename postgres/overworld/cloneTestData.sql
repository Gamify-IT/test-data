--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area (
    dtype character varying(31) NOT NULL,
    id uuid NOT NULL,
    active boolean NOT NULL,
    configured boolean NOT NULL,
    index integer NOT NULL,
    static_name character varying(255) NOT NULL,
    topic_name character varying(255),
    course_id integer,
    world_id uuid
);


ALTER TABLE public.area OWNER TO postgres;

--
-- Name: area_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area_books (
    area_id uuid NOT NULL,
    books_id uuid NOT NULL
);


ALTER TABLE public.area_books OWNER TO postgres;

--
-- Name: area_dungeons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area_dungeons (
    world_id uuid NOT NULL,
    dungeons_id uuid NOT NULL
);


ALTER TABLE public.area_dungeons OWNER TO postgres;

--
-- Name: area_minigame_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area_minigame_tasks (
    area_id uuid NOT NULL,
    minigame_tasks_id uuid NOT NULL
);


ALTER TABLE public.area_minigame_tasks OWNER TO postgres;

--
-- Name: area_npcs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area_npcs (
    area_id uuid NOT NULL,
    npcs_id uuid NOT NULL
);


ALTER TABLE public.area_npcs OWNER TO postgres;

--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id uuid NOT NULL,
    description character varying(255),
    index integer NOT NULL,
    text character varying(1000000),
    area_id uuid,
    course_id integer
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id integer NOT NULL,
    active boolean NOT NULL,
    course_name character varying(255) NOT NULL,
    description character varying(255),
    semester character varying(255)
);


ALTER TABLE public.course OWNER TO postgres;

--
-- Name: course_player_statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_player_statistics (
    course_id integer NOT NULL,
    player_statistics_id uuid NOT NULL
);


ALTER TABLE public.course_player_statistics OWNER TO postgres;

--
-- Name: course_worlds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_worlds (
    course_id integer NOT NULL,
    worlds_id uuid NOT NULL
);


ALTER TABLE public.course_worlds OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: minigame_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.minigame_task (
    id uuid NOT NULL,
    configuration_id uuid,
    description character varying(255),
    game character varying(255),
    index integer NOT NULL,
    area_id uuid,
    course_id integer
);


ALTER TABLE public.minigame_task OWNER TO postgres;

--
-- Name: npc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.npc (
    id uuid NOT NULL,
    description character varying(255),
    index integer NOT NULL,
    area_id uuid,
    course_id integer
);


ALTER TABLE public.npc OWNER TO postgres;

--
-- Name: npc_text; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.npc_text (
    npc_id uuid NOT NULL,
    text character varying(255)
);


ALTER TABLE public.npc_text OWNER TO postgres;

--
-- Name: player_statistic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_statistic (
    id uuid NOT NULL,
    knowledge bigint NOT NULL,
    user_id character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    course_id integer,
    current_area_id uuid
);


ALTER TABLE public.player_statistic OWNER TO postgres;

--
-- Name: player_statistic_completed_dungeons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_statistic_completed_dungeons (
    player_statistic_id uuid NOT NULL,
    completed_dungeons_id uuid NOT NULL
);


ALTER TABLE public.player_statistic_completed_dungeons OWNER TO postgres;

--
-- Name: player_statistic_player_task_statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_statistic_player_task_statistics (
    player_statistic_id uuid NOT NULL,
    player_task_statistics_id uuid NOT NULL
);


ALTER TABLE public.player_statistic_player_task_statistics OWNER TO postgres;

--
-- Name: player_statistic_playernpcstatistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_statistic_playernpcstatistics (
    player_statistic_id uuid NOT NULL,
    playernpcstatistics_id uuid NOT NULL
);


ALTER TABLE public.player_statistic_playernpcstatistics OWNER TO postgres;

--
-- Name: player_statistic_unlocked_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_statistic_unlocked_areas (
    player_statistic_id uuid NOT NULL,
    unlocked_areas_id uuid NOT NULL
);


ALTER TABLE public.player_statistic_unlocked_areas OWNER TO postgres;

--
-- Name: player_task_action_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_task_action_log (
    id uuid NOT NULL,
    configuration_id uuid,
    current_highscore bigint NOT NULL,
    date timestamp without time zone,
    gained_knowledge bigint NOT NULL,
    game character varying(255),
    score bigint NOT NULL,
    course_id integer,
    player_task_statistic_id uuid
);


ALTER TABLE public.player_task_action_log OWNER TO postgres;

--
-- Name: player_task_statistic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_task_statistic (
    id uuid NOT NULL,
    completed boolean NOT NULL,
    highscore bigint NOT NULL,
    course_id integer,
    minigame_task_id uuid,
    player_statistic_id uuid,
    CONSTRAINT player_task_statistic_highscore_check CHECK (((highscore <= 100) AND (highscore >= 0)))
);


ALTER TABLE public.player_task_statistic OWNER TO postgres;

--
-- Name: player_task_statistic_player_task_action_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_task_statistic_player_task_action_logs (
    player_task_statistic_id uuid NOT NULL,
    player_task_action_logs_id uuid NOT NULL
);


ALTER TABLE public.player_task_statistic_player_task_action_logs OWNER TO postgres;

--
-- Name: playernpcaction_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playernpcaction_log (
    id uuid NOT NULL,
    date timestamp without time zone,
    gained_knowledge bigint NOT NULL,
    course_id integer,
    playernpcstatistic_id uuid
);


ALTER TABLE public.playernpcaction_log OWNER TO postgres;

--
-- Name: playernpcstatistic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playernpcstatistic (
    id uuid NOT NULL,
    completed boolean NOT NULL,
    course_id integer,
    npc_id uuid,
    player_statistic_id uuid
);


ALTER TABLE public.playernpcstatistic OWNER TO postgres;

--
-- Name: playernpcstatistic_playernpcaction_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playernpcstatistic_playernpcaction_logs (
    playernpcstatistic_id uuid NOT NULL,
    playernpcaction_logs_id uuid NOT NULL
);


ALTER TABLE public.playernpcstatistic_playernpcaction_logs OWNER TO postgres;

--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area (dtype, id, active, configured, index, static_name, topic_name, course_id, world_id) FROM stdin;
Dungeon	4223dc7c-7f3d-462b-9982-43e650f4bf0f	f	f	1	dungeon1		1	acaa562e-1708-442a-83d1-65cd2b887282
Dungeon	77691b12-d45a-44d2-91ce-5daa08485d87	f	f	2	dungeon2		1	acaa562e-1708-442a-83d1-65cd2b887282
Dungeon	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	f	f	3	dungeon3		1	acaa562e-1708-442a-83d1-65cd2b887282
Dungeon	618eea81-3859-4e0d-a456-70f5516cbf27	f	f	4	dungeon4		1	acaa562e-1708-442a-83d1-65cd2b887282
World	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	f	f	2	Sunny Beach		1	\N
Dungeon	dbce70d8-edbf-4a8a-822c-61b3395b591f	f	f	1	dungeon1		1	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2
Dungeon	ada1acea-439d-4168-b828-a4be1c39a531	f	f	2	dungeon2		1	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2
Dungeon	efca83e3-1284-4840-883c-098d3c40b559	f	f	3	dungeon3		1	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2
Dungeon	53263f22-a05e-4adf-a52b-0a6679e9b339	f	f	4	dungeon4		1	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2
World	4bc0e541-03c1-478e-98d9-ac454eeb18c5	f	f	3	Magic Forest		1	\N
Dungeon	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	f	f	1	dungeon1		1	4bc0e541-03c1-478e-98d9-ac454eeb18c5
Dungeon	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	f	f	2	dungeon2		1	4bc0e541-03c1-478e-98d9-ac454eeb18c5
Dungeon	881817c3-6446-4984-982e-c2ac13300b76	f	f	3	dungeon3		1	4bc0e541-03c1-478e-98d9-ac454eeb18c5
Dungeon	a912041d-e158-4452-ac47-49f3b9552398	f	f	4	dungeon4		1	4bc0e541-03c1-478e-98d9-ac454eeb18c5
World	8a4023af-f31f-4d52-b047-99e2e04fb301	f	f	4	Winter Wonder Land		1	\N
Dungeon	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	f	f	1	dungeon1		1	8a4023af-f31f-4d52-b047-99e2e04fb301
Dungeon	64960f63-845e-48e4-b905-1600d8ebf0ee	f	f	2	dungeon2		1	8a4023af-f31f-4d52-b047-99e2e04fb301
Dungeon	22a08277-b8a8-453d-9562-044eeb0baf17	f	f	3	dungeon3		1	8a4023af-f31f-4d52-b047-99e2e04fb301
Dungeon	85d25d01-7529-4e0a-988b-3acbdf9616ad	f	f	4	dungeon4		1	8a4023af-f31f-4d52-b047-99e2e04fb301
World	acaa562e-1708-442a-83d1-65cd2b887282	f	t	1	Blooming Savanna		1	\N
\.


--
-- Data for Name: area_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area_books (area_id, books_id) FROM stdin;
acaa562e-1708-442a-83d1-65cd2b887282	0c6ef10a-6139-437f-8bf4-c3300b4dc44f
acaa562e-1708-442a-83d1-65cd2b887282	0e97a6ea-a68b-4008-a1d1-c2d1c5a739df
acaa562e-1708-442a-83d1-65cd2b887282	a307d047-127e-4af5-8938-2fed917034bd
acaa562e-1708-442a-83d1-65cd2b887282	50bab967-580a-4193-82db-1e939488c58f
acaa562e-1708-442a-83d1-65cd2b887282	44f92108-14ad-422b-bf78-25bf8e798fb0
4223dc7c-7f3d-462b-9982-43e650f4bf0f	850333ff-6408-498a-a748-ea8daa17e1d4
4223dc7c-7f3d-462b-9982-43e650f4bf0f	25d84231-1a62-41b7-98c2-c63a9d5ed22b
4223dc7c-7f3d-462b-9982-43e650f4bf0f	4c85ad53-ba29-46a8-a895-1058fc1fa458
4223dc7c-7f3d-462b-9982-43e650f4bf0f	e0216c12-e65a-4680-acf9-2f59484858ad
4223dc7c-7f3d-462b-9982-43e650f4bf0f	cb09d229-e5b0-403a-b78f-4d36ec617dd5
77691b12-d45a-44d2-91ce-5daa08485d87	b870fff4-83da-45fe-85d7-788a6edfbb10
77691b12-d45a-44d2-91ce-5daa08485d87	f706051c-f016-4909-9cb5-e59e00483e68
77691b12-d45a-44d2-91ce-5daa08485d87	9823ae4e-56fb-48af-a1c5-992b42bd3f08
77691b12-d45a-44d2-91ce-5daa08485d87	5a62fde1-a126-4e9d-af59-09515b322c33
77691b12-d45a-44d2-91ce-5daa08485d87	00a8b15f-0e20-4267-a4b5-76efc2cf15fe
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	81d13123-5eb3-4c7a-9f14-f59c03a26684
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	ad6f78db-df20-43e3-bfe9-34e303ed28a3
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	4cfb0a19-0a2d-4d9b-b2b4-95336666f9a9
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	04934b13-c554-4e66-b50b-1b9cac0a3f44
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	0d899aeb-36be-4eeb-b210-40e9d385d50b
618eea81-3859-4e0d-a456-70f5516cbf27	31069da1-433e-42b4-9602-16843637465a
618eea81-3859-4e0d-a456-70f5516cbf27	af43e7cc-e0f1-4beb-aab4-dc926295a650
618eea81-3859-4e0d-a456-70f5516cbf27	c603ea49-e9a4-488d-b979-9c52e0e3475b
618eea81-3859-4e0d-a456-70f5516cbf27	a09f6666-4d5b-4a6b-9648-2fa449c140fb
618eea81-3859-4e0d-a456-70f5516cbf27	48903c8e-0b3e-41d3-ba59-ffe9648f3e9d
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	3faa16b9-65c8-4ef8-aefa-3dcfd08f9645
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	9e63c7e2-b97e-44f7-accd-53875b418225
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	d71cf0b6-d787-4930-8147-310ca8517649
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	56d746a1-387b-45ea-b416-c3b18fc4e3fe
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	9b9a7081-82df-4f4a-9f46-09c264b5f178
dbce70d8-edbf-4a8a-822c-61b3395b591f	687fb8dd-537f-4fec-a7aa-25308131084a
dbce70d8-edbf-4a8a-822c-61b3395b591f	81d6653a-467d-40c4-ab33-513112d14a57
dbce70d8-edbf-4a8a-822c-61b3395b591f	ebcdd4d8-0242-4527-871e-b9b7711700a1
dbce70d8-edbf-4a8a-822c-61b3395b591f	d75695c8-9980-4bb0-8156-8b1f7f6a67b0
dbce70d8-edbf-4a8a-822c-61b3395b591f	c4237a8f-bd7b-472f-af0d-e0d545191d99
ada1acea-439d-4168-b828-a4be1c39a531	47e837ca-ab8a-48b2-a797-088d3ee4ee3c
ada1acea-439d-4168-b828-a4be1c39a531	3dcdce67-8b59-4f5d-84e7-9b241bbc83e4
ada1acea-439d-4168-b828-a4be1c39a531	b9d3d7c5-23b1-4f4f-96a6-aa86806b6c07
ada1acea-439d-4168-b828-a4be1c39a531	38a3762a-99d8-4783-b311-3d7a53ab509f
ada1acea-439d-4168-b828-a4be1c39a531	e7fafaac-3197-4335-90f5-48f6906310a5
efca83e3-1284-4840-883c-098d3c40b559	46dcb9b6-5127-4765-a5c7-a208d8e8b651
efca83e3-1284-4840-883c-098d3c40b559	589a8e07-6eff-4893-a780-7c1e1e118827
efca83e3-1284-4840-883c-098d3c40b559	89891058-0cc1-451e-b016-c86800e74d49
efca83e3-1284-4840-883c-098d3c40b559	f10fb03d-c8f1-4081-a114-8a9d76acd28b
efca83e3-1284-4840-883c-098d3c40b559	5cf3f52c-5a34-457f-8cf6-d67ec1d95277
53263f22-a05e-4adf-a52b-0a6679e9b339	e87a36bb-8f83-4d41-9726-e493f8405468
53263f22-a05e-4adf-a52b-0a6679e9b339	35802fa5-4e8f-4608-94d4-905ac7be96b9
53263f22-a05e-4adf-a52b-0a6679e9b339	7dfc27a7-03a2-4033-8836-fb70e31dd511
53263f22-a05e-4adf-a52b-0a6679e9b339	0570a3c9-6ed0-47e9-a052-385e3ece9947
53263f22-a05e-4adf-a52b-0a6679e9b339	d04cf63f-b845-4ab3-b937-e2c3ef7a4230
4bc0e541-03c1-478e-98d9-ac454eeb18c5	a7fede37-9c6f-4438-9e88-90175277206a
4bc0e541-03c1-478e-98d9-ac454eeb18c5	bbc53559-7816-41c7-a800-dc927105ed88
4bc0e541-03c1-478e-98d9-ac454eeb18c5	8e5d857a-19a8-4efe-95fe-b1a4a34ff749
4bc0e541-03c1-478e-98d9-ac454eeb18c5	b91310ba-e208-40bd-90f3-6addecf2da36
4bc0e541-03c1-478e-98d9-ac454eeb18c5	02c029e3-6aec-47c0-92a6-ce4449efdacf
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	4d7d331f-ddf0-4af8-945b-5d353feb3e0f
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	dad68694-f8bc-4c00-ab94-06caf55937bd
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	44843d6d-0163-4bc2-b85e-8ba0ade85853
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	ee49524d-3f83-4bb8-aabc-203c722fea19
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	0b990922-f88f-4189-8cc9-0dda4a8e8382
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	5f17db4b-ea6e-4cab-886c-afbafa64f6d0
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	e4d7672f-2642-41ec-8fc9-91af1123553b
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	0092c3c9-8eef-49ee-9122-03d1e4ef316a
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	48179f64-a4d3-4529-8352-2ebf05b0dde3
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	45b21478-884a-4fe7-80df-d0d16b30bd66
881817c3-6446-4984-982e-c2ac13300b76	27763e66-9d1e-4078-b00d-27487f097f68
881817c3-6446-4984-982e-c2ac13300b76	70be8fdf-1a2d-4fea-b2be-a0faf55ec921
881817c3-6446-4984-982e-c2ac13300b76	397e7bbe-9dba-4941-b0fd-a175b396a062
881817c3-6446-4984-982e-c2ac13300b76	14b457b2-6c21-47d3-94ee-4de082bcb235
881817c3-6446-4984-982e-c2ac13300b76	d81a4975-47c5-4852-b11b-c4d8c0fc5461
a912041d-e158-4452-ac47-49f3b9552398	a9e9df3f-32bb-420c-b6d3-f59f8b5d6e4d
a912041d-e158-4452-ac47-49f3b9552398	0560e90b-4289-4500-b736-684b5ac6bec7
a912041d-e158-4452-ac47-49f3b9552398	892cb051-66ef-4730-a211-2d5a2a78a942
a912041d-e158-4452-ac47-49f3b9552398	1c6d73d6-3298-45a5-ba26-1ab828660ec1
a912041d-e158-4452-ac47-49f3b9552398	ba46575a-891e-4b54-911f-ad97ea67f280
8a4023af-f31f-4d52-b047-99e2e04fb301	3703caf4-2ac6-4e82-9072-9b09591b1df4
8a4023af-f31f-4d52-b047-99e2e04fb301	5a07dbf6-3465-4310-a4c7-3bdc9247446b
8a4023af-f31f-4d52-b047-99e2e04fb301	5a1dddd0-3ceb-4f69-892b-9d26ce583e4d
8a4023af-f31f-4d52-b047-99e2e04fb301	293f51cd-c18d-40a6-bac4-3a31822dd9b0
8a4023af-f31f-4d52-b047-99e2e04fb301	7e25bd4e-3705-4319-bb15-26bb4e236804
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	8c8ea07d-c47d-4464-87a2-b7087fee0c56
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	55c554ef-b6f3-4b44-b4a4-cf717a3431d3
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1ff7a925-1db1-4483-bda9-7ccf1f878286
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	d9f35421-0b03-4a9b-b836-ff080a13c825
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	4a92b8b6-c2b8-4c44-994b-0f84ec3424da
64960f63-845e-48e4-b905-1600d8ebf0ee	30ffae2e-b396-49a9-924f-6c131e4e4671
64960f63-845e-48e4-b905-1600d8ebf0ee	874cf47e-90fa-45b7-b6fd-922f361cf576
64960f63-845e-48e4-b905-1600d8ebf0ee	865e868e-16b9-43af-9eaf-ad9a99c5ce26
64960f63-845e-48e4-b905-1600d8ebf0ee	c0dacf96-84b0-4fe7-8b19-f14045983e41
64960f63-845e-48e4-b905-1600d8ebf0ee	e7c20076-ff06-4377-8d11-549dc2b52fdb
22a08277-b8a8-453d-9562-044eeb0baf17	cad0cd0e-2fe9-4f33-9460-a53f26ba9883
22a08277-b8a8-453d-9562-044eeb0baf17	a0d7cc95-26a8-4272-a7d4-f68142bfb098
22a08277-b8a8-453d-9562-044eeb0baf17	1cc93c4f-cce0-49a9-a671-ef0225aa7d38
22a08277-b8a8-453d-9562-044eeb0baf17	c505a9e7-ff8e-402f-b539-c32c07d603f8
22a08277-b8a8-453d-9562-044eeb0baf17	de95c57f-e47b-4045-8aae-98d5f87599d5
85d25d01-7529-4e0a-988b-3acbdf9616ad	9987ea02-e27a-48be-80f3-ce16ea8b26a8
85d25d01-7529-4e0a-988b-3acbdf9616ad	44f17eb5-fc10-4ab4-9b7e-98c64169c1eb
85d25d01-7529-4e0a-988b-3acbdf9616ad	582f6823-04ca-4627-96e4-6ce703c4a1a4
85d25d01-7529-4e0a-988b-3acbdf9616ad	6dcd3269-42ba-4b7b-951e-8a1a08efb7e7
85d25d01-7529-4e0a-988b-3acbdf9616ad	b7cdfcb5-9130-4652-9d9f-3340a8ec671b
\.


--
-- Data for Name: area_dungeons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area_dungeons (world_id, dungeons_id) FROM stdin;
acaa562e-1708-442a-83d1-65cd2b887282	4223dc7c-7f3d-462b-9982-43e650f4bf0f
acaa562e-1708-442a-83d1-65cd2b887282	77691b12-d45a-44d2-91ce-5daa08485d87
acaa562e-1708-442a-83d1-65cd2b887282	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44
acaa562e-1708-442a-83d1-65cd2b887282	618eea81-3859-4e0d-a456-70f5516cbf27
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	dbce70d8-edbf-4a8a-822c-61b3395b591f
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	ada1acea-439d-4168-b828-a4be1c39a531
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	efca83e3-1284-4840-883c-098d3c40b559
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	53263f22-a05e-4adf-a52b-0a6679e9b339
4bc0e541-03c1-478e-98d9-ac454eeb18c5	8a14cbad-608f-4f4e-81a9-8d187fa26cd2
4bc0e541-03c1-478e-98d9-ac454eeb18c5	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e
4bc0e541-03c1-478e-98d9-ac454eeb18c5	881817c3-6446-4984-982e-c2ac13300b76
4bc0e541-03c1-478e-98d9-ac454eeb18c5	a912041d-e158-4452-ac47-49f3b9552398
8a4023af-f31f-4d52-b047-99e2e04fb301	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c
8a4023af-f31f-4d52-b047-99e2e04fb301	64960f63-845e-48e4-b905-1600d8ebf0ee
8a4023af-f31f-4d52-b047-99e2e04fb301	22a08277-b8a8-453d-9562-044eeb0baf17
8a4023af-f31f-4d52-b047-99e2e04fb301	85d25d01-7529-4e0a-988b-3acbdf9616ad
\.


--
-- Data for Name: area_minigame_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area_minigame_tasks (area_id, minigame_tasks_id) FROM stdin;
acaa562e-1708-442a-83d1-65cd2b887282	1852e022-8c31-4437-b5db-3dd2ebbe01a8
acaa562e-1708-442a-83d1-65cd2b887282	4af3a5e0-bb06-4bce-a98a-f5255ce097d8
acaa562e-1708-442a-83d1-65cd2b887282	2c069c2a-4e5e-415b-9b21-a03ced23507f
acaa562e-1708-442a-83d1-65cd2b887282	83ba359d-d5f0-4660-a150-5921ff7d2924
acaa562e-1708-442a-83d1-65cd2b887282	7b6d3e74-cbd7-47ac-b9bb-5fa59ef26f1c
acaa562e-1708-442a-83d1-65cd2b887282	66a9c60c-a41f-4c34-838a-a10bd1e69b95
acaa562e-1708-442a-83d1-65cd2b887282	8289a472-cddd-451d-ac5a-63b5060cae61
acaa562e-1708-442a-83d1-65cd2b887282	5a1b261d-9760-4ac9-8dcf-1731ac96e331
acaa562e-1708-442a-83d1-65cd2b887282	aa8446ce-3b09-4d8a-b756-4f77382a5c96
acaa562e-1708-442a-83d1-65cd2b887282	89aaf061-f43d-4264-94af-52eca34aeca7
acaa562e-1708-442a-83d1-65cd2b887282	2a00a92d-82c3-49cd-a034-ac14f70f24b3
acaa562e-1708-442a-83d1-65cd2b887282	790302d6-cd08-4d6b-a344-36c206f88316
4223dc7c-7f3d-462b-9982-43e650f4bf0f	05a286e1-e535-47d0-857d-5432ebc53779
4223dc7c-7f3d-462b-9982-43e650f4bf0f	cd932364-f01a-4ef2-bea0-31a8498c4695
4223dc7c-7f3d-462b-9982-43e650f4bf0f	88d52094-f227-4e1c-a035-ff60b06fb016
4223dc7c-7f3d-462b-9982-43e650f4bf0f	7a156bff-bf34-4b9e-986a-bca0f9e47256
4223dc7c-7f3d-462b-9982-43e650f4bf0f	11885a42-2e8d-486c-b7ea-d5fa82bd6a40
4223dc7c-7f3d-462b-9982-43e650f4bf0f	839799a0-f90b-45ab-b360-e5c3859cd5d4
4223dc7c-7f3d-462b-9982-43e650f4bf0f	99ba9411-fd64-4e29-b1f8-5c858c639c6a
4223dc7c-7f3d-462b-9982-43e650f4bf0f	a2e28a76-bfe0-4b94-9495-b3e304303bba
4223dc7c-7f3d-462b-9982-43e650f4bf0f	18b806a4-5cf1-4d97-b794-731a3883133f
4223dc7c-7f3d-462b-9982-43e650f4bf0f	be36d880-6b7d-4bbc-b985-570385b76c10
4223dc7c-7f3d-462b-9982-43e650f4bf0f	4a5c8ba2-0b29-4e09-bc0a-e644262eba41
4223dc7c-7f3d-462b-9982-43e650f4bf0f	1231e80b-ab8e-4699-901e-cb83a140aad8
77691b12-d45a-44d2-91ce-5daa08485d87	b497b502-e61e-42dc-8e6b-5067c20dace6
77691b12-d45a-44d2-91ce-5daa08485d87	0f33eceb-6bf9-4f7b-8012-8d0a46c712ae
77691b12-d45a-44d2-91ce-5daa08485d87	672a58c2-8281-40fa-97d4-8c4892496099
77691b12-d45a-44d2-91ce-5daa08485d87	451542cc-d312-4ecd-ac03-1531c1be4468
77691b12-d45a-44d2-91ce-5daa08485d87	2d33e5af-dbe3-4bd6-aecb-1395c636e0b2
77691b12-d45a-44d2-91ce-5daa08485d87	9c57a3f8-3291-4047-b702-a84cdc85c933
77691b12-d45a-44d2-91ce-5daa08485d87	33764b04-f938-4f66-8471-1abf71f17a57
77691b12-d45a-44d2-91ce-5daa08485d87	eb0d9bb9-6a62-478e-9224-417f00f154d9
77691b12-d45a-44d2-91ce-5daa08485d87	ee17b5d9-de07-4b34-a8c9-a65a549b44c1
77691b12-d45a-44d2-91ce-5daa08485d87	0d580fff-8e20-4a89-852f-8e7f86c64043
77691b12-d45a-44d2-91ce-5daa08485d87	194c4443-e12c-4376-a59a-95ede14ad5dd
77691b12-d45a-44d2-91ce-5daa08485d87	d9cec878-ea2c-4e4b-a1c3-8250748dae7b
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	a3db7144-e8fb-4c35-af76-9a037010459b
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	d0a3063d-8b35-4844-8eea-292434ba203a
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	f00ef4d7-8bea-4d76-9bc9-3933cd4dfcd4
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1c7f1173-c2a7-4f2d-8dd3-0f0f3f2a01b4
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	2a1c3732-2acc-456a-ae2f-d6b10de700db
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	2c650d0b-cc1a-4e0f-af4e-5df59a1ca6de
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	a0bd11f3-8292-43f5-909e-8c668833424b
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	ac17df7f-0e74-4f9f-879a-53d7b8a405c3
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	d48d155a-44ed-45c9-a410-7bd3faf154da
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	0736c39f-7a9b-49d0-8d55-476695a0441a
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	6b4cb915-c246-4dd8-851e-3620dacf0dfe
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	e4d50d8a-0f3b-467d-8451-16d3b6ac738a
618eea81-3859-4e0d-a456-70f5516cbf27	e77008d2-2031-4882-a7fa-e3d00c3c49a8
618eea81-3859-4e0d-a456-70f5516cbf27	d1a3d3b0-d626-4c9d-81b3-c1eee62eef75
618eea81-3859-4e0d-a456-70f5516cbf27	3867f52e-3b85-4195-b286-5e5399a856d6
618eea81-3859-4e0d-a456-70f5516cbf27	5fdf1956-3095-4c33-9469-f0540538566c
618eea81-3859-4e0d-a456-70f5516cbf27	8ab934d9-705f-4b1e-900e-c34695345a14
618eea81-3859-4e0d-a456-70f5516cbf27	e783addb-53d5-4608-90ff-e5939e1ecc35
618eea81-3859-4e0d-a456-70f5516cbf27	8939ba0e-3fed-40f6-907e-b845329a792c
618eea81-3859-4e0d-a456-70f5516cbf27	0adf453e-6ea2-4bfb-83cd-dbdd0dc13148
618eea81-3859-4e0d-a456-70f5516cbf27	deb55002-ae10-4c87-a7cb-64e0cbbfe697
618eea81-3859-4e0d-a456-70f5516cbf27	ae0761d0-dad0-4e7a-9587-d18afc00539a
618eea81-3859-4e0d-a456-70f5516cbf27	343e723f-6944-4b31-901c-718f07341ccc
618eea81-3859-4e0d-a456-70f5516cbf27	ecb66171-268b-465a-9281-939bb76edba0
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	b516d523-02db-474f-be91-60eb81e86f3e
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	07d3f65e-2745-400d-b5b1-8b1b11b89adb
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	62f56647-14b3-4222-8d72-c133ea94ab3d
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	96d8393f-781f-4b3d-9301-3edcc3fcd57d
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	42a45c8a-368b-4032-8db1-60f58c90ea51
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	a3018a2d-a815-4a24-9c23-6320db8aaa7f
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	425f90d3-63a9-43f3-86e0-e5ecc78a15d2
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	e86b2429-54ef-40b4-aa06-670eb39b3a98
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	8bd4f6b8-f49c-43c2-9360-633e89eb0c58
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	178a554b-cc64-4c5c-9e54-aaf60d9dbfa7
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	85d181ee-d8dc-4620-848d-1221d1e9566c
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	4c475f88-b166-4c7a-a630-c251b8888c44
dbce70d8-edbf-4a8a-822c-61b3395b591f	6dc91026-1760-4561-b95a-713ff05bb83f
dbce70d8-edbf-4a8a-822c-61b3395b591f	50a25e2a-60a7-4c1c-8178-fc943b382a9e
dbce70d8-edbf-4a8a-822c-61b3395b591f	62c5d813-c79c-4b3e-a34d-e74ab4e8d91d
dbce70d8-edbf-4a8a-822c-61b3395b591f	7140504f-ec54-4d38-812a-02acc400da0c
dbce70d8-edbf-4a8a-822c-61b3395b591f	e1a808f3-f105-436d-92e7-bae5b38102e4
dbce70d8-edbf-4a8a-822c-61b3395b591f	6cafab6b-4578-444a-b178-0a07f21fc277
dbce70d8-edbf-4a8a-822c-61b3395b591f	972f738c-6afb-4612-ad09-41e906927060
dbce70d8-edbf-4a8a-822c-61b3395b591f	1dba6591-97a8-4eea-a204-670b89415720
dbce70d8-edbf-4a8a-822c-61b3395b591f	9e2fa0a6-162f-496f-9529-e410db4d1522
dbce70d8-edbf-4a8a-822c-61b3395b591f	d224b43e-e38b-4818-a282-286db4e65fc8
dbce70d8-edbf-4a8a-822c-61b3395b591f	b05870c2-f476-4b98-8258-ff48fe457528
dbce70d8-edbf-4a8a-822c-61b3395b591f	05c3fe17-f743-4a2e-96f1-05246431a563
ada1acea-439d-4168-b828-a4be1c39a531	9ef1afbb-e948-4aee-beeb-1df87f3bb407
ada1acea-439d-4168-b828-a4be1c39a531	8c8dafde-66c7-4af8-8dc8-4163df152380
ada1acea-439d-4168-b828-a4be1c39a531	4f09e4f4-3377-493b-9151-45315e0274cc
ada1acea-439d-4168-b828-a4be1c39a531	ad0f44ac-ced1-40ed-96f2-26ef8a2e1407
ada1acea-439d-4168-b828-a4be1c39a531	a22b5cb8-533d-4d1b-8a2e-e791c3a6951d
ada1acea-439d-4168-b828-a4be1c39a531	50972227-b715-4d80-9943-aca48d7975d4
ada1acea-439d-4168-b828-a4be1c39a531	5178c458-1f06-468b-9581-11a80793f290
ada1acea-439d-4168-b828-a4be1c39a531	4b42f5e2-c96c-4dab-abf5-5cf184e35c32
ada1acea-439d-4168-b828-a4be1c39a531	2a7f74d8-c9ec-4d81-9f6f-9b9b97f22a31
ada1acea-439d-4168-b828-a4be1c39a531	a1b5f318-f618-4d04-a19c-92db0fd2cef5
ada1acea-439d-4168-b828-a4be1c39a531	6b3f3d15-81d6-48d1-9dc8-fcdccd6cc0ee
ada1acea-439d-4168-b828-a4be1c39a531	ea3a4ee1-e550-488b-8ff4-d4a08505a1ea
efca83e3-1284-4840-883c-098d3c40b559	5a225e79-551a-439b-9aed-0a69d4a28b4a
efca83e3-1284-4840-883c-098d3c40b559	43dcecaf-fa7b-4389-9b5f-92513263e322
efca83e3-1284-4840-883c-098d3c40b559	2af5051b-20f7-488d-961d-cf530d3a00b4
efca83e3-1284-4840-883c-098d3c40b559	1ec8b370-4d8d-4e5d-b2af-68d80d4f31b2
efca83e3-1284-4840-883c-098d3c40b559	a36e144b-a8e3-4458-88d9-9f18586801c7
efca83e3-1284-4840-883c-098d3c40b559	1cf6f5d2-942b-4ef1-bf70-a8eb5903bad6
efca83e3-1284-4840-883c-098d3c40b559	bdafcdf0-02d2-4dc8-81f6-7b38723520e8
efca83e3-1284-4840-883c-098d3c40b559	ca4ea26a-97dd-47c5-afb3-7ce907a22f73
efca83e3-1284-4840-883c-098d3c40b559	6bf196a0-7900-4b5b-8465-1629943a57c6
efca83e3-1284-4840-883c-098d3c40b559	8f3988e1-a981-46a2-aa1b-816d64150687
efca83e3-1284-4840-883c-098d3c40b559	23d4b492-09bf-46c9-9561-02c3d3164fe6
efca83e3-1284-4840-883c-098d3c40b559	ede05067-9e6d-46e5-b9a4-73b0fff5302d
53263f22-a05e-4adf-a52b-0a6679e9b339	317679bf-3262-4fc1-81fc-c382d086055e
53263f22-a05e-4adf-a52b-0a6679e9b339	189c3cd9-ec00-48ed-b172-3915ddc331ca
53263f22-a05e-4adf-a52b-0a6679e9b339	df8ff905-f144-4053-91d5-5ea15c6593bb
53263f22-a05e-4adf-a52b-0a6679e9b339	22462e5c-e6bc-4ed5-9350-89ce19259286
53263f22-a05e-4adf-a52b-0a6679e9b339	b18f3c41-9f00-4f57-bb0f-975b89deeb5c
53263f22-a05e-4adf-a52b-0a6679e9b339	34035da4-b8d7-4fd0-b957-9a2ccc798fd3
53263f22-a05e-4adf-a52b-0a6679e9b339	8783ff13-1d57-4794-ab3a-eed2dddcaae3
53263f22-a05e-4adf-a52b-0a6679e9b339	2a1edfe4-85d7-4c26-a200-8fd5f831a66b
53263f22-a05e-4adf-a52b-0a6679e9b339	efd90865-f838-480e-8c28-60b0590a89c6
53263f22-a05e-4adf-a52b-0a6679e9b339	99cf8537-d693-412a-8a8e-866cf4606ab5
53263f22-a05e-4adf-a52b-0a6679e9b339	59987a20-7fe0-4d9b-b4d5-7b6c5820845f
53263f22-a05e-4adf-a52b-0a6679e9b339	1534778e-4ec1-4b8f-8a46-f4e2971bd062
4bc0e541-03c1-478e-98d9-ac454eeb18c5	d880fd12-7646-4834-bf9a-010df103e87a
4bc0e541-03c1-478e-98d9-ac454eeb18c5	3b2609e2-3b64-43bb-838a-810891c6a63c
4bc0e541-03c1-478e-98d9-ac454eeb18c5	dc2e94af-0128-4c73-9c0e-df5ed064d4b2
4bc0e541-03c1-478e-98d9-ac454eeb18c5	e7c40957-d0fa-4410-ab1f-b7c402c24418
4bc0e541-03c1-478e-98d9-ac454eeb18c5	fb3aef13-fcbe-4bf4-afe5-6623e78d2858
4bc0e541-03c1-478e-98d9-ac454eeb18c5	b80c0e5b-17e5-4843-9512-11118892dbe6
4bc0e541-03c1-478e-98d9-ac454eeb18c5	cd4c057c-a6d0-4e03-b425-98f60975836b
4bc0e541-03c1-478e-98d9-ac454eeb18c5	32a9d340-f582-4b8e-8fbb-8df24d274624
4bc0e541-03c1-478e-98d9-ac454eeb18c5	e9da628e-7a23-44cf-8519-c14ad600764b
4bc0e541-03c1-478e-98d9-ac454eeb18c5	ef0d913c-484e-41fd-adfc-080dd1f34f33
4bc0e541-03c1-478e-98d9-ac454eeb18c5	f7e2469f-4fbd-4bda-aa7a-73ec9d631a2c
4bc0e541-03c1-478e-98d9-ac454eeb18c5	3f413e80-9630-4ef0-9b1b-1dceba852b5c
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	5d1c7920-d11f-4dbb-a427-1efbbd9ca58f
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	89284984-0421-4755-82f1-7c6503ced411
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1456bfce-bd09-4833-bd5e-a69008de32fb
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	230ba019-064d-4374-b4f9-b839fbe63934
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	4af1f702-ba35-44cd-a86d-5faa2da0cd29
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	d8938457-122e-4e59-81e8-248b129b60e0
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	0e6b4a0e-967e-4b27-937a-f8a00190a077
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	f1c7ad75-cfba-4762-a2c0-877835509087
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	ac61ff83-b54d-4b65-8cd8-ac2ea886f300
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	5bff4ae0-e19e-4e65-9cf4-603142e4a221
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	54273643-1753-464e-9cdc-257c3bf14469
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	825231a7-7e90-45aa-81a1-154a10c8a41c
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	edfc93a8-a12e-429e-8bd0-bcde09652f53
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	d7a456e8-2afe-4743-b157-d807ca133033
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	816a7f31-d9b4-4685-b5f6-6f0dba306854
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	136d94e0-508d-4b73-8211-dae689cca560
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	5cbf6d4f-23e1-4a3a-a07b-427cc0e8399a
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	843f873b-61cd-4440-aa59-9d1c90481d9c
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	18c0ab31-6122-482d-8a26-47ba58a6d917
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	bc8c202d-49f3-40e8-814b-e0ff741a1bcb
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	17d3261e-8116-4dbc-bc02-7344f8e00ef5
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	fc616896-8f46-4f97-9092-55798bc5c60a
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	8a29b148-4964-49ac-a012-fda0705e8ba3
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	6ee3b745-f49c-4679-8688-d7481d60d8c5
881817c3-6446-4984-982e-c2ac13300b76	fca772b7-7784-44c1-bfbc-140e53514347
881817c3-6446-4984-982e-c2ac13300b76	40cc0d10-63a7-4d86-a93f-f16f5ad5c74c
881817c3-6446-4984-982e-c2ac13300b76	0537178d-462a-4efc-a09d-16e2b6229934
881817c3-6446-4984-982e-c2ac13300b76	15217be1-ca10-49fd-838f-b91eae052266
881817c3-6446-4984-982e-c2ac13300b76	54240883-314d-4f82-9de1-470f97ee0e0d
881817c3-6446-4984-982e-c2ac13300b76	80af0768-92d5-40d8-957a-7cc79b7aaaaa
881817c3-6446-4984-982e-c2ac13300b76	c83b8a8e-c8b8-497f-967a-c63b4055065a
881817c3-6446-4984-982e-c2ac13300b76	cd87e557-4455-4b5c-be40-6033084e053c
881817c3-6446-4984-982e-c2ac13300b76	b2d376bf-bf8d-433a-92be-ca5a5eb08064
881817c3-6446-4984-982e-c2ac13300b76	b1b039bb-b0d8-47cb-8244-2ebbd9e2d58a
881817c3-6446-4984-982e-c2ac13300b76	32441cfc-ed97-4b11-863b-6a2af792ab62
881817c3-6446-4984-982e-c2ac13300b76	1dc635f8-a900-4aec-bdd7-32c2db8872c9
a912041d-e158-4452-ac47-49f3b9552398	58784e2c-9094-4b9c-bc45-536139e0618f
a912041d-e158-4452-ac47-49f3b9552398	90d766b9-0a29-410d-8cb5-12dd04b0d3ce
a912041d-e158-4452-ac47-49f3b9552398	25c458cf-3a4f-45f1-b3f4-e1efbe8decab
a912041d-e158-4452-ac47-49f3b9552398	f85d09e5-7cea-43d0-aae9-76a086aa3e80
a912041d-e158-4452-ac47-49f3b9552398	f555ebc1-716c-4042-9cb2-17ab453573e1
a912041d-e158-4452-ac47-49f3b9552398	bc54f66f-f134-4c67-aa08-38414fbdda31
a912041d-e158-4452-ac47-49f3b9552398	1f40e359-5c72-4b64-8a6d-ec1599113c90
a912041d-e158-4452-ac47-49f3b9552398	cb7febaf-4d6c-46cd-9757-9e8dbc137630
a912041d-e158-4452-ac47-49f3b9552398	3a5924ee-7e60-4efc-ab87-ff02180e0ac7
a912041d-e158-4452-ac47-49f3b9552398	270181b8-42a0-46e4-9bcd-20d57877e7f9
a912041d-e158-4452-ac47-49f3b9552398	fbf4de46-6437-43ee-a587-82ced5738f57
a912041d-e158-4452-ac47-49f3b9552398	e3357ff8-0bf2-45c3-a645-0d3c6f328777
8a4023af-f31f-4d52-b047-99e2e04fb301	7ed56f90-0e59-48d9-84a0-b28d7615b91b
8a4023af-f31f-4d52-b047-99e2e04fb301	1b454e14-ae9e-47e8-8488-98f51af060ce
8a4023af-f31f-4d52-b047-99e2e04fb301	a028017b-be1f-4edd-ac34-58126ebc79e4
8a4023af-f31f-4d52-b047-99e2e04fb301	32711d08-f0ba-44e2-a3eb-678e7e5b98dd
8a4023af-f31f-4d52-b047-99e2e04fb301	87f5cf00-edae-4e88-9c89-829e3eb6ff4d
8a4023af-f31f-4d52-b047-99e2e04fb301	411f571b-09ab-4566-ab76-ebe1583c9ccb
8a4023af-f31f-4d52-b047-99e2e04fb301	5238be4f-2823-476d-ab9b-55ebd9675aac
8a4023af-f31f-4d52-b047-99e2e04fb301	4f2db3b4-bc75-4c82-8c60-22f24b3c3954
8a4023af-f31f-4d52-b047-99e2e04fb301	d9fa3692-9496-41c1-8fb2-e3fb59738038
8a4023af-f31f-4d52-b047-99e2e04fb301	c6d9f842-f998-4c4c-ba30-3a99664cd292
8a4023af-f31f-4d52-b047-99e2e04fb301	9fdc4205-dfcd-4a58-a2c2-7a21764cac6a
8a4023af-f31f-4d52-b047-99e2e04fb301	836b870b-cc9c-4aee-bdfa-089fcaa3d032
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	a7022a5a-1374-4f27-97f0-c1aa5966394c
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	949f13a9-2313-4999-a80a-bf4dcfc1f333
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	48fba280-ac5e-4ee7-a501-d70b60f4a3b5
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	c34249ae-8d90-4837-b1ef-69c660614e60
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	5a92b39f-c5ce-4ec8-8008-a1667b762a0d
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	dc05ef71-d64a-4c7d-bdc2-b9811ab00f2f
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	d3d3ae0e-08e1-4a67-8e09-f81d7b90aa80
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	4b8abb82-ee64-4586-b572-d7800e260f03
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	76b9d308-6f40-4d64-8af7-435fda6ee810
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	7ddde3f1-8e4a-412b-abbf-9afc9f87fecd
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	191078d9-445d-4b81-b3f4-900c30ff2cf1
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	8ad06419-914a-4891-86e0-0221a8e7f20b
64960f63-845e-48e4-b905-1600d8ebf0ee	e666e600-08d9-4d93-ad05-6efdc68e6256
64960f63-845e-48e4-b905-1600d8ebf0ee	74934347-bc01-4753-86f3-e72e301967f2
64960f63-845e-48e4-b905-1600d8ebf0ee	d93046e9-141d-43dc-bfa4-d96f94be9614
64960f63-845e-48e4-b905-1600d8ebf0ee	2d66f456-0186-4fb7-a57b-45bc1ac5578a
64960f63-845e-48e4-b905-1600d8ebf0ee	5cfb89db-0062-46e2-adf8-4f8b8729c115
64960f63-845e-48e4-b905-1600d8ebf0ee	c096e001-2f77-4882-ae8f-092e8a9eea67
64960f63-845e-48e4-b905-1600d8ebf0ee	67d64520-884d-4d88-a155-acdf23fbe409
64960f63-845e-48e4-b905-1600d8ebf0ee	f40e6eea-ae72-4605-abcc-f8f68586e5b2
64960f63-845e-48e4-b905-1600d8ebf0ee	65d4b9ff-5957-4cb5-b999-96958b2411dd
64960f63-845e-48e4-b905-1600d8ebf0ee	5f61e065-7c93-4892-94a1-e3168780fdae
64960f63-845e-48e4-b905-1600d8ebf0ee	6fa2b01f-2646-44a0-a59e-85bc8756a30c
64960f63-845e-48e4-b905-1600d8ebf0ee	e8e6baa4-0ebb-438a-b536-5ca349f9d662
22a08277-b8a8-453d-9562-044eeb0baf17	875617b1-aa44-44f3-9c8a-a14ba33e85cb
22a08277-b8a8-453d-9562-044eeb0baf17	5b186721-983b-4ccf-b690-15eb7d10035c
22a08277-b8a8-453d-9562-044eeb0baf17	4c061d5c-4b57-4ede-925b-e25e140046f3
22a08277-b8a8-453d-9562-044eeb0baf17	e48ab1f7-20f2-425a-9010-5e802c54e2a7
22a08277-b8a8-453d-9562-044eeb0baf17	0250893a-ad8e-425e-9e7e-cc9708403517
22a08277-b8a8-453d-9562-044eeb0baf17	15e3a7f1-34dc-4004-9d15-42e58acf0906
22a08277-b8a8-453d-9562-044eeb0baf17	51539b44-d8cf-4c34-b058-eac2085688ca
22a08277-b8a8-453d-9562-044eeb0baf17	d972992a-b006-4208-8e89-7606533a65f3
22a08277-b8a8-453d-9562-044eeb0baf17	7f8f7d07-b339-4cab-b68a-aa93eb439ead
22a08277-b8a8-453d-9562-044eeb0baf17	84c7e947-f45c-4270-a2be-2aaec4a8ba40
22a08277-b8a8-453d-9562-044eeb0baf17	2261aef8-79a6-414b-835f-b0b21df6f292
22a08277-b8a8-453d-9562-044eeb0baf17	6cb7859b-d18b-4bde-b833-3f69a3016662
85d25d01-7529-4e0a-988b-3acbdf9616ad	48bc1d60-3f1d-4a38-bb33-daab445ae89e
85d25d01-7529-4e0a-988b-3acbdf9616ad	67647d87-7935-4ae6-be69-288f2a57a870
85d25d01-7529-4e0a-988b-3acbdf9616ad	a558ceab-86e5-4480-a376-d287aeb989e1
85d25d01-7529-4e0a-988b-3acbdf9616ad	cdc5c04a-1c38-4525-b267-d8a625ba928c
85d25d01-7529-4e0a-988b-3acbdf9616ad	259dd37a-56dc-4d61-bf7b-a2f29649933b
85d25d01-7529-4e0a-988b-3acbdf9616ad	362ec029-7eca-4cfd-bb74-22f491fcef29
85d25d01-7529-4e0a-988b-3acbdf9616ad	3c76d675-509f-433f-9151-9738f14f5bd1
85d25d01-7529-4e0a-988b-3acbdf9616ad	e52cee0f-01f3-4a06-b667-cb11324d755b
85d25d01-7529-4e0a-988b-3acbdf9616ad	5857364a-4690-44df-8544-655d32ad97bd
85d25d01-7529-4e0a-988b-3acbdf9616ad	ea2ff075-cb07-4b67-88a1-330deeee3bd4
85d25d01-7529-4e0a-988b-3acbdf9616ad	833d48c1-4db3-4ee1-813a-6a4fd2b2438c
85d25d01-7529-4e0a-988b-3acbdf9616ad	1b25607a-fcdd-40e3-82b2-17807ac0a61c
\.


--
-- Data for Name: area_npcs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area_npcs (area_id, npcs_id) FROM stdin;
acaa562e-1708-442a-83d1-65cd2b887282	9b65b92e-c026-45c2-a914-4c6d0fc873cf
acaa562e-1708-442a-83d1-65cd2b887282	06282f6a-c575-4fb7-ad3c-109680568d39
acaa562e-1708-442a-83d1-65cd2b887282	db91a48b-aeda-41eb-a683-14614e1ca845
acaa562e-1708-442a-83d1-65cd2b887282	956a9ee3-d5cd-4f11-8e9d-74020a3d2a2b
acaa562e-1708-442a-83d1-65cd2b887282	768bd6a5-ec2b-41ec-8ada-09ef6d512f14
acaa562e-1708-442a-83d1-65cd2b887282	f538b88e-ff1e-443c-aa32-f995672ce016
acaa562e-1708-442a-83d1-65cd2b887282	df9807ca-85ec-43fc-8150-3ddd03805142
acaa562e-1708-442a-83d1-65cd2b887282	22f8b2d9-39b0-4ef9-bb43-d41b7b4d4a66
acaa562e-1708-442a-83d1-65cd2b887282	645c8480-c489-4220-9f5c-1ec2821dd4ca
acaa562e-1708-442a-83d1-65cd2b887282	de29f362-e886-4fdc-a552-b97f15331692
4223dc7c-7f3d-462b-9982-43e650f4bf0f	1ee7ced8-ed48-43d2-9970-95831248957b
4223dc7c-7f3d-462b-9982-43e650f4bf0f	3b9c2011-cdd7-4ddf-8222-80ea69159372
4223dc7c-7f3d-462b-9982-43e650f4bf0f	885f9c94-e8b9-4faa-aafa-ee51f9a11a54
4223dc7c-7f3d-462b-9982-43e650f4bf0f	d23be219-717d-4ec1-90e1-a5c3fe9c62ae
4223dc7c-7f3d-462b-9982-43e650f4bf0f	d62a368c-119a-4f20-b783-806a7f1b8749
4223dc7c-7f3d-462b-9982-43e650f4bf0f	ceeb712c-4ab2-4d66-ac89-3988524608e3
4223dc7c-7f3d-462b-9982-43e650f4bf0f	c287b479-d904-4bd0-9cb5-4bc87048a409
4223dc7c-7f3d-462b-9982-43e650f4bf0f	6e10661c-824d-4ff6-a68e-4d8df0c9ed44
4223dc7c-7f3d-462b-9982-43e650f4bf0f	1efe1492-3eba-488d-95aa-2d922de1236e
4223dc7c-7f3d-462b-9982-43e650f4bf0f	47c741e7-bb8a-4658-b713-60d82769f266
77691b12-d45a-44d2-91ce-5daa08485d87	13158dbf-b145-4c21-9adc-600a5c6c444e
77691b12-d45a-44d2-91ce-5daa08485d87	2aa402ce-b9b9-462d-b812-e90742f2d2fb
77691b12-d45a-44d2-91ce-5daa08485d87	229dc22e-d159-4685-b120-855b02124b78
77691b12-d45a-44d2-91ce-5daa08485d87	64f4067b-9a12-4734-951b-9012b73a4f9b
77691b12-d45a-44d2-91ce-5daa08485d87	c0e20ad1-a79f-404a-a440-3d1eb0047a62
77691b12-d45a-44d2-91ce-5daa08485d87	a639a627-1599-4247-bc6f-141ba2fdacd8
77691b12-d45a-44d2-91ce-5daa08485d87	8b4f6aa1-6af6-4920-a0c9-e2a1e191855f
77691b12-d45a-44d2-91ce-5daa08485d87	9a3a9ad7-2e6a-42ba-aae3-cf6023a11e43
77691b12-d45a-44d2-91ce-5daa08485d87	f8040a17-430c-48f0-9bce-f84f572c6cbf
77691b12-d45a-44d2-91ce-5daa08485d87	01fb6e1f-af00-4a90-8fd6-60529238f583
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	02f5d454-b54f-44cb-9cc4-c413a961072b
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	6789e1f4-9661-4f50-a322-c777a815a23b
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	c4d47c88-c3bd-4601-abb0-56cb6c0d9bd3
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	0a4f0b40-3f19-42c7-8a6c-a237415ff903
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	155ff8c6-8fc2-4221-bf4a-268e1fa85b2a
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	f6ce95b6-2f01-40ec-9ce6-9c311076dc61
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	151011a5-cfd3-48e2-9d9f-45806e36473d
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	d0e7f388-8415-40f2-a450-3cb6ddedca53
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	865d7ff0-1501-4f11-adcf-99168465b2d1
b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	4c349a5f-29c8-4e75-a8b4-1257f6168844
618eea81-3859-4e0d-a456-70f5516cbf27	bf7a76ba-4f03-4598-a4d9-95db14ecaf53
618eea81-3859-4e0d-a456-70f5516cbf27	07b45a2d-c1ef-4b5b-8ed3-6389555000e9
618eea81-3859-4e0d-a456-70f5516cbf27	c02c5c8c-d014-421b-8598-93f5929ff482
618eea81-3859-4e0d-a456-70f5516cbf27	f14d50d3-c514-4c7c-9d4d-fa6b3fb34f27
618eea81-3859-4e0d-a456-70f5516cbf27	fd1d45f6-ddba-4f81-b3cc-dd125f2abcb7
618eea81-3859-4e0d-a456-70f5516cbf27	ff6a0012-10fb-4a03-b56c-3f656d9b4ea8
618eea81-3859-4e0d-a456-70f5516cbf27	64713004-f5e0-4639-aea6-96825733eb43
618eea81-3859-4e0d-a456-70f5516cbf27	257fd906-b7d5-40a5-a4fd-587b2b8d35e4
618eea81-3859-4e0d-a456-70f5516cbf27	ec1d7a08-8f15-4dc4-954d-da9294636006
618eea81-3859-4e0d-a456-70f5516cbf27	bd81788a-e81d-4588-b81a-71091a53fd6c
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	d3c6f07f-3de0-4181-bae8-d5c93743dc5c
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	e5b2706d-6fc1-40f9-af79-4470a0a0b6e0
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	a66b0ff6-7852-4c4a-8304-d9b0682f51d2
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	7d118e6a-9d1c-4b79-9ecb-ec670116cc14
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	10eb0a97-4a3c-4a29-806e-e828ce0cd2a0
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	e1984fd3-e687-4946-a83b-908d7b92819e
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	7af5259a-02b7-4e5a-b51c-a1a4a9cde39a
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	bbb65296-0e54-4832-8ef5-e73699c7b043
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	37c784d4-bbf5-47e2-9ad6-5c73a2f8fca2
c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	2ccbe6fd-4e91-4120-b6ad-97c1a5b4d46a
dbce70d8-edbf-4a8a-822c-61b3395b591f	48908cb5-dac7-4c25-8136-bed67e6f89b7
dbce70d8-edbf-4a8a-822c-61b3395b591f	e2730e32-5beb-4d50-a650-01585720ed6d
dbce70d8-edbf-4a8a-822c-61b3395b591f	7139f704-0c6c-4b3c-9f18-e5a0ffae6aa1
dbce70d8-edbf-4a8a-822c-61b3395b591f	69f49060-bbf9-425a-8886-fbe3d01d8944
dbce70d8-edbf-4a8a-822c-61b3395b591f	ac016b95-6d73-4a48-8987-ac9a7614e54d
dbce70d8-edbf-4a8a-822c-61b3395b591f	023e25ec-7f18-4748-9a18-30536a7c82ed
dbce70d8-edbf-4a8a-822c-61b3395b591f	8cc8b8c8-e742-40b9-8ce7-72cebfa3bf67
dbce70d8-edbf-4a8a-822c-61b3395b591f	97d38b9d-7014-4c46-bd9a-85e289664e8f
dbce70d8-edbf-4a8a-822c-61b3395b591f	2e0c0e5b-e5b7-4c1b-b52b-f4410ea6afa0
dbce70d8-edbf-4a8a-822c-61b3395b591f	38b7aef4-6287-4aee-be74-734a70eafedd
ada1acea-439d-4168-b828-a4be1c39a531	35999676-02cf-4cfd-a1e3-f6109a98267a
ada1acea-439d-4168-b828-a4be1c39a531	be66bd07-d6cb-4434-9666-4b08d8d3891a
ada1acea-439d-4168-b828-a4be1c39a531	85e57523-558b-4a82-8f46-23efab45dd2d
ada1acea-439d-4168-b828-a4be1c39a531	0dab3f35-aae4-4f01-9c2e-c14390d78bb9
ada1acea-439d-4168-b828-a4be1c39a531	17f7fb6d-9984-4b9c-988b-99e7c8ac7f7d
ada1acea-439d-4168-b828-a4be1c39a531	d13e31a5-4ed2-45c1-bac0-5be8cb2fcdec
ada1acea-439d-4168-b828-a4be1c39a531	52e6b2d5-421f-4712-a414-4597b138ad61
ada1acea-439d-4168-b828-a4be1c39a531	30680ec9-5313-400d-b4fa-833c45d99f8d
ada1acea-439d-4168-b828-a4be1c39a531	746efd83-22b1-4309-a2bb-eb6326dc61f5
ada1acea-439d-4168-b828-a4be1c39a531	deec502f-70b4-4baa-b5b1-e2906c2f771a
efca83e3-1284-4840-883c-098d3c40b559	fe4af448-1a34-4482-946f-874488e6b1f6
efca83e3-1284-4840-883c-098d3c40b559	905cb45d-9a89-4444-a1e3-9a48d37f2803
efca83e3-1284-4840-883c-098d3c40b559	e4f127b7-9c20-4e70-8fe1-f74d320a032d
efca83e3-1284-4840-883c-098d3c40b559	68f46899-387d-41a6-9fb1-cbdd217af49c
efca83e3-1284-4840-883c-098d3c40b559	543fa826-09c3-4650-9c80-743cf09abd51
efca83e3-1284-4840-883c-098d3c40b559	cdafca15-3797-4326-8fc4-26ef7b43f5eb
efca83e3-1284-4840-883c-098d3c40b559	ce719fbf-9118-447f-a014-3afff4ff1c16
efca83e3-1284-4840-883c-098d3c40b559	05b87181-d3a7-4120-8694-faf41fe7acad
efca83e3-1284-4840-883c-098d3c40b559	2b9ee003-24a4-4f94-8492-996f8f472207
efca83e3-1284-4840-883c-098d3c40b559	e1e2123c-0c3d-43e1-96df-30383117833a
53263f22-a05e-4adf-a52b-0a6679e9b339	281c24a3-24b3-46b9-a30c-77e5f61126da
53263f22-a05e-4adf-a52b-0a6679e9b339	0e1f9c23-6964-49f4-8117-96c260adcd3a
53263f22-a05e-4adf-a52b-0a6679e9b339	01775e34-0d42-4c1d-9480-9d11b892311a
53263f22-a05e-4adf-a52b-0a6679e9b339	7c3efcb2-98ed-4742-bbe3-651e06006a6f
53263f22-a05e-4adf-a52b-0a6679e9b339	4effe8d5-8c11-4808-9f79-9a7676003694
53263f22-a05e-4adf-a52b-0a6679e9b339	23900a07-2039-46f3-9486-b24121c947fc
53263f22-a05e-4adf-a52b-0a6679e9b339	cff31ab4-4a3a-49c0-8105-5b00a7085615
53263f22-a05e-4adf-a52b-0a6679e9b339	cc1cd6c7-2319-49b2-b9b4-a1bb273075c3
53263f22-a05e-4adf-a52b-0a6679e9b339	58eac99f-09b4-4b3d-a742-5acb308db3a1
53263f22-a05e-4adf-a52b-0a6679e9b339	3a159368-d5b7-4caf-8a20-a40790c54ad6
4bc0e541-03c1-478e-98d9-ac454eeb18c5	d0fc5863-16a0-4f86-957f-b5ecd18e0501
4bc0e541-03c1-478e-98d9-ac454eeb18c5	c6cbd390-bab3-4d88-a622-52f7a56405ea
4bc0e541-03c1-478e-98d9-ac454eeb18c5	c57b1df5-d86a-4dae-a014-3745b321c948
4bc0e541-03c1-478e-98d9-ac454eeb18c5	9f8d764d-073c-410a-a4db-cf7a6281091e
4bc0e541-03c1-478e-98d9-ac454eeb18c5	ba54c663-6bf8-4868-ac2c-2cfc38cafe52
4bc0e541-03c1-478e-98d9-ac454eeb18c5	479b3746-07b7-4ba2-9f19-a2fb2fafdedb
4bc0e541-03c1-478e-98d9-ac454eeb18c5	986bae2c-0608-41e9-af7a-3d42d841a4c8
4bc0e541-03c1-478e-98d9-ac454eeb18c5	0d20e9e3-bf2a-4aaf-b0bc-37ad5bdaddf0
4bc0e541-03c1-478e-98d9-ac454eeb18c5	9a79f9e9-d7bc-4bee-b716-42c9367aa42e
4bc0e541-03c1-478e-98d9-ac454eeb18c5	5acc3d7a-e16d-415d-b508-51e17c66c46a
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	66f17b1a-74c6-48d0-9e81-4d69baa95135
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	463bea1b-3a52-45bb-ae41-9e0a03cb28a8
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	611aea04-9c16-45d1-8470-99e737343e3d
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	4645bd51-9b55-4fae-9e33-008b18cc30f9
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	cd442250-b689-4e57-8a2a-bb4b2a84b306
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	9e882fe4-f0de-4fa3-9907-1d12d0a21e3a
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	6d43e396-58f2-4930-974f-abc9812a86c1
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	e6d11b0c-6884-471b-acc5-89e8172c43fb
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	ef79592e-610f-4742-af30-e299e0596ec7
8a14cbad-608f-4f4e-81a9-8d187fa26cd2	d86c1a04-b2b4-42f9-b424-bfe90205bf32
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	0dddde64-4cb6-400f-a618-a869e55b3982
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	b146b014-30d4-4678-b17c-1a2d8f0a8016
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	807499ec-d04e-410c-8184-01c7e5780cdf
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	b4b7a37e-48ae-4bdf-8e6b-63ea1c72b001
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	ad21c87a-73e2-41ef-a94c-1d0d6b9e2aab
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	3ea0e3a9-fb53-4b80-b6f7-b1f06fa597bd
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	90f5065c-8f17-4b8d-a481-939135985ae0
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	3bf7ff38-8793-4b7f-890e-2a689549cb0a
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	905109cf-e691-4d45-88c0-9c3e77901b74
e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	9a583ae3-49f9-42f2-ad6a-cb214dfb750c
881817c3-6446-4984-982e-c2ac13300b76	5aee268e-c1e3-4a69-99bb-e8fa39c70912
881817c3-6446-4984-982e-c2ac13300b76	c89ae757-2127-4cdb-9fdf-693a0845fcfa
881817c3-6446-4984-982e-c2ac13300b76	23c7f4f2-e660-494c-98a0-e8f1b9ad8411
881817c3-6446-4984-982e-c2ac13300b76	682e2b6e-5c56-4c51-bd6c-4463f70a205b
881817c3-6446-4984-982e-c2ac13300b76	98f6db99-7401-42fb-b1db-1cdbcc2793cc
881817c3-6446-4984-982e-c2ac13300b76	5e929037-9e8f-4b67-8552-c398a1d5b1e9
881817c3-6446-4984-982e-c2ac13300b76	4bfcdf24-ced1-4f3a-b069-99fc33ce4174
881817c3-6446-4984-982e-c2ac13300b76	55d8c3f2-e1ee-4d9b-adde-5b26f165d0a5
881817c3-6446-4984-982e-c2ac13300b76	71fce7b1-e110-4441-979c-22463f6b4a03
881817c3-6446-4984-982e-c2ac13300b76	75c20377-087a-4a2d-98fb-4f2bc9c7906d
a912041d-e158-4452-ac47-49f3b9552398	3a7e4fed-0c0b-4039-8d80-b19f444c1229
a912041d-e158-4452-ac47-49f3b9552398	cce1f425-f0b1-4595-b07f-a1127a9f40f2
a912041d-e158-4452-ac47-49f3b9552398	9c143533-b8ac-44a3-a517-08af48c791d7
a912041d-e158-4452-ac47-49f3b9552398	861d0c33-4fc6-404f-a5e7-7c8fb3cb4708
a912041d-e158-4452-ac47-49f3b9552398	05a03d0c-a46e-4ff0-9825-74d74abdd773
a912041d-e158-4452-ac47-49f3b9552398	4b5b4532-1bd4-414a-81af-6b063baced86
a912041d-e158-4452-ac47-49f3b9552398	ef8f5042-7da8-4b83-920d-772381ed2f80
a912041d-e158-4452-ac47-49f3b9552398	2a7b864a-10b2-4898-846b-9de08b2adb1e
a912041d-e158-4452-ac47-49f3b9552398	4ee04741-b614-4e6a-b664-539d9c06db56
a912041d-e158-4452-ac47-49f3b9552398	336e4bf4-6c18-4b1e-9b1b-a5906f5a37ba
8a4023af-f31f-4d52-b047-99e2e04fb301	26b0ff54-d30d-409b-b75f-2636186a9be8
8a4023af-f31f-4d52-b047-99e2e04fb301	395412d6-5e66-4e7c-a5c1-162c27ca2d78
8a4023af-f31f-4d52-b047-99e2e04fb301	a45020cf-7ccf-429c-ab96-fd2c62fcf9af
8a4023af-f31f-4d52-b047-99e2e04fb301	9445c84d-000f-4797-b70c-561aa1a593b3
8a4023af-f31f-4d52-b047-99e2e04fb301	87ce1772-3f4d-41dc-a870-29f7d4664d8b
8a4023af-f31f-4d52-b047-99e2e04fb301	ee9ceb90-c119-47d9-abd1-1f7807c1baa1
8a4023af-f31f-4d52-b047-99e2e04fb301	12f1c9b8-f179-4467-86bd-76716c29ab88
8a4023af-f31f-4d52-b047-99e2e04fb301	91176df0-cdda-475c-bc47-f76d4afb86d5
8a4023af-f31f-4d52-b047-99e2e04fb301	ccc17ef2-1944-4efd-8caf-af0425c3ffef
8a4023af-f31f-4d52-b047-99e2e04fb301	cb597339-909b-4aa8-8844-00cdf1f06a1f
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	b842860c-7e3f-4436-91f4-4228a037cff1
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	15b2fba2-1ad4-4ca9-9591-d13d2353c0e4
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	f57f557e-95b0-409a-92de-49d401303648
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	34c87903-0a20-4c22-8b14-8b87745c39b0
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	7a6fada5-50c1-4da5-b495-e3d26e72c97f
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	916d3c9d-a131-4512-a31b-6dacfe6d1fc9
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	4cbfeedc-7573-4ff7-90b4-babf33e60392
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	4d496519-5006-4c0b-b0b1-086d554d3e74
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	79acff6c-fc9b-46ab-b505-c67d49e2643d
4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	0e8a3514-8ca7-41fd-8053-d039db09baaa
64960f63-845e-48e4-b905-1600d8ebf0ee	24fa725d-d6ad-4f9a-87b7-d3aefffdeddd
64960f63-845e-48e4-b905-1600d8ebf0ee	9d082e6d-d197-43c4-9f87-15b53e005974
64960f63-845e-48e4-b905-1600d8ebf0ee	7ffe17a6-4bab-4c61-8564-a4aaeed44afa
64960f63-845e-48e4-b905-1600d8ebf0ee	fbce0112-a0b8-41dd-b2fa-4a9998e50e9f
64960f63-845e-48e4-b905-1600d8ebf0ee	a4aa4ddb-e060-4aee-b8c7-e26691363939
64960f63-845e-48e4-b905-1600d8ebf0ee	0a0cd7ef-86e9-4cbb-8337-5c30f67213a7
64960f63-845e-48e4-b905-1600d8ebf0ee	c34dd98b-3575-4274-918d-f02ff77b5dc2
64960f63-845e-48e4-b905-1600d8ebf0ee	c6e0133a-c5af-483f-872d-f8dca578cb8a
64960f63-845e-48e4-b905-1600d8ebf0ee	89a1507a-3d72-4ef8-9505-9a8952e3c03a
64960f63-845e-48e4-b905-1600d8ebf0ee	4d8dbad0-e61d-4f3a-a12a-05409997555b
22a08277-b8a8-453d-9562-044eeb0baf17	b97baf4a-538f-43be-8d9a-711431c68afe
22a08277-b8a8-453d-9562-044eeb0baf17	a3d2379e-8417-44ac-896b-dbab09576827
22a08277-b8a8-453d-9562-044eeb0baf17	20b0ab82-0700-4bfc-aef4-c155ebaeb40a
22a08277-b8a8-453d-9562-044eeb0baf17	e0d2e384-eb04-476a-8b01-6a506b00d784
22a08277-b8a8-453d-9562-044eeb0baf17	c9449f40-1bd7-4748-aa4d-5686ab781e6b
22a08277-b8a8-453d-9562-044eeb0baf17	70142443-1db7-4602-9d98-42d5a3324b98
22a08277-b8a8-453d-9562-044eeb0baf17	06441997-6cb7-4647-acb5-6afd2f2b5792
22a08277-b8a8-453d-9562-044eeb0baf17	195a7ac9-fa98-48ce-b7cd-c6193fbb4559
22a08277-b8a8-453d-9562-044eeb0baf17	6ff345ff-a98b-4947-aea7-da18c4b4d052
22a08277-b8a8-453d-9562-044eeb0baf17	fc0ad42c-62ef-41e7-ae24-1b810203cf82
85d25d01-7529-4e0a-988b-3acbdf9616ad	36d23981-3144-46d1-9d5d-c847697cb358
85d25d01-7529-4e0a-988b-3acbdf9616ad	268766be-3fdb-47c8-ba52-b4350ee6134f
85d25d01-7529-4e0a-988b-3acbdf9616ad	0743ff90-4314-47f1-a18f-686f16127286
85d25d01-7529-4e0a-988b-3acbdf9616ad	d32fe160-b719-4def-9f6d-1c28296e2c96
85d25d01-7529-4e0a-988b-3acbdf9616ad	0bdac606-d5ca-4145-8043-a73c994271c8
85d25d01-7529-4e0a-988b-3acbdf9616ad	923470eb-987e-4776-bf11-99c5245f7f8c
85d25d01-7529-4e0a-988b-3acbdf9616ad	aa8dea73-3d3c-4943-b714-6e84f73ce665
85d25d01-7529-4e0a-988b-3acbdf9616ad	8b8c8f9b-92b6-4076-9747-514dfe6b2eb0
85d25d01-7529-4e0a-988b-3acbdf9616ad	cde4a3da-efc7-4343-8ce7-965cea2f0611
85d25d01-7529-4e0a-988b-3acbdf9616ad	c4cc9853-7c3f-4c9a-a01a-89042be4b230
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (id, description, index, text, area_id, course_id) FROM stdin;
0e97a6ea-a68b-4008-a1d1-c2d1c5a739df	\N	2		acaa562e-1708-442a-83d1-65cd2b887282	1
a307d047-127e-4af5-8938-2fed917034bd	\N	3		acaa562e-1708-442a-83d1-65cd2b887282	1
50bab967-580a-4193-82db-1e939488c58f	\N	4		acaa562e-1708-442a-83d1-65cd2b887282	1
44f92108-14ad-422b-bf78-25bf8e798fb0	\N	5		acaa562e-1708-442a-83d1-65cd2b887282	1
850333ff-6408-498a-a748-ea8daa17e1d4	\N	1		4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
25d84231-1a62-41b7-98c2-c63a9d5ed22b	\N	2		4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
4c85ad53-ba29-46a8-a895-1058fc1fa458	\N	3		4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
e0216c12-e65a-4680-acf9-2f59484858ad	\N	4		4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
cb09d229-e5b0-403a-b78f-4d36ec617dd5	\N	5		4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
b870fff4-83da-45fe-85d7-788a6edfbb10	\N	1		77691b12-d45a-44d2-91ce-5daa08485d87	1
f706051c-f016-4909-9cb5-e59e00483e68	\N	2		77691b12-d45a-44d2-91ce-5daa08485d87	1
9823ae4e-56fb-48af-a1c5-992b42bd3f08	\N	3		77691b12-d45a-44d2-91ce-5daa08485d87	1
5a62fde1-a126-4e9d-af59-09515b322c33	\N	4		77691b12-d45a-44d2-91ce-5daa08485d87	1
00a8b15f-0e20-4267-a4b5-76efc2cf15fe	\N	5		77691b12-d45a-44d2-91ce-5daa08485d87	1
81d13123-5eb3-4c7a-9f14-f59c03a26684	\N	1		b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
ad6f78db-df20-43e3-bfe9-34e303ed28a3	\N	2		b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
4cfb0a19-0a2d-4d9b-b2b4-95336666f9a9	\N	3		b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
04934b13-c554-4e66-b50b-1b9cac0a3f44	\N	4		b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
0d899aeb-36be-4eeb-b210-40e9d385d50b	\N	5		b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
31069da1-433e-42b4-9602-16843637465a	\N	1		618eea81-3859-4e0d-a456-70f5516cbf27	1
af43e7cc-e0f1-4beb-aab4-dc926295a650	\N	2		618eea81-3859-4e0d-a456-70f5516cbf27	1
c603ea49-e9a4-488d-b979-9c52e0e3475b	\N	3		618eea81-3859-4e0d-a456-70f5516cbf27	1
a09f6666-4d5b-4a6b-9648-2fa449c140fb	\N	4		618eea81-3859-4e0d-a456-70f5516cbf27	1
48903c8e-0b3e-41d3-ba59-ffe9648f3e9d	\N	5		618eea81-3859-4e0d-a456-70f5516cbf27	1
3faa16b9-65c8-4ef8-aefa-3dcfd08f9645	\N	1		c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
9e63c7e2-b97e-44f7-accd-53875b418225	\N	2		c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
d71cf0b6-d787-4930-8147-310ca8517649	\N	3		c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
56d746a1-387b-45ea-b416-c3b18fc4e3fe	\N	4		c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
9b9a7081-82df-4f4a-9f46-09c264b5f178	\N	5		c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
687fb8dd-537f-4fec-a7aa-25308131084a	\N	1		dbce70d8-edbf-4a8a-822c-61b3395b591f	1
81d6653a-467d-40c4-ab33-513112d14a57	\N	2		dbce70d8-edbf-4a8a-822c-61b3395b591f	1
ebcdd4d8-0242-4527-871e-b9b7711700a1	\N	3		dbce70d8-edbf-4a8a-822c-61b3395b591f	1
d75695c8-9980-4bb0-8156-8b1f7f6a67b0	\N	4		dbce70d8-edbf-4a8a-822c-61b3395b591f	1
c4237a8f-bd7b-472f-af0d-e0d545191d99	\N	5		dbce70d8-edbf-4a8a-822c-61b3395b591f	1
47e837ca-ab8a-48b2-a797-088d3ee4ee3c	\N	1		ada1acea-439d-4168-b828-a4be1c39a531	1
3dcdce67-8b59-4f5d-84e7-9b241bbc83e4	\N	2		ada1acea-439d-4168-b828-a4be1c39a531	1
b9d3d7c5-23b1-4f4f-96a6-aa86806b6c07	\N	3		ada1acea-439d-4168-b828-a4be1c39a531	1
38a3762a-99d8-4783-b311-3d7a53ab509f	\N	4		ada1acea-439d-4168-b828-a4be1c39a531	1
e7fafaac-3197-4335-90f5-48f6906310a5	\N	5		ada1acea-439d-4168-b828-a4be1c39a531	1
46dcb9b6-5127-4765-a5c7-a208d8e8b651	\N	1		efca83e3-1284-4840-883c-098d3c40b559	1
589a8e07-6eff-4893-a780-7c1e1e118827	\N	2		efca83e3-1284-4840-883c-098d3c40b559	1
89891058-0cc1-451e-b016-c86800e74d49	\N	3		efca83e3-1284-4840-883c-098d3c40b559	1
f10fb03d-c8f1-4081-a114-8a9d76acd28b	\N	4		efca83e3-1284-4840-883c-098d3c40b559	1
5cf3f52c-5a34-457f-8cf6-d67ec1d95277	\N	5		efca83e3-1284-4840-883c-098d3c40b559	1
e87a36bb-8f83-4d41-9726-e493f8405468	\N	1		53263f22-a05e-4adf-a52b-0a6679e9b339	1
35802fa5-4e8f-4608-94d4-905ac7be96b9	\N	2		53263f22-a05e-4adf-a52b-0a6679e9b339	1
7dfc27a7-03a2-4033-8836-fb70e31dd511	\N	3		53263f22-a05e-4adf-a52b-0a6679e9b339	1
0570a3c9-6ed0-47e9-a052-385e3ece9947	\N	4		53263f22-a05e-4adf-a52b-0a6679e9b339	1
d04cf63f-b845-4ab3-b937-e2c3ef7a4230	\N	5		53263f22-a05e-4adf-a52b-0a6679e9b339	1
a7fede37-9c6f-4438-9e88-90175277206a	\N	1		4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
bbc53559-7816-41c7-a800-dc927105ed88	\N	2		4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
8e5d857a-19a8-4efe-95fe-b1a4a34ff749	\N	3		4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
b91310ba-e208-40bd-90f3-6addecf2da36	\N	4		4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
02c029e3-6aec-47c0-92a6-ce4449efdacf	\N	5		4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
4d7d331f-ddf0-4af8-945b-5d353feb3e0f	\N	1		8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
dad68694-f8bc-4c00-ab94-06caf55937bd	\N	2		8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
44843d6d-0163-4bc2-b85e-8ba0ade85853	\N	3		8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
ee49524d-3f83-4bb8-aabc-203c722fea19	\N	4		8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
0b990922-f88f-4189-8cc9-0dda4a8e8382	\N	5		8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
5f17db4b-ea6e-4cab-886c-afbafa64f6d0	\N	1		e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
e4d7672f-2642-41ec-8fc9-91af1123553b	\N	2		e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
0092c3c9-8eef-49ee-9122-03d1e4ef316a	\N	3		e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
48179f64-a4d3-4529-8352-2ebf05b0dde3	\N	4		e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
45b21478-884a-4fe7-80df-d0d16b30bd66	\N	5		e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
27763e66-9d1e-4078-b00d-27487f097f68	\N	1		881817c3-6446-4984-982e-c2ac13300b76	1
70be8fdf-1a2d-4fea-b2be-a0faf55ec921	\N	2		881817c3-6446-4984-982e-c2ac13300b76	1
397e7bbe-9dba-4941-b0fd-a175b396a062	\N	3		881817c3-6446-4984-982e-c2ac13300b76	1
14b457b2-6c21-47d3-94ee-4de082bcb235	\N	4		881817c3-6446-4984-982e-c2ac13300b76	1
d81a4975-47c5-4852-b11b-c4d8c0fc5461	\N	5		881817c3-6446-4984-982e-c2ac13300b76	1
a9e9df3f-32bb-420c-b6d3-f59f8b5d6e4d	\N	1		a912041d-e158-4452-ac47-49f3b9552398	1
0560e90b-4289-4500-b736-684b5ac6bec7	\N	2		a912041d-e158-4452-ac47-49f3b9552398	1
892cb051-66ef-4730-a211-2d5a2a78a942	\N	3		a912041d-e158-4452-ac47-49f3b9552398	1
1c6d73d6-3298-45a5-ba26-1ab828660ec1	\N	4		a912041d-e158-4452-ac47-49f3b9552398	1
ba46575a-891e-4b54-911f-ad97ea67f280	\N	5		a912041d-e158-4452-ac47-49f3b9552398	1
3703caf4-2ac6-4e82-9072-9b09591b1df4	\N	1		8a4023af-f31f-4d52-b047-99e2e04fb301	1
5a07dbf6-3465-4310-a4c7-3bdc9247446b	\N	2		8a4023af-f31f-4d52-b047-99e2e04fb301	1
5a1dddd0-3ceb-4f69-892b-9d26ce583e4d	\N	3		8a4023af-f31f-4d52-b047-99e2e04fb301	1
293f51cd-c18d-40a6-bac4-3a31822dd9b0	\N	4		8a4023af-f31f-4d52-b047-99e2e04fb301	1
7e25bd4e-3705-4319-bb15-26bb4e236804	\N	5		8a4023af-f31f-4d52-b047-99e2e04fb301	1
8c8ea07d-c47d-4464-87a2-b7087fee0c56	\N	1		4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
55c554ef-b6f3-4b44-b4a4-cf717a3431d3	\N	2		4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
1ff7a925-1db1-4483-bda9-7ccf1f878286	\N	3		4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
d9f35421-0b03-4a9b-b836-ff080a13c825	\N	4		4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
4a92b8b6-c2b8-4c44-994b-0f84ec3424da	\N	5		4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
30ffae2e-b396-49a9-924f-6c131e4e4671	\N	1		64960f63-845e-48e4-b905-1600d8ebf0ee	1
874cf47e-90fa-45b7-b6fd-922f361cf576	\N	2		64960f63-845e-48e4-b905-1600d8ebf0ee	1
865e868e-16b9-43af-9eaf-ad9a99c5ce26	\N	3		64960f63-845e-48e4-b905-1600d8ebf0ee	1
c0dacf96-84b0-4fe7-8b19-f14045983e41	\N	4		64960f63-845e-48e4-b905-1600d8ebf0ee	1
e7c20076-ff06-4377-8d11-549dc2b52fdb	\N	5		64960f63-845e-48e4-b905-1600d8ebf0ee	1
cad0cd0e-2fe9-4f33-9460-a53f26ba9883	\N	1		22a08277-b8a8-453d-9562-044eeb0baf17	1
a0d7cc95-26a8-4272-a7d4-f68142bfb098	\N	2		22a08277-b8a8-453d-9562-044eeb0baf17	1
1cc93c4f-cce0-49a9-a671-ef0225aa7d38	\N	3		22a08277-b8a8-453d-9562-044eeb0baf17	1
c505a9e7-ff8e-402f-b539-c32c07d603f8	\N	4		22a08277-b8a8-453d-9562-044eeb0baf17	1
de95c57f-e47b-4045-8aae-98d5f87599d5	\N	5		22a08277-b8a8-453d-9562-044eeb0baf17	1
9987ea02-e27a-48be-80f3-ce16ea8b26a8	\N	1		85d25d01-7529-4e0a-988b-3acbdf9616ad	1
44f17eb5-fc10-4ab4-9b7e-98c64169c1eb	\N	2		85d25d01-7529-4e0a-988b-3acbdf9616ad	1
582f6823-04ca-4627-96e4-6ce703c4a1a4	\N	3		85d25d01-7529-4e0a-988b-3acbdf9616ad	1
6dcd3269-42ba-4b7b-951e-8a1a08efb7e7	\N	4		85d25d01-7529-4e0a-988b-3acbdf9616ad	1
b7cdfcb5-9130-4652-9d9f-3340a8ec671b	\N	5		85d25d01-7529-4e0a-988b-3acbdf9616ad	1
0c6ef10a-6139-437f-8bf4-c3300b4dc44f	a book	1	test text for a book	acaa562e-1708-442a-83d1-65cd2b887282	1
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (id, active, course_name, description, semester) FROM stdin;
1	t	PSE	introduction into the PSE	WS-22
\.


--
-- Data for Name: course_player_statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_player_statistics (course_id, player_statistics_id) FROM stdin;
\.


--
-- Data for Name: course_worlds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_worlds (course_id, worlds_id) FROM stdin;
1	acaa562e-1708-442a-83d1-65cd2b887282
1	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2
1	4bc0e541-03c1-478e-98d9-ac454eeb18c5
1	8a4023af-f31f-4d52-b047-99e2e04fb301
\.


--
-- Data for Name: minigame_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.minigame_task (id, configuration_id, description, game, index, area_id, course_id) FROM stdin;
7b6d3e74-cbd7-47ac-b9bb-5fa59ef26f1c	\N	\N	\N	5	acaa562e-1708-442a-83d1-65cd2b887282	1
66a9c60c-a41f-4c34-838a-a10bd1e69b95	\N	\N	\N	12	acaa562e-1708-442a-83d1-65cd2b887282	1
8289a472-cddd-451d-ac5a-63b5060cae61	\N	\N	\N	6	acaa562e-1708-442a-83d1-65cd2b887282	1
5a1b261d-9760-4ac9-8dcf-1731ac96e331	\N	\N	\N	11	acaa562e-1708-442a-83d1-65cd2b887282	1
aa8446ce-3b09-4d8a-b756-4f77382a5c96	\N	\N	\N	7	acaa562e-1708-442a-83d1-65cd2b887282	1
89aaf061-f43d-4264-94af-52eca34aeca7	\N	\N	\N	8	acaa562e-1708-442a-83d1-65cd2b887282	1
2a00a92d-82c3-49cd-a034-ac14f70f24b3	\N	\N	\N	9	acaa562e-1708-442a-83d1-65cd2b887282	1
790302d6-cd08-4d6b-a344-36c206f88316	\N	\N	\N	10	acaa562e-1708-442a-83d1-65cd2b887282	1
05a286e1-e535-47d0-857d-5432ebc53779	\N	\N	\N	2	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
cd932364-f01a-4ef2-bea0-31a8498c4695	\N	\N	\N	1	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
88d52094-f227-4e1c-a035-ff60b06fb016	\N	\N	\N	3	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
7a156bff-bf34-4b9e-986a-bca0f9e47256	\N	\N	\N	4	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
11885a42-2e8d-486c-b7ea-d5fa82bd6a40	\N	\N	\N	5	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
839799a0-f90b-45ab-b360-e5c3859cd5d4	\N	\N	\N	12	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
99ba9411-fd64-4e29-b1f8-5c858c639c6a	\N	\N	\N	6	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
a2e28a76-bfe0-4b94-9495-b3e304303bba	\N	\N	\N	11	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
18b806a4-5cf1-4d97-b794-731a3883133f	\N	\N	\N	7	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
be36d880-6b7d-4bbc-b985-570385b76c10	\N	\N	\N	8	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
4a5c8ba2-0b29-4e09-bc0a-e644262eba41	\N	\N	\N	9	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
1231e80b-ab8e-4699-901e-cb83a140aad8	\N	\N	\N	10	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
b497b502-e61e-42dc-8e6b-5067c20dace6	\N	\N	\N	2	77691b12-d45a-44d2-91ce-5daa08485d87	1
0f33eceb-6bf9-4f7b-8012-8d0a46c712ae	\N	\N	\N	1	77691b12-d45a-44d2-91ce-5daa08485d87	1
672a58c2-8281-40fa-97d4-8c4892496099	\N	\N	\N	3	77691b12-d45a-44d2-91ce-5daa08485d87	1
451542cc-d312-4ecd-ac03-1531c1be4468	\N	\N	\N	4	77691b12-d45a-44d2-91ce-5daa08485d87	1
2d33e5af-dbe3-4bd6-aecb-1395c636e0b2	\N	\N	\N	5	77691b12-d45a-44d2-91ce-5daa08485d87	1
9c57a3f8-3291-4047-b702-a84cdc85c933	\N	\N	\N	12	77691b12-d45a-44d2-91ce-5daa08485d87	1
33764b04-f938-4f66-8471-1abf71f17a57	\N	\N	\N	6	77691b12-d45a-44d2-91ce-5daa08485d87	1
eb0d9bb9-6a62-478e-9224-417f00f154d9	\N	\N	\N	11	77691b12-d45a-44d2-91ce-5daa08485d87	1
ee17b5d9-de07-4b34-a8c9-a65a549b44c1	\N	\N	\N	7	77691b12-d45a-44d2-91ce-5daa08485d87	1
0d580fff-8e20-4a89-852f-8e7f86c64043	\N	\N	\N	8	77691b12-d45a-44d2-91ce-5daa08485d87	1
194c4443-e12c-4376-a59a-95ede14ad5dd	\N	\N	\N	9	77691b12-d45a-44d2-91ce-5daa08485d87	1
d9cec878-ea2c-4e4b-a1c3-8250748dae7b	\N	\N	\N	10	77691b12-d45a-44d2-91ce-5daa08485d87	1
a3db7144-e8fb-4c35-af76-9a037010459b	\N	\N	\N	2	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
d0a3063d-8b35-4844-8eea-292434ba203a	\N	\N	\N	1	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
f00ef4d7-8bea-4d76-9bc9-3933cd4dfcd4	\N	\N	\N	3	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
1c7f1173-c2a7-4f2d-8dd3-0f0f3f2a01b4	\N	\N	\N	4	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
2a1c3732-2acc-456a-ae2f-d6b10de700db	\N	\N	\N	5	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
2c650d0b-cc1a-4e0f-af4e-5df59a1ca6de	\N	\N	\N	12	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
a0bd11f3-8292-43f5-909e-8c668833424b	\N	\N	\N	6	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
ac17df7f-0e74-4f9f-879a-53d7b8a405c3	\N	\N	\N	11	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
d48d155a-44ed-45c9-a410-7bd3faf154da	\N	\N	\N	7	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
0736c39f-7a9b-49d0-8d55-476695a0441a	\N	\N	\N	8	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
6b4cb915-c246-4dd8-851e-3620dacf0dfe	\N	\N	\N	9	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
e4d50d8a-0f3b-467d-8451-16d3b6ac738a	\N	\N	\N	10	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
e77008d2-2031-4882-a7fa-e3d00c3c49a8	\N	\N	\N	2	618eea81-3859-4e0d-a456-70f5516cbf27	1
d1a3d3b0-d626-4c9d-81b3-c1eee62eef75	\N	\N	\N	1	618eea81-3859-4e0d-a456-70f5516cbf27	1
3867f52e-3b85-4195-b286-5e5399a856d6	\N	\N	\N	3	618eea81-3859-4e0d-a456-70f5516cbf27	1
5fdf1956-3095-4c33-9469-f0540538566c	\N	\N	\N	4	618eea81-3859-4e0d-a456-70f5516cbf27	1
8ab934d9-705f-4b1e-900e-c34695345a14	\N	\N	\N	5	618eea81-3859-4e0d-a456-70f5516cbf27	1
e783addb-53d5-4608-90ff-e5939e1ecc35	\N	\N	\N	12	618eea81-3859-4e0d-a456-70f5516cbf27	1
8939ba0e-3fed-40f6-907e-b845329a792c	\N	\N	\N	6	618eea81-3859-4e0d-a456-70f5516cbf27	1
0adf453e-6ea2-4bfb-83cd-dbdd0dc13148	\N	\N	\N	11	618eea81-3859-4e0d-a456-70f5516cbf27	1
deb55002-ae10-4c87-a7cb-64e0cbbfe697	\N	\N	\N	7	618eea81-3859-4e0d-a456-70f5516cbf27	1
ae0761d0-dad0-4e7a-9587-d18afc00539a	\N	\N	\N	8	618eea81-3859-4e0d-a456-70f5516cbf27	1
343e723f-6944-4b31-901c-718f07341ccc	\N	\N	\N	9	618eea81-3859-4e0d-a456-70f5516cbf27	1
ecb66171-268b-465a-9281-939bb76edba0	\N	\N	\N	10	618eea81-3859-4e0d-a456-70f5516cbf27	1
b516d523-02db-474f-be91-60eb81e86f3e	\N	\N	\N	2	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
07d3f65e-2745-400d-b5b1-8b1b11b89adb	\N	\N	\N	1	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
62f56647-14b3-4222-8d72-c133ea94ab3d	\N	\N	\N	3	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
96d8393f-781f-4b3d-9301-3edcc3fcd57d	\N	\N	\N	4	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
42a45c8a-368b-4032-8db1-60f58c90ea51	\N	\N	\N	5	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
a3018a2d-a815-4a24-9c23-6320db8aaa7f	\N	\N	\N	12	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
425f90d3-63a9-43f3-86e0-e5ecc78a15d2	\N	\N	\N	6	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
e86b2429-54ef-40b4-aa06-670eb39b3a98	\N	\N	\N	11	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
8bd4f6b8-f49c-43c2-9360-633e89eb0c58	\N	\N	\N	7	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
178a554b-cc64-4c5c-9e54-aaf60d9dbfa7	\N	\N	\N	8	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
85d181ee-d8dc-4620-848d-1221d1e9566c	\N	\N	\N	9	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
4c475f88-b166-4c7a-a630-c251b8888c44	\N	\N	\N	10	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
6dc91026-1760-4561-b95a-713ff05bb83f	\N	\N	\N	2	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
50a25e2a-60a7-4c1c-8178-fc943b382a9e	\N	\N	\N	1	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
62c5d813-c79c-4b3e-a34d-e74ab4e8d91d	\N	\N	\N	3	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
7140504f-ec54-4d38-812a-02acc400da0c	\N	\N	\N	4	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
e1a808f3-f105-436d-92e7-bae5b38102e4	\N	\N	\N	5	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
6cafab6b-4578-444a-b178-0a07f21fc277	\N	\N	\N	12	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
972f738c-6afb-4612-ad09-41e906927060	\N	\N	\N	6	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
1dba6591-97a8-4eea-a204-670b89415720	\N	\N	\N	11	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
9e2fa0a6-162f-496f-9529-e410db4d1522	\N	\N	\N	7	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
d224b43e-e38b-4818-a282-286db4e65fc8	\N	\N	\N	8	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
b05870c2-f476-4b98-8258-ff48fe457528	\N	\N	\N	9	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
05c3fe17-f743-4a2e-96f1-05246431a563	\N	\N	\N	10	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
9ef1afbb-e948-4aee-beeb-1df87f3bb407	\N	\N	\N	2	ada1acea-439d-4168-b828-a4be1c39a531	1
8c8dafde-66c7-4af8-8dc8-4163df152380	\N	\N	\N	1	ada1acea-439d-4168-b828-a4be1c39a531	1
4f09e4f4-3377-493b-9151-45315e0274cc	\N	\N	\N	3	ada1acea-439d-4168-b828-a4be1c39a531	1
ad0f44ac-ced1-40ed-96f2-26ef8a2e1407	\N	\N	\N	4	ada1acea-439d-4168-b828-a4be1c39a531	1
a22b5cb8-533d-4d1b-8a2e-e791c3a6951d	\N	\N	\N	5	ada1acea-439d-4168-b828-a4be1c39a531	1
50972227-b715-4d80-9943-aca48d7975d4	\N	\N	\N	12	ada1acea-439d-4168-b828-a4be1c39a531	1
5178c458-1f06-468b-9581-11a80793f290	\N	\N	\N	6	ada1acea-439d-4168-b828-a4be1c39a531	1
4b42f5e2-c96c-4dab-abf5-5cf184e35c32	\N	\N	\N	11	ada1acea-439d-4168-b828-a4be1c39a531	1
2a7f74d8-c9ec-4d81-9f6f-9b9b97f22a31	\N	\N	\N	7	ada1acea-439d-4168-b828-a4be1c39a531	1
a1b5f318-f618-4d04-a19c-92db0fd2cef5	\N	\N	\N	8	ada1acea-439d-4168-b828-a4be1c39a531	1
6b3f3d15-81d6-48d1-9dc8-fcdccd6cc0ee	\N	\N	\N	9	ada1acea-439d-4168-b828-a4be1c39a531	1
ea3a4ee1-e550-488b-8ff4-d4a08505a1ea	\N	\N	\N	10	ada1acea-439d-4168-b828-a4be1c39a531	1
5a225e79-551a-439b-9aed-0a69d4a28b4a	\N	\N	\N	2	efca83e3-1284-4840-883c-098d3c40b559	1
43dcecaf-fa7b-4389-9b5f-92513263e322	\N	\N	\N	1	efca83e3-1284-4840-883c-098d3c40b559	1
2af5051b-20f7-488d-961d-cf530d3a00b4	\N	\N	\N	3	efca83e3-1284-4840-883c-098d3c40b559	1
1ec8b370-4d8d-4e5d-b2af-68d80d4f31b2	\N	\N	\N	4	efca83e3-1284-4840-883c-098d3c40b559	1
a36e144b-a8e3-4458-88d9-9f18586801c7	\N	\N	\N	5	efca83e3-1284-4840-883c-098d3c40b559	1
1cf6f5d2-942b-4ef1-bf70-a8eb5903bad6	\N	\N	\N	12	efca83e3-1284-4840-883c-098d3c40b559	1
bdafcdf0-02d2-4dc8-81f6-7b38723520e8	\N	\N	\N	6	efca83e3-1284-4840-883c-098d3c40b559	1
ca4ea26a-97dd-47c5-afb3-7ce907a22f73	\N	\N	\N	11	efca83e3-1284-4840-883c-098d3c40b559	1
6bf196a0-7900-4b5b-8465-1629943a57c6	\N	\N	\N	7	efca83e3-1284-4840-883c-098d3c40b559	1
8f3988e1-a981-46a2-aa1b-816d64150687	\N	\N	\N	8	efca83e3-1284-4840-883c-098d3c40b559	1
23d4b492-09bf-46c9-9561-02c3d3164fe6	\N	\N	\N	9	efca83e3-1284-4840-883c-098d3c40b559	1
ede05067-9e6d-46e5-b9a4-73b0fff5302d	\N	\N	\N	10	efca83e3-1284-4840-883c-098d3c40b559	1
317679bf-3262-4fc1-81fc-c382d086055e	\N	\N	\N	2	53263f22-a05e-4adf-a52b-0a6679e9b339	1
189c3cd9-ec00-48ed-b172-3915ddc331ca	\N	\N	\N	1	53263f22-a05e-4adf-a52b-0a6679e9b339	1
df8ff905-f144-4053-91d5-5ea15c6593bb	\N	\N	\N	3	53263f22-a05e-4adf-a52b-0a6679e9b339	1
22462e5c-e6bc-4ed5-9350-89ce19259286	\N	\N	\N	4	53263f22-a05e-4adf-a52b-0a6679e9b339	1
b18f3c41-9f00-4f57-bb0f-975b89deeb5c	\N	\N	\N	5	53263f22-a05e-4adf-a52b-0a6679e9b339	1
34035da4-b8d7-4fd0-b957-9a2ccc798fd3	\N	\N	\N	12	53263f22-a05e-4adf-a52b-0a6679e9b339	1
8783ff13-1d57-4794-ab3a-eed2dddcaae3	\N	\N	\N	6	53263f22-a05e-4adf-a52b-0a6679e9b339	1
2a1edfe4-85d7-4c26-a200-8fd5f831a66b	\N	\N	\N	11	53263f22-a05e-4adf-a52b-0a6679e9b339	1
efd90865-f838-480e-8c28-60b0590a89c6	\N	\N	\N	7	53263f22-a05e-4adf-a52b-0a6679e9b339	1
99cf8537-d693-412a-8a8e-866cf4606ab5	\N	\N	\N	8	53263f22-a05e-4adf-a52b-0a6679e9b339	1
59987a20-7fe0-4d9b-b4d5-7b6c5820845f	\N	\N	\N	9	53263f22-a05e-4adf-a52b-0a6679e9b339	1
1534778e-4ec1-4b8f-8a46-f4e2971bd062	\N	\N	\N	10	53263f22-a05e-4adf-a52b-0a6679e9b339	1
83ba359d-d5f0-4660-a150-5921ff7d2924	2e5d0718-fdfe-4738-87da-b55b6ed62a35	Bugfinder game	BUGFINDER	4	acaa562e-1708-442a-83d1-65cd2b887282	1
d880fd12-7646-4834-bf9a-010df103e87a	\N	\N	\N	2	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
3b2609e2-3b64-43bb-838a-810891c6a63c	\N	\N	\N	1	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
dc2e94af-0128-4c73-9c0e-df5ed064d4b2	\N	\N	\N	3	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
e7c40957-d0fa-4410-ab1f-b7c402c24418	\N	\N	\N	4	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
fb3aef13-fcbe-4bf4-afe5-6623e78d2858	\N	\N	\N	5	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
b80c0e5b-17e5-4843-9512-11118892dbe6	\N	\N	\N	12	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
cd4c057c-a6d0-4e03-b425-98f60975836b	\N	\N	\N	6	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
32a9d340-f582-4b8e-8fbb-8df24d274624	\N	\N	\N	11	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
e9da628e-7a23-44cf-8519-c14ad600764b	\N	\N	\N	7	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
ef0d913c-484e-41fd-adfc-080dd1f34f33	\N	\N	\N	8	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
f7e2469f-4fbd-4bda-aa7a-73ec9d631a2c	\N	\N	\N	9	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
3f413e80-9630-4ef0-9b1b-1dceba852b5c	\N	\N	\N	10	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
5d1c7920-d11f-4dbb-a427-1efbbd9ca58f	\N	\N	\N	2	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
89284984-0421-4755-82f1-7c6503ced411	\N	\N	\N	1	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
1456bfce-bd09-4833-bd5e-a69008de32fb	\N	\N	\N	3	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
230ba019-064d-4374-b4f9-b839fbe63934	\N	\N	\N	4	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
4af1f702-ba35-44cd-a86d-5faa2da0cd29	\N	\N	\N	5	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
d8938457-122e-4e59-81e8-248b129b60e0	\N	\N	\N	12	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
0e6b4a0e-967e-4b27-937a-f8a00190a077	\N	\N	\N	6	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
f1c7ad75-cfba-4762-a2c0-877835509087	\N	\N	\N	11	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
ac61ff83-b54d-4b65-8cd8-ac2ea886f300	\N	\N	\N	7	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
5bff4ae0-e19e-4e65-9cf4-603142e4a221	\N	\N	\N	8	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
54273643-1753-464e-9cdc-257c3bf14469	\N	\N	\N	9	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
825231a7-7e90-45aa-81a1-154a10c8a41c	\N	\N	\N	10	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
edfc93a8-a12e-429e-8bd0-bcde09652f53	\N	\N	\N	2	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
d7a456e8-2afe-4743-b157-d807ca133033	\N	\N	\N	1	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
816a7f31-d9b4-4685-b5f6-6f0dba306854	\N	\N	\N	3	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
136d94e0-508d-4b73-8211-dae689cca560	\N	\N	\N	4	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
5cbf6d4f-23e1-4a3a-a07b-427cc0e8399a	\N	\N	\N	5	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
843f873b-61cd-4440-aa59-9d1c90481d9c	\N	\N	\N	12	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
18c0ab31-6122-482d-8a26-47ba58a6d917	\N	\N	\N	6	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
bc8c202d-49f3-40e8-814b-e0ff741a1bcb	\N	\N	\N	11	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
17d3261e-8116-4dbc-bc02-7344f8e00ef5	\N	\N	\N	7	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
fc616896-8f46-4f97-9092-55798bc5c60a	\N	\N	\N	8	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
8a29b148-4964-49ac-a012-fda0705e8ba3	\N	\N	\N	9	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
6ee3b745-f49c-4679-8688-d7481d60d8c5	\N	\N	\N	10	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
fca772b7-7784-44c1-bfbc-140e53514347	\N	\N	\N	2	881817c3-6446-4984-982e-c2ac13300b76	1
40cc0d10-63a7-4d86-a93f-f16f5ad5c74c	\N	\N	\N	1	881817c3-6446-4984-982e-c2ac13300b76	1
0537178d-462a-4efc-a09d-16e2b6229934	\N	\N	\N	3	881817c3-6446-4984-982e-c2ac13300b76	1
15217be1-ca10-49fd-838f-b91eae052266	\N	\N	\N	4	881817c3-6446-4984-982e-c2ac13300b76	1
54240883-314d-4f82-9de1-470f97ee0e0d	\N	\N	\N	5	881817c3-6446-4984-982e-c2ac13300b76	1
80af0768-92d5-40d8-957a-7cc79b7aaaaa	\N	\N	\N	12	881817c3-6446-4984-982e-c2ac13300b76	1
c83b8a8e-c8b8-497f-967a-c63b4055065a	\N	\N	\N	6	881817c3-6446-4984-982e-c2ac13300b76	1
cd87e557-4455-4b5c-be40-6033084e053c	\N	\N	\N	11	881817c3-6446-4984-982e-c2ac13300b76	1
b2d376bf-bf8d-433a-92be-ca5a5eb08064	\N	\N	\N	7	881817c3-6446-4984-982e-c2ac13300b76	1
b1b039bb-b0d8-47cb-8244-2ebbd9e2d58a	\N	\N	\N	8	881817c3-6446-4984-982e-c2ac13300b76	1
32441cfc-ed97-4b11-863b-6a2af792ab62	\N	\N	\N	9	881817c3-6446-4984-982e-c2ac13300b76	1
1dc635f8-a900-4aec-bdd7-32c2db8872c9	\N	\N	\N	10	881817c3-6446-4984-982e-c2ac13300b76	1
58784e2c-9094-4b9c-bc45-536139e0618f	\N	\N	\N	2	a912041d-e158-4452-ac47-49f3b9552398	1
90d766b9-0a29-410d-8cb5-12dd04b0d3ce	\N	\N	\N	1	a912041d-e158-4452-ac47-49f3b9552398	1
25c458cf-3a4f-45f1-b3f4-e1efbe8decab	\N	\N	\N	3	a912041d-e158-4452-ac47-49f3b9552398	1
f85d09e5-7cea-43d0-aae9-76a086aa3e80	\N	\N	\N	4	a912041d-e158-4452-ac47-49f3b9552398	1
f555ebc1-716c-4042-9cb2-17ab453573e1	\N	\N	\N	5	a912041d-e158-4452-ac47-49f3b9552398	1
bc54f66f-f134-4c67-aa08-38414fbdda31	\N	\N	\N	12	a912041d-e158-4452-ac47-49f3b9552398	1
1f40e359-5c72-4b64-8a6d-ec1599113c90	\N	\N	\N	6	a912041d-e158-4452-ac47-49f3b9552398	1
cb7febaf-4d6c-46cd-9757-9e8dbc137630	\N	\N	\N	11	a912041d-e158-4452-ac47-49f3b9552398	1
3a5924ee-7e60-4efc-ab87-ff02180e0ac7	\N	\N	\N	7	a912041d-e158-4452-ac47-49f3b9552398	1
270181b8-42a0-46e4-9bcd-20d57877e7f9	\N	\N	\N	8	a912041d-e158-4452-ac47-49f3b9552398	1
fbf4de46-6437-43ee-a587-82ced5738f57	\N	\N	\N	9	a912041d-e158-4452-ac47-49f3b9552398	1
e3357ff8-0bf2-45c3-a645-0d3c6f328777	\N	\N	\N	10	a912041d-e158-4452-ac47-49f3b9552398	1
7ed56f90-0e59-48d9-84a0-b28d7615b91b	\N	\N	\N	2	8a4023af-f31f-4d52-b047-99e2e04fb301	1
1b454e14-ae9e-47e8-8488-98f51af060ce	\N	\N	\N	1	8a4023af-f31f-4d52-b047-99e2e04fb301	1
a028017b-be1f-4edd-ac34-58126ebc79e4	\N	\N	\N	3	8a4023af-f31f-4d52-b047-99e2e04fb301	1
32711d08-f0ba-44e2-a3eb-678e7e5b98dd	\N	\N	\N	4	8a4023af-f31f-4d52-b047-99e2e04fb301	1
87f5cf00-edae-4e88-9c89-829e3eb6ff4d	\N	\N	\N	5	8a4023af-f31f-4d52-b047-99e2e04fb301	1
411f571b-09ab-4566-ab76-ebe1583c9ccb	\N	\N	\N	12	8a4023af-f31f-4d52-b047-99e2e04fb301	1
5238be4f-2823-476d-ab9b-55ebd9675aac	\N	\N	\N	6	8a4023af-f31f-4d52-b047-99e2e04fb301	1
4f2db3b4-bc75-4c82-8c60-22f24b3c3954	\N	\N	\N	11	8a4023af-f31f-4d52-b047-99e2e04fb301	1
d9fa3692-9496-41c1-8fb2-e3fb59738038	\N	\N	\N	7	8a4023af-f31f-4d52-b047-99e2e04fb301	1
c6d9f842-f998-4c4c-ba30-3a99664cd292	\N	\N	\N	8	8a4023af-f31f-4d52-b047-99e2e04fb301	1
9fdc4205-dfcd-4a58-a2c2-7a21764cac6a	\N	\N	\N	9	8a4023af-f31f-4d52-b047-99e2e04fb301	1
836b870b-cc9c-4aee-bdfa-089fcaa3d032	\N	\N	\N	10	8a4023af-f31f-4d52-b047-99e2e04fb301	1
a7022a5a-1374-4f27-97f0-c1aa5966394c	\N	\N	\N	2	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
949f13a9-2313-4999-a80a-bf4dcfc1f333	\N	\N	\N	1	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
48fba280-ac5e-4ee7-a501-d70b60f4a3b5	\N	\N	\N	3	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
c34249ae-8d90-4837-b1ef-69c660614e60	\N	\N	\N	4	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
5a92b39f-c5ce-4ec8-8008-a1667b762a0d	\N	\N	\N	5	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
dc05ef71-d64a-4c7d-bdc2-b9811ab00f2f	\N	\N	\N	12	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
d3d3ae0e-08e1-4a67-8e09-f81d7b90aa80	\N	\N	\N	6	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
4b8abb82-ee64-4586-b572-d7800e260f03	\N	\N	\N	11	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
76b9d308-6f40-4d64-8af7-435fda6ee810	\N	\N	\N	7	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
7ddde3f1-8e4a-412b-abbf-9afc9f87fecd	\N	\N	\N	8	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
191078d9-445d-4b81-b3f4-900c30ff2cf1	\N	\N	\N	9	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
8ad06419-914a-4891-86e0-0221a8e7f20b	\N	\N	\N	10	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
e666e600-08d9-4d93-ad05-6efdc68e6256	\N	\N	\N	2	64960f63-845e-48e4-b905-1600d8ebf0ee	1
74934347-bc01-4753-86f3-e72e301967f2	\N	\N	\N	1	64960f63-845e-48e4-b905-1600d8ebf0ee	1
d93046e9-141d-43dc-bfa4-d96f94be9614	\N	\N	\N	3	64960f63-845e-48e4-b905-1600d8ebf0ee	1
2d66f456-0186-4fb7-a57b-45bc1ac5578a	\N	\N	\N	4	64960f63-845e-48e4-b905-1600d8ebf0ee	1
5cfb89db-0062-46e2-adf8-4f8b8729c115	\N	\N	\N	5	64960f63-845e-48e4-b905-1600d8ebf0ee	1
c096e001-2f77-4882-ae8f-092e8a9eea67	\N	\N	\N	12	64960f63-845e-48e4-b905-1600d8ebf0ee	1
67d64520-884d-4d88-a155-acdf23fbe409	\N	\N	\N	6	64960f63-845e-48e4-b905-1600d8ebf0ee	1
f40e6eea-ae72-4605-abcc-f8f68586e5b2	\N	\N	\N	11	64960f63-845e-48e4-b905-1600d8ebf0ee	1
65d4b9ff-5957-4cb5-b999-96958b2411dd	\N	\N	\N	7	64960f63-845e-48e4-b905-1600d8ebf0ee	1
5f61e065-7c93-4892-94a1-e3168780fdae	\N	\N	\N	8	64960f63-845e-48e4-b905-1600d8ebf0ee	1
6fa2b01f-2646-44a0-a59e-85bc8756a30c	\N	\N	\N	9	64960f63-845e-48e4-b905-1600d8ebf0ee	1
e8e6baa4-0ebb-438a-b536-5ca349f9d662	\N	\N	\N	10	64960f63-845e-48e4-b905-1600d8ebf0ee	1
875617b1-aa44-44f3-9c8a-a14ba33e85cb	\N	\N	\N	2	22a08277-b8a8-453d-9562-044eeb0baf17	1
5b186721-983b-4ccf-b690-15eb7d10035c	\N	\N	\N	1	22a08277-b8a8-453d-9562-044eeb0baf17	1
4c061d5c-4b57-4ede-925b-e25e140046f3	\N	\N	\N	3	22a08277-b8a8-453d-9562-044eeb0baf17	1
e48ab1f7-20f2-425a-9010-5e802c54e2a7	\N	\N	\N	4	22a08277-b8a8-453d-9562-044eeb0baf17	1
0250893a-ad8e-425e-9e7e-cc9708403517	\N	\N	\N	5	22a08277-b8a8-453d-9562-044eeb0baf17	1
15e3a7f1-34dc-4004-9d15-42e58acf0906	\N	\N	\N	12	22a08277-b8a8-453d-9562-044eeb0baf17	1
51539b44-d8cf-4c34-b058-eac2085688ca	\N	\N	\N	6	22a08277-b8a8-453d-9562-044eeb0baf17	1
d972992a-b006-4208-8e89-7606533a65f3	\N	\N	\N	11	22a08277-b8a8-453d-9562-044eeb0baf17	1
7f8f7d07-b339-4cab-b68a-aa93eb439ead	\N	\N	\N	7	22a08277-b8a8-453d-9562-044eeb0baf17	1
84c7e947-f45c-4270-a2be-2aaec4a8ba40	\N	\N	\N	8	22a08277-b8a8-453d-9562-044eeb0baf17	1
2261aef8-79a6-414b-835f-b0b21df6f292	\N	\N	\N	9	22a08277-b8a8-453d-9562-044eeb0baf17	1
6cb7859b-d18b-4bde-b833-3f69a3016662	\N	\N	\N	10	22a08277-b8a8-453d-9562-044eeb0baf17	1
48bc1d60-3f1d-4a38-bb33-daab445ae89e	\N	\N	\N	2	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
67647d87-7935-4ae6-be69-288f2a57a870	\N	\N	\N	1	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
a558ceab-86e5-4480-a376-d287aeb989e1	\N	\N	\N	3	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
cdc5c04a-1c38-4525-b267-d8a625ba928c	\N	\N	\N	4	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
259dd37a-56dc-4d61-bf7b-a2f29649933b	\N	\N	\N	5	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
362ec029-7eca-4cfd-bb74-22f491fcef29	\N	\N	\N	12	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
3c76d675-509f-433f-9151-9738f14f5bd1	\N	\N	\N	6	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
e52cee0f-01f3-4a06-b667-cb11324d755b	\N	\N	\N	11	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
5857364a-4690-44df-8544-655d32ad97bd	\N	\N	\N	7	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
ea2ff075-cb07-4b67-88a1-330deeee3bd4	\N	\N	\N	8	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
833d48c1-4db3-4ee1-813a-6a4fd2b2438c	\N	\N	\N	9	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
1b25607a-fcdd-40e3-82b2-17807ac0a61c	\N	\N	\N	10	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
4af3a5e0-bb06-4bce-a98a-f5255ce097d8	70fcd00c-b67c-46f2-be73-961dc0bc8de1	Chickenshock game	CHICKENSHOCK	1	acaa562e-1708-442a-83d1-65cd2b887282	1
1852e022-8c31-4437-b5db-3dd2ebbe01a8	98a66aed-6d0e-4966-80f4-053cbb93fd54	Finitequiz game	FINITEQUIZ	2	acaa562e-1708-442a-83d1-65cd2b887282	1
2c069c2a-4e5e-415b-9b21-a03ced23507f	4f3af39f-1a0c-44f1-8a07-460786ab4fb1	Crosswordpuzzle game	CROSSWORDPUZZLE	3	acaa562e-1708-442a-83d1-65cd2b887282	1
\.


--
-- Data for Name: npc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.npc (id, description, index, area_id, course_id) FROM stdin;
9b65b92e-c026-45c2-a914-4c6d0fc873cf	\N	10	acaa562e-1708-442a-83d1-65cd2b887282	1
06282f6a-c575-4fb7-ad3c-109680568d39	\N	1	acaa562e-1708-442a-83d1-65cd2b887282	1
db91a48b-aeda-41eb-a683-14614e1ca845	\N	2	acaa562e-1708-442a-83d1-65cd2b887282	1
956a9ee3-d5cd-4f11-8e9d-74020a3d2a2b	\N	8	acaa562e-1708-442a-83d1-65cd2b887282	1
768bd6a5-ec2b-41ec-8ada-09ef6d512f14	\N	4	acaa562e-1708-442a-83d1-65cd2b887282	1
f538b88e-ff1e-443c-aa32-f995672ce016	\N	5	acaa562e-1708-442a-83d1-65cd2b887282	1
df9807ca-85ec-43fc-8150-3ddd03805142	\N	6	acaa562e-1708-442a-83d1-65cd2b887282	1
22f8b2d9-39b0-4ef9-bb43-d41b7b4d4a66	\N	3	acaa562e-1708-442a-83d1-65cd2b887282	1
645c8480-c489-4220-9f5c-1ec2821dd4ca	\N	7	acaa562e-1708-442a-83d1-65cd2b887282	1
de29f362-e886-4fdc-a552-b97f15331692	\N	9	acaa562e-1708-442a-83d1-65cd2b887282	1
1ee7ced8-ed48-43d2-9970-95831248957b	\N	10	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
3b9c2011-cdd7-4ddf-8222-80ea69159372	\N	1	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
885f9c94-e8b9-4faa-aafa-ee51f9a11a54	\N	2	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
d23be219-717d-4ec1-90e1-a5c3fe9c62ae	\N	8	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
d62a368c-119a-4f20-b783-806a7f1b8749	\N	4	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
ceeb712c-4ab2-4d66-ac89-3988524608e3	\N	5	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
c287b479-d904-4bd0-9cb5-4bc87048a409	\N	6	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
6e10661c-824d-4ff6-a68e-4d8df0c9ed44	\N	3	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
1efe1492-3eba-488d-95aa-2d922de1236e	\N	7	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
47c741e7-bb8a-4658-b713-60d82769f266	\N	9	4223dc7c-7f3d-462b-9982-43e650f4bf0f	1
13158dbf-b145-4c21-9adc-600a5c6c444e	\N	10	77691b12-d45a-44d2-91ce-5daa08485d87	1
2aa402ce-b9b9-462d-b812-e90742f2d2fb	\N	1	77691b12-d45a-44d2-91ce-5daa08485d87	1
229dc22e-d159-4685-b120-855b02124b78	\N	2	77691b12-d45a-44d2-91ce-5daa08485d87	1
64f4067b-9a12-4734-951b-9012b73a4f9b	\N	8	77691b12-d45a-44d2-91ce-5daa08485d87	1
c0e20ad1-a79f-404a-a440-3d1eb0047a62	\N	4	77691b12-d45a-44d2-91ce-5daa08485d87	1
a639a627-1599-4247-bc6f-141ba2fdacd8	\N	5	77691b12-d45a-44d2-91ce-5daa08485d87	1
8b4f6aa1-6af6-4920-a0c9-e2a1e191855f	\N	6	77691b12-d45a-44d2-91ce-5daa08485d87	1
9a3a9ad7-2e6a-42ba-aae3-cf6023a11e43	\N	3	77691b12-d45a-44d2-91ce-5daa08485d87	1
f8040a17-430c-48f0-9bce-f84f572c6cbf	\N	7	77691b12-d45a-44d2-91ce-5daa08485d87	1
01fb6e1f-af00-4a90-8fd6-60529238f583	\N	9	77691b12-d45a-44d2-91ce-5daa08485d87	1
02f5d454-b54f-44cb-9cc4-c413a961072b	\N	10	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
6789e1f4-9661-4f50-a322-c777a815a23b	\N	1	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
c4d47c88-c3bd-4601-abb0-56cb6c0d9bd3	\N	2	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
0a4f0b40-3f19-42c7-8a6c-a237415ff903	\N	8	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
155ff8c6-8fc2-4221-bf4a-268e1fa85b2a	\N	4	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
f6ce95b6-2f01-40ec-9ce6-9c311076dc61	\N	5	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
151011a5-cfd3-48e2-9d9f-45806e36473d	\N	6	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
d0e7f388-8415-40f2-a450-3cb6ddedca53	\N	3	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
865d7ff0-1501-4f11-adcf-99168465b2d1	\N	7	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
4c349a5f-29c8-4e75-a8b4-1257f6168844	\N	9	b4d3479f-54b1-45ca-a47f-7f20a8d8bc44	1
bf7a76ba-4f03-4598-a4d9-95db14ecaf53	\N	10	618eea81-3859-4e0d-a456-70f5516cbf27	1
07b45a2d-c1ef-4b5b-8ed3-6389555000e9	\N	1	618eea81-3859-4e0d-a456-70f5516cbf27	1
c02c5c8c-d014-421b-8598-93f5929ff482	\N	2	618eea81-3859-4e0d-a456-70f5516cbf27	1
f14d50d3-c514-4c7c-9d4d-fa6b3fb34f27	\N	8	618eea81-3859-4e0d-a456-70f5516cbf27	1
fd1d45f6-ddba-4f81-b3cc-dd125f2abcb7	\N	4	618eea81-3859-4e0d-a456-70f5516cbf27	1
ff6a0012-10fb-4a03-b56c-3f656d9b4ea8	\N	5	618eea81-3859-4e0d-a456-70f5516cbf27	1
64713004-f5e0-4639-aea6-96825733eb43	\N	6	618eea81-3859-4e0d-a456-70f5516cbf27	1
257fd906-b7d5-40a5-a4fd-587b2b8d35e4	\N	3	618eea81-3859-4e0d-a456-70f5516cbf27	1
ec1d7a08-8f15-4dc4-954d-da9294636006	\N	7	618eea81-3859-4e0d-a456-70f5516cbf27	1
bd81788a-e81d-4588-b81a-71091a53fd6c	\N	9	618eea81-3859-4e0d-a456-70f5516cbf27	1
d3c6f07f-3de0-4181-bae8-d5c93743dc5c	\N	10	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
e5b2706d-6fc1-40f9-af79-4470a0a0b6e0	\N	1	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
a66b0ff6-7852-4c4a-8304-d9b0682f51d2	\N	2	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
7d118e6a-9d1c-4b79-9ecb-ec670116cc14	\N	8	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
10eb0a97-4a3c-4a29-806e-e828ce0cd2a0	\N	4	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
e1984fd3-e687-4946-a83b-908d7b92819e	\N	5	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
7af5259a-02b7-4e5a-b51c-a1a4a9cde39a	\N	6	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
bbb65296-0e54-4832-8ef5-e73699c7b043	\N	3	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
37c784d4-bbf5-47e2-9ad6-5c73a2f8fca2	\N	7	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
2ccbe6fd-4e91-4120-b6ad-97c1a5b4d46a	\N	9	c4cb21b9-308d-4ad7-836c-bd84c92e1ab2	1
48908cb5-dac7-4c25-8136-bed67e6f89b7	\N	10	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
e2730e32-5beb-4d50-a650-01585720ed6d	\N	1	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
7139f704-0c6c-4b3c-9f18-e5a0ffae6aa1	\N	2	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
69f49060-bbf9-425a-8886-fbe3d01d8944	\N	8	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
ac016b95-6d73-4a48-8987-ac9a7614e54d	\N	4	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
023e25ec-7f18-4748-9a18-30536a7c82ed	\N	5	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
8cc8b8c8-e742-40b9-8ce7-72cebfa3bf67	\N	6	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
97d38b9d-7014-4c46-bd9a-85e289664e8f	\N	3	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
2e0c0e5b-e5b7-4c1b-b52b-f4410ea6afa0	\N	7	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
38b7aef4-6287-4aee-be74-734a70eafedd	\N	9	dbce70d8-edbf-4a8a-822c-61b3395b591f	1
35999676-02cf-4cfd-a1e3-f6109a98267a	\N	10	ada1acea-439d-4168-b828-a4be1c39a531	1
be66bd07-d6cb-4434-9666-4b08d8d3891a	\N	1	ada1acea-439d-4168-b828-a4be1c39a531	1
85e57523-558b-4a82-8f46-23efab45dd2d	\N	2	ada1acea-439d-4168-b828-a4be1c39a531	1
0dab3f35-aae4-4f01-9c2e-c14390d78bb9	\N	8	ada1acea-439d-4168-b828-a4be1c39a531	1
17f7fb6d-9984-4b9c-988b-99e7c8ac7f7d	\N	4	ada1acea-439d-4168-b828-a4be1c39a531	1
d13e31a5-4ed2-45c1-bac0-5be8cb2fcdec	\N	5	ada1acea-439d-4168-b828-a4be1c39a531	1
52e6b2d5-421f-4712-a414-4597b138ad61	\N	6	ada1acea-439d-4168-b828-a4be1c39a531	1
30680ec9-5313-400d-b4fa-833c45d99f8d	\N	3	ada1acea-439d-4168-b828-a4be1c39a531	1
746efd83-22b1-4309-a2bb-eb6326dc61f5	\N	7	ada1acea-439d-4168-b828-a4be1c39a531	1
deec502f-70b4-4baa-b5b1-e2906c2f771a	\N	9	ada1acea-439d-4168-b828-a4be1c39a531	1
fe4af448-1a34-4482-946f-874488e6b1f6	\N	10	efca83e3-1284-4840-883c-098d3c40b559	1
905cb45d-9a89-4444-a1e3-9a48d37f2803	\N	1	efca83e3-1284-4840-883c-098d3c40b559	1
e4f127b7-9c20-4e70-8fe1-f74d320a032d	\N	2	efca83e3-1284-4840-883c-098d3c40b559	1
68f46899-387d-41a6-9fb1-cbdd217af49c	\N	8	efca83e3-1284-4840-883c-098d3c40b559	1
543fa826-09c3-4650-9c80-743cf09abd51	\N	4	efca83e3-1284-4840-883c-098d3c40b559	1
cdafca15-3797-4326-8fc4-26ef7b43f5eb	\N	5	efca83e3-1284-4840-883c-098d3c40b559	1
ce719fbf-9118-447f-a014-3afff4ff1c16	\N	6	efca83e3-1284-4840-883c-098d3c40b559	1
05b87181-d3a7-4120-8694-faf41fe7acad	\N	3	efca83e3-1284-4840-883c-098d3c40b559	1
2b9ee003-24a4-4f94-8492-996f8f472207	\N	7	efca83e3-1284-4840-883c-098d3c40b559	1
e1e2123c-0c3d-43e1-96df-30383117833a	\N	9	efca83e3-1284-4840-883c-098d3c40b559	1
281c24a3-24b3-46b9-a30c-77e5f61126da	\N	10	53263f22-a05e-4adf-a52b-0a6679e9b339	1
0e1f9c23-6964-49f4-8117-96c260adcd3a	\N	1	53263f22-a05e-4adf-a52b-0a6679e9b339	1
01775e34-0d42-4c1d-9480-9d11b892311a	\N	2	53263f22-a05e-4adf-a52b-0a6679e9b339	1
7c3efcb2-98ed-4742-bbe3-651e06006a6f	\N	8	53263f22-a05e-4adf-a52b-0a6679e9b339	1
4effe8d5-8c11-4808-9f79-9a7676003694	\N	4	53263f22-a05e-4adf-a52b-0a6679e9b339	1
23900a07-2039-46f3-9486-b24121c947fc	\N	5	53263f22-a05e-4adf-a52b-0a6679e9b339	1
cff31ab4-4a3a-49c0-8105-5b00a7085615	\N	6	53263f22-a05e-4adf-a52b-0a6679e9b339	1
cc1cd6c7-2319-49b2-b9b4-a1bb273075c3	\N	3	53263f22-a05e-4adf-a52b-0a6679e9b339	1
58eac99f-09b4-4b3d-a742-5acb308db3a1	\N	7	53263f22-a05e-4adf-a52b-0a6679e9b339	1
3a159368-d5b7-4caf-8a20-a40790c54ad6	\N	9	53263f22-a05e-4adf-a52b-0a6679e9b339	1
d0fc5863-16a0-4f86-957f-b5ecd18e0501	\N	10	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
c6cbd390-bab3-4d88-a622-52f7a56405ea	\N	1	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
c57b1df5-d86a-4dae-a014-3745b321c948	\N	2	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
9f8d764d-073c-410a-a4db-cf7a6281091e	\N	8	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
ba54c663-6bf8-4868-ac2c-2cfc38cafe52	\N	4	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
479b3746-07b7-4ba2-9f19-a2fb2fafdedb	\N	5	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
986bae2c-0608-41e9-af7a-3d42d841a4c8	\N	6	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
0d20e9e3-bf2a-4aaf-b0bc-37ad5bdaddf0	\N	3	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
9a79f9e9-d7bc-4bee-b716-42c9367aa42e	\N	7	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
5acc3d7a-e16d-415d-b508-51e17c66c46a	\N	9	4bc0e541-03c1-478e-98d9-ac454eeb18c5	1
66f17b1a-74c6-48d0-9e81-4d69baa95135	\N	10	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
463bea1b-3a52-45bb-ae41-9e0a03cb28a8	\N	1	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
611aea04-9c16-45d1-8470-99e737343e3d	\N	2	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
4645bd51-9b55-4fae-9e33-008b18cc30f9	\N	8	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
cd442250-b689-4e57-8a2a-bb4b2a84b306	\N	4	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
9e882fe4-f0de-4fa3-9907-1d12d0a21e3a	\N	5	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
6d43e396-58f2-4930-974f-abc9812a86c1	\N	6	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
e6d11b0c-6884-471b-acc5-89e8172c43fb	\N	3	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
ef79592e-610f-4742-af30-e299e0596ec7	\N	7	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
d86c1a04-b2b4-42f9-b424-bfe90205bf32	\N	9	8a14cbad-608f-4f4e-81a9-8d187fa26cd2	1
0dddde64-4cb6-400f-a618-a869e55b3982	\N	10	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
b146b014-30d4-4678-b17c-1a2d8f0a8016	\N	1	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
807499ec-d04e-410c-8184-01c7e5780cdf	\N	2	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
b4b7a37e-48ae-4bdf-8e6b-63ea1c72b001	\N	8	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
ad21c87a-73e2-41ef-a94c-1d0d6b9e2aab	\N	4	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
3ea0e3a9-fb53-4b80-b6f7-b1f06fa597bd	\N	5	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
90f5065c-8f17-4b8d-a481-939135985ae0	\N	6	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
3bf7ff38-8793-4b7f-890e-2a689549cb0a	\N	3	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
905109cf-e691-4d45-88c0-9c3e77901b74	\N	7	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
9a583ae3-49f9-42f2-ad6a-cb214dfb750c	\N	9	e5c0d2aa-4564-4f30-956e-bc2f53eeeb6e	1
5aee268e-c1e3-4a69-99bb-e8fa39c70912	\N	10	881817c3-6446-4984-982e-c2ac13300b76	1
c89ae757-2127-4cdb-9fdf-693a0845fcfa	\N	1	881817c3-6446-4984-982e-c2ac13300b76	1
23c7f4f2-e660-494c-98a0-e8f1b9ad8411	\N	2	881817c3-6446-4984-982e-c2ac13300b76	1
682e2b6e-5c56-4c51-bd6c-4463f70a205b	\N	8	881817c3-6446-4984-982e-c2ac13300b76	1
98f6db99-7401-42fb-b1db-1cdbcc2793cc	\N	4	881817c3-6446-4984-982e-c2ac13300b76	1
5e929037-9e8f-4b67-8552-c398a1d5b1e9	\N	5	881817c3-6446-4984-982e-c2ac13300b76	1
4bfcdf24-ced1-4f3a-b069-99fc33ce4174	\N	6	881817c3-6446-4984-982e-c2ac13300b76	1
55d8c3f2-e1ee-4d9b-adde-5b26f165d0a5	\N	3	881817c3-6446-4984-982e-c2ac13300b76	1
71fce7b1-e110-4441-979c-22463f6b4a03	\N	7	881817c3-6446-4984-982e-c2ac13300b76	1
75c20377-087a-4a2d-98fb-4f2bc9c7906d	\N	9	881817c3-6446-4984-982e-c2ac13300b76	1
3a7e4fed-0c0b-4039-8d80-b19f444c1229	\N	10	a912041d-e158-4452-ac47-49f3b9552398	1
cce1f425-f0b1-4595-b07f-a1127a9f40f2	\N	1	a912041d-e158-4452-ac47-49f3b9552398	1
9c143533-b8ac-44a3-a517-08af48c791d7	\N	2	a912041d-e158-4452-ac47-49f3b9552398	1
861d0c33-4fc6-404f-a5e7-7c8fb3cb4708	\N	8	a912041d-e158-4452-ac47-49f3b9552398	1
05a03d0c-a46e-4ff0-9825-74d74abdd773	\N	4	a912041d-e158-4452-ac47-49f3b9552398	1
4b5b4532-1bd4-414a-81af-6b063baced86	\N	5	a912041d-e158-4452-ac47-49f3b9552398	1
ef8f5042-7da8-4b83-920d-772381ed2f80	\N	6	a912041d-e158-4452-ac47-49f3b9552398	1
2a7b864a-10b2-4898-846b-9de08b2adb1e	\N	3	a912041d-e158-4452-ac47-49f3b9552398	1
4ee04741-b614-4e6a-b664-539d9c06db56	\N	7	a912041d-e158-4452-ac47-49f3b9552398	1
336e4bf4-6c18-4b1e-9b1b-a5906f5a37ba	\N	9	a912041d-e158-4452-ac47-49f3b9552398	1
26b0ff54-d30d-409b-b75f-2636186a9be8	\N	10	8a4023af-f31f-4d52-b047-99e2e04fb301	1
395412d6-5e66-4e7c-a5c1-162c27ca2d78	\N	1	8a4023af-f31f-4d52-b047-99e2e04fb301	1
a45020cf-7ccf-429c-ab96-fd2c62fcf9af	\N	2	8a4023af-f31f-4d52-b047-99e2e04fb301	1
9445c84d-000f-4797-b70c-561aa1a593b3	\N	8	8a4023af-f31f-4d52-b047-99e2e04fb301	1
87ce1772-3f4d-41dc-a870-29f7d4664d8b	\N	4	8a4023af-f31f-4d52-b047-99e2e04fb301	1
ee9ceb90-c119-47d9-abd1-1f7807c1baa1	\N	5	8a4023af-f31f-4d52-b047-99e2e04fb301	1
12f1c9b8-f179-4467-86bd-76716c29ab88	\N	6	8a4023af-f31f-4d52-b047-99e2e04fb301	1
91176df0-cdda-475c-bc47-f76d4afb86d5	\N	3	8a4023af-f31f-4d52-b047-99e2e04fb301	1
ccc17ef2-1944-4efd-8caf-af0425c3ffef	\N	7	8a4023af-f31f-4d52-b047-99e2e04fb301	1
cb597339-909b-4aa8-8844-00cdf1f06a1f	\N	9	8a4023af-f31f-4d52-b047-99e2e04fb301	1
b842860c-7e3f-4436-91f4-4228a037cff1	\N	10	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
15b2fba2-1ad4-4ca9-9591-d13d2353c0e4	\N	1	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
f57f557e-95b0-409a-92de-49d401303648	\N	2	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
34c87903-0a20-4c22-8b14-8b87745c39b0	\N	8	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
7a6fada5-50c1-4da5-b495-e3d26e72c97f	\N	4	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
916d3c9d-a131-4512-a31b-6dacfe6d1fc9	\N	5	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
4cbfeedc-7573-4ff7-90b4-babf33e60392	\N	6	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
4d496519-5006-4c0b-b0b1-086d554d3e74	\N	3	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
79acff6c-fc9b-46ab-b505-c67d49e2643d	\N	7	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
0e8a3514-8ca7-41fd-8053-d039db09baaa	\N	9	4be8e356-8ef0-46fa-9c7b-af6da0dc0d0c	1
24fa725d-d6ad-4f9a-87b7-d3aefffdeddd	\N	10	64960f63-845e-48e4-b905-1600d8ebf0ee	1
9d082e6d-d197-43c4-9f87-15b53e005974	\N	1	64960f63-845e-48e4-b905-1600d8ebf0ee	1
7ffe17a6-4bab-4c61-8564-a4aaeed44afa	\N	2	64960f63-845e-48e4-b905-1600d8ebf0ee	1
fbce0112-a0b8-41dd-b2fa-4a9998e50e9f	\N	8	64960f63-845e-48e4-b905-1600d8ebf0ee	1
a4aa4ddb-e060-4aee-b8c7-e26691363939	\N	4	64960f63-845e-48e4-b905-1600d8ebf0ee	1
0a0cd7ef-86e9-4cbb-8337-5c30f67213a7	\N	5	64960f63-845e-48e4-b905-1600d8ebf0ee	1
c34dd98b-3575-4274-918d-f02ff77b5dc2	\N	6	64960f63-845e-48e4-b905-1600d8ebf0ee	1
c6e0133a-c5af-483f-872d-f8dca578cb8a	\N	3	64960f63-845e-48e4-b905-1600d8ebf0ee	1
89a1507a-3d72-4ef8-9505-9a8952e3c03a	\N	7	64960f63-845e-48e4-b905-1600d8ebf0ee	1
4d8dbad0-e61d-4f3a-a12a-05409997555b	\N	9	64960f63-845e-48e4-b905-1600d8ebf0ee	1
b97baf4a-538f-43be-8d9a-711431c68afe	\N	10	22a08277-b8a8-453d-9562-044eeb0baf17	1
a3d2379e-8417-44ac-896b-dbab09576827	\N	1	22a08277-b8a8-453d-9562-044eeb0baf17	1
20b0ab82-0700-4bfc-aef4-c155ebaeb40a	\N	2	22a08277-b8a8-453d-9562-044eeb0baf17	1
e0d2e384-eb04-476a-8b01-6a506b00d784	\N	8	22a08277-b8a8-453d-9562-044eeb0baf17	1
c9449f40-1bd7-4748-aa4d-5686ab781e6b	\N	4	22a08277-b8a8-453d-9562-044eeb0baf17	1
70142443-1db7-4602-9d98-42d5a3324b98	\N	5	22a08277-b8a8-453d-9562-044eeb0baf17	1
06441997-6cb7-4647-acb5-6afd2f2b5792	\N	6	22a08277-b8a8-453d-9562-044eeb0baf17	1
195a7ac9-fa98-48ce-b7cd-c6193fbb4559	\N	3	22a08277-b8a8-453d-9562-044eeb0baf17	1
6ff345ff-a98b-4947-aea7-da18c4b4d052	\N	7	22a08277-b8a8-453d-9562-044eeb0baf17	1
fc0ad42c-62ef-41e7-ae24-1b810203cf82	\N	9	22a08277-b8a8-453d-9562-044eeb0baf17	1
36d23981-3144-46d1-9d5d-c847697cb358	\N	10	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
268766be-3fdb-47c8-ba52-b4350ee6134f	\N	1	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
0743ff90-4314-47f1-a18f-686f16127286	\N	2	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
d32fe160-b719-4def-9f6d-1c28296e2c96	\N	8	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
0bdac606-d5ca-4145-8043-a73c994271c8	\N	4	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
923470eb-987e-4776-bf11-99c5245f7f8c	\N	5	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
aa8dea73-3d3c-4943-b714-6e84f73ce665	\N	6	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
8b8c8f9b-92b6-4076-9747-514dfe6b2eb0	\N	3	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
cde4a3da-efc7-4343-8ce7-965cea2f0611	\N	7	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
c4cc9853-7c3f-4c9a-a01a-89042be4b230	\N	9	85d25d01-7529-4e0a-988b-3acbdf9616ad	1
\.


--
-- Data for Name: npc_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.npc_text (npc_id, text) FROM stdin;
\.


--
-- Data for Name: player_statistic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_statistic (id, knowledge, user_id, username, course_id, current_area_id) FROM stdin;
\.


--
-- Data for Name: player_statistic_completed_dungeons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_statistic_completed_dungeons (player_statistic_id, completed_dungeons_id) FROM stdin;
\.


--
-- Data for Name: player_statistic_player_task_statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_statistic_player_task_statistics (player_statistic_id, player_task_statistics_id) FROM stdin;
\.


--
-- Data for Name: player_statistic_playernpcstatistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_statistic_playernpcstatistics (player_statistic_id, playernpcstatistics_id) FROM stdin;
\.


--
-- Data for Name: player_statistic_unlocked_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_statistic_unlocked_areas (player_statistic_id, unlocked_areas_id) FROM stdin;
\.


--
-- Data for Name: player_task_action_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_task_action_log (id, configuration_id, current_highscore, date, gained_knowledge, game, score, course_id, player_task_statistic_id) FROM stdin;
\.


--
-- Data for Name: player_task_statistic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_task_statistic (id, completed, highscore, course_id, minigame_task_id, player_statistic_id) FROM stdin;
\.


--
-- Data for Name: player_task_statistic_player_task_action_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_task_statistic_player_task_action_logs (player_task_statistic_id, player_task_action_logs_id) FROM stdin;
\.


--
-- Data for Name: playernpcaction_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playernpcaction_log (id, date, gained_knowledge, course_id, playernpcstatistic_id) FROM stdin;
\.


--
-- Data for Name: playernpcstatistic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playernpcstatistic (id, completed, course_id, npc_id, player_statistic_id) FROM stdin;
\.


--
-- Data for Name: playernpcstatistic_playernpcaction_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playernpcstatistic_playernpcaction_logs (playernpcstatistic_id, playernpcaction_logs_id) FROM stdin;
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, true);


--
-- Name: area_books area_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_books
    ADD CONSTRAINT area_books_pkey PRIMARY KEY (area_id, books_id);


--
-- Name: area_minigame_tasks area_minigame_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_minigame_tasks
    ADD CONSTRAINT area_minigame_tasks_pkey PRIMARY KEY (area_id, minigame_tasks_id);


--
-- Name: area_npcs area_npcs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_npcs
    ADD CONSTRAINT area_npcs_pkey PRIMARY KEY (area_id, npcs_id);


--
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- Name: course_player_statistics course_player_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_player_statistics
    ADD CONSTRAINT course_player_statistics_pkey PRIMARY KEY (course_id, player_statistics_id);


--
-- Name: minigame_task minigame_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minigame_task
    ADD CONSTRAINT minigame_task_pkey PRIMARY KEY (id);


--
-- Name: npc npc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.npc
    ADD CONSTRAINT npc_pkey PRIMARY KEY (id);


--
-- Name: player_statistic player_statistic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic
    ADD CONSTRAINT player_statistic_pkey PRIMARY KEY (id);


--
-- Name: player_statistic_player_task_statistics player_statistic_player_task_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_player_task_statistics
    ADD CONSTRAINT player_statistic_player_task_statistics_pkey PRIMARY KEY (player_statistic_id, player_task_statistics_id);


--
-- Name: player_statistic_playernpcstatistics player_statistic_playernpcstatistics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_playernpcstatistics
    ADD CONSTRAINT player_statistic_playernpcstatistics_pkey PRIMARY KEY (player_statistic_id, playernpcstatistics_id);


--
-- Name: player_task_action_log player_task_action_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_action_log
    ADD CONSTRAINT player_task_action_log_pkey PRIMARY KEY (id);


--
-- Name: player_task_statistic player_task_statistic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_statistic
    ADD CONSTRAINT player_task_statistic_pkey PRIMARY KEY (id);


--
-- Name: player_task_statistic_player_task_action_logs player_task_statistic_player_task_action_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_statistic_player_task_action_logs
    ADD CONSTRAINT player_task_statistic_player_task_action_logs_pkey PRIMARY KEY (player_task_statistic_id, player_task_action_logs_id);


--
-- Name: playernpcaction_log playernpcaction_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcaction_log
    ADD CONSTRAINT playernpcaction_log_pkey PRIMARY KEY (id);


--
-- Name: playernpcstatistic playernpcstatistic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcstatistic
    ADD CONSTRAINT playernpcstatistic_pkey PRIMARY KEY (id);


--
-- Name: playernpcstatistic_playernpcaction_logs playernpcstatistic_playernpcaction_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcstatistic_playernpcaction_logs
    ADD CONSTRAINT playernpcstatistic_playernpcaction_logs_pkey PRIMARY KEY (playernpcstatistic_id, playernpcaction_logs_id);


--
-- Name: course uk820tkd4yvetwbn59037xp1ix0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT uk820tkd4yvetwbn59037xp1ix0 UNIQUE (course_name, semester);


--
-- Name: book uk9unjth2xglyrweh7ythk0ehc7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT uk9unjth2xglyrweh7ythk0ehc7 UNIQUE (index, area_id, course_id);


--
-- Name: player_statistic_playernpcstatistics uk_7w9c0idi7mg84wh2fv0mjwes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_playernpcstatistics
    ADD CONSTRAINT uk_7w9c0idi7mg84wh2fv0mjwes UNIQUE (playernpcstatistics_id);


--
-- Name: playernpcstatistic_playernpcaction_logs uk_8neeqyks7p4oqru9c0j04x5fi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcstatistic_playernpcaction_logs
    ADD CONSTRAINT uk_8neeqyks7p4oqru9c0j04x5fi UNIQUE (playernpcaction_logs_id);


--
-- Name: course_worlds uk_8wb9mpt836gtib5lkw17yyiy9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_worlds
    ADD CONSTRAINT uk_8wb9mpt836gtib5lkw17yyiy9 UNIQUE (worlds_id);


--
-- Name: area_npcs uk_af9lyjvml2klp6f7j2salyajs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_npcs
    ADD CONSTRAINT uk_af9lyjvml2klp6f7j2salyajs UNIQUE (npcs_id);


--
-- Name: area_dungeons uk_arxrussoxrq8qul4udrv80kv6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_dungeons
    ADD CONSTRAINT uk_arxrussoxrq8qul4udrv80kv6 UNIQUE (dungeons_id);


--
-- Name: course_player_statistics uk_ay0oo04jui0f401m0t26c784s; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_player_statistics
    ADD CONSTRAINT uk_ay0oo04jui0f401m0t26c784s UNIQUE (player_statistics_id);


--
-- Name: player_statistic_player_task_statistics uk_b47dqi2chebh46j4lhs6dc0y1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_player_task_statistics
    ADD CONSTRAINT uk_b47dqi2chebh46j4lhs6dc0y1 UNIQUE (player_task_statistics_id);


--
-- Name: area_books uk_ccmryae7idl5i7ei17jsd76bh; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_books
    ADD CONSTRAINT uk_ccmryae7idl5i7ei17jsd76bh UNIQUE (books_id);


--
-- Name: area_minigame_tasks uk_dcdrgvmm9tleh9ayt0wo72tj; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_minigame_tasks
    ADD CONSTRAINT uk_dcdrgvmm9tleh9ayt0wo72tj UNIQUE (minigame_tasks_id);


--
-- Name: player_task_statistic_player_task_action_logs uk_l0gdwtngrk6s19rmp9r9mj7s; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_statistic_player_task_action_logs
    ADD CONSTRAINT uk_l0gdwtngrk6s19rmp9r9mj7s UNIQUE (player_task_action_logs_id);


--
-- Name: minigame_task ukp08e5jhus5o7aafkk7olekjwh; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minigame_task
    ADD CONSTRAINT ukp08e5jhus5o7aafkk7olekjwh UNIQUE (index, area_id, course_id);


--
-- Name: npc ukrp1s2edjwhvyjjmj9m4wlapfg; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.npc
    ADD CONSTRAINT ukrp1s2edjwhvyjjmj9m4wlapfg UNIQUE (index, area_id, course_id);


--
-- Name: player_task_statistic fk12orm06caiu19w8il8s2jsbdl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_statistic
    ADD CONSTRAINT fk12orm06caiu19w8il8s2jsbdl FOREIGN KEY (minigame_task_id) REFERENCES public.minigame_task(id);


--
-- Name: playernpcaction_log fk1f7o7i4v9w82cxrg0u14tgmym; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcaction_log
    ADD CONSTRAINT fk1f7o7i4v9w82cxrg0u14tgmym FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: player_task_statistic fk1okhn876e2a6uulje8e3fuuk5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_statistic
    ADD CONSTRAINT fk1okhn876e2a6uulje8e3fuuk5 FOREIGN KEY (player_statistic_id) REFERENCES public.player_statistic(id);


--
-- Name: npc fk2t7w14eq7c78bfpcoufe8eyne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.npc
    ADD CONSTRAINT fk2t7w14eq7c78bfpcoufe8eyne FOREIGN KEY (area_id) REFERENCES public.area(id);


--
-- Name: area_books fk33aovkdu8oaajb819ir107s1o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_books
    ADD CONSTRAINT fk33aovkdu8oaajb819ir107s1o FOREIGN KEY (books_id) REFERENCES public.book(id);


--
-- Name: minigame_task fk42f1f9nt23vs2nl5hu90ol2a3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minigame_task
    ADD CONSTRAINT fk42f1f9nt23vs2nl5hu90ol2a3 FOREIGN KEY (area_id) REFERENCES public.area(id);


--
-- Name: area_dungeons fk4g1gtrb4sbw3lejfd2uh6tyw8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_dungeons
    ADD CONSTRAINT fk4g1gtrb4sbw3lejfd2uh6tyw8 FOREIGN KEY (dungeons_id) REFERENCES public.area(id);


--
-- Name: player_statistic_playernpcstatistics fk4jq025mftyeyep71t98trqf3l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_playernpcstatistics
    ADD CONSTRAINT fk4jq025mftyeyep71t98trqf3l FOREIGN KEY (player_statistic_id) REFERENCES public.player_statistic(id);


--
-- Name: playernpcstatistic fk58fhj6qipi15slyct040a2mt6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcstatistic
    ADD CONSTRAINT fk58fhj6qipi15slyct040a2mt6 FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: playernpcstatistic fk59ejtn8fulc26ymdqt5fb1mrr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcstatistic
    ADD CONSTRAINT fk59ejtn8fulc26ymdqt5fb1mrr FOREIGN KEY (npc_id) REFERENCES public.npc(id);


--
-- Name: course_player_statistics fk5y3ghl2hplxka6o877v7r6rsp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_player_statistics
    ADD CONSTRAINT fk5y3ghl2hplxka6o877v7r6rsp FOREIGN KEY (player_statistics_id) REFERENCES public.player_statistic(id);


--
-- Name: player_task_statistic_player_task_action_logs fk66lg03286gi0s62k5sg46dc90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_statistic_player_task_action_logs
    ADD CONSTRAINT fk66lg03286gi0s62k5sg46dc90 FOREIGN KEY (player_task_action_logs_id) REFERENCES public.player_task_action_log(id);


--
-- Name: area_minigame_tasks fk6os2w0w1v3euv2k1ngj30nhdr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_minigame_tasks
    ADD CONSTRAINT fk6os2w0w1v3euv2k1ngj30nhdr FOREIGN KEY (minigame_tasks_id) REFERENCES public.minigame_task(id);


--
-- Name: playernpcstatistic_playernpcaction_logs fk6r4drao88j3upygr9uj2d9187; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcstatistic_playernpcaction_logs
    ADD CONSTRAINT fk6r4drao88j3upygr9uj2d9187 FOREIGN KEY (playernpcstatistic_id) REFERENCES public.playernpcstatistic(id);


--
-- Name: player_task_action_log fk6uf4h7kq387mei941oweb32pl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_action_log
    ADD CONSTRAINT fk6uf4h7kq387mei941oweb32pl FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: playernpcstatistic fk92jj8ujawdasvl90b57vs9gbb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcstatistic
    ADD CONSTRAINT fk92jj8ujawdasvl90b57vs9gbb FOREIGN KEY (player_statistic_id) REFERENCES public.player_statistic(id);


--
-- Name: area_minigame_tasks fk9urdfdsvqwbb3buy0dcdxws6k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_minigame_tasks
    ADD CONSTRAINT fk9urdfdsvqwbb3buy0dcdxws6k FOREIGN KEY (area_id) REFERENCES public.area(id);


--
-- Name: player_task_statistic fk9y1c39d5bbnw5sh3oh3nm7wum; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_statistic
    ADD CONSTRAINT fk9y1c39d5bbnw5sh3oh3nm7wum FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: player_statistic_completed_dungeons fkb8e7inkwlcg3gk8tbymhsq6ul; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_completed_dungeons
    ADD CONSTRAINT fkb8e7inkwlcg3gk8tbymhsq6ul FOREIGN KEY (completed_dungeons_id) REFERENCES public.area(id);


--
-- Name: player_statistic_completed_dungeons fkbj119ecx4k8i5chsv8dv7fdfg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_completed_dungeons
    ADD CONSTRAINT fkbj119ecx4k8i5chsv8dv7fdfg FOREIGN KEY (player_statistic_id) REFERENCES public.player_statistic(id);


--
-- Name: player_statistic_unlocked_areas fkc8rmgmwe16v3mm33jsy9texyr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_unlocked_areas
    ADD CONSTRAINT fkc8rmgmwe16v3mm33jsy9texyr FOREIGN KEY (unlocked_areas_id) REFERENCES public.area(id);


--
-- Name: player_task_action_log fkdlfw5fmcsknwuql63b86b45a1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_action_log
    ADD CONSTRAINT fkdlfw5fmcsknwuql63b86b45a1 FOREIGN KEY (player_task_statistic_id) REFERENCES public.player_task_statistic(id);


--
-- Name: player_statistic fki1rwj9je6dm6avyhqh7lj7gjt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic
    ADD CONSTRAINT fki1rwj9je6dm6avyhqh7lj7gjt FOREIGN KEY (current_area_id) REFERENCES public.area(id);


--
-- Name: player_statistic_player_task_statistics fki7g5w4ig8hyiaqqjab7apf5xr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_player_task_statistics
    ADD CONSTRAINT fki7g5w4ig8hyiaqqjab7apf5xr FOREIGN KEY (player_task_statistics_id) REFERENCES public.player_task_statistic(id);


--
-- Name: player_statistic_player_task_statistics fkiv8joyn2x1r38uf5lhsminya8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_player_task_statistics
    ADD CONSTRAINT fkiv8joyn2x1r38uf5lhsminya8 FOREIGN KEY (player_statistic_id) REFERENCES public.player_statistic(id);


--
-- Name: player_statistic fkivnttptny2j311jg06hmgsmbt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic
    ADD CONSTRAINT fkivnttptny2j311jg06hmgsmbt FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: minigame_task fkjj5msugs6tsg0dpkyhg5rg3fj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minigame_task
    ADD CONSTRAINT fkjj5msugs6tsg0dpkyhg5rg3fj FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: player_task_statistic_player_task_action_logs fkjm1bdvgey2qg1lfngx2abi0sm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_task_statistic_player_task_action_logs
    ADD CONSTRAINT fkjm1bdvgey2qg1lfngx2abi0sm FOREIGN KEY (player_task_statistic_id) REFERENCES public.player_task_statistic(id);


--
-- Name: area_npcs fkjrt31eq7amlbhumjf62fhexia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_npcs
    ADD CONSTRAINT fkjrt31eq7amlbhumjf62fhexia FOREIGN KEY (area_id) REFERENCES public.area(id);


--
-- Name: playernpcstatistic_playernpcaction_logs fkjx0ula9op9ne4mub427p552m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcstatistic_playernpcaction_logs
    ADD CONSTRAINT fkjx0ula9op9ne4mub427p552m FOREIGN KEY (playernpcaction_logs_id) REFERENCES public.playernpcaction_log(id);


--
-- Name: area fkke3rmfk70r7ot54sy24vw442q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT fkke3rmfk70r7ot54sy24vw442q FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: npc_text fkkgia5fha5jshcattp7t0iaelm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.npc_text
    ADD CONSTRAINT fkkgia5fha5jshcattp7t0iaelm FOREIGN KEY (npc_id) REFERENCES public.npc(id);


--
-- Name: player_statistic_playernpcstatistics fkkprti8utwbb5d6uug4cs63h9w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_playernpcstatistics
    ADD CONSTRAINT fkkprti8utwbb5d6uug4cs63h9w FOREIGN KEY (playernpcstatistics_id) REFERENCES public.playernpcstatistic(id);


--
-- Name: npc fkl4iy0bskn9q6bxtbbxfcydnj8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.npc
    ADD CONSTRAINT fkl4iy0bskn9q6bxtbbxfcydnj8 FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: playernpcaction_log fkly1wr6ylc85twrxav2nhtnimd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playernpcaction_log
    ADD CONSTRAINT fkly1wr6ylc85twrxav2nhtnimd FOREIGN KEY (playernpcstatistic_id) REFERENCES public.playernpcstatistic(id);


--
-- Name: area_books fkn0nlgq66g162qd395kgeinpyb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_books
    ADD CONSTRAINT fkn0nlgq66g162qd395kgeinpyb FOREIGN KEY (area_id) REFERENCES public.area(id);


--
-- Name: area_dungeons fkn1r4adt88177xhsnx2jiripue; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_dungeons
    ADD CONSTRAINT fkn1r4adt88177xhsnx2jiripue FOREIGN KEY (world_id) REFERENCES public.area(id);


--
-- Name: course_worlds fknedx1yjlpvg4j57xkqefl1888; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_worlds
    ADD CONSTRAINT fknedx1yjlpvg4j57xkqefl1888 FOREIGN KEY (worlds_id) REFERENCES public.area(id);


--
-- Name: course_player_statistics fkoklc3m3jittssm0fnyy97s6gq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_player_statistics
    ADD CONSTRAINT fkoklc3m3jittssm0fnyy97s6gq FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: area fkp3yyg6h1oplrq0upvdw5acekg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT fkp3yyg6h1oplrq0upvdw5acekg FOREIGN KEY (world_id) REFERENCES public.area(id);


--
-- Name: book fkpbtrb5t9s5tlmmv7x86kmvkgj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT fkpbtrb5t9s5tlmmv7x86kmvkgj FOREIGN KEY (area_id) REFERENCES public.area(id);


--
-- Name: player_statistic_unlocked_areas fkqkahskoqcupdnaf0moeg6mi5e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_statistic_unlocked_areas
    ADD CONSTRAINT fkqkahskoqcupdnaf0moeg6mi5e FOREIGN KEY (player_statistic_id) REFERENCES public.player_statistic(id);


--
-- Name: area_npcs fkqthws1lsesl8bgsq477p8gv4m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_npcs
    ADD CONSTRAINT fkqthws1lsesl8bgsq477p8gv4m FOREIGN KEY (npcs_id) REFERENCES public.npc(id);


--
-- Name: course_worlds fkr7o1p1hsb0ngdf36ouqchb00w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_worlds
    ADD CONSTRAINT fkr7o1p1hsb0ngdf36ouqchb00w FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- Name: book fkrow3o1i3tcpejmaggbpv1d4fr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT fkrow3o1i3tcpejmaggbpv1d4fr FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- PostgreSQL database dump complete
--

