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
    index integer NOT NULL,
    static_name character varying(255) NOT NULL,
    topic_name character varying(255),
    course_id integer,
    world_id uuid
);


ALTER TABLE public.area OWNER TO postgres;

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
    game character varying(255),
    index integer NOT NULL,
    area_id uuid,
    course_id integer,
    description character varying(255)
);


ALTER TABLE public.minigame_task OWNER TO postgres;

--
-- Name: npc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.npc (
    id uuid NOT NULL,
    index integer NOT NULL,
    area_id uuid,
    course_id integer,
    description character varying(255)
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

COPY public.area (dtype, id, active, index, static_name, topic_name, course_id, world_id) FROM stdin;
World	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	f	1	Blooming Savanna		1	\N
Dungeon	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	f	1	dungeon1		1	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3
Dungeon	adcf84fc-5b67-4e7d-8dcf-dec636abab47	f	2	dungeon2		1	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3
Dungeon	ee0d859c-be18-4b8a-8e08-b417e79b786d	f	3	dungeon3		1	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3
Dungeon	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	f	4	dungeon4		1	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3
World	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	f	2	Sunny Beach		1	\N
Dungeon	26be4da3-0c43-4aab-b783-856672e5427b	f	1	dungeon1		1	b27f4217-616f-4a62-9ef4-8bc26cc6cd73
Dungeon	351488de-5c35-4445-89a6-0217da326e5c	f	2	dungeon2		1	b27f4217-616f-4a62-9ef4-8bc26cc6cd73
Dungeon	e4b4fc3a-39a3-497b-8665-c474a21231d1	f	3	dungeon3		1	b27f4217-616f-4a62-9ef4-8bc26cc6cd73
Dungeon	e6104412-e53d-4dde-8667-94d7a0c8ec1f	f	4	dungeon4		1	b27f4217-616f-4a62-9ef4-8bc26cc6cd73
World	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	f	3	Magic Forest		1	\N
Dungeon	ea1e8d2c-0555-4054-817f-f63edfbdb650	f	1	dungeon1		1	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe
Dungeon	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	f	2	dungeon2		1	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe
Dungeon	59616e13-3367-4ce1-bcae-3ba14a12d965	f	3	dungeon3		1	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe
Dungeon	b46d78f2-fce9-477e-af13-11f4903ee0b0	f	4	dungeon4		1	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe
World	8ce6bee0-0202-42a1-a944-438dd77309cb	f	4	Winter Wonder Land		1	\N
Dungeon	277facf5-f177-43e8-886e-e9520f8a1e58	f	1	dungeon1		1	8ce6bee0-0202-42a1-a944-438dd77309cb
Dungeon	081031cf-ce5a-4c4e-ad28-1556ac125cfe	f	2	dungeon2		1	8ce6bee0-0202-42a1-a944-438dd77309cb
Dungeon	86f950f5-482f-4385-a2ce-052586067f5a	f	3	dungeon3		1	8ce6bee0-0202-42a1-a944-438dd77309cb
Dungeon	9249d60d-7c1a-420b-bdf7-a346f2023ac1	f	4	dungeon4		1	8ce6bee0-0202-42a1-a944-438dd77309cb
World	ac193cda-be9f-423c-9c24-9ab7bbc807f4	f	1	Blooming Savanna		2	\N
Dungeon	8f783c88-580d-45bc-8d4f-6d84aa806a81	f	1	dungeon1		2	ac193cda-be9f-423c-9c24-9ab7bbc807f4
Dungeon	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	f	2	dungeon2		2	ac193cda-be9f-423c-9c24-9ab7bbc807f4
Dungeon	60f725e0-3b9a-4199-86ca-fc70c2692b0d	f	3	dungeon3		2	ac193cda-be9f-423c-9c24-9ab7bbc807f4
Dungeon	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	f	4	dungeon4		2	ac193cda-be9f-423c-9c24-9ab7bbc807f4
World	c250ac28-5424-44d2-ae5b-6c04dae71a0e	f	2	Sunny Beach		2	\N
Dungeon	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	f	1	dungeon1		2	c250ac28-5424-44d2-ae5b-6c04dae71a0e
Dungeon	9be265af-972e-4a05-a5b3-8c916d0ba306	f	2	dungeon2		2	c250ac28-5424-44d2-ae5b-6c04dae71a0e
Dungeon	425c7d41-de8a-4b74-a2d1-657e70eeb87f	f	3	dungeon3		2	c250ac28-5424-44d2-ae5b-6c04dae71a0e
Dungeon	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	f	4	dungeon4		2	c250ac28-5424-44d2-ae5b-6c04dae71a0e
World	a25b42bc-0576-4936-be2f-4eb8136417ce	f	3	Magic Forest		2	\N
Dungeon	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	f	1	dungeon1		2	a25b42bc-0576-4936-be2f-4eb8136417ce
Dungeon	faef09e7-1275-4854-88d3-a50aa90e0a47	f	2	dungeon2		2	a25b42bc-0576-4936-be2f-4eb8136417ce
Dungeon	f0004dea-f619-4f42-a87a-bda3a9129aeb	f	3	dungeon3		2	a25b42bc-0576-4936-be2f-4eb8136417ce
Dungeon	25912394-202e-42a9-a3e8-07dc2d4e6178	f	4	dungeon4		2	a25b42bc-0576-4936-be2f-4eb8136417ce
World	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	f	4	Winter Wonder Land		2	\N
Dungeon	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	f	1	dungeon1		2	1e92dcd9-2dc4-4fec-a953-e23b27b35e17
Dungeon	6d65476b-9452-4438-8092-fcbf514081cd	f	2	dungeon2		2	1e92dcd9-2dc4-4fec-a953-e23b27b35e17
Dungeon	e9127edd-4638-4ce9-a929-b943a2d368fa	f	3	dungeon3		2	1e92dcd9-2dc4-4fec-a953-e23b27b35e17
Dungeon	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	f	4	dungeon4		2	1e92dcd9-2dc4-4fec-a953-e23b27b35e17
\.


--
-- Data for Name: area_dungeons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area_dungeons (world_id, dungeons_id) FROM stdin;
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	adcf84fc-5b67-4e7d-8dcf-dec636abab47
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	ee0d859c-be18-4b8a-8e08-b417e79b786d
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	c2fd389c-07ea-4e89-ba9a-795602c0fbe7
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	26be4da3-0c43-4aab-b783-856672e5427b
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	351488de-5c35-4445-89a6-0217da326e5c
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	e4b4fc3a-39a3-497b-8665-c474a21231d1
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	e6104412-e53d-4dde-8667-94d7a0c8ec1f
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	ea1e8d2c-0555-4054-817f-f63edfbdb650
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	02e6ac42-f0de-40f3-8902-db0ba9aa9a56
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	59616e13-3367-4ce1-bcae-3ba14a12d965
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	b46d78f2-fce9-477e-af13-11f4903ee0b0
8ce6bee0-0202-42a1-a944-438dd77309cb	277facf5-f177-43e8-886e-e9520f8a1e58
8ce6bee0-0202-42a1-a944-438dd77309cb	081031cf-ce5a-4c4e-ad28-1556ac125cfe
8ce6bee0-0202-42a1-a944-438dd77309cb	86f950f5-482f-4385-a2ce-052586067f5a
8ce6bee0-0202-42a1-a944-438dd77309cb	9249d60d-7c1a-420b-bdf7-a346f2023ac1
ac193cda-be9f-423c-9c24-9ab7bbc807f4	8f783c88-580d-45bc-8d4f-6d84aa806a81
ac193cda-be9f-423c-9c24-9ab7bbc807f4	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4
ac193cda-be9f-423c-9c24-9ab7bbc807f4	60f725e0-3b9a-4199-86ca-fc70c2692b0d
ac193cda-be9f-423c-9c24-9ab7bbc807f4	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4
c250ac28-5424-44d2-ae5b-6c04dae71a0e	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c
c250ac28-5424-44d2-ae5b-6c04dae71a0e	9be265af-972e-4a05-a5b3-8c916d0ba306
c250ac28-5424-44d2-ae5b-6c04dae71a0e	425c7d41-de8a-4b74-a2d1-657e70eeb87f
c250ac28-5424-44d2-ae5b-6c04dae71a0e	3f7e9308-eabd-4f9a-8cc7-d43c3d848958
a25b42bc-0576-4936-be2f-4eb8136417ce	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6
a25b42bc-0576-4936-be2f-4eb8136417ce	faef09e7-1275-4854-88d3-a50aa90e0a47
a25b42bc-0576-4936-be2f-4eb8136417ce	f0004dea-f619-4f42-a87a-bda3a9129aeb
a25b42bc-0576-4936-be2f-4eb8136417ce	25912394-202e-42a9-a3e8-07dc2d4e6178
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	6d65476b-9452-4438-8092-fcbf514081cd
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	e9127edd-4638-4ce9-a929-b943a2d368fa
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	58dfb291-eaa3-4ba2-a3b8-00a394a16d60
\.


--
-- Data for Name: area_minigame_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area_minigame_tasks (area_id, minigame_tasks_id) FROM stdin;
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	58fdb041-d376-409a-90bb-52cc4f607168
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1527f59d-7797-44bb-89eb-cce3ee73dfbb
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	07c15751-08ba-4f0e-a51d-3d64726e4428
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	74cd15ff-8fb9-4b30-9a74-bbe3735869a3
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	8a221278-d341-4618-98f7-7abd1fa2e431
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	67a5a78c-b824-42ee-adba-d0f82be8b371
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1837a281-5fab-4f96-82d3-635bd3e78c96
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	c4310355-a449-4408-8fe1-998f8941a748
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	27ca6eaa-fdea-4833-917b-f330c2f91f0f
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	3648b70c-722c-412b-bff2-73b520ffdbf5
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	0770c651-0856-4158-b7ae-88f4878b5c17
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	41b4bfa2-9e0c-433e-9c77-8d51529fe3c1
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	419dc1c5-f3d4-4ce5-aea4-d725158fc35e
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	515dac09-f85d-4fef-ba6a-4bd71a5704e6
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	a605ca42-f0c4-4a7e-b8ec-32f6d0d43ee1
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	15136fb6-9658-4c83-9b2a-b2afab49f675
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	372d2f0a-421d-4fc7-b2c2-76a2e53dc286
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	681f9b41-d383-47a7-a571-4dad0ead835e
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	e59f9c8e-835c-4cb3-a85d-ca60a1d6d4b3
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	b27fd32d-cee6-4fcf-b67d-74856e476916
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	481b84fe-9e93-4d24-860e-264a6c0bcf30
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	177a5146-2720-496d-b2ab-27fee2ea5f31
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	32bbf2ee-e242-43ac-ac40-6e2d47ddeef0
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1b131cb5-9d50-4f86-bed3-04b849fda88e
adcf84fc-5b67-4e7d-8dcf-dec636abab47	91f68abf-deb9-47af-a5fc-760561f41527
adcf84fc-5b67-4e7d-8dcf-dec636abab47	87c235e9-622e-47aa-95fd-88857b179c00
adcf84fc-5b67-4e7d-8dcf-dec636abab47	e2f52572-4ce0-4e6f-9ad9-9d7289ef23cb
adcf84fc-5b67-4e7d-8dcf-dec636abab47	4ec9394d-a50f-4f0a-95c5-e2ccbd457032
adcf84fc-5b67-4e7d-8dcf-dec636abab47	ed8ec599-377c-47a7-bfae-ccaa493b8e32
adcf84fc-5b67-4e7d-8dcf-dec636abab47	80f12240-6df5-451c-abfe-60cad835c073
adcf84fc-5b67-4e7d-8dcf-dec636abab47	f9461fe7-d1cc-47b1-aaa5-0e4a7ffc500c
adcf84fc-5b67-4e7d-8dcf-dec636abab47	5557a63b-c5ba-4c46-ac07-053df7d40edf
adcf84fc-5b67-4e7d-8dcf-dec636abab47	cb19136b-69b3-4fed-94a8-5fab0aa4bc89
adcf84fc-5b67-4e7d-8dcf-dec636abab47	3f696ad2-5a9f-49ef-8e98-ed157347afe5
adcf84fc-5b67-4e7d-8dcf-dec636abab47	49f520c8-b0d5-4ebe-a24f-045ccb30af0e
adcf84fc-5b67-4e7d-8dcf-dec636abab47	0edc94b3-413d-49c2-a583-61d724049be2
ee0d859c-be18-4b8a-8e08-b417e79b786d	a3eec8ad-e632-4e71-83c2-c4ff29d259aa
ee0d859c-be18-4b8a-8e08-b417e79b786d	772405b0-ef5a-4572-aa06-6d0d16dbea17
ee0d859c-be18-4b8a-8e08-b417e79b786d	8be5af24-b9f7-4e86-8cf5-cf484625c985
ee0d859c-be18-4b8a-8e08-b417e79b786d	0b733bdc-b79b-4452-8d58-776ed574e77a
ee0d859c-be18-4b8a-8e08-b417e79b786d	23a48d49-fce7-4a18-8fca-86f989eb3e94
ee0d859c-be18-4b8a-8e08-b417e79b786d	760940ba-4d17-4055-b3b7-e0cf49a37512
ee0d859c-be18-4b8a-8e08-b417e79b786d	0763be19-d3e8-4a0d-9689-3b771ce3455e
ee0d859c-be18-4b8a-8e08-b417e79b786d	5d52ddc9-1781-47ea-881c-2fb5cac0012e
ee0d859c-be18-4b8a-8e08-b417e79b786d	d68a1d70-324a-4521-8af4-965afbb77cae
ee0d859c-be18-4b8a-8e08-b417e79b786d	dc79ca00-0d0b-4742-b302-82741d728fee
ee0d859c-be18-4b8a-8e08-b417e79b786d	823430c9-02fe-415b-ba13-0cb3a32e72ea
ee0d859c-be18-4b8a-8e08-b417e79b786d	1b30adf9-516f-47fd-b94a-275ddd4e21e8
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	62e3ebf5-dd4c-46ea-8e4e-ced3985b9fef
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	4782e644-b047-4193-990d-9ab90da6696f
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	f49c733a-35d9-4e0d-87c0-d44641007fcd
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	486a3fa0-6133-4175-8f64-d14f06899b30
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	64f63f34-4749-4715-b39a-859831d8862b
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	ff2992e5-852e-4e04-a78a-076f32f18e02
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	86892e58-bfeb-4719-8ef7-c7d9bc01a58c
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	d427961c-663d-4341-8808-fe73f7cbbd81
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	0fe34899-dd56-46b3-806f-261adc310000
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	0d1c9b8b-de24-4b8a-a90d-284793732efa
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	3fa14eb9-4c03-4499-b3cf-cb436f2fc5d4
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	5e419152-7e72-4c40-99cc-b25315173ed1
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	4cc1efc6-4005-4124-bcf0-85f2182c81c1
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	886144b5-3802-4fa2-ba7b-8aed055fa203
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	b591c02d-796d-40b4-91dd-104a726b3006
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	d8b08984-a569-4e10-8866-1cc1b17c6092
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	70d41876-cc0f-4c81-8628-c6d1c8b45f61
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	4912b617-7992-46b7-83d1-f88182be7d0c
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	50e0ced4-f26f-4cc7-8c2f-e6583e6f781f
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	3cfe0f0b-bbf9-474e-99ae-668b09d3bca1
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	dac0ecc5-a20e-44df-9f49-071bec950cdf
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	d53e4b01-f476-4fb3-885c-b6d69729c590
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	8067b12f-c241-42bc-b9c1-b71796b7fcef
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	d10827a0-2f09-4ec9-aa5b-8c07f21be8e2
26be4da3-0c43-4aab-b783-856672e5427b	3a15b2d8-7bc3-41b0-b4c2-a5d56c9704df
26be4da3-0c43-4aab-b783-856672e5427b	8a701c30-a468-47e2-9fda-8ab819c81190
26be4da3-0c43-4aab-b783-856672e5427b	57660fa8-b6de-4210-90e2-e93bad21187d
26be4da3-0c43-4aab-b783-856672e5427b	a53f5edc-950f-449d-96c3-72359f45ed94
26be4da3-0c43-4aab-b783-856672e5427b	4b09050a-9f85-4566-aec7-7743d9dbfcfb
26be4da3-0c43-4aab-b783-856672e5427b	2369ce32-1c98-45b2-98c4-c5331c8a811a
26be4da3-0c43-4aab-b783-856672e5427b	3e00c145-a287-4025-bd73-3a458b5b3529
26be4da3-0c43-4aab-b783-856672e5427b	07b990b1-747d-4631-8034-475e4c0c7ea2
26be4da3-0c43-4aab-b783-856672e5427b	b4aef722-217c-4012-8e62-1453eacdd9b2
26be4da3-0c43-4aab-b783-856672e5427b	b495240e-fd5c-4ae7-a8ca-a91e6c41a860
26be4da3-0c43-4aab-b783-856672e5427b	e210d13d-4dd7-44cc-9396-9c0577ca580b
26be4da3-0c43-4aab-b783-856672e5427b	7fab7273-c1f9-4da6-a409-7ab65ec5766c
351488de-5c35-4445-89a6-0217da326e5c	42862f09-4a2e-46e5-9e50-d783d9618be7
351488de-5c35-4445-89a6-0217da326e5c	6d4c1874-6593-4574-a64a-9f9b96c309b4
351488de-5c35-4445-89a6-0217da326e5c	e72f0f3e-577e-4672-b406-32da87f5e0f1
351488de-5c35-4445-89a6-0217da326e5c	4b82d2a5-4d76-4926-984a-126dc281db66
351488de-5c35-4445-89a6-0217da326e5c	648c7908-cded-474f-bd03-6d155851b254
351488de-5c35-4445-89a6-0217da326e5c	4ec10077-2358-4b38-858b-a2f83ab91ea4
351488de-5c35-4445-89a6-0217da326e5c	b2cff975-f0fd-44e1-b486-daa2e8804bcd
351488de-5c35-4445-89a6-0217da326e5c	1d704e95-91e4-4339-ac27-19e153a0797b
351488de-5c35-4445-89a6-0217da326e5c	c3c97387-d7cf-4d70-abe9-55f7b0e058d8
351488de-5c35-4445-89a6-0217da326e5c	d5668093-980f-46c7-bc10-277afaad0468
351488de-5c35-4445-89a6-0217da326e5c	b4dcb323-99f6-47a8-8ed6-81eae709eb82
351488de-5c35-4445-89a6-0217da326e5c	ffa40b27-5e14-4e8f-a577-a71e1c876965
e4b4fc3a-39a3-497b-8665-c474a21231d1	3ff6734b-88aa-47ce-b587-54255c790f3d
e4b4fc3a-39a3-497b-8665-c474a21231d1	5d0274b8-4bac-4bda-a0b9-875aa9df659b
e4b4fc3a-39a3-497b-8665-c474a21231d1	7e6a4fe7-db1b-4e42-a714-640fe17626eb
e4b4fc3a-39a3-497b-8665-c474a21231d1	dd2f2038-0c8c-4db9-aafb-baaa845c1047
e4b4fc3a-39a3-497b-8665-c474a21231d1	4d8bc3d7-721b-4c35-9211-a660769c2812
e4b4fc3a-39a3-497b-8665-c474a21231d1	d1ca7862-0e13-46b6-b4a5-56cd635c67d4
e4b4fc3a-39a3-497b-8665-c474a21231d1	404cdbfc-43d0-4ca8-bf4d-9a2715f274ab
e4b4fc3a-39a3-497b-8665-c474a21231d1	d8cc45bf-5735-4f80-8b55-8d09b20cad08
e4b4fc3a-39a3-497b-8665-c474a21231d1	7ad0b6d3-21de-4d60-9e41-7c8d405676e7
e4b4fc3a-39a3-497b-8665-c474a21231d1	583118a2-2f3d-40b8-831a-e425742fad61
e4b4fc3a-39a3-497b-8665-c474a21231d1	63440c16-5fa8-42fa-8a2c-332a125b9374
e4b4fc3a-39a3-497b-8665-c474a21231d1	0acefa4e-2921-4466-8647-4a0d2fba15b6
e6104412-e53d-4dde-8667-94d7a0c8ec1f	ca372ae4-cee4-4165-8221-e26ea03e6de4
e6104412-e53d-4dde-8667-94d7a0c8ec1f	1f48b25a-41f9-4ee3-926e-e21282fa30c8
e6104412-e53d-4dde-8667-94d7a0c8ec1f	aa1e9e9e-7b83-4705-8af1-efa98cbce656
e6104412-e53d-4dde-8667-94d7a0c8ec1f	1d96a115-b396-477b-a482-81b401d94c5d
e6104412-e53d-4dde-8667-94d7a0c8ec1f	dbcf9a68-599c-4917-b228-22d916d0a66a
e6104412-e53d-4dde-8667-94d7a0c8ec1f	984be6a9-1c2a-49e9-a4d8-81ed061a5d45
e6104412-e53d-4dde-8667-94d7a0c8ec1f	b64ebf62-f069-4e2f-a96b-f65ad7d20e06
e6104412-e53d-4dde-8667-94d7a0c8ec1f	bf13ed03-5b71-433b-99b9-658b270d819e
e6104412-e53d-4dde-8667-94d7a0c8ec1f	c89d3b02-9e88-40cb-9f63-a55341d160fa
e6104412-e53d-4dde-8667-94d7a0c8ec1f	cff0b772-c7dc-4da6-a7fb-be0df3ddbc26
e6104412-e53d-4dde-8667-94d7a0c8ec1f	6fbb160f-84ef-4806-8579-cb3ccf5d4161
e6104412-e53d-4dde-8667-94d7a0c8ec1f	9ad6cc18-438e-4767-b126-521d5a085b77
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	b2108304-518f-4cc6-a0d9-d1440377d699
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	87409b75-3054-4cec-a699-63c32c4c1df5
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	8a9dbf27-8de2-4002-b1b3-cb7dd709b78e
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	339b74d0-7067-4783-a521-7667bbc56b92
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	52ab7a0f-6de1-42b2-bdf1-1a24128222e0
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	c26f1397-19d6-4106-a0c2-ea76f43dc2da
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	dd7dbc48-e273-4585-8b57-14bc4dc74527
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	396d53d4-985b-4106-9bca-4a658f0038a1
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	180aa5e6-4977-4e0f-ae5f-29abf59c7824
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	a65ca80e-c54a-436e-94ed-fb85ad62bb47
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	d6b56378-265c-4538-a1c3-04f8d7c48898
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	beb4be93-b027-4a4b-8891-3f14a7859d8c
ea1e8d2c-0555-4054-817f-f63edfbdb650	0919ff4f-84c8-4da4-8afe-fe9af80e9eb8
ea1e8d2c-0555-4054-817f-f63edfbdb650	5b8270c5-d74d-4180-8f0d-5df43c3212c9
ea1e8d2c-0555-4054-817f-f63edfbdb650	e71f0ec7-6efe-4a19-b338-6435a6cebbe5
ea1e8d2c-0555-4054-817f-f63edfbdb650	fec38a87-f43c-4ffe-87c8-36e3bafb78db
ea1e8d2c-0555-4054-817f-f63edfbdb650	6ef72fe4-19fd-44b9-bf06-d4ffad75a9a6
ea1e8d2c-0555-4054-817f-f63edfbdb650	ca69fc1f-3548-4131-9238-9da9f171c14b
ea1e8d2c-0555-4054-817f-f63edfbdb650	2912e5d3-a477-4245-aa80-5d58117b2e17
ea1e8d2c-0555-4054-817f-f63edfbdb650	c589733a-1a1c-4ba1-91d8-848184d117d8
ea1e8d2c-0555-4054-817f-f63edfbdb650	6b037898-3c14-4962-b348-f1d0ac68a103
ea1e8d2c-0555-4054-817f-f63edfbdb650	809dd4c1-c36e-4beb-91ac-833d769d7245
ea1e8d2c-0555-4054-817f-f63edfbdb650	de4ac1bf-e5be-435b-9369-4c5d8fecb069
ea1e8d2c-0555-4054-817f-f63edfbdb650	c96eba51-8e1f-4696-8ec5-65e9d831bf15
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	a6fca17d-9382-4021-8921-b58c60504c02
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	651323dc-1a71-47a5-adee-f4195075080c
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	896984b0-7c75-4cdf-a453-4054cc1d9caf
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	83e9f7b0-fc38-4512-a7fd-eabcbd54f994
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	c0da56c7-24b5-49e0-93f8-a9cada828986
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	ba677353-6904-43d5-a7e9-c54010636ae3
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	971440b3-9186-4a63-b594-9c80cde80c89
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	cf5c28e5-aac3-4af9-b917-b189e6f60660
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	575bcd8c-59cc-41de-8297-c8caac280fef
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	81818fca-1512-4812-b14f-86ab855e68d8
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	cb23f6b1-acc7-46f6-97b6-e1c661792ca8
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	06a61595-dcad-48ba-a7b3-f889133f54b4
59616e13-3367-4ce1-bcae-3ba14a12d965	68358f3e-356c-495d-9b27-ea9402e38f8d
59616e13-3367-4ce1-bcae-3ba14a12d965	581f2ce5-bedb-4366-8ad0-e604a60f874a
59616e13-3367-4ce1-bcae-3ba14a12d965	a5f7f283-a243-43a2-bc2f-03c3d6f1e527
59616e13-3367-4ce1-bcae-3ba14a12d965	35321cd2-8fc7-4145-9922-52cfc67d9845
59616e13-3367-4ce1-bcae-3ba14a12d965	fd46a785-24d5-4c9c-a7fa-c425f405a210
59616e13-3367-4ce1-bcae-3ba14a12d965	e6ab77f7-c558-4346-acb6-4e874086099a
59616e13-3367-4ce1-bcae-3ba14a12d965	b5709bf8-fe38-4bc3-b047-f56837808fe9
59616e13-3367-4ce1-bcae-3ba14a12d965	0d247e5c-7b6d-44fc-b3c7-e67d0c1d5f1e
59616e13-3367-4ce1-bcae-3ba14a12d965	eb273424-ef39-4b75-909c-17b105166969
59616e13-3367-4ce1-bcae-3ba14a12d965	5e0d957f-59e1-4c80-8c63-37560d8ab18a
59616e13-3367-4ce1-bcae-3ba14a12d965	5fced5ee-e66f-46e5-8033-ead4df1c0b9c
59616e13-3367-4ce1-bcae-3ba14a12d965	488ebedd-d864-471d-b7b5-fc5a29a5a27d
b46d78f2-fce9-477e-af13-11f4903ee0b0	fcb36929-5ee8-48d3-a433-509e4ef0408a
b46d78f2-fce9-477e-af13-11f4903ee0b0	c258de8d-f7c8-4c81-9504-e4de53266b3d
b46d78f2-fce9-477e-af13-11f4903ee0b0	56e3ecba-aa84-498c-928f-16a242920893
b46d78f2-fce9-477e-af13-11f4903ee0b0	e2f32002-a569-40a2-af63-5acea287d208
b46d78f2-fce9-477e-af13-11f4903ee0b0	2112fbf2-876e-448a-9eff-db510123c895
b46d78f2-fce9-477e-af13-11f4903ee0b0	827c1c08-68fc-4fe8-be00-3cce8016f989
b46d78f2-fce9-477e-af13-11f4903ee0b0	0e166a0e-4bdb-40bd-aca7-afb1e721b5d3
b46d78f2-fce9-477e-af13-11f4903ee0b0	0959b3e9-3f80-4aae-8c84-f31d49aa0ac5
b46d78f2-fce9-477e-af13-11f4903ee0b0	9d620a8b-28a7-4d44-a748-71039407d7db
b46d78f2-fce9-477e-af13-11f4903ee0b0	ce3c2e99-7e07-49b9-b0c1-d76197fc114d
b46d78f2-fce9-477e-af13-11f4903ee0b0	aac664a6-f945-48d4-a3ce-b7ca6040123d
b46d78f2-fce9-477e-af13-11f4903ee0b0	5615a0a6-b8b3-46fe-8e3a-62327ee00537
8ce6bee0-0202-42a1-a944-438dd77309cb	d07cca2a-ab1d-4e4e-8ed7-021c67a319ec
8ce6bee0-0202-42a1-a944-438dd77309cb	26ea9dca-f00a-43e6-b42b-7e4e56e5fc3f
8ce6bee0-0202-42a1-a944-438dd77309cb	add69d35-0bc7-40b0-97ed-66b0066bf34c
8ce6bee0-0202-42a1-a944-438dd77309cb	79cc12af-ba09-4877-b4fd-c2f0ce9f5257
8ce6bee0-0202-42a1-a944-438dd77309cb	0fdd7b28-0c2b-4c05-9f49-2469f67fe025
8ce6bee0-0202-42a1-a944-438dd77309cb	7ce1cc84-6428-4604-919f-e1f7f76e699e
8ce6bee0-0202-42a1-a944-438dd77309cb	9602bce8-5f49-45c3-8b41-eb2aca889ec0
8ce6bee0-0202-42a1-a944-438dd77309cb	7e25eb3e-707e-4486-a1a5-45d964ca9e0a
8ce6bee0-0202-42a1-a944-438dd77309cb	5064c936-e34c-4afb-8f4d-19c5d3058e8c
8ce6bee0-0202-42a1-a944-438dd77309cb	ff0f7bc7-63d4-49a1-93e2-3ec2aaa644cf
8ce6bee0-0202-42a1-a944-438dd77309cb	83bdeee1-a379-415e-9cf8-935a52407348
8ce6bee0-0202-42a1-a944-438dd77309cb	25693759-601b-4230-86fc-01fc67385259
277facf5-f177-43e8-886e-e9520f8a1e58	50be9504-14b5-4563-a841-8d2d38e40703
277facf5-f177-43e8-886e-e9520f8a1e58	560fd7ea-0033-4d81-91f4-41672f898800
277facf5-f177-43e8-886e-e9520f8a1e58	66ff9b56-7cbb-40e9-9a04-4701ac41cdad
277facf5-f177-43e8-886e-e9520f8a1e58	db71371e-6584-4de2-86a5-31143c97424f
277facf5-f177-43e8-886e-e9520f8a1e58	2a3fd83f-4303-4169-92e1-5759fb9e6404
277facf5-f177-43e8-886e-e9520f8a1e58	44c688ba-0d24-4f67-b1c7-51a96d82b573
277facf5-f177-43e8-886e-e9520f8a1e58	f110133c-3c94-4402-9e29-9edc4af367fa
277facf5-f177-43e8-886e-e9520f8a1e58	1a44e8cd-7908-49c1-b03c-1f1b36a740eb
277facf5-f177-43e8-886e-e9520f8a1e58	310358cb-0734-4b6b-a20b-b0cde2b533fd
277facf5-f177-43e8-886e-e9520f8a1e58	1cfbc939-b719-448b-b934-8a838e82fc94
277facf5-f177-43e8-886e-e9520f8a1e58	74e3c5ef-e9fb-4aa8-978a-0681a54f70e1
277facf5-f177-43e8-886e-e9520f8a1e58	dbaaa48d-16ff-4edf-86f2-f15ab0902d80
081031cf-ce5a-4c4e-ad28-1556ac125cfe	738d23b9-6314-42a9-b296-a140ed73dd90
081031cf-ce5a-4c4e-ad28-1556ac125cfe	bc4573df-9bfc-4931-a1e2-18b885b983da
081031cf-ce5a-4c4e-ad28-1556ac125cfe	ce59bf90-1178-469c-9533-93ed82d22511
081031cf-ce5a-4c4e-ad28-1556ac125cfe	11a7b7a9-f172-4aa4-b643-a80345de980e
081031cf-ce5a-4c4e-ad28-1556ac125cfe	175c8101-ae49-48b5-ba33-694ba289f430
081031cf-ce5a-4c4e-ad28-1556ac125cfe	87ba475c-a445-4a27-8470-c2e5f8769085
081031cf-ce5a-4c4e-ad28-1556ac125cfe	1658726f-86e3-4b12-a179-5de415c4fa88
081031cf-ce5a-4c4e-ad28-1556ac125cfe	8f17771d-8f72-4b6e-bcd3-72ccd3faeb5c
081031cf-ce5a-4c4e-ad28-1556ac125cfe	a5ba06ba-1508-4e37-b657-8e9a02cfc4f3
081031cf-ce5a-4c4e-ad28-1556ac125cfe	e4244178-159c-42b6-b478-5e9306442ef5
081031cf-ce5a-4c4e-ad28-1556ac125cfe	d66c79f1-103e-4dba-a8c9-90eab7bb3365
081031cf-ce5a-4c4e-ad28-1556ac125cfe	914bb778-beab-41eb-8657-6099f4ac6104
86f950f5-482f-4385-a2ce-052586067f5a	75b8ca71-ecdb-40e4-b512-73c3c4560748
86f950f5-482f-4385-a2ce-052586067f5a	18f471cb-49b4-4773-a2fd-5d02f94ca22a
86f950f5-482f-4385-a2ce-052586067f5a	2244d600-2283-4b46-a320-d78a54771b34
86f950f5-482f-4385-a2ce-052586067f5a	c5090b66-ab7b-40b7-b5f4-932b23451674
86f950f5-482f-4385-a2ce-052586067f5a	e4977146-1fd4-4dda-97da-67337f8af9a7
86f950f5-482f-4385-a2ce-052586067f5a	91319a64-b571-4742-8cbf-86de9106b745
86f950f5-482f-4385-a2ce-052586067f5a	6b7121e9-58e8-445f-ac07-a34862428e71
86f950f5-482f-4385-a2ce-052586067f5a	89bf8ce4-7782-4094-9891-5c6531bff7dc
86f950f5-482f-4385-a2ce-052586067f5a	5d61d950-54db-4349-8cb9-b9947b339d00
86f950f5-482f-4385-a2ce-052586067f5a	3457eb8e-ad73-416b-8b4f-5f40f7e99ae2
86f950f5-482f-4385-a2ce-052586067f5a	f37250b3-7f28-42e6-abcd-a8cc9951a3b1
86f950f5-482f-4385-a2ce-052586067f5a	f2277178-41c5-40c8-8cac-9ab7a23f055c
9249d60d-7c1a-420b-bdf7-a346f2023ac1	d873d035-a426-4b4f-9ef0-228d2952c21e
9249d60d-7c1a-420b-bdf7-a346f2023ac1	4e55878c-613a-4990-bef1-1e626b855486
9249d60d-7c1a-420b-bdf7-a346f2023ac1	8175e0e6-dcd8-4b44-8aaa-9abbeb89d1a8
9249d60d-7c1a-420b-bdf7-a346f2023ac1	34d598e0-d78b-4e41-a3cf-d3b3e2ed294e
9249d60d-7c1a-420b-bdf7-a346f2023ac1	3f9fb6d5-9475-4ed6-b440-ebc3245e1ad6
9249d60d-7c1a-420b-bdf7-a346f2023ac1	50be1528-3267-4e5d-9fc2-6dac9b35c3f0
9249d60d-7c1a-420b-bdf7-a346f2023ac1	99f242db-c6fb-4cee-b43f-fd71dccf2d3c
9249d60d-7c1a-420b-bdf7-a346f2023ac1	8eae5ba3-a639-4287-86d9-3bcdbf6e2e62
9249d60d-7c1a-420b-bdf7-a346f2023ac1	1eb5cac2-4c4a-4113-bdcd-976e656f704d
9249d60d-7c1a-420b-bdf7-a346f2023ac1	02cbbbaf-9334-4bd1-ab8a-af131338bd4e
9249d60d-7c1a-420b-bdf7-a346f2023ac1	38d04012-3ab7-4f42-a979-225cbd5f37da
9249d60d-7c1a-420b-bdf7-a346f2023ac1	b380a336-c40c-40ab-92fa-1152214f50a6
ac193cda-be9f-423c-9c24-9ab7bbc807f4	37ffb3ea-785c-41ee-b610-f42c102da33b
ac193cda-be9f-423c-9c24-9ab7bbc807f4	41da12cd-ebcc-4583-84dc-9803767517c9
ac193cda-be9f-423c-9c24-9ab7bbc807f4	49c3aa48-3eec-4fa8-8a14-60f18cc3afb3
ac193cda-be9f-423c-9c24-9ab7bbc807f4	086bcc96-0298-47e7-968e-4983d1f795d9
ac193cda-be9f-423c-9c24-9ab7bbc807f4	3d355ed9-ec41-4e36-a9ea-9405dcc7be6d
ac193cda-be9f-423c-9c24-9ab7bbc807f4	24bff4dd-d471-4b8b-8bbf-590b2e766dbc
ac193cda-be9f-423c-9c24-9ab7bbc807f4	7ae4b680-8a72-445c-a52c-6b77f0a51d5c
ac193cda-be9f-423c-9c24-9ab7bbc807f4	cab90542-bc81-4e13-a5c2-838d9810bb33
ac193cda-be9f-423c-9c24-9ab7bbc807f4	652b22cb-f159-478c-adef-5a25598b3ca1
ac193cda-be9f-423c-9c24-9ab7bbc807f4	12253bb5-1ea4-42a7-a80c-a12c5f3d5c02
ac193cda-be9f-423c-9c24-9ab7bbc807f4	6bb024e0-01fc-41a7-bc38-cdbb2f89ccb3
ac193cda-be9f-423c-9c24-9ab7bbc807f4	db00d0d9-2e89-4a0d-8ab1-17562f14b8f3
8f783c88-580d-45bc-8d4f-6d84aa806a81	3863c5f8-a6df-492e-a775-eab4e5554e64
8f783c88-580d-45bc-8d4f-6d84aa806a81	8aaa3f0d-c930-4293-ad1d-b5ed4eef4356
8f783c88-580d-45bc-8d4f-6d84aa806a81	1198290a-582e-4b9a-90bf-1df77a3c95ef
8f783c88-580d-45bc-8d4f-6d84aa806a81	d45ebb49-56cf-44ce-9949-f51e65519d61
8f783c88-580d-45bc-8d4f-6d84aa806a81	8764be00-33a7-40f4-8fc2-906cbb016053
8f783c88-580d-45bc-8d4f-6d84aa806a81	be828751-4975-406c-88da-6e07a7c3d0c7
8f783c88-580d-45bc-8d4f-6d84aa806a81	7c3eaa2c-fe92-4b90-ba20-3205d62c86ab
8f783c88-580d-45bc-8d4f-6d84aa806a81	2e0ef2fa-597a-4232-8023-b4d3a0e4c3ca
8f783c88-580d-45bc-8d4f-6d84aa806a81	558e8686-e1ed-46d2-ae19-70c91de0ceb2
8f783c88-580d-45bc-8d4f-6d84aa806a81	42140cb8-6ef1-43a5-8ef8-4f436f42f18d
8f783c88-580d-45bc-8d4f-6d84aa806a81	3f1a5664-7ffe-4228-9130-64c84c24d4c0
8f783c88-580d-45bc-8d4f-6d84aa806a81	4b9e2413-967b-4b15-8b5f-21b8020b9a5b
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	60c0a3ba-28d5-42f0-a956-a65b7cae92a9
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	5def49b3-605d-4188-a27c-71c29d848268
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	e19cfb6d-7cdf-4c43-8b21-772dad9e9199
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	51beb349-804b-41f1-a120-2398f05f0e30
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	e24daa96-073b-4f4a-9ef5-c1f8cff139dd
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	cdb3a209-e026-4b07-a345-4b4090e10f0b
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	803b5c24-34ee-4b17-a8bc-a55fe4eec163
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	b9278a63-2a46-429a-b7a0-222bbbcffec0
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	456b90e9-a0bc-4fbf-ac8e-40b63a6dcef7
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	5304d6ca-9d44-461f-a2d9-8e06f0bdf657
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	8dd87045-cc39-41e8-b05b-b764320daeaa
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	9d8d2fbb-cd35-4a21-9cfa-455526cea239
60f725e0-3b9a-4199-86ca-fc70c2692b0d	6abf1853-b5d0-4c6c-8d58-59167b1f351c
60f725e0-3b9a-4199-86ca-fc70c2692b0d	75eefe2b-3494-4639-a610-be92626498f7
60f725e0-3b9a-4199-86ca-fc70c2692b0d	148c581a-bc49-49e7-b4e3-f6420fb905bf
60f725e0-3b9a-4199-86ca-fc70c2692b0d	7b51d44d-9fb3-4565-a2a5-4c09ffbb6ad8
60f725e0-3b9a-4199-86ca-fc70c2692b0d	c2a83b65-2484-4dab-a081-9c4c30ff966b
60f725e0-3b9a-4199-86ca-fc70c2692b0d	4f96d462-7b5b-49c0-9a5e-b9c8a355a55d
60f725e0-3b9a-4199-86ca-fc70c2692b0d	2b204dfa-a8dd-4a84-9528-89472adc5525
60f725e0-3b9a-4199-86ca-fc70c2692b0d	62cc6fb1-0105-49be-8013-3952171a38e3
60f725e0-3b9a-4199-86ca-fc70c2692b0d	4130e885-29b6-4a07-8ce3-df672c0cca7d
60f725e0-3b9a-4199-86ca-fc70c2692b0d	23e39b5a-3cd3-486e-b323-13b71e378475
60f725e0-3b9a-4199-86ca-fc70c2692b0d	fe1bfb02-8629-4a6e-98ee-f65c449976c6
60f725e0-3b9a-4199-86ca-fc70c2692b0d	0cbfe5d5-4b34-4b02-b9db-2883acd4bbc0
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	1ff0d71c-77fc-4582-823f-c59c29f15949
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	5f849f2d-4504-4b98-af00-8e5d0fcc1cc2
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	907b2536-f5a5-4c74-bd77-76f6fea19c62
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	f3cdaa28-774a-4fa0-b84e-00ad9c982e49
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	a8ebfdbc-46ad-477b-bee1-721321b7e97b
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	72d982fe-a55c-4e91-87fd-e6a56949ffa8
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	6072dc39-a839-4de1-ac7f-d05e78d9dfea
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	6a805a26-3126-4a0c-b482-c96d7978547b
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2923c9bf-a875-439c-b519-294398c018f4
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	8763f545-1f35-484b-84b4-3d14b095d2c5
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	e5bfd498-eaa2-4369-8a56-92ea4656e8c8
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	ea7722be-089f-408e-9bfe-07c108478298
c250ac28-5424-44d2-ae5b-6c04dae71a0e	a4b70260-b186-4327-b1e3-e61dbe5d3fb6
c250ac28-5424-44d2-ae5b-6c04dae71a0e	30836efd-3209-419c-be96-0020de269484
c250ac28-5424-44d2-ae5b-6c04dae71a0e	473b6070-46fb-4f9c-b619-e1a8ced2339d
c250ac28-5424-44d2-ae5b-6c04dae71a0e	dcf274de-e8e1-4458-ba46-c2299d19fec1
c250ac28-5424-44d2-ae5b-6c04dae71a0e	0926c2e2-cca2-458c-99fc-b6f4184c01c0
c250ac28-5424-44d2-ae5b-6c04dae71a0e	2d689ea8-0e9c-48da-a5c9-f7c5f32352da
c250ac28-5424-44d2-ae5b-6c04dae71a0e	704067f5-d032-42d0-b1bd-4ec09392cc48
c250ac28-5424-44d2-ae5b-6c04dae71a0e	71a6068e-bf6b-4243-938a-cde226531511
c250ac28-5424-44d2-ae5b-6c04dae71a0e	529f3356-cd0d-429b-951a-a82609b876ac
c250ac28-5424-44d2-ae5b-6c04dae71a0e	0bfbf22c-2df6-43e1-9441-7a040259cfc9
c250ac28-5424-44d2-ae5b-6c04dae71a0e	4e14bbec-9473-4423-a1dc-371a7119ca05
c250ac28-5424-44d2-ae5b-6c04dae71a0e	dd91a909-6171-4632-a861-aecc9ac2f06e
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	552bc927-8498-4e8c-bd1b-2011fb2d2d6b
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	04ee197f-fb65-4ea3-895a-09813b1975b1
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	4e7ee96a-d218-4e7e-9d12-289c85b86fd3
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	ab26253e-f702-4ab0-8c29-24f84d0263b9
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	0e173106-d68e-4d41-af06-7da1888ee0f0
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	7ca1a4b5-e5ca-442e-ad10-f630160d3639
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	612e17b2-c912-45af-9330-f1d5a7430dd0
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	a48ea115-2a16-403c-b1f8-8843468910aa
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	c8fe4d70-0dc6-4067-95b8-2b3709829ff3
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	bac5dd37-c025-4e18-9ebf-ed28990211de
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2ab228ab-cbd0-431e-a45e-6299abd31c68
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	c56b72af-809f-49f8-8565-d0c641eac388
9be265af-972e-4a05-a5b3-8c916d0ba306	a210c42e-6f7f-4821-86c4-33f4e8b8fb28
9be265af-972e-4a05-a5b3-8c916d0ba306	a95de06b-92b7-488b-9a12-daff2f906ddb
9be265af-972e-4a05-a5b3-8c916d0ba306	3cf2ff1e-5db8-4b52-be52-8edfa81f3bbc
9be265af-972e-4a05-a5b3-8c916d0ba306	0a88066a-0b75-49d9-9b8f-bec03d627b49
9be265af-972e-4a05-a5b3-8c916d0ba306	ef4d6136-0547-4642-9bc6-bfbea6183a3b
9be265af-972e-4a05-a5b3-8c916d0ba306	ce19f68e-b38f-40de-9f19-e30800f9edaf
9be265af-972e-4a05-a5b3-8c916d0ba306	e844f38e-33da-4e5a-86f0-2fa49022a63e
9be265af-972e-4a05-a5b3-8c916d0ba306	e0692f2c-c73b-42c8-a248-9720e2846c9d
9be265af-972e-4a05-a5b3-8c916d0ba306	bb6a6710-c8df-4c69-8f12-2c354d8140f0
9be265af-972e-4a05-a5b3-8c916d0ba306	a95795d6-c81c-4828-905b-7bd9cf34f63c
9be265af-972e-4a05-a5b3-8c916d0ba306	7816b403-821e-4b3b-9358-ff104433e2c6
9be265af-972e-4a05-a5b3-8c916d0ba306	5409c239-6e50-4b72-aafc-4ddc17baaddb
425c7d41-de8a-4b74-a2d1-657e70eeb87f	a535f9bf-897a-4331-9ec6-0e9ee7c6f44e
425c7d41-de8a-4b74-a2d1-657e70eeb87f	2b9f3dc2-f200-4ce3-baa3-c0959138b4f5
425c7d41-de8a-4b74-a2d1-657e70eeb87f	8dc7ff61-67c5-4fb5-af37-5cd47a373627
425c7d41-de8a-4b74-a2d1-657e70eeb87f	3813a332-6050-46bc-a897-295fd169f60d
425c7d41-de8a-4b74-a2d1-657e70eeb87f	b7ccad55-af94-4c91-aff4-ce3afcfb9088
425c7d41-de8a-4b74-a2d1-657e70eeb87f	8dad7e64-d9a9-47a3-8a22-fb96b96a40b4
425c7d41-de8a-4b74-a2d1-657e70eeb87f	bbb5fbe2-ab29-4c68-ae95-185e941d91c4
425c7d41-de8a-4b74-a2d1-657e70eeb87f	0c7067b3-1a91-4eff-bcd3-8fddd487671a
425c7d41-de8a-4b74-a2d1-657e70eeb87f	a70b3376-177c-412a-adf8-da04a1cc6f11
425c7d41-de8a-4b74-a2d1-657e70eeb87f	43831346-3c5e-48b8-ab44-4ed8bfb9e7fe
425c7d41-de8a-4b74-a2d1-657e70eeb87f	00d7139c-2f02-4297-855a-503f2460b280
425c7d41-de8a-4b74-a2d1-657e70eeb87f	8bca7fb4-5117-4f51-950d-59cea7c31a18
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2555c003-96eb-463a-b059-cfd16bf67817
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	ea999631-7d6e-4600-9b0b-9bc9ccaa9e67
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	70435bd7-da04-4af0-85b9-e6a7ffaf2925
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	8154cc25-bbd0-494d-b4c7-33f30bb9e60c
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	b579adfe-ba00-4fe3-92bc-4b51bd36d445
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	86e7c72b-9258-471a-b16c-2600d752400f
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	f17697dd-8656-49d3-a835-d3a8ddf3b6ba
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	9fd2a21b-652e-431d-9e56-7e73dcfe6bf1
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	ef6f3872-b074-4706-a189-8bc7fc15285a
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	fdbb1d1b-d4e8-4dab-b95b-0881268b63d6
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	8b9abc45-aa91-4cae-aabb-7f4bee1e6a41
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2b37f8a9-4af1-41b4-88e1-90ddf4815c8d
a25b42bc-0576-4936-be2f-4eb8136417ce	a9d39400-d6d5-4e4e-9dd1-40ca94a26b53
a25b42bc-0576-4936-be2f-4eb8136417ce	7f9875a7-13fc-42b9-bce1-fcb0ef384373
a25b42bc-0576-4936-be2f-4eb8136417ce	e9f34094-c54a-4a0b-b60f-12f4c22d8297
a25b42bc-0576-4936-be2f-4eb8136417ce	95cd5cf5-4183-46b3-b247-30dfb2348bdf
a25b42bc-0576-4936-be2f-4eb8136417ce	6fef5bf2-6cf8-4bef-b8c9-b7179af68147
a25b42bc-0576-4936-be2f-4eb8136417ce	432ae1d1-be71-4743-8ccc-f4e33a1284d9
a25b42bc-0576-4936-be2f-4eb8136417ce	0f8958af-005b-4ac9-bf37-71d09c7037d4
a25b42bc-0576-4936-be2f-4eb8136417ce	8b4fedae-8a81-47ac-b70c-4ef208cf74f1
a25b42bc-0576-4936-be2f-4eb8136417ce	396e2d37-f53a-4d3a-bfd8-e2c50d19ca92
a25b42bc-0576-4936-be2f-4eb8136417ce	98cfdb13-deb2-443a-8fc7-2abd0df416f0
a25b42bc-0576-4936-be2f-4eb8136417ce	e55532b0-2e58-43cc-8b2e-94e3600faefa
a25b42bc-0576-4936-be2f-4eb8136417ce	69c88a51-1c39-4ea4-98d9-50bfa3e8162b
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	8e3991ed-a603-4716-a24b-8155c55c3a36
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	406984ad-852d-42e5-8bd6-558bc6df8478
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	52293d76-88c3-40cc-ae8a-d5055797d7f0
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	ed51d5a9-363f-4a2c-a73e-d9b2375eb529
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	ddf45fc6-d84a-4d42-a70c-4b4d96c90b94
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	50cb3370-70d9-40c5-a147-3bca972d9d77
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	9836c154-5bdf-42e3-9ebe-5c47d104bba4
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	6ee3e056-d104-4387-bfc7-5d0be34b6cc6
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	24191d57-c8d6-40a1-a101-a136ca4f1499
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	761db5e7-2dfd-4b1c-81df-04d9f17bdce4
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	8f6abba6-722e-426a-93b0-bded690a58a3
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	41c9c1f1-adb6-41ad-962e-52ad31f9ce81
faef09e7-1275-4854-88d3-a50aa90e0a47	b4d2f308-0884-4448-9de6-b0c532e81851
faef09e7-1275-4854-88d3-a50aa90e0a47	56a0ea36-eb45-4136-8aef-c15462fba45c
faef09e7-1275-4854-88d3-a50aa90e0a47	800df1d2-5f76-4517-98b1-597ce9e48622
faef09e7-1275-4854-88d3-a50aa90e0a47	847c6de1-cd2c-4ad9-b467-e0e039944b9e
faef09e7-1275-4854-88d3-a50aa90e0a47	ff6ab9e1-5274-408d-851c-88661b4e4b38
faef09e7-1275-4854-88d3-a50aa90e0a47	ae9a07c8-2b3b-47f2-acae-de31844303c1
faef09e7-1275-4854-88d3-a50aa90e0a47	182bbd0e-a18e-4090-b272-119735f14d52
faef09e7-1275-4854-88d3-a50aa90e0a47	b44af35f-bb1b-432a-bb45-c382d707552b
faef09e7-1275-4854-88d3-a50aa90e0a47	2609894d-2102-44af-8520-5a07ba73f4c1
faef09e7-1275-4854-88d3-a50aa90e0a47	02d74e13-801a-42e8-8a28-09b8206e9c3c
faef09e7-1275-4854-88d3-a50aa90e0a47	06b88515-ff9d-41c0-a908-f46895f1c89d
faef09e7-1275-4854-88d3-a50aa90e0a47	05342138-d77f-41ee-b928-3c55d8a2403c
f0004dea-f619-4f42-a87a-bda3a9129aeb	239dc6a2-af4c-4bfa-8310-44e9ded7536c
f0004dea-f619-4f42-a87a-bda3a9129aeb	dc4c9ddb-10bf-4471-b3a2-4d86968f2401
f0004dea-f619-4f42-a87a-bda3a9129aeb	d4cb5f21-8959-4d52-a0a8-85ebba461035
f0004dea-f619-4f42-a87a-bda3a9129aeb	e3b47591-4113-410b-913c-c749238ce2f5
f0004dea-f619-4f42-a87a-bda3a9129aeb	95528017-2598-487e-ab14-543c1944d4e4
f0004dea-f619-4f42-a87a-bda3a9129aeb	112f554e-eafb-4523-9112-b093aabc4232
f0004dea-f619-4f42-a87a-bda3a9129aeb	c3666a5e-5cf1-4d1b-805c-18060631dd99
f0004dea-f619-4f42-a87a-bda3a9129aeb	79be1080-8a1a-414e-8ee9-5b629e393fe7
f0004dea-f619-4f42-a87a-bda3a9129aeb	58aa736e-057b-4ee7-aa8b-4cc678f75f7a
f0004dea-f619-4f42-a87a-bda3a9129aeb	0d7cb8ec-9810-4d07-b41b-4ee77e4b2f1d
f0004dea-f619-4f42-a87a-bda3a9129aeb	07843549-3da8-407e-9c05-fc43abcc5800
f0004dea-f619-4f42-a87a-bda3a9129aeb	9f742510-2b92-43a0-8552-9a158469332b
25912394-202e-42a9-a3e8-07dc2d4e6178	47f198d4-8c6f-4cd3-bfc8-4ac704bf57f7
25912394-202e-42a9-a3e8-07dc2d4e6178	ae957775-d5c9-4a2c-8bdd-a7d06a9d401a
25912394-202e-42a9-a3e8-07dc2d4e6178	68c638d4-f6c0-4f46-ac66-4e15a8607e01
25912394-202e-42a9-a3e8-07dc2d4e6178	cdca2998-73ba-4625-bff3-9dcc801c61cb
25912394-202e-42a9-a3e8-07dc2d4e6178	81de5af8-49f8-497d-b926-8e8ca5956b18
25912394-202e-42a9-a3e8-07dc2d4e6178	5142dc65-5157-47a7-98e2-dd96a47383bc
25912394-202e-42a9-a3e8-07dc2d4e6178	29ac299f-43e0-43a3-ae4b-99534e44d490
25912394-202e-42a9-a3e8-07dc2d4e6178	88505a46-d631-4bc3-b9cc-98f2855a412d
25912394-202e-42a9-a3e8-07dc2d4e6178	f9973f46-a210-4367-97ea-f2f0d151e921
25912394-202e-42a9-a3e8-07dc2d4e6178	6893c3a1-fe34-4ac3-9b64-3ec4b82260aa
25912394-202e-42a9-a3e8-07dc2d4e6178	724552e5-016a-4eee-abc9-331ed11601a5
25912394-202e-42a9-a3e8-07dc2d4e6178	4fd74631-e9f2-42fa-ae09-44a337c9a8b5
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	a9bcb7d0-dcc9-419a-87ef-cc4eda5a9ad5
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	84a27578-40ef-4009-929e-f28e91d6ea4d
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	b34c4ee3-f742-4148-b241-20afbfafd366
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	ff6bcf1c-ef41-4659-998c-2e2b3402fae8
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	b4a29f58-3ddd-4347-ad00-35300216bc02
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	3685157e-d79a-4182-a7f3-1bc8f697e3be
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	af6ca0a3-234f-4b88-b80e-2fbe407fbba2
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	edd0d474-6672-4986-a87c-8ae88262d48c
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	eb9c6ffa-1e9d-4b31-a595-99fc438c4c04
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	59ae75d2-4731-4966-9e99-10f5dc60c212
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	d86e272b-75b0-44d5-acf0-8e5e071a37ac
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	0da9a080-078c-4ea9-bc6b-53e9c8aeafc5
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	a594ffb6-4634-4d86-baf2-47f2251bf245
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	e0f26bd4-3db7-47dc-95df-000340c94c3d
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	39bc68cc-0ba1-4e2e-b538-c2dc2fcca0fc
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	f017c7a7-2c0e-4541-9001-e794833cab4e
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	6f7f78a2-072d-4c85-92e5-267c7b17b7a0
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	d2a1ef0c-8eab-4b4c-bb0e-678568945978
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	1a3d9860-a3bf-43df-908a-2a013cfbd166
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	de3a8a1d-2c6c-4c7b-b085-f0bcdfb18232
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	65a76cc7-9632-46d0-bcd7-856e7e2293bd
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	6ba46adb-998d-45cf-8fc3-edb9653f2926
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	686718d0-c777-499f-9f52-d3de5a8c68b5
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	f3b4c898-b72f-4f3d-a0d5-917624e0662b
6d65476b-9452-4438-8092-fcbf514081cd	3c28fec8-b9cc-422d-9a61-474ae27fdc0a
6d65476b-9452-4438-8092-fcbf514081cd	7f5ab4e9-9e83-46f0-8438-4fb00310ecb1
6d65476b-9452-4438-8092-fcbf514081cd	e0fb69a8-45cf-4208-8a85-1af0b9b2501f
6d65476b-9452-4438-8092-fcbf514081cd	0362abc5-699b-4f00-af11-4c5e816612cc
6d65476b-9452-4438-8092-fcbf514081cd	f5dc30a1-feee-4ef9-9d2b-e7e592f77f02
6d65476b-9452-4438-8092-fcbf514081cd	389e1539-5844-40ca-ac0a-e7fdebd7599a
6d65476b-9452-4438-8092-fcbf514081cd	a56fa914-6b71-45a5-892b-3b614e0f9cee
6d65476b-9452-4438-8092-fcbf514081cd	09c09359-dfbf-4a9b-81d6-74a5cd31063b
6d65476b-9452-4438-8092-fcbf514081cd	f170bd6e-3c0d-448d-8c73-54d047ec4502
6d65476b-9452-4438-8092-fcbf514081cd	2f9205fa-cf07-4629-97bb-11af6e6c60cc
6d65476b-9452-4438-8092-fcbf514081cd	2f180029-fa18-4027-9454-f21c6f106812
6d65476b-9452-4438-8092-fcbf514081cd	38b40a3f-41a1-46c9-9e73-d2090b9aa678
e9127edd-4638-4ce9-a929-b943a2d368fa	0226d601-7144-4612-bae0-0964c8b184bb
e9127edd-4638-4ce9-a929-b943a2d368fa	57067781-699b-4170-9ff3-f58a42e01dc9
e9127edd-4638-4ce9-a929-b943a2d368fa	57bcfdb1-c51b-48d3-92cc-74548c2898d7
e9127edd-4638-4ce9-a929-b943a2d368fa	43c5a138-965d-4ba3-ad55-ef9b34686a7c
e9127edd-4638-4ce9-a929-b943a2d368fa	bd8d1de8-f3a2-4510-aaaa-8b8b963bb131
e9127edd-4638-4ce9-a929-b943a2d368fa	bf00563f-42b9-4975-8239-dc0814dd1c59
e9127edd-4638-4ce9-a929-b943a2d368fa	ae64add2-013c-48af-be68-a098b4e78c1b
e9127edd-4638-4ce9-a929-b943a2d368fa	52c6ef44-b311-4c34-9a32-2eeb5910c8d7
e9127edd-4638-4ce9-a929-b943a2d368fa	6c6e3f0c-add6-4e53-8d37-71ff1b808587
e9127edd-4638-4ce9-a929-b943a2d368fa	c6f45ddf-9937-4456-9538-1a0cf350a73e
e9127edd-4638-4ce9-a929-b943a2d368fa	5e7a0d59-7c23-4f88-8a87-ef55fd88f6d5
e9127edd-4638-4ce9-a929-b943a2d368fa	78652953-ea64-41ed-aab4-75e077e0ed69
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	417b7a03-f52b-4ac4-8ff3-243d5055e29a
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	1a9a5726-bba2-443b-b01e-8fa60b1ebfc5
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	383dcecb-082a-431d-9559-0482e606e2b5
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	6ec404a3-a0e6-4d80-9251-e34a14dc1682
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	a4f8f353-02ea-4550-8684-1366e43814b2
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2e2d5ddf-1aff-453f-9df2-5a7e883c4b89
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	85534ed2-9f97-4f31-9d99-773fd8842e84
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	279d5ee9-603c-48a6-89d7-8d6f20a2bedd
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	a100515b-5dbe-4fc4-904b-ec12c5063c34
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	6843c331-11ec-4c1d-aaab-22689dbe8988
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	4d1ebac9-b327-40a0-8291-f7049d367769
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	3405562d-c417-40b8-b99d-4c2a4bdc063a
\.


--
-- Data for Name: area_npcs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area_npcs (area_id, npcs_id) FROM stdin;
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	79a2a848-5540-4af2-ad8c-ae362ad956b8
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	aa1239c3-12bb-4f12-9db0-3a1d711361df
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	ac9384bc-f7ab-4b7b-8eba-fabf3d237bcf
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	0eedc05c-8b53-49ba-9107-6de6c8d8a273
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	4f83114f-909b-49d3-9b35-5455a0c4d307
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	5cd60ca7-1ea7-45ad-99dc-f1656a3665ac
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	8f5551e3-d6f2-4b21-8d97-54ef0351b38d
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	6728e8ca-af7c-4e50-829c-e4c297a691b6
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	5228c86b-dad2-43ea-96ff-f726f4a301c0
2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	e8a08bfa-a6c6-46e9-9e43-2db974e7bc85
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	d18f0bc0-9650-40e8-80e7-0b0fe0630c30
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	798ac637-cca0-45fa-a24f-74a5d940c214
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	024ff217-e067-4616-a637-05da368082c5
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	bac7b420-f150-434a-ba12-0514324872b2
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	5f97ec40-5a76-4616-8f48-47bcbc5dad3c
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	03558060-87dc-4aec-90e8-0e20e9bc20ca
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	3adeefb7-0a64-49c5-a68d-a51ee5746451
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	09a89ad0-ae78-4a65-b968-77a2556494bb
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	7a8442d8-c98b-4f1b-94a7-907f8b14f93b
c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	db70f056-eda3-4917-8865-f5ba2ff0af3d
adcf84fc-5b67-4e7d-8dcf-dec636abab47	465c7c96-811b-4c5e-86c1-19ca0f26d077
adcf84fc-5b67-4e7d-8dcf-dec636abab47	53773563-c732-4462-9098-03880c5b76f7
adcf84fc-5b67-4e7d-8dcf-dec636abab47	702ed12b-235d-4e94-860e-aa08e4dbbb21
adcf84fc-5b67-4e7d-8dcf-dec636abab47	254dd08a-1ca1-4ed4-95f6-e954c686dcd6
adcf84fc-5b67-4e7d-8dcf-dec636abab47	4cfbbdaa-0af9-4a90-944a-01a6ce7a91d5
adcf84fc-5b67-4e7d-8dcf-dec636abab47	04e5dc1d-8237-4557-ac4a-f9d3ddd1ed6d
adcf84fc-5b67-4e7d-8dcf-dec636abab47	400a9590-c94f-4b8e-869a-00823266505a
adcf84fc-5b67-4e7d-8dcf-dec636abab47	d1ba22ad-cd97-47ca-b748-fde42165f0c2
adcf84fc-5b67-4e7d-8dcf-dec636abab47	40f728de-5d85-4d5e-bcbe-35a45d2b65fa
adcf84fc-5b67-4e7d-8dcf-dec636abab47	188c8a6c-ce71-4683-9308-6dae2788307d
ee0d859c-be18-4b8a-8e08-b417e79b786d	7698ece3-211a-4019-8c9e-92c7b21c5d7c
ee0d859c-be18-4b8a-8e08-b417e79b786d	2f09e935-3088-4498-95a9-041eaa6a2d2e
ee0d859c-be18-4b8a-8e08-b417e79b786d	221005ba-9b2f-4525-be65-f754859f619d
ee0d859c-be18-4b8a-8e08-b417e79b786d	43957133-fd92-41e3-a1a5-1e3f60ed7599
ee0d859c-be18-4b8a-8e08-b417e79b786d	e1e54f48-1bb5-4b76-bde0-af552180039e
ee0d859c-be18-4b8a-8e08-b417e79b786d	0b24710c-71fa-4b4f-889f-654497ce6b4c
ee0d859c-be18-4b8a-8e08-b417e79b786d	01b0505f-025e-4c9e-b076-098f4ba35e62
ee0d859c-be18-4b8a-8e08-b417e79b786d	9a27d8c1-c6a4-4b38-9e0d-5c5008164d82
ee0d859c-be18-4b8a-8e08-b417e79b786d	3c9d02bf-631f-4fd1-aec0-4591a6a092eb
ee0d859c-be18-4b8a-8e08-b417e79b786d	d309f5ee-c569-4fa8-a406-0a0ceee67f53
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	d41da348-98e5-49b3-b5ca-1b2a66f69a03
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	8ea037bc-7e38-4dc9-a44f-b9606cbe9146
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	84e46405-1db6-454f-b251-84450a1e0e2d
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	cf14c2bb-0bb1-4839-95e0-8378ca1c7124
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	c1eff64f-dc7d-4a00-af7d-72b15f4a5e1e
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	da9e3170-26df-4017-a4fd-c6fa3b31e17c
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	75e2fa59-e81f-4821-be33-80ee002087fd
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	3529a8eb-80a8-4e17-89c2-b5102f037771
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	ceb9f4a2-91fe-4a37-9367-10ae06b1e0c5
c2fd389c-07ea-4e89-ba9a-795602c0fbe7	7cd33d39-eb73-4b8b-bd42-e7c469a8e4e8
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	a936686c-07b7-46a6-91f4-1529eb10c8f7
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	14f295fc-bd2d-465f-a670-ffbb69cf1674
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	010f3678-bd4b-4c2f-8460-643768fddd38
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	95f7b227-5688-475e-93d6-a968a8a180ba
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	2d0a2e20-92a1-445c-bd49-b0d804cf888d
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	fd18fa1a-d2b2-4669-a48b-d543befba86b
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	2714c66b-4321-4d1a-8ea6-62dde422340d
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	97090c22-90e1-401c-a059-f3abb1e89a95
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	eba3135f-5683-42d9-97fb-03961a1e6649
b27f4217-616f-4a62-9ef4-8bc26cc6cd73	a70e95ca-6551-4c48-9166-9463f0f598dd
26be4da3-0c43-4aab-b783-856672e5427b	fddd373d-b199-4f79-84ca-da38490bdab4
26be4da3-0c43-4aab-b783-856672e5427b	e5c56261-a7f6-4fef-9176-ca4993ea1bbd
26be4da3-0c43-4aab-b783-856672e5427b	2e9306f1-807e-412a-8de7-c65f66b4a046
26be4da3-0c43-4aab-b783-856672e5427b	daebf807-1465-4b44-8acf-0cd2d618f963
26be4da3-0c43-4aab-b783-856672e5427b	e9ff9e0c-f110-4e53-ab40-4717edc8c7f0
26be4da3-0c43-4aab-b783-856672e5427b	6aa0cdfa-bb81-4e13-b200-345f83c5ce77
26be4da3-0c43-4aab-b783-856672e5427b	2ec9f4a5-3625-4d55-ba0f-d82ccba64997
26be4da3-0c43-4aab-b783-856672e5427b	767cd271-04fe-4cee-8019-e519a0750e31
26be4da3-0c43-4aab-b783-856672e5427b	0662bbe0-d1c3-4629-bba8-d302143706f8
26be4da3-0c43-4aab-b783-856672e5427b	5dae1e11-7f35-4d8e-b28f-bd64c26be41f
351488de-5c35-4445-89a6-0217da326e5c	112f5874-e806-4003-8b24-fd13fee14e9a
351488de-5c35-4445-89a6-0217da326e5c	946e30b4-8a38-4996-be69-a6f3b602fef4
351488de-5c35-4445-89a6-0217da326e5c	081d5884-ee4a-4c8e-b547-0ff7034cd8c8
351488de-5c35-4445-89a6-0217da326e5c	901a6bc1-8ef5-426f-87fa-04d9f4a1499c
351488de-5c35-4445-89a6-0217da326e5c	2bc28347-caee-442f-9674-bd462ed53e5b
351488de-5c35-4445-89a6-0217da326e5c	a680f92a-f40e-46b3-a2a1-66bb5ca5cf33
351488de-5c35-4445-89a6-0217da326e5c	6c4c0bee-deb4-4418-948a-48cabff340c2
351488de-5c35-4445-89a6-0217da326e5c	6089cf80-7a02-42d6-b2d2-ef2994c1f60a
351488de-5c35-4445-89a6-0217da326e5c	891ff251-a7a2-42bb-a725-9e40c3bcddf6
351488de-5c35-4445-89a6-0217da326e5c	3dbd4e97-5d66-4cb2-94a2-c5f068dd3443
e4b4fc3a-39a3-497b-8665-c474a21231d1	e5916d7b-9dfb-4900-83d8-c704f310a50e
e4b4fc3a-39a3-497b-8665-c474a21231d1	c0b17e1a-d014-46ce-8269-bb4049b5d742
e4b4fc3a-39a3-497b-8665-c474a21231d1	9a29a29f-2ef6-4902-a285-7e85b2dba8f7
e4b4fc3a-39a3-497b-8665-c474a21231d1	6098c6dd-2485-4195-b9ed-6f3c0f41413e
e4b4fc3a-39a3-497b-8665-c474a21231d1	e382654d-1c79-4a4d-a755-674757486571
e4b4fc3a-39a3-497b-8665-c474a21231d1	5f13fa6d-545f-4f4e-93e5-552edaffd83f
e4b4fc3a-39a3-497b-8665-c474a21231d1	5f3ff3b7-d672-467c-abf4-f38f7e5f6ec4
e4b4fc3a-39a3-497b-8665-c474a21231d1	3f49d9a1-2f7a-4e8e-ad3d-085bf8fddee2
e4b4fc3a-39a3-497b-8665-c474a21231d1	02cbde76-9e7d-44a3-a594-58759aebf972
e4b4fc3a-39a3-497b-8665-c474a21231d1	daa95815-0c86-415a-89f1-2d77c7eefd5b
e6104412-e53d-4dde-8667-94d7a0c8ec1f	920e77c2-2530-48fd-a5c9-97a9e36c4ba0
e6104412-e53d-4dde-8667-94d7a0c8ec1f	cdb7a229-9e4b-4b03-a58f-7cd68fa0406d
e6104412-e53d-4dde-8667-94d7a0c8ec1f	ef06dc2f-2001-49c1-b680-19c234ec0f59
e6104412-e53d-4dde-8667-94d7a0c8ec1f	6290b887-91d1-4908-abb6-bc580902f2bc
e6104412-e53d-4dde-8667-94d7a0c8ec1f	56b4e2d3-c3b8-4f9d-b559-faf230298e4d
e6104412-e53d-4dde-8667-94d7a0c8ec1f	5b44c92e-3aed-4aac-b7f3-95223bbcbb86
e6104412-e53d-4dde-8667-94d7a0c8ec1f	79333bdc-7585-4cf5-8d50-cc3986b00462
e6104412-e53d-4dde-8667-94d7a0c8ec1f	42fe66ae-1311-4b98-b2e6-16ddd22d6e28
e6104412-e53d-4dde-8667-94d7a0c8ec1f	f1c62f63-638e-4a8b-8e30-4b4edaa7b62e
e6104412-e53d-4dde-8667-94d7a0c8ec1f	36e4e0f0-0946-4ec8-ad39-1754c80dc02c
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	79105085-f156-4a7a-abd4-434ca1f960aa
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	dabbaf56-33c8-4cf6-8668-da8dd914e84d
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	3d1f52d4-ff38-4bf5-8af5-07c498fa49bd
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	9bba0c5d-6ac7-44c0-88be-7d17f2b4d614
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	acb73b87-9b1e-48d6-b326-ac2a0f8e8c40
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	7d4c5a1d-d134-479f-9711-e9f0ca738a05
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	969d2fa1-162d-45d7-b216-bf093d807c67
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	b81c1c55-00bb-4f92-a895-cb918bf64809
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	f407ff5c-6e38-4fe1-bce1-3a2248414fca
8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	918c2b33-161a-4290-bfc8-d8eacd0d25f4
ea1e8d2c-0555-4054-817f-f63edfbdb650	677e26d2-4491-498e-a171-0bd02177d9c8
ea1e8d2c-0555-4054-817f-f63edfbdb650	0fecc54a-223c-4c6d-94c9-1a361b114bef
ea1e8d2c-0555-4054-817f-f63edfbdb650	e9039b4d-78c4-4e48-9dc9-71af55d4ef79
ea1e8d2c-0555-4054-817f-f63edfbdb650	cfd597f2-7869-4344-884a-b7d0f48bf598
ea1e8d2c-0555-4054-817f-f63edfbdb650	2c3d210b-aa67-4d51-8674-6d532e6ff49d
ea1e8d2c-0555-4054-817f-f63edfbdb650	1ca77586-a4e6-428a-8b88-99dd36920794
ea1e8d2c-0555-4054-817f-f63edfbdb650	8558c27d-9df1-48c4-af55-aeb36e113a3b
ea1e8d2c-0555-4054-817f-f63edfbdb650	6335d4e2-3e70-4dd7-b2cd-8735e0918aa0
ea1e8d2c-0555-4054-817f-f63edfbdb650	fb2c891a-4cc3-46b1-b24a-e2c96c21340a
ea1e8d2c-0555-4054-817f-f63edfbdb650	1595b759-0ee7-426e-9071-14f4da40bdbf
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	5ac01eab-ede3-4a2c-91f6-d3563a53d91b
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	6d2cb6cd-484e-4449-87cf-9b2a430d3480
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	684db820-0f64-4267-a5f6-3e8bc6ca4645
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	aac2e102-9f32-493d-ba99-3bb1fea4f278
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	fbc8d70b-321a-46c5-b632-e8be11c39813
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	5bb8500c-ac5f-4e2a-9dee-daa46e64e6ff
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	621c5623-fa91-48a5-a1aa-964589c7debc
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1585a88d-e5e7-4b83-b19e-9fbdfba94c0e
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	8e314b83-b5e9-404d-b8bb-720d0c9e38d8
02e6ac42-f0de-40f3-8902-db0ba9aa9a56	56783ac8-b9f0-4672-901b-be55db1f8498
59616e13-3367-4ce1-bcae-3ba14a12d965	13adea08-9f40-455f-ba70-101cad4f1d26
59616e13-3367-4ce1-bcae-3ba14a12d965	6d0271a0-a4f2-43b6-85fd-52157838d2ac
59616e13-3367-4ce1-bcae-3ba14a12d965	b3a901cd-4af7-451a-8d8f-730bb8996ff7
59616e13-3367-4ce1-bcae-3ba14a12d965	791ceab7-d2f1-460c-b0de-f698687a5404
59616e13-3367-4ce1-bcae-3ba14a12d965	b7ebab6c-5d65-4b7e-8441-19a717e9228d
59616e13-3367-4ce1-bcae-3ba14a12d965	781de11a-b87c-4dd8-b24c-6d1b5fb187c4
59616e13-3367-4ce1-bcae-3ba14a12d965	08a40ab1-c13b-46d4-b4fe-3a446bf73f09
59616e13-3367-4ce1-bcae-3ba14a12d965	078a127e-41e0-459b-b5a7-365b4f44d0af
59616e13-3367-4ce1-bcae-3ba14a12d965	4d8387bd-d2c8-4512-907c-c8bac2dd5a16
59616e13-3367-4ce1-bcae-3ba14a12d965	53e884cf-9328-492c-a64e-e05dc4fb7534
b46d78f2-fce9-477e-af13-11f4903ee0b0	8256453f-ddfa-4711-9385-552e53b8b254
b46d78f2-fce9-477e-af13-11f4903ee0b0	7ef634c5-04fe-47a0-8b66-feac965d0358
b46d78f2-fce9-477e-af13-11f4903ee0b0	ef36b0d8-94e7-440d-ac22-4a852beea2bf
b46d78f2-fce9-477e-af13-11f4903ee0b0	4937cc8a-be5f-4910-8fef-77f102ab76ed
b46d78f2-fce9-477e-af13-11f4903ee0b0	870785b3-611f-4ade-aef0-893d8bf67cae
b46d78f2-fce9-477e-af13-11f4903ee0b0	3b0d9acc-a15b-4e51-b4e7-492c7237b7bd
b46d78f2-fce9-477e-af13-11f4903ee0b0	d190a186-b5d7-4af9-8306-342ae535c710
b46d78f2-fce9-477e-af13-11f4903ee0b0	35b4c363-0c29-4b8a-ae91-542a58eef089
b46d78f2-fce9-477e-af13-11f4903ee0b0	db237b40-07b0-4097-8dd6-d1691e4a4f24
b46d78f2-fce9-477e-af13-11f4903ee0b0	2ffdcb07-e9fc-4b2d-a63b-15ae5f2890b1
8ce6bee0-0202-42a1-a944-438dd77309cb	9d45f816-a343-4af0-a7dc-00e954aed649
8ce6bee0-0202-42a1-a944-438dd77309cb	9b91dd44-8dda-4c94-92b8-e3ac523a6ba4
8ce6bee0-0202-42a1-a944-438dd77309cb	752ab7b4-c25e-494d-bb14-103eae207a58
8ce6bee0-0202-42a1-a944-438dd77309cb	b25b5675-2aa4-4e53-885b-c3b5003b28df
8ce6bee0-0202-42a1-a944-438dd77309cb	4a7b9e27-4fe2-4e40-8390-a3770355eb6e
8ce6bee0-0202-42a1-a944-438dd77309cb	30a2d510-7f4e-47f4-b3bd-32d7aacc9175
8ce6bee0-0202-42a1-a944-438dd77309cb	39817a2d-f647-4195-8884-8e3fe623f848
8ce6bee0-0202-42a1-a944-438dd77309cb	e0f5c24a-3da6-43da-a3c0-ab704951260c
8ce6bee0-0202-42a1-a944-438dd77309cb	4e9bd07f-e789-4ac6-a2dc-d126f137b64b
8ce6bee0-0202-42a1-a944-438dd77309cb	e898aaf2-6443-4031-81e6-3eeb165cd678
277facf5-f177-43e8-886e-e9520f8a1e58	f0cc147e-2c45-4cc8-ab1e-cabd82fabf8a
277facf5-f177-43e8-886e-e9520f8a1e58	45b01ab4-c630-4cba-af7c-5a5fb1d2cb4a
277facf5-f177-43e8-886e-e9520f8a1e58	e9c731dc-94d9-4710-97a1-41de748446ee
277facf5-f177-43e8-886e-e9520f8a1e58	1ce06cec-2a5c-4119-a5b7-9f6e97fcbd25
277facf5-f177-43e8-886e-e9520f8a1e58	b80d30e1-7c8b-48bd-8756-781b4d062f71
277facf5-f177-43e8-886e-e9520f8a1e58	0add3483-461a-41ae-9aa7-fde2bb05f88d
277facf5-f177-43e8-886e-e9520f8a1e58	7108d325-75c5-4099-87e2-7d459452167a
277facf5-f177-43e8-886e-e9520f8a1e58	dc9430a1-0101-4c70-a78c-fb51934012fc
277facf5-f177-43e8-886e-e9520f8a1e58	2f68b2c1-1d4b-4e3b-8955-6326570eba60
277facf5-f177-43e8-886e-e9520f8a1e58	2f0cbd05-9a80-44d8-8327-a5eb55abbdd1
081031cf-ce5a-4c4e-ad28-1556ac125cfe	848248d1-f62d-4845-9a37-0f6c2696a5a5
081031cf-ce5a-4c4e-ad28-1556ac125cfe	041b6bb8-d28b-41b3-a64b-a284416c3949
081031cf-ce5a-4c4e-ad28-1556ac125cfe	073c709f-08a8-4262-8a8f-1269a37239a0
081031cf-ce5a-4c4e-ad28-1556ac125cfe	72f0744f-ba3b-4ee7-bd4a-861946207de0
081031cf-ce5a-4c4e-ad28-1556ac125cfe	8eb68e7b-6adf-40ac-a5b5-b4cc3f9deb41
081031cf-ce5a-4c4e-ad28-1556ac125cfe	64740fdf-fd58-4f8e-bb8f-72fecc60b2f4
081031cf-ce5a-4c4e-ad28-1556ac125cfe	0c6f51c9-7bcc-4d4d-bbf8-2b420851b8ff
081031cf-ce5a-4c4e-ad28-1556ac125cfe	881ff827-9985-4d28-b1a8-648469f1828f
081031cf-ce5a-4c4e-ad28-1556ac125cfe	c06a260e-1073-48c1-b413-76939bbfcc9e
081031cf-ce5a-4c4e-ad28-1556ac125cfe	720a3ea4-76cc-4719-92c9-fe1fbbb84475
86f950f5-482f-4385-a2ce-052586067f5a	8b5fc1b9-1a18-40b6-8168-96e4475d8f50
86f950f5-482f-4385-a2ce-052586067f5a	a1b6b2de-e58a-4caa-8833-ee71c3a7bb3d
86f950f5-482f-4385-a2ce-052586067f5a	c9f5d1c7-1692-453e-8ad0-5daddb072631
86f950f5-482f-4385-a2ce-052586067f5a	153f13f5-387d-45b3-9626-98ac74f6b5e9
86f950f5-482f-4385-a2ce-052586067f5a	5655db35-4b77-4c7e-b849-019cedd07835
86f950f5-482f-4385-a2ce-052586067f5a	311c241e-befe-4c92-b303-e550ffbc2a1c
86f950f5-482f-4385-a2ce-052586067f5a	0fcdb71e-b9fe-4145-afd7-9aead0679e8a
86f950f5-482f-4385-a2ce-052586067f5a	02aa00dd-417d-48f1-bd4e-bd22b4d9eda6
86f950f5-482f-4385-a2ce-052586067f5a	065b143d-3ff2-420a-b5f8-bdb93fbe9890
86f950f5-482f-4385-a2ce-052586067f5a	3c216dc7-ea99-485a-b954-0dca05630939
9249d60d-7c1a-420b-bdf7-a346f2023ac1	4306ce5e-afdc-46a5-91c5-5a03ce2fb439
9249d60d-7c1a-420b-bdf7-a346f2023ac1	5dd4e823-693f-4a55-bda6-c1d630a0f512
9249d60d-7c1a-420b-bdf7-a346f2023ac1	f3344dc6-bfac-45d5-ae7f-df9eeb5c8128
9249d60d-7c1a-420b-bdf7-a346f2023ac1	31bd6e80-e636-437d-8628-804bb253deca
9249d60d-7c1a-420b-bdf7-a346f2023ac1	badbdb7d-2d42-45ee-a9ce-66d9351f9c2f
9249d60d-7c1a-420b-bdf7-a346f2023ac1	47663ebf-251a-4400-ac4e-2964d1e4754f
9249d60d-7c1a-420b-bdf7-a346f2023ac1	f0ae3f97-e1b0-4fa3-8eba-bd7b3b324370
9249d60d-7c1a-420b-bdf7-a346f2023ac1	a812defb-cd10-404e-a775-c2deb697ce9c
9249d60d-7c1a-420b-bdf7-a346f2023ac1	023c0256-2b82-409e-bea0-ee6505df7b6e
9249d60d-7c1a-420b-bdf7-a346f2023ac1	24480c33-8dd7-47d2-bfd3-ad31bc9bcd0a
ac193cda-be9f-423c-9c24-9ab7bbc807f4	3cf1abf9-7427-45fb-857e-cd2e626347cf
ac193cda-be9f-423c-9c24-9ab7bbc807f4	540fab18-0aa8-41ef-b884-1729b6648613
ac193cda-be9f-423c-9c24-9ab7bbc807f4	0aeec3a2-abf5-454e-a36c-8557a29b8662
ac193cda-be9f-423c-9c24-9ab7bbc807f4	1ba8dfdf-f582-445f-bb0b-300ae08db593
ac193cda-be9f-423c-9c24-9ab7bbc807f4	3a7fbc92-5f1c-4409-b006-b540acab12c6
ac193cda-be9f-423c-9c24-9ab7bbc807f4	6fd2f958-8d83-401a-9bd6-9cbff0f8e505
ac193cda-be9f-423c-9c24-9ab7bbc807f4	fced1bba-93ac-4fb2-bbd8-b81bbbf5996b
ac193cda-be9f-423c-9c24-9ab7bbc807f4	75a4f331-df9d-4945-bbd9-e4763583b1e6
ac193cda-be9f-423c-9c24-9ab7bbc807f4	1494eb82-a869-413f-bca6-8b2dbe54c527
ac193cda-be9f-423c-9c24-9ab7bbc807f4	3f66b9e6-4ab9-41d0-a5d5-01056ebeaca4
8f783c88-580d-45bc-8d4f-6d84aa806a81	ba04c802-395b-4f8a-a9e6-0518797c954e
8f783c88-580d-45bc-8d4f-6d84aa806a81	62719e49-abd5-481a-ae26-d9008dcafa43
8f783c88-580d-45bc-8d4f-6d84aa806a81	9a576a23-7e59-4ac6-a533-0e3f46854386
8f783c88-580d-45bc-8d4f-6d84aa806a81	358fdb8c-0c5f-4762-91c3-9648b8d83f1b
8f783c88-580d-45bc-8d4f-6d84aa806a81	ac9201a0-b908-4661-9ab0-5a18350053f7
8f783c88-580d-45bc-8d4f-6d84aa806a81	163c0f2c-32b8-42e6-810c-2300ae3dc7b3
8f783c88-580d-45bc-8d4f-6d84aa806a81	0494ba30-99b1-4330-99d7-f000fb9f1800
8f783c88-580d-45bc-8d4f-6d84aa806a81	d9010747-0070-4760-97ac-7c4a409277bb
8f783c88-580d-45bc-8d4f-6d84aa806a81	58d797a3-8041-41e9-937c-1b2939ebad7b
8f783c88-580d-45bc-8d4f-6d84aa806a81	7e6cb4ff-f125-4715-bd0e-5ef1f1ac5f0f
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	84e5c325-5ec1-463c-9b6c-f32a3975c437
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	a8cfc84a-03c8-41e4-aaf4-a65980c4f7d0
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	bd09b687-7eec-444a-bca0-bbb22a5f942e
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	a08f1f4b-c3a2-4f2d-992e-00cd140e2a4e
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	0668f1ad-535e-46b5-bec7-6bdd31b3f9ec
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	087c60fc-791f-45f4-9b32-1ecec2db14f3
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	64e355b0-535e-4c03-9d4b-d314ac63df44
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	6926ad8d-b7e0-45a8-a9ec-c21d8accf161
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	f02fcac9-7439-48d9-a741-4a4a048c6419
3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	d0f95b5d-e3e3-415f-8dad-68f3d0b79492
60f725e0-3b9a-4199-86ca-fc70c2692b0d	700b7da8-df2c-42fa-9160-d86acca082bb
60f725e0-3b9a-4199-86ca-fc70c2692b0d	77b7da24-eafe-4a82-b693-2548776f2119
60f725e0-3b9a-4199-86ca-fc70c2692b0d	ecfb8e81-05af-41fd-9814-3ed295cfb6d7
60f725e0-3b9a-4199-86ca-fc70c2692b0d	4857d418-ee1d-43a5-94ee-b6e5b076b5d8
60f725e0-3b9a-4199-86ca-fc70c2692b0d	6ab17af7-d165-400f-9cc3-1582ef29812c
60f725e0-3b9a-4199-86ca-fc70c2692b0d	92360e25-23c7-46cd-8ae1-4a6db4aca736
60f725e0-3b9a-4199-86ca-fc70c2692b0d	ffd8833f-b6a9-42ff-b12e-3df14dd906e8
60f725e0-3b9a-4199-86ca-fc70c2692b0d	ab307c9b-f893-4c76-9088-bf30ea7978ba
60f725e0-3b9a-4199-86ca-fc70c2692b0d	d1dcea36-84ca-48a3-8c24-cdd40a511a62
60f725e0-3b9a-4199-86ca-fc70c2692b0d	780aea2e-aaad-49bd-b4e8-c07780c4335e
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	06e26c34-277e-40de-a20f-9324791e0f1d
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	cb73dfab-1335-42ae-b12f-13446dfd0d14
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	8da75bcd-81fc-487e-8bd7-1fdcdbcd2583
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	46b48537-b27d-4580-b87d-a26de3a4cd7c
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	4f84f367-dd6e-4d40-b69f-3298d513cd43
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	40827207-0a46-4d5c-be62-7237bb5dce55
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	e306fcfa-2e94-4a89-a56e-7c1abe13e35b
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	a7986fc9-ce62-4648-828c-07e636114b86
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	02eb7871-2025-432f-86f5-ebb19f3da12f
df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	c20c4475-e65e-4d16-a8cc-8df2e5120aa9
c250ac28-5424-44d2-ae5b-6c04dae71a0e	87df3436-07e0-4946-bd66-c2e979a068fe
c250ac28-5424-44d2-ae5b-6c04dae71a0e	b128dfc2-c63c-4ed0-a09b-ae919b46ab84
c250ac28-5424-44d2-ae5b-6c04dae71a0e	dd393d58-8956-499e-aa04-9c30ca190697
c250ac28-5424-44d2-ae5b-6c04dae71a0e	e350536a-0458-4866-8ad7-3c60b88239e2
c250ac28-5424-44d2-ae5b-6c04dae71a0e	ed6d157f-ba96-4674-b5a8-0ae5eca2ea7f
c250ac28-5424-44d2-ae5b-6c04dae71a0e	b33524b4-966a-45c1-a85a-40fa8b5669bd
c250ac28-5424-44d2-ae5b-6c04dae71a0e	f9f27a18-6dfd-45fb-aa20-0fc3a478be1d
c250ac28-5424-44d2-ae5b-6c04dae71a0e	930e60bd-1244-4823-a757-f406d1c7c442
c250ac28-5424-44d2-ae5b-6c04dae71a0e	2ad6579e-d09e-4560-9034-319be61a6da2
c250ac28-5424-44d2-ae5b-6c04dae71a0e	93f935c0-a773-46b5-842c-0eae70a006ec
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	923d023b-9e95-43a8-8b7d-9e447de16a73
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	1e170eac-b6b1-4c41-bc84-06a9ee74ae4a
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	3fdfb331-54ec-48ff-b44f-b1f700e5ffb0
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	fb3b3806-e57b-4788-aa9f-742d819acac5
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	13c8e637-781d-4a04-94fe-ad9892c1b17f
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	9530a61e-7a36-4a2e-8826-5b48e4d95c54
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	f8ab64c4-d0bb-4114-ace0-038612c31372
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	01aebc73-cad0-460d-8e2d-7694f1e3e406
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	b34f4cae-9e4f-4895-8c80-8574d7526b92
5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	4712cf8d-6e43-4978-aafa-133d8ee1ac08
9be265af-972e-4a05-a5b3-8c916d0ba306	b32d9156-c401-4732-bf2d-2583853ca403
9be265af-972e-4a05-a5b3-8c916d0ba306	8fcea843-aaee-4f7e-ae6a-fc68b92501c2
9be265af-972e-4a05-a5b3-8c916d0ba306	82f643bb-d411-4346-9cd8-380faf06f46e
9be265af-972e-4a05-a5b3-8c916d0ba306	06e3c53d-81a3-4566-b3f1-783fe6881ed5
9be265af-972e-4a05-a5b3-8c916d0ba306	1f53d6ff-2c31-4617-8d20-ab4fe5a8fac4
9be265af-972e-4a05-a5b3-8c916d0ba306	0de3d93a-50a1-4be2-820f-0031f4c25456
9be265af-972e-4a05-a5b3-8c916d0ba306	859dc8bd-9f55-45cc-9329-38227f4f03ed
9be265af-972e-4a05-a5b3-8c916d0ba306	bf4fd03d-ff14-4c37-a4b0-e4ce33123d6e
9be265af-972e-4a05-a5b3-8c916d0ba306	cd19c9a3-467d-4ee0-95f6-dfbfa5b30ade
9be265af-972e-4a05-a5b3-8c916d0ba306	a445084f-24da-46ca-9542-b47ddfe030fa
425c7d41-de8a-4b74-a2d1-657e70eeb87f	76d0080c-aa47-4644-843b-f70272bb4db6
425c7d41-de8a-4b74-a2d1-657e70eeb87f	540c6dbc-c48a-446e-bf21-af5e17a767ae
425c7d41-de8a-4b74-a2d1-657e70eeb87f	72abb4d2-3bbc-4b2a-b847-1cca327bca17
425c7d41-de8a-4b74-a2d1-657e70eeb87f	95af1aae-2c59-4840-b7aa-d1ca6d128e23
425c7d41-de8a-4b74-a2d1-657e70eeb87f	ff4ab8ea-3a5b-4d8f-8cee-c44aceb1306a
425c7d41-de8a-4b74-a2d1-657e70eeb87f	072badff-739f-4f52-b02e-96697a4663e1
425c7d41-de8a-4b74-a2d1-657e70eeb87f	02d99760-8969-42d9-bc5c-db6470c01fd3
425c7d41-de8a-4b74-a2d1-657e70eeb87f	6d892f8b-ec94-4c35-b11c-811d5ddb7bf3
425c7d41-de8a-4b74-a2d1-657e70eeb87f	2b603051-e55e-4484-8586-76160e8b7ce2
425c7d41-de8a-4b74-a2d1-657e70eeb87f	c06a7b4e-9376-4888-8504-172af52554b6
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	bf16f4e8-3e1a-42fa-9df7-0e4fe6f29278
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	23338a85-834a-409c-bb5d-bceedcc6c8a0
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	df6a1992-e68e-458b-8451-dfbaf3c22577
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	7a019012-c165-4ab3-9be2-899696aec948
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	14355a83-1d37-445c-aaa7-779765ac788c
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2aad9d65-7ab3-43b9-b634-8ec2938dea67
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	ea9dce18-2f10-4c29-bd17-78c51a8fbd43
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	28b368bc-2d02-44e5-980d-b0349ce08a6b
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	dbfd3291-ea21-45c3-a298-3b1cfeb8d71d
3f7e9308-eabd-4f9a-8cc7-d43c3d848958	53ab0a14-47a9-4fef-a3d9-11299f7f368a
a25b42bc-0576-4936-be2f-4eb8136417ce	9a88091d-41f7-4592-b4b3-c38bad74a822
a25b42bc-0576-4936-be2f-4eb8136417ce	072a21b5-c64b-4a3d-93c0-b417ba194cba
a25b42bc-0576-4936-be2f-4eb8136417ce	6e4d3ff0-6d16-48b9-9256-600f1c959e55
a25b42bc-0576-4936-be2f-4eb8136417ce	34bdfb85-7c63-4021-89e8-5004b0f6a8b6
a25b42bc-0576-4936-be2f-4eb8136417ce	52ae4f00-bb0b-4aa7-b531-7869c256cb84
a25b42bc-0576-4936-be2f-4eb8136417ce	35af151a-c56f-42ae-aab1-9df96d182d94
a25b42bc-0576-4936-be2f-4eb8136417ce	4c3c57db-048e-426c-aeca-c00dbadb6f53
a25b42bc-0576-4936-be2f-4eb8136417ce	7a6bff89-674f-4f01-ac09-35a28b4011ca
a25b42bc-0576-4936-be2f-4eb8136417ce	714ee1b5-871a-4c4a-9b93-ad2b60a1f9d0
a25b42bc-0576-4936-be2f-4eb8136417ce	bb6f01d9-a345-441d-b6fd-21cc6ca4907e
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	b0e772f5-e777-4c3d-86e7-b3eb35cf4a3d
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	e4137996-b278-425e-813b-56135d934d1a
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	9a9da23a-aa92-4c5c-b8a6-11ea33e8b602
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	b0248141-264c-4506-bfa8-20a6abfdd8ed
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	5c7e014a-1488-4a33-9b43-c8607e9aadbc
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	a3876541-2d6b-4d67-aaa8-4e64fbd43566
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	b562773a-e7df-4564-ab5c-d1984bc10157
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	11cc8c44-178c-4122-83a2-fa6ae6721d78
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	7c215f4c-9980-4c10-b61a-45a100e66133
fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	d18fbef6-c870-40c5-bd88-41ebb4b744f5
faef09e7-1275-4854-88d3-a50aa90e0a47	40306bff-bf0c-4049-af45-c134abfdd1c1
faef09e7-1275-4854-88d3-a50aa90e0a47	d15dc68d-e3a6-4462-9de3-4618f18d60d7
faef09e7-1275-4854-88d3-a50aa90e0a47	311696dc-bd56-4e74-835a-2d366cc4b2ac
faef09e7-1275-4854-88d3-a50aa90e0a47	fa8be374-23a3-4038-aec7-f0fdcedd4a2c
faef09e7-1275-4854-88d3-a50aa90e0a47	a95d0935-05b0-4981-a139-f3d10d587c61
faef09e7-1275-4854-88d3-a50aa90e0a47	d3ca2d81-cf9e-4f57-a2f8-70887d763c4a
faef09e7-1275-4854-88d3-a50aa90e0a47	6edf1650-49fb-4ac5-9db7-e92d5026885a
faef09e7-1275-4854-88d3-a50aa90e0a47	ee0744c3-31ad-4a89-a7bb-276baf069767
faef09e7-1275-4854-88d3-a50aa90e0a47	fdd82ae0-f1ee-4c49-8ec9-0d6ca7724a15
faef09e7-1275-4854-88d3-a50aa90e0a47	1b007797-4d7c-449e-8ea1-fbf6075f5ee8
f0004dea-f619-4f42-a87a-bda3a9129aeb	5b332240-991f-4a9d-ad4c-b5881ff1477b
f0004dea-f619-4f42-a87a-bda3a9129aeb	53c567fe-5efe-423c-917d-2a928f8ee580
f0004dea-f619-4f42-a87a-bda3a9129aeb	51afd5d5-f518-4e0f-bed6-41eacb3c1962
f0004dea-f619-4f42-a87a-bda3a9129aeb	ab7b8a13-384c-48b2-9438-b63c5a1ec70b
f0004dea-f619-4f42-a87a-bda3a9129aeb	fdb2464c-1238-4e16-9f43-9641949f259c
f0004dea-f619-4f42-a87a-bda3a9129aeb	78859b7c-2371-43bc-b506-09811bf4aa7a
f0004dea-f619-4f42-a87a-bda3a9129aeb	7158d76b-5482-421b-8315-c4b34d92d9ac
f0004dea-f619-4f42-a87a-bda3a9129aeb	feb462f0-17fe-4247-8624-8456941b4f6c
f0004dea-f619-4f42-a87a-bda3a9129aeb	2a9a6d07-b176-4457-b246-af984432589b
f0004dea-f619-4f42-a87a-bda3a9129aeb	7a7d07e1-f9dc-49ee-b6f6-1753f06531ec
25912394-202e-42a9-a3e8-07dc2d4e6178	a9f56fd8-2b78-4281-8005-ba4746b5a750
25912394-202e-42a9-a3e8-07dc2d4e6178	5527e50c-34f3-45cc-a7b8-7556a6fb8a9a
25912394-202e-42a9-a3e8-07dc2d4e6178	2d148952-a3af-4cef-b492-05c0764071f4
25912394-202e-42a9-a3e8-07dc2d4e6178	3b99ecf6-3479-43ca-8ad3-8c28e260ce99
25912394-202e-42a9-a3e8-07dc2d4e6178	da262f22-6aaf-4288-87af-91d7fe526105
25912394-202e-42a9-a3e8-07dc2d4e6178	ddabc3da-fe81-4cfc-8a23-e4b02b16bbc2
25912394-202e-42a9-a3e8-07dc2d4e6178	73046252-cb5d-48e5-965a-3983fb4f0594
25912394-202e-42a9-a3e8-07dc2d4e6178	1ab7e955-45d1-47a5-a4c6-65c4de5e97cf
25912394-202e-42a9-a3e8-07dc2d4e6178	31d67a6c-08cc-4bce-b9ea-f2a973f3207e
25912394-202e-42a9-a3e8-07dc2d4e6178	2850c5e9-0ea5-47eb-be83-05b04f354df0
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	35678ccf-dedd-43f1-8bce-f8290df66b81
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	0bce5328-94c1-421e-b3b1-ef7fd2c9a07f
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	10bc17f9-0ca6-4201-8c81-b2e35bdb0263
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	bc8ba7cc-ef66-46e5-b4e6-cfe461fc88b1
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	1c2d8339-7d7b-4090-8bfa-6c76cda491e3
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	199aafdb-634a-4d4f-bbe4-5a67d13dc3b4
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	47a7897e-8e4d-4c6c-879c-92e4673b5c54
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	04c8018e-f9b0-4a58-bdd3-0e0630bba9b2
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	ed343d88-5e70-41ec-8bba-2650a40148fe
1e92dcd9-2dc4-4fec-a953-e23b27b35e17	781083d4-ae7a-474e-92c4-4bfdb35da837
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	3596e64b-0de1-4371-b0b4-560239200156
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	fc176824-5495-484a-8dee-3466a5f3671c
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	c70b74aa-e116-4589-aa09-2000bbe71483
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	145603f7-514c-4d59-a05c-fb675b05c8bc
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	90913069-3045-4a6f-84ea-fe6f15e6ba41
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	bce7a838-4f01-4540-910c-cd771d899ead
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	c79a992d-30b7-4ddc-9638-302adb59f35a
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	fcc0add6-ec92-47c1-9274-b3ae08b5189c
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	dcfb7b0c-3d91-4143-b71a-45863f9fde3a
bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	40cfa488-c441-4540-b489-8e467e0efdcb
6d65476b-9452-4438-8092-fcbf514081cd	8b32fb1e-03ce-42eb-957a-2910ed57d998
6d65476b-9452-4438-8092-fcbf514081cd	d7566972-49dc-4e3a-8708-fa9e7eb83175
6d65476b-9452-4438-8092-fcbf514081cd	f43e22b2-5697-420f-bc59-ac4bcdd7b3d0
6d65476b-9452-4438-8092-fcbf514081cd	a9109e11-d937-4c4d-aca7-ae4cb3070207
6d65476b-9452-4438-8092-fcbf514081cd	eed83fee-8528-4a24-a855-b86b3bfcf562
6d65476b-9452-4438-8092-fcbf514081cd	30ead4c8-37b5-4d73-8606-22f427aefa50
6d65476b-9452-4438-8092-fcbf514081cd	a41f605c-3bd7-416f-acd3-5972c08d90f7
6d65476b-9452-4438-8092-fcbf514081cd	f07d87db-38c9-48f3-91f2-f18f4d2b0c88
6d65476b-9452-4438-8092-fcbf514081cd	f4c7a59b-2e65-42c0-9f0a-74629b9c8bfa
6d65476b-9452-4438-8092-fcbf514081cd	1931dcd6-dc4b-4eb9-b12b-443df19848e7
e9127edd-4638-4ce9-a929-b943a2d368fa	a31b9743-fa1d-4698-96fd-40c47692f28d
e9127edd-4638-4ce9-a929-b943a2d368fa	32bf7301-0414-4c90-a7a8-66913baf9220
e9127edd-4638-4ce9-a929-b943a2d368fa	403347d7-b9be-4c97-ac36-7efbefe0f8e0
e9127edd-4638-4ce9-a929-b943a2d368fa	13b9023c-632a-44b4-89cf-cc9e07657088
e9127edd-4638-4ce9-a929-b943a2d368fa	16b01c87-cc90-408e-b0f8-f66491c8eefe
e9127edd-4638-4ce9-a929-b943a2d368fa	8cb3694e-0cb8-43d3-b86f-6014e20d5fd3
e9127edd-4638-4ce9-a929-b943a2d368fa	355597d3-686a-4f84-a0b7-24475f51c929
e9127edd-4638-4ce9-a929-b943a2d368fa	fb48b9d5-848d-4686-ac47-aa8a55e84a84
e9127edd-4638-4ce9-a929-b943a2d368fa	777553fa-151a-4c09-83a4-3670fae23113
e9127edd-4638-4ce9-a929-b943a2d368fa	bd28d261-7cc3-423d-8c37-c220907a1249
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	74daf3ff-16d2-4152-bc5f-cfd6d4531f9b
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	70b1b965-e5cd-498d-bbd8-09d892b26d13
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	7601b61d-2add-4a29-b11f-2a3c33cdfc56
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	8d396f86-ea20-425e-bc85-3a459c2136bd
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	b8ddb57c-8493-4c15-901d-cbc2c2d89f7f
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	9015f7db-4fe9-444e-9915-e7799eb55cbc
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	fab6d7fa-2bf0-42dc-89d5-d4480ecb935c
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	8fd4e7ad-75e9-4001-ac6a-c8ccd55210fb
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	afc7d6be-6b5b-42d3-ba12-da9e21cecd1a
58dfb291-eaa3-4ba2-a3b8-00a394a16d60	1a607e1a-309f-4550-8abe-63b761951ffb
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (id, active, course_name, description, semester) FROM stdin;
1	t	PSE	introduction into the PSE	WS-22
2	t	dummy	testDescription	SS-22
\.


--
-- Data for Name: course_player_statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_player_statistics (course_id, player_statistics_id) FROM stdin;
1	6ee03d4d-af5b-4349-9c40-cbb8e5bba3e3
\.


--
-- Data for Name: course_worlds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_worlds (course_id, worlds_id) FROM stdin;
1	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3
1	b27f4217-616f-4a62-9ef4-8bc26cc6cd73
1	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe
1	8ce6bee0-0202-42a1-a944-438dd77309cb
2	ac193cda-be9f-423c-9c24-9ab7bbc807f4
2	c250ac28-5424-44d2-ae5b-6c04dae71a0e
2	a25b42bc-0576-4936-be2f-4eb8136417ce
2	1e92dcd9-2dc4-4fec-a953-e23b27b35e17
\.


--
-- Data for Name: minigame_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.minigame_task (id, configuration_id, game, index, area_id, course_id, description) FROM stdin;
58fdb041-d376-409a-90bb-52cc4f607168	\N	\N	7	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
1527f59d-7797-44bb-89eb-cce3ee73dfbb	\N	\N	6	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
07c15751-08ba-4f0e-a51d-3d64726e4428	\N	\N	8	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
74cd15ff-8fb9-4b30-9a74-bbe3735869a3	\N	\N	11	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
8a221278-d341-4618-98f7-7abd1fa2e431	\N	\N	4	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
67a5a78c-b824-42ee-adba-d0f82be8b371	\N	\N	10	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
1837a281-5fab-4f96-82d3-635bd3e78c96	\N	\N	12	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
0770c651-0856-4158-b7ae-88f4878b5c17	\N	\N	5	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
41b4bfa2-9e0c-433e-9c77-8d51529fe3c1	\N	\N	9	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
419dc1c5-f3d4-4ce5-aea4-d725158fc35e	\N	\N	7	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
515dac09-f85d-4fef-ba6a-4bd71a5704e6	\N	\N	6	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
a605ca42-f0c4-4a7e-b8ec-32f6d0d43ee1	\N	\N	8	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
15136fb6-9658-4c83-9b2a-b2afab49f675	\N	\N	11	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
372d2f0a-421d-4fc7-b2c2-76a2e53dc286	\N	\N	4	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
681f9b41-d383-47a7-a571-4dad0ead835e	\N	\N	10	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
e59f9c8e-835c-4cb3-a85d-ca60a1d6d4b3	\N	\N	12	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
b27fd32d-cee6-4fcf-b67d-74856e476916	\N	\N	1	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
481b84fe-9e93-4d24-860e-264a6c0bcf30	\N	\N	2	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
177a5146-2720-496d-b2ab-27fee2ea5f31	\N	\N	3	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
32bbf2ee-e242-43ac-ac40-6e2d47ddeef0	\N	\N	5	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
1b131cb5-9d50-4f86-bed3-04b849fda88e	\N	\N	9	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
91f68abf-deb9-47af-a5fc-760561f41527	\N	\N	7	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
87c235e9-622e-47aa-95fd-88857b179c00	\N	\N	6	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
e2f52572-4ce0-4e6f-9ad9-9d7289ef23cb	\N	\N	8	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
4ec9394d-a50f-4f0a-95c5-e2ccbd457032	\N	\N	11	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
ed8ec599-377c-47a7-bfae-ccaa493b8e32	\N	\N	4	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
80f12240-6df5-451c-abfe-60cad835c073	\N	\N	10	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
f9461fe7-d1cc-47b1-aaa5-0e4a7ffc500c	\N	\N	12	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
5557a63b-c5ba-4c46-ac07-053df7d40edf	\N	\N	1	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
cb19136b-69b3-4fed-94a8-5fab0aa4bc89	\N	\N	2	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
3f696ad2-5a9f-49ef-8e98-ed157347afe5	\N	\N	3	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
49f520c8-b0d5-4ebe-a24f-045ccb30af0e	\N	\N	5	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
0edc94b3-413d-49c2-a583-61d724049be2	\N	\N	9	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
a3eec8ad-e632-4e71-83c2-c4ff29d259aa	\N	\N	7	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
772405b0-ef5a-4572-aa06-6d0d16dbea17	\N	\N	6	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
8be5af24-b9f7-4e86-8cf5-cf484625c985	\N	\N	8	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
0b733bdc-b79b-4452-8d58-776ed574e77a	\N	\N	11	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
23a48d49-fce7-4a18-8fca-86f989eb3e94	\N	\N	4	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
760940ba-4d17-4055-b3b7-e0cf49a37512	\N	\N	10	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
0763be19-d3e8-4a0d-9689-3b771ce3455e	\N	\N	12	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
5d52ddc9-1781-47ea-881c-2fb5cac0012e	\N	\N	1	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
d68a1d70-324a-4521-8af4-965afbb77cae	\N	\N	2	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
dc79ca00-0d0b-4742-b302-82741d728fee	\N	\N	3	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
823430c9-02fe-415b-ba13-0cb3a32e72ea	\N	\N	5	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
1b30adf9-516f-47fd-b94a-275ddd4e21e8	\N	\N	9	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
62e3ebf5-dd4c-46ea-8e4e-ced3985b9fef	\N	\N	7	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
4782e644-b047-4193-990d-9ab90da6696f	\N	\N	6	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
f49c733a-35d9-4e0d-87c0-d44641007fcd	\N	\N	8	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
486a3fa0-6133-4175-8f64-d14f06899b30	\N	\N	11	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
64f63f34-4749-4715-b39a-859831d8862b	\N	\N	4	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
ff2992e5-852e-4e04-a78a-076f32f18e02	\N	\N	10	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
86892e58-bfeb-4719-8ef7-c7d9bc01a58c	\N	\N	12	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
d427961c-663d-4341-8808-fe73f7cbbd81	\N	\N	1	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
0fe34899-dd56-46b3-806f-261adc310000	\N	\N	2	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
0d1c9b8b-de24-4b8a-a90d-284793732efa	\N	\N	3	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
3fa14eb9-4c03-4499-b3cf-cb436f2fc5d4	\N	\N	5	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
5e419152-7e72-4c40-99cc-b25315173ed1	\N	\N	9	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
4cc1efc6-4005-4124-bcf0-85f2182c81c1	\N	\N	7	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
886144b5-3802-4fa2-ba7b-8aed055fa203	\N	\N	6	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
b591c02d-796d-40b4-91dd-104a726b3006	\N	\N	8	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
d8b08984-a569-4e10-8866-1cc1b17c6092	\N	\N	11	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
70d41876-cc0f-4c81-8628-c6d1c8b45f61	\N	\N	4	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
4912b617-7992-46b7-83d1-f88182be7d0c	\N	\N	10	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
50e0ced4-f26f-4cc7-8c2f-e6583e6f781f	\N	\N	12	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
3cfe0f0b-bbf9-474e-99ae-668b09d3bca1	\N	\N	1	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
dac0ecc5-a20e-44df-9f49-071bec950cdf	\N	\N	2	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
d53e4b01-f476-4fb3-885c-b6d69729c590	\N	\N	3	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
8067b12f-c241-42bc-b9c1-b71796b7fcef	\N	\N	5	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
d10827a0-2f09-4ec9-aa5b-8c07f21be8e2	\N	\N	9	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
3a15b2d8-7bc3-41b0-b4c2-a5d56c9704df	\N	\N	7	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
8a701c30-a468-47e2-9fda-8ab819c81190	\N	\N	6	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
57660fa8-b6de-4210-90e2-e93bad21187d	\N	\N	8	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
a53f5edc-950f-449d-96c3-72359f45ed94	\N	\N	11	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
4b09050a-9f85-4566-aec7-7743d9dbfcfb	\N	\N	4	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
2369ce32-1c98-45b2-98c4-c5331c8a811a	\N	\N	10	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
3e00c145-a287-4025-bd73-3a458b5b3529	\N	\N	12	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
07b990b1-747d-4631-8034-475e4c0c7ea2	\N	\N	1	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
b4aef722-217c-4012-8e62-1453eacdd9b2	\N	\N	2	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
b495240e-fd5c-4ae7-a8ca-a91e6c41a860	\N	\N	3	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
e210d13d-4dd7-44cc-9396-9c0577ca580b	\N	\N	5	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
7fab7273-c1f9-4da6-a409-7ab65ec5766c	\N	\N	9	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
42862f09-4a2e-46e5-9e50-d783d9618be7	\N	\N	7	351488de-5c35-4445-89a6-0217da326e5c	1	\N
6d4c1874-6593-4574-a64a-9f9b96c309b4	\N	\N	6	351488de-5c35-4445-89a6-0217da326e5c	1	\N
e72f0f3e-577e-4672-b406-32da87f5e0f1	\N	\N	8	351488de-5c35-4445-89a6-0217da326e5c	1	\N
4b82d2a5-4d76-4926-984a-126dc281db66	\N	\N	11	351488de-5c35-4445-89a6-0217da326e5c	1	\N
648c7908-cded-474f-bd03-6d155851b254	\N	\N	4	351488de-5c35-4445-89a6-0217da326e5c	1	\N
4ec10077-2358-4b38-858b-a2f83ab91ea4	\N	\N	10	351488de-5c35-4445-89a6-0217da326e5c	1	\N
b2cff975-f0fd-44e1-b486-daa2e8804bcd	\N	\N	12	351488de-5c35-4445-89a6-0217da326e5c	1	\N
1d704e95-91e4-4339-ac27-19e153a0797b	\N	\N	1	351488de-5c35-4445-89a6-0217da326e5c	1	\N
c3c97387-d7cf-4d70-abe9-55f7b0e058d8	\N	\N	2	351488de-5c35-4445-89a6-0217da326e5c	1	\N
d5668093-980f-46c7-bc10-277afaad0468	\N	\N	3	351488de-5c35-4445-89a6-0217da326e5c	1	\N
b4dcb323-99f6-47a8-8ed6-81eae709eb82	\N	\N	5	351488de-5c35-4445-89a6-0217da326e5c	1	\N
ffa40b27-5e14-4e8f-a577-a71e1c876965	\N	\N	9	351488de-5c35-4445-89a6-0217da326e5c	1	\N
3ff6734b-88aa-47ce-b587-54255c790f3d	\N	\N	7	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
5d0274b8-4bac-4bda-a0b9-875aa9df659b	\N	\N	6	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
7e6a4fe7-db1b-4e42-a714-640fe17626eb	\N	\N	8	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
dd2f2038-0c8c-4db9-aafb-baaa845c1047	\N	\N	11	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
4d8bc3d7-721b-4c35-9211-a660769c2812	\N	\N	4	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
d1ca7862-0e13-46b6-b4a5-56cd635c67d4	\N	\N	10	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
404cdbfc-43d0-4ca8-bf4d-9a2715f274ab	\N	\N	12	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
d8cc45bf-5735-4f80-8b55-8d09b20cad08	\N	\N	1	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
7ad0b6d3-21de-4d60-9e41-7c8d405676e7	\N	\N	2	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
583118a2-2f3d-40b8-831a-e425742fad61	\N	\N	3	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
63440c16-5fa8-42fa-8a2c-332a125b9374	\N	\N	5	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
0acefa4e-2921-4466-8647-4a0d2fba15b6	\N	\N	9	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
ca372ae4-cee4-4165-8221-e26ea03e6de4	\N	\N	7	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
1f48b25a-41f9-4ee3-926e-e21282fa30c8	\N	\N	6	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
aa1e9e9e-7b83-4705-8af1-efa98cbce656	\N	\N	8	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
1d96a115-b396-477b-a482-81b401d94c5d	\N	\N	11	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
dbcf9a68-599c-4917-b228-22d916d0a66a	\N	\N	4	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
984be6a9-1c2a-49e9-a4d8-81ed061a5d45	\N	\N	10	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
b64ebf62-f069-4e2f-a96b-f65ad7d20e06	\N	\N	12	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
bf13ed03-5b71-433b-99b9-658b270d819e	\N	\N	1	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
c89d3b02-9e88-40cb-9f63-a55341d160fa	\N	\N	2	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
cff0b772-c7dc-4da6-a7fb-be0df3ddbc26	\N	\N	3	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
6fbb160f-84ef-4806-8579-cb3ccf5d4161	\N	\N	5	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
9ad6cc18-438e-4767-b126-521d5a085b77	\N	\N	9	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
b2108304-518f-4cc6-a0d9-d1440377d699	\N	\N	7	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
87409b75-3054-4cec-a699-63c32c4c1df5	\N	\N	6	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
8a9dbf27-8de2-4002-b1b3-cb7dd709b78e	\N	\N	8	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
339b74d0-7067-4783-a521-7667bbc56b92	\N	\N	11	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
52ab7a0f-6de1-42b2-bdf1-1a24128222e0	\N	\N	4	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
c26f1397-19d6-4106-a0c2-ea76f43dc2da	\N	\N	10	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
dd7dbc48-e273-4585-8b57-14bc4dc74527	\N	\N	12	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
396d53d4-985b-4106-9bca-4a658f0038a1	\N	\N	1	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
180aa5e6-4977-4e0f-ae5f-29abf59c7824	\N	\N	2	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
a65ca80e-c54a-436e-94ed-fb85ad62bb47	\N	\N	3	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
d6b56378-265c-4538-a1c3-04f8d7c48898	\N	\N	5	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
beb4be93-b027-4a4b-8891-3f14a7859d8c	\N	\N	9	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
0919ff4f-84c8-4da4-8afe-fe9af80e9eb8	\N	\N	7	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
5b8270c5-d74d-4180-8f0d-5df43c3212c9	\N	\N	6	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
e71f0ec7-6efe-4a19-b338-6435a6cebbe5	\N	\N	8	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
fec38a87-f43c-4ffe-87c8-36e3bafb78db	\N	\N	11	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
6ef72fe4-19fd-44b9-bf06-d4ffad75a9a6	\N	\N	4	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
ca69fc1f-3548-4131-9238-9da9f171c14b	\N	\N	10	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
2912e5d3-a477-4245-aa80-5d58117b2e17	\N	\N	12	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
c589733a-1a1c-4ba1-91d8-848184d117d8	\N	\N	1	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
6b037898-3c14-4962-b348-f1d0ac68a103	\N	\N	2	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
809dd4c1-c36e-4beb-91ac-833d769d7245	\N	\N	3	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
de4ac1bf-e5be-435b-9369-4c5d8fecb069	\N	\N	5	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
c96eba51-8e1f-4696-8ec5-65e9d831bf15	\N	\N	9	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
a6fca17d-9382-4021-8921-b58c60504c02	\N	\N	7	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
651323dc-1a71-47a5-adee-f4195075080c	\N	\N	6	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
896984b0-7c75-4cdf-a453-4054cc1d9caf	\N	\N	8	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
83e9f7b0-fc38-4512-a7fd-eabcbd54f994	\N	\N	11	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
c0da56c7-24b5-49e0-93f8-a9cada828986	\N	\N	4	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
ba677353-6904-43d5-a7e9-c54010636ae3	\N	\N	10	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
971440b3-9186-4a63-b594-9c80cde80c89	\N	\N	12	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
cf5c28e5-aac3-4af9-b917-b189e6f60660	\N	\N	1	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
575bcd8c-59cc-41de-8297-c8caac280fef	\N	\N	2	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
81818fca-1512-4812-b14f-86ab855e68d8	\N	\N	3	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
cb23f6b1-acc7-46f6-97b6-e1c661792ca8	\N	\N	5	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
06a61595-dcad-48ba-a7b3-f889133f54b4	\N	\N	9	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
68358f3e-356c-495d-9b27-ea9402e38f8d	\N	\N	7	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
581f2ce5-bedb-4366-8ad0-e604a60f874a	\N	\N	6	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
a5f7f283-a243-43a2-bc2f-03c3d6f1e527	\N	\N	8	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
35321cd2-8fc7-4145-9922-52cfc67d9845	\N	\N	11	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
fd46a785-24d5-4c9c-a7fa-c425f405a210	\N	\N	4	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
e6ab77f7-c558-4346-acb6-4e874086099a	\N	\N	10	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
b5709bf8-fe38-4bc3-b047-f56837808fe9	\N	\N	12	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
0d247e5c-7b6d-44fc-b3c7-e67d0c1d5f1e	\N	\N	1	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
eb273424-ef39-4b75-909c-17b105166969	\N	\N	2	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
5e0d957f-59e1-4c80-8c63-37560d8ab18a	\N	\N	3	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
5fced5ee-e66f-46e5-8033-ead4df1c0b9c	\N	\N	5	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
488ebedd-d864-471d-b7b5-fc5a29a5a27d	\N	\N	9	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
fcb36929-5ee8-48d3-a433-509e4ef0408a	\N	\N	7	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
c258de8d-f7c8-4c81-9504-e4de53266b3d	\N	\N	6	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
56e3ecba-aa84-498c-928f-16a242920893	\N	\N	8	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
e2f32002-a569-40a2-af63-5acea287d208	\N	\N	11	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
2112fbf2-876e-448a-9eff-db510123c895	\N	\N	4	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
827c1c08-68fc-4fe8-be00-3cce8016f989	\N	\N	10	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
0e166a0e-4bdb-40bd-aca7-afb1e721b5d3	\N	\N	12	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
0959b3e9-3f80-4aae-8c84-f31d49aa0ac5	\N	\N	1	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
9d620a8b-28a7-4d44-a748-71039407d7db	\N	\N	2	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
ce3c2e99-7e07-49b9-b0c1-d76197fc114d	\N	\N	3	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
aac664a6-f945-48d4-a3ce-b7ca6040123d	\N	\N	5	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
5615a0a6-b8b3-46fe-8e3a-62327ee00537	\N	\N	9	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
d07cca2a-ab1d-4e4e-8ed7-021c67a319ec	\N	\N	7	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
26ea9dca-f00a-43e6-b42b-7e4e56e5fc3f	\N	\N	6	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
add69d35-0bc7-40b0-97ed-66b0066bf34c	\N	\N	8	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
79cc12af-ba09-4877-b4fd-c2f0ce9f5257	\N	\N	11	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
0fdd7b28-0c2b-4c05-9f49-2469f67fe025	\N	\N	4	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
7ce1cc84-6428-4604-919f-e1f7f76e699e	\N	\N	10	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
9602bce8-5f49-45c3-8b41-eb2aca889ec0	\N	\N	12	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
7e25eb3e-707e-4486-a1a5-45d964ca9e0a	\N	\N	1	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
5064c936-e34c-4afb-8f4d-19c5d3058e8c	\N	\N	2	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
ff0f7bc7-63d4-49a1-93e2-3ec2aaa644cf	\N	\N	3	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
83bdeee1-a379-415e-9cf8-935a52407348	\N	\N	5	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
25693759-601b-4230-86fc-01fc67385259	\N	\N	9	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
50be9504-14b5-4563-a841-8d2d38e40703	\N	\N	7	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
560fd7ea-0033-4d81-91f4-41672f898800	\N	\N	6	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
66ff9b56-7cbb-40e9-9a04-4701ac41cdad	\N	\N	8	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
db71371e-6584-4de2-86a5-31143c97424f	\N	\N	11	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
2a3fd83f-4303-4169-92e1-5759fb9e6404	\N	\N	4	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
44c688ba-0d24-4f67-b1c7-51a96d82b573	\N	\N	10	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
f110133c-3c94-4402-9e29-9edc4af367fa	\N	\N	12	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
1a44e8cd-7908-49c1-b03c-1f1b36a740eb	\N	\N	1	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
310358cb-0734-4b6b-a20b-b0cde2b533fd	\N	\N	2	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
1cfbc939-b719-448b-b934-8a838e82fc94	\N	\N	3	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
74e3c5ef-e9fb-4aa8-978a-0681a54f70e1	\N	\N	5	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
dbaaa48d-16ff-4edf-86f2-f15ab0902d80	\N	\N	9	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
738d23b9-6314-42a9-b296-a140ed73dd90	\N	\N	7	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
bc4573df-9bfc-4931-a1e2-18b885b983da	\N	\N	6	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
ce59bf90-1178-469c-9533-93ed82d22511	\N	\N	8	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
11a7b7a9-f172-4aa4-b643-a80345de980e	\N	\N	11	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
175c8101-ae49-48b5-ba33-694ba289f430	\N	\N	4	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
87ba475c-a445-4a27-8470-c2e5f8769085	\N	\N	10	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
1658726f-86e3-4b12-a179-5de415c4fa88	\N	\N	12	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
8f17771d-8f72-4b6e-bcd3-72ccd3faeb5c	\N	\N	1	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
a5ba06ba-1508-4e37-b657-8e9a02cfc4f3	\N	\N	2	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
e4244178-159c-42b6-b478-5e9306442ef5	\N	\N	3	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
d66c79f1-103e-4dba-a8c9-90eab7bb3365	\N	\N	5	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
914bb778-beab-41eb-8657-6099f4ac6104	\N	\N	9	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
75b8ca71-ecdb-40e4-b512-73c3c4560748	\N	\N	7	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
18f471cb-49b4-4773-a2fd-5d02f94ca22a	\N	\N	6	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
2244d600-2283-4b46-a320-d78a54771b34	\N	\N	8	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
c5090b66-ab7b-40b7-b5f4-932b23451674	\N	\N	11	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
e4977146-1fd4-4dda-97da-67337f8af9a7	\N	\N	4	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
91319a64-b571-4742-8cbf-86de9106b745	\N	\N	10	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
6b7121e9-58e8-445f-ac07-a34862428e71	\N	\N	12	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
89bf8ce4-7782-4094-9891-5c6531bff7dc	\N	\N	1	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
5d61d950-54db-4349-8cb9-b9947b339d00	\N	\N	2	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
3457eb8e-ad73-416b-8b4f-5f40f7e99ae2	\N	\N	3	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
f37250b3-7f28-42e6-abcd-a8cc9951a3b1	\N	\N	5	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
f2277178-41c5-40c8-8cac-9ab7a23f055c	\N	\N	9	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
d873d035-a426-4b4f-9ef0-228d2952c21e	\N	\N	7	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
4e55878c-613a-4990-bef1-1e626b855486	\N	\N	6	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
8175e0e6-dcd8-4b44-8aaa-9abbeb89d1a8	\N	\N	8	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
34d598e0-d78b-4e41-a3cf-d3b3e2ed294e	\N	\N	11	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
3f9fb6d5-9475-4ed6-b440-ebc3245e1ad6	\N	\N	4	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
50be1528-3267-4e5d-9fc2-6dac9b35c3f0	\N	\N	10	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
99f242db-c6fb-4cee-b43f-fd71dccf2d3c	\N	\N	12	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
8eae5ba3-a639-4287-86d9-3bcdbf6e2e62	\N	\N	1	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
1eb5cac2-4c4a-4113-bdcd-976e656f704d	\N	\N	2	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
02cbbbaf-9334-4bd1-ab8a-af131338bd4e	\N	\N	3	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
38d04012-3ab7-4f42-a979-225cbd5f37da	\N	\N	5	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
b380a336-c40c-40ab-92fa-1152214f50a6	\N	\N	9	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
f17697dd-8656-49d3-a835-d3a8ddf3b6ba	\N	\N	6	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
37ffb3ea-785c-41ee-b610-f42c102da33b	449aa881-cba8-4d39-a6b1-fb08c9389191	CROSSWORDPUZZLE	3	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
41da12cd-ebcc-4583-84dc-9803767517c9	\N	\N	4	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
49c3aa48-3eec-4fa8-8a14-60f18cc3afb3	\N	\N	5	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
086bcc96-0298-47e7-968e-4983d1f795d9	\N	\N	12	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
3d355ed9-ec41-4e36-a9ea-9405dcc7be6d	6ffdeff7-adc0-481b-a590-d51bdd820dd3	FINITEQUIZ	2	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
24bff4dd-d471-4b8b-8bbf-590b2e766dbc	\N	\N	11	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
7ae4b680-8a72-445c-a52c-6b77f0a51d5c	\N	\N	6	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
cab90542-bc81-4e13-a5c2-838d9810bb33	\N	\N	7	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
652b22cb-f159-478c-adef-5a25598b3ca1	\N	\N	8	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
12253bb5-1ea4-42a7-a80c-a12c5f3d5c02	\N	\N	9	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
6bb024e0-01fc-41a7-bc38-cdbb2f89ccb3	\N	\N	10	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
db00d0d9-2e89-4a0d-8ab1-17562f14b8f3	bf8ac0d3-c486-4db9-b53e-2e689409a12f	CHICKENSHOCK	1	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
3863c5f8-a6df-492e-a775-eab4e5554e64	\N	\N	2	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
8aaa3f0d-c930-4293-ad1d-b5ed4eef4356	\N	\N	1	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
1198290a-582e-4b9a-90bf-1df77a3c95ef	\N	\N	4	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
d45ebb49-56cf-44ce-9949-f51e65519d61	\N	\N	3	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
8764be00-33a7-40f4-8fc2-906cbb016053	\N	\N	12	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
be828751-4975-406c-88da-6e07a7c3d0c7	\N	\N	5	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
7c3eaa2c-fe92-4b90-ba20-3205d62c86ab	\N	\N	11	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
2e0ef2fa-597a-4232-8023-b4d3a0e4c3ca	\N	\N	6	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
558e8686-e1ed-46d2-ae19-70c91de0ceb2	\N	\N	7	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
42140cb8-6ef1-43a5-8ef8-4f436f42f18d	\N	\N	8	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
3f1a5664-7ffe-4228-9130-64c84c24d4c0	\N	\N	9	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
4b9e2413-967b-4b15-8b5f-21b8020b9a5b	\N	\N	10	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
60c0a3ba-28d5-42f0-a956-a65b7cae92a9	\N	\N	2	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
5def49b3-605d-4188-a27c-71c29d848268	\N	\N	1	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
e19cfb6d-7cdf-4c43-8b21-772dad9e9199	\N	\N	4	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
51beb349-804b-41f1-a120-2398f05f0e30	\N	\N	3	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
e24daa96-073b-4f4a-9ef5-c1f8cff139dd	\N	\N	5	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
cdb3a209-e026-4b07-a345-4b4090e10f0b	\N	\N	12	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
803b5c24-34ee-4b17-a8bc-a55fe4eec163	\N	\N	11	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
b9278a63-2a46-429a-b7a0-222bbbcffec0	\N	\N	6	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
456b90e9-a0bc-4fbf-ac8e-40b63a6dcef7	\N	\N	7	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
5304d6ca-9d44-461f-a2d9-8e06f0bdf657	\N	\N	8	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
8dd87045-cc39-41e8-b05b-b764320daeaa	\N	\N	9	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
9d8d2fbb-cd35-4a21-9cfa-455526cea239	\N	\N	10	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
6abf1853-b5d0-4c6c-8d58-59167b1f351c	\N	\N	2	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
75eefe2b-3494-4639-a610-be92626498f7	\N	\N	1	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
148c581a-bc49-49e7-b4e3-f6420fb905bf	\N	\N	4	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
7b51d44d-9fb3-4565-a2a5-4c09ffbb6ad8	\N	\N	3	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
c2a83b65-2484-4dab-a081-9c4c30ff966b	\N	\N	5	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
4f96d462-7b5b-49c0-9a5e-b9c8a355a55d	\N	\N	12	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
2b204dfa-a8dd-4a84-9528-89472adc5525	\N	\N	6	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
62cc6fb1-0105-49be-8013-3952171a38e3	\N	\N	11	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
4130e885-29b6-4a07-8ce3-df672c0cca7d	\N	\N	7	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
23e39b5a-3cd3-486e-b323-13b71e378475	\N	\N	8	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
fe1bfb02-8629-4a6e-98ee-f65c449976c6	\N	\N	9	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
0cbfe5d5-4b34-4b02-b9db-2883acd4bbc0	\N	\N	10	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
1ff0d71c-77fc-4582-823f-c59c29f15949	\N	\N	2	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
5f849f2d-4504-4b98-af00-8e5d0fcc1cc2	\N	\N	1	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
907b2536-f5a5-4c74-bd77-76f6fea19c62	\N	\N	3	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
f3cdaa28-774a-4fa0-b84e-00ad9c982e49	\N	\N	4	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
a8ebfdbc-46ad-477b-bee1-721321b7e97b	\N	\N	5	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
72d982fe-a55c-4e91-87fd-e6a56949ffa8	\N	\N	12	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
6072dc39-a839-4de1-ac7f-d05e78d9dfea	\N	\N	11	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
6a805a26-3126-4a0c-b482-c96d7978547b	\N	\N	6	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
2923c9bf-a875-439c-b519-294398c018f4	\N	\N	7	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
8763f545-1f35-484b-84b4-3d14b095d2c5	\N	\N	8	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
e5bfd498-eaa2-4369-8a56-92ea4656e8c8	\N	\N	9	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
ea7722be-089f-408e-9bfe-07c108478298	\N	\N	10	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
a4b70260-b186-4327-b1e3-e61dbe5d3fb6	\N	\N	2	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
30836efd-3209-419c-be96-0020de269484	\N	\N	1	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
473b6070-46fb-4f9c-b619-e1a8ced2339d	\N	\N	4	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
dcf274de-e8e1-4458-ba46-c2299d19fec1	\N	\N	3	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
0926c2e2-cca2-458c-99fc-b6f4184c01c0	\N	\N	12	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
2d689ea8-0e9c-48da-a5c9-f7c5f32352da	\N	\N	5	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
704067f5-d032-42d0-b1bd-4ec09392cc48	\N	\N	6	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
71a6068e-bf6b-4243-938a-cde226531511	\N	\N	11	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
529f3356-cd0d-429b-951a-a82609b876ac	\N	\N	7	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
0bfbf22c-2df6-43e1-9441-7a040259cfc9	\N	\N	8	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
4e14bbec-9473-4423-a1dc-371a7119ca05	\N	\N	9	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
dd91a909-6171-4632-a861-aecc9ac2f06e	\N	\N	10	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
552bc927-8498-4e8c-bd1b-2011fb2d2d6b	\N	\N	2	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
04ee197f-fb65-4ea3-895a-09813b1975b1	\N	\N	1	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
4e7ee96a-d218-4e7e-9d12-289c85b86fd3	\N	\N	4	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
ab26253e-f702-4ab0-8c29-24f84d0263b9	\N	\N	3	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
0e173106-d68e-4d41-af06-7da1888ee0f0	\N	\N	5	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
7ca1a4b5-e5ca-442e-ad10-f630160d3639	\N	\N	12	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
612e17b2-c912-45af-9330-f1d5a7430dd0	\N	\N	6	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
a48ea115-2a16-403c-b1f8-8843468910aa	\N	\N	11	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
c8fe4d70-0dc6-4067-95b8-2b3709829ff3	\N	\N	7	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
bac5dd37-c025-4e18-9ebf-ed28990211de	\N	\N	8	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
2ab228ab-cbd0-431e-a45e-6299abd31c68	\N	\N	9	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
c56b72af-809f-49f8-8565-d0c641eac388	\N	\N	10	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
a210c42e-6f7f-4821-86c4-33f4e8b8fb28	\N	\N	2	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
a95de06b-92b7-488b-9a12-daff2f906ddb	\N	\N	1	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
3cf2ff1e-5db8-4b52-be52-8edfa81f3bbc	\N	\N	3	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
0a88066a-0b75-49d9-9b8f-bec03d627b49	\N	\N	4	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
ef4d6136-0547-4642-9bc6-bfbea6183a3b	\N	\N	5	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
ce19f68e-b38f-40de-9f19-e30800f9edaf	\N	\N	12	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
e844f38e-33da-4e5a-86f0-2fa49022a63e	\N	\N	6	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
e0692f2c-c73b-42c8-a248-9720e2846c9d	\N	\N	11	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
bb6a6710-c8df-4c69-8f12-2c354d8140f0	\N	\N	7	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
a95795d6-c81c-4828-905b-7bd9cf34f63c	\N	\N	8	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
7816b403-821e-4b3b-9358-ff104433e2c6	\N	\N	9	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
5409c239-6e50-4b72-aafc-4ddc17baaddb	\N	\N	10	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
a535f9bf-897a-4331-9ec6-0e9ee7c6f44e	\N	\N	2	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
2b9f3dc2-f200-4ce3-baa3-c0959138b4f5	\N	\N	1	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
8dc7ff61-67c5-4fb5-af37-5cd47a373627	\N	\N	3	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
3813a332-6050-46bc-a897-295fd169f60d	\N	\N	4	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
b7ccad55-af94-4c91-aff4-ce3afcfb9088	\N	\N	12	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
8dad7e64-d9a9-47a3-8a22-fb96b96a40b4	\N	\N	5	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
bbb5fbe2-ab29-4c68-ae95-185e941d91c4	\N	\N	6	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
0c7067b3-1a91-4eff-bcd3-8fddd487671a	\N	\N	11	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
a70b3376-177c-412a-adf8-da04a1cc6f11	\N	\N	7	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
43831346-3c5e-48b8-ab44-4ed8bfb9e7fe	\N	\N	8	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
00d7139c-2f02-4297-855a-503f2460b280	\N	\N	9	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
8bca7fb4-5117-4f51-950d-59cea7c31a18	\N	\N	10	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
2555c003-96eb-463a-b059-cfd16bf67817	\N	\N	2	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
ea999631-7d6e-4600-9b0b-9bc9ccaa9e67	\N	\N	1	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
70435bd7-da04-4af0-85b9-e6a7ffaf2925	\N	\N	4	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
8154cc25-bbd0-494d-b4c7-33f30bb9e60c	\N	\N	3	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
b579adfe-ba00-4fe3-92bc-4b51bd36d445	\N	\N	12	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
86e7c72b-9258-471a-b16c-2600d752400f	\N	\N	5	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
9fd2a21b-652e-431d-9e56-7e73dcfe6bf1	\N	\N	11	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
3648b70c-722c-412b-bff2-73b520ffdbf5	4f3af39f-1a0c-44f1-8a07-460786ab4fb1	CROSSWORDPUZZLE	3	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	Crosswordpuzzle game
ef6f3872-b074-4706-a189-8bc7fc15285a	\N	\N	7	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
fdbb1d1b-d4e8-4dab-b95b-0881268b63d6	\N	\N	8	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
8b9abc45-aa91-4cae-aabb-7f4bee1e6a41	\N	\N	9	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
2b37f8a9-4af1-41b4-88e1-90ddf4815c8d	\N	\N	10	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
a9d39400-d6d5-4e4e-9dd1-40ca94a26b53	\N	\N	2	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
7f9875a7-13fc-42b9-bce1-fcb0ef384373	\N	\N	1	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
e9f34094-c54a-4a0b-b60f-12f4c22d8297	\N	\N	4	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
95cd5cf5-4183-46b3-b247-30dfb2348bdf	\N	\N	3	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
6fef5bf2-6cf8-4bef-b8c9-b7179af68147	\N	\N	12	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
432ae1d1-be71-4743-8ccc-f4e33a1284d9	\N	\N	5	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
0f8958af-005b-4ac9-bf37-71d09c7037d4	\N	\N	11	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
8b4fedae-8a81-47ac-b70c-4ef208cf74f1	\N	\N	6	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
396e2d37-f53a-4d3a-bfd8-e2c50d19ca92	\N	\N	7	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
98cfdb13-deb2-443a-8fc7-2abd0df416f0	\N	\N	8	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
e55532b0-2e58-43cc-8b2e-94e3600faefa	\N	\N	9	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
69c88a51-1c39-4ea4-98d9-50bfa3e8162b	\N	\N	10	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
8e3991ed-a603-4716-a24b-8155c55c3a36	\N	\N	2	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
406984ad-852d-42e5-8bd6-558bc6df8478	\N	\N	1	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
52293d76-88c3-40cc-ae8a-d5055797d7f0	\N	\N	4	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
ed51d5a9-363f-4a2c-a73e-d9b2375eb529	\N	\N	3	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
ddf45fc6-d84a-4d42-a70c-4b4d96c90b94	\N	\N	12	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
50cb3370-70d9-40c5-a147-3bca972d9d77	\N	\N	5	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
9836c154-5bdf-42e3-9ebe-5c47d104bba4	\N	\N	6	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
6ee3e056-d104-4387-bfc7-5d0be34b6cc6	\N	\N	11	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
24191d57-c8d6-40a1-a101-a136ca4f1499	\N	\N	7	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
761db5e7-2dfd-4b1c-81df-04d9f17bdce4	\N	\N	8	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
8f6abba6-722e-426a-93b0-bded690a58a3	\N	\N	9	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
41c9c1f1-adb6-41ad-962e-52ad31f9ce81	\N	\N	10	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
b4d2f308-0884-4448-9de6-b0c532e81851	\N	\N	2	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
56a0ea36-eb45-4136-8aef-c15462fba45c	\N	\N	1	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
800df1d2-5f76-4517-98b1-597ce9e48622	\N	\N	3	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
847c6de1-cd2c-4ad9-b467-e0e039944b9e	\N	\N	4	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
ff6ab9e1-5274-408d-851c-88661b4e4b38	\N	\N	12	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
ae9a07c8-2b3b-47f2-acae-de31844303c1	\N	\N	5	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
182bbd0e-a18e-4090-b272-119735f14d52	\N	\N	6	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
b44af35f-bb1b-432a-bb45-c382d707552b	\N	\N	11	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
2609894d-2102-44af-8520-5a07ba73f4c1	\N	\N	7	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
02d74e13-801a-42e8-8a28-09b8206e9c3c	\N	\N	8	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
06b88515-ff9d-41c0-a908-f46895f1c89d	\N	\N	9	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
05342138-d77f-41ee-b928-3c55d8a2403c	\N	\N	10	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
239dc6a2-af4c-4bfa-8310-44e9ded7536c	\N	\N	2	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
dc4c9ddb-10bf-4471-b3a2-4d86968f2401	\N	\N	1	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
d4cb5f21-8959-4d52-a0a8-85ebba461035	\N	\N	3	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
e3b47591-4113-410b-913c-c749238ce2f5	\N	\N	4	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
95528017-2598-487e-ab14-543c1944d4e4	\N	\N	5	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
112f554e-eafb-4523-9112-b093aabc4232	\N	\N	12	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
c3666a5e-5cf1-4d1b-805c-18060631dd99	\N	\N	11	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
79be1080-8a1a-414e-8ee9-5b629e393fe7	\N	\N	6	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
58aa736e-057b-4ee7-aa8b-4cc678f75f7a	\N	\N	7	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
0d7cb8ec-9810-4d07-b41b-4ee77e4b2f1d	\N	\N	8	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
07843549-3da8-407e-9c05-fc43abcc5800	\N	\N	9	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
9f742510-2b92-43a0-8552-9a158469332b	\N	\N	10	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
47f198d4-8c6f-4cd3-bfc8-4ac704bf57f7	\N	\N	2	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
ae957775-d5c9-4a2c-8bdd-a7d06a9d401a	\N	\N	1	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
68c638d4-f6c0-4f46-ac66-4e15a8607e01	\N	\N	3	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
81de5af8-49f8-497d-b926-8e8ca5956b18	\N	\N	5	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
5142dc65-5157-47a7-98e2-dd96a47383bc	\N	\N	12	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
29ac299f-43e0-43a3-ae4b-99534e44d490	\N	\N	11	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
88505a46-d631-4bc3-b9cc-98f2855a412d	\N	\N	6	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
f9973f46-a210-4367-97ea-f2f0d151e921	\N	\N	7	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
6893c3a1-fe34-4ac3-9b64-3ec4b82260aa	\N	\N	8	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
724552e5-016a-4eee-abc9-331ed11601a5	\N	\N	9	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
4fd74631-e9f2-42fa-ae09-44a337c9a8b5	\N	\N	10	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
a9bcb7d0-dcc9-419a-87ef-cc4eda5a9ad5	\N	\N	2	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
84a27578-40ef-4009-929e-f28e91d6ea4d	\N	\N	1	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
b34c4ee3-f742-4148-b241-20afbfafd366	\N	\N	4	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
ff6bcf1c-ef41-4659-998c-2e2b3402fae8	\N	\N	3	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
b4a29f58-3ddd-4347-ad00-35300216bc02	\N	\N	12	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
3685157e-d79a-4182-a7f3-1bc8f697e3be	\N	\N	5	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
af6ca0a3-234f-4b88-b80e-2fbe407fbba2	\N	\N	6	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
edd0d474-6672-4986-a87c-8ae88262d48c	\N	\N	11	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
eb9c6ffa-1e9d-4b31-a595-99fc438c4c04	\N	\N	7	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
59ae75d2-4731-4966-9e99-10f5dc60c212	\N	\N	8	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
d86e272b-75b0-44d5-acf0-8e5e071a37ac	\N	\N	9	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
0da9a080-078c-4ea9-bc6b-53e9c8aeafc5	\N	\N	10	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
a594ffb6-4634-4d86-baf2-47f2251bf245	\N	\N	2	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
e0f26bd4-3db7-47dc-95df-000340c94c3d	\N	\N	1	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
39bc68cc-0ba1-4e2e-b538-c2dc2fcca0fc	\N	\N	3	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
f017c7a7-2c0e-4541-9001-e794833cab4e	\N	\N	4	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
6f7f78a2-072d-4c85-92e5-267c7b17b7a0	\N	\N	5	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
d2a1ef0c-8eab-4b4c-bb0e-678568945978	\N	\N	12	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
1a3d9860-a3bf-43df-908a-2a013cfbd166	\N	\N	6	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
de3a8a1d-2c6c-4c7b-b085-f0bcdfb18232	\N	\N	11	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
65a76cc7-9632-46d0-bcd7-856e7e2293bd	\N	\N	7	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
6ba46adb-998d-45cf-8fc3-edb9653f2926	\N	\N	8	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
686718d0-c777-499f-9f52-d3de5a8c68b5	\N	\N	9	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
f3b4c898-b72f-4f3d-a0d5-917624e0662b	\N	\N	10	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
3c28fec8-b9cc-422d-9a61-474ae27fdc0a	\N	\N	2	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
7f5ab4e9-9e83-46f0-8438-4fb00310ecb1	\N	\N	1	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
e0fb69a8-45cf-4208-8a85-1af0b9b2501f	\N	\N	3	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
0362abc5-699b-4f00-af11-4c5e816612cc	\N	\N	4	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
f5dc30a1-feee-4ef9-9d2b-e7e592f77f02	\N	\N	12	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
389e1539-5844-40ca-ac0a-e7fdebd7599a	\N	\N	5	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
a56fa914-6b71-45a5-892b-3b614e0f9cee	\N	\N	6	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
09c09359-dfbf-4a9b-81d6-74a5cd31063b	\N	\N	11	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
f170bd6e-3c0d-448d-8c73-54d047ec4502	\N	\N	7	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
2f9205fa-cf07-4629-97bb-11af6e6c60cc	\N	\N	8	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
2f180029-fa18-4027-9454-f21c6f106812	\N	\N	9	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
38b40a3f-41a1-46c9-9e73-d2090b9aa678	\N	\N	10	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
0226d601-7144-4612-bae0-0964c8b184bb	\N	\N	2	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
57067781-699b-4170-9ff3-f58a42e01dc9	\N	\N	1	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
57bcfdb1-c51b-48d3-92cc-74548c2898d7	\N	\N	3	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
43c5a138-965d-4ba3-ad55-ef9b34686a7c	\N	\N	4	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
bd8d1de8-f3a2-4510-aaaa-8b8b963bb131	\N	\N	12	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
bf00563f-42b9-4975-8239-dc0814dd1c59	\N	\N	5	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
ae64add2-013c-48af-be68-a098b4e78c1b	\N	\N	11	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
52c6ef44-b311-4c34-9a32-2eeb5910c8d7	\N	\N	6	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
6c6e3f0c-add6-4e53-8d37-71ff1b808587	\N	\N	7	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
c6f45ddf-9937-4456-9538-1a0cf350a73e	\N	\N	8	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
5e7a0d59-7c23-4f88-8a87-ef55fd88f6d5	\N	\N	9	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
78652953-ea64-41ed-aab4-75e077e0ed69	\N	\N	10	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
417b7a03-f52b-4ac4-8ff3-243d5055e29a	\N	\N	2	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
1a9a5726-bba2-443b-b01e-8fa60b1ebfc5	\N	\N	1	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
383dcecb-082a-431d-9559-0482e606e2b5	\N	\N	3	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
6ec404a3-a0e6-4d80-9251-e34a14dc1682	\N	\N	4	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
a4f8f353-02ea-4550-8684-1366e43814b2	\N	\N	12	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
2e2d5ddf-1aff-453f-9df2-5a7e883c4b89	\N	\N	5	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
85534ed2-9f97-4f31-9d99-773fd8842e84	\N	\N	6	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
279d5ee9-603c-48a6-89d7-8d6f20a2bedd	\N	\N	11	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
a100515b-5dbe-4fc4-904b-ec12c5063c34	\N	\N	7	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
6843c331-11ec-4c1d-aaab-22689dbe8988	\N	\N	8	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
4d1ebac9-b327-40a0-8291-f7049d367769	\N	\N	9	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
3405562d-c417-40b8-b99d-4c2a4bdc063a	\N	\N	10	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
c4310355-a449-4408-8fe1-998f8941a748	70fcd00c-b67c-46f2-be73-961dc0bc8de1	CHICKENSHOCK	1	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	Chickenshock game
27ca6eaa-fdea-4833-917b-f330c2f91f0f	98a66aed-6d0e-4966-80f4-053cbb93fd54	FINITEQUIZ	2	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	Finitequiz game
cdca2998-73ba-4625-bff3-9dcc801c61cb	2e5d0718-fdfe-4738-87da-b55b6ed62a35	BUGFINDER	4	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
\.


--
-- Data for Name: npc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.npc (id, index, area_id, course_id, description) FROM stdin;
79a2a848-5540-4af2-ad8c-ae362ad956b8	9	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
aa1239c3-12bb-4f12-9db0-3a1d711361df	3	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
ac9384bc-f7ab-4b7b-8eba-fabf3d237bcf	7	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
4f83114f-909b-49d3-9b35-5455a0c4d307	6	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
5cd60ca7-1ea7-45ad-99dc-f1656a3665ac	4	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
8f5551e3-d6f2-4b21-8d97-54ef0351b38d	8	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
6728e8ca-af7c-4e50-829c-e4c297a691b6	2	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
5228c86b-dad2-43ea-96ff-f726f4a301c0	5	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
e8a08bfa-a6c6-46e9-9e43-2db974e7bc85	10	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	\N
d18f0bc0-9650-40e8-80e7-0b0fe0630c30	9	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
798ac637-cca0-45fa-a24f-74a5d940c214	3	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
024ff217-e067-4616-a637-05da368082c5	7	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
bac7b420-f150-434a-ba12-0514324872b2	1	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
5f97ec40-5a76-4616-8f48-47bcbc5dad3c	6	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
03558060-87dc-4aec-90e8-0e20e9bc20ca	4	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
3adeefb7-0a64-49c5-a68d-a51ee5746451	8	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
09a89ad0-ae78-4a65-b968-77a2556494bb	2	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
7a8442d8-c98b-4f1b-94a7-907f8b14f93b	5	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
db70f056-eda3-4917-8865-f5ba2ff0af3d	10	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1	\N
465c7c96-811b-4c5e-86c1-19ca0f26d077	9	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
53773563-c732-4462-9098-03880c5b76f7	3	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
702ed12b-235d-4e94-860e-aa08e4dbbb21	7	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
254dd08a-1ca1-4ed4-95f6-e954c686dcd6	1	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
4cfbbdaa-0af9-4a90-944a-01a6ce7a91d5	6	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
04e5dc1d-8237-4557-ac4a-f9d3ddd1ed6d	4	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
400a9590-c94f-4b8e-869a-00823266505a	8	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
d1ba22ad-cd97-47ca-b748-fde42165f0c2	2	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
40f728de-5d85-4d5e-bcbe-35a45d2b65fa	5	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
188c8a6c-ce71-4683-9308-6dae2788307d	10	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1	\N
7698ece3-211a-4019-8c9e-92c7b21c5d7c	9	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
2f09e935-3088-4498-95a9-041eaa6a2d2e	3	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
221005ba-9b2f-4525-be65-f754859f619d	7	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
43957133-fd92-41e3-a1a5-1e3f60ed7599	1	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
e1e54f48-1bb5-4b76-bde0-af552180039e	6	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
0b24710c-71fa-4b4f-889f-654497ce6b4c	4	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
01b0505f-025e-4c9e-b076-098f4ba35e62	8	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
9a27d8c1-c6a4-4b38-9e0d-5c5008164d82	2	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
3c9d02bf-631f-4fd1-aec0-4591a6a092eb	5	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
d309f5ee-c569-4fa8-a406-0a0ceee67f53	10	ee0d859c-be18-4b8a-8e08-b417e79b786d	1	\N
d41da348-98e5-49b3-b5ca-1b2a66f69a03	9	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
8ea037bc-7e38-4dc9-a44f-b9606cbe9146	3	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
84e46405-1db6-454f-b251-84450a1e0e2d	7	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
cf14c2bb-0bb1-4839-95e0-8378ca1c7124	1	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
c1eff64f-dc7d-4a00-af7d-72b15f4a5e1e	6	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
da9e3170-26df-4017-a4fd-c6fa3b31e17c	4	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
75e2fa59-e81f-4821-be33-80ee002087fd	8	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
3529a8eb-80a8-4e17-89c2-b5102f037771	2	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
ceb9f4a2-91fe-4a37-9367-10ae06b1e0c5	5	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
7cd33d39-eb73-4b8b-bd42-e7c469a8e4e8	10	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1	\N
a936686c-07b7-46a6-91f4-1529eb10c8f7	9	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
14f295fc-bd2d-465f-a670-ffbb69cf1674	3	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
010f3678-bd4b-4c2f-8460-643768fddd38	7	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
95f7b227-5688-475e-93d6-a968a8a180ba	1	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
2d0a2e20-92a1-445c-bd49-b0d804cf888d	6	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
fd18fa1a-d2b2-4669-a48b-d543befba86b	4	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
2714c66b-4321-4d1a-8ea6-62dde422340d	8	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
97090c22-90e1-401c-a059-f3abb1e89a95	2	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
eba3135f-5683-42d9-97fb-03961a1e6649	5	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
a70e95ca-6551-4c48-9166-9463f0f598dd	10	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1	\N
fddd373d-b199-4f79-84ca-da38490bdab4	9	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
e5c56261-a7f6-4fef-9176-ca4993ea1bbd	3	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
2e9306f1-807e-412a-8de7-c65f66b4a046	7	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
daebf807-1465-4b44-8acf-0cd2d618f963	1	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
e9ff9e0c-f110-4e53-ab40-4717edc8c7f0	6	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
6aa0cdfa-bb81-4e13-b200-345f83c5ce77	4	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
2ec9f4a5-3625-4d55-ba0f-d82ccba64997	8	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
767cd271-04fe-4cee-8019-e519a0750e31	2	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
0662bbe0-d1c3-4629-bba8-d302143706f8	5	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
5dae1e11-7f35-4d8e-b28f-bd64c26be41f	10	26be4da3-0c43-4aab-b783-856672e5427b	1	\N
112f5874-e806-4003-8b24-fd13fee14e9a	9	351488de-5c35-4445-89a6-0217da326e5c	1	\N
946e30b4-8a38-4996-be69-a6f3b602fef4	3	351488de-5c35-4445-89a6-0217da326e5c	1	\N
081d5884-ee4a-4c8e-b547-0ff7034cd8c8	7	351488de-5c35-4445-89a6-0217da326e5c	1	\N
901a6bc1-8ef5-426f-87fa-04d9f4a1499c	1	351488de-5c35-4445-89a6-0217da326e5c	1	\N
2bc28347-caee-442f-9674-bd462ed53e5b	6	351488de-5c35-4445-89a6-0217da326e5c	1	\N
a680f92a-f40e-46b3-a2a1-66bb5ca5cf33	4	351488de-5c35-4445-89a6-0217da326e5c	1	\N
6c4c0bee-deb4-4418-948a-48cabff340c2	8	351488de-5c35-4445-89a6-0217da326e5c	1	\N
6089cf80-7a02-42d6-b2d2-ef2994c1f60a	2	351488de-5c35-4445-89a6-0217da326e5c	1	\N
891ff251-a7a2-42bb-a725-9e40c3bcddf6	5	351488de-5c35-4445-89a6-0217da326e5c	1	\N
3dbd4e97-5d66-4cb2-94a2-c5f068dd3443	10	351488de-5c35-4445-89a6-0217da326e5c	1	\N
e5916d7b-9dfb-4900-83d8-c704f310a50e	9	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
c0b17e1a-d014-46ce-8269-bb4049b5d742	3	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
9a29a29f-2ef6-4902-a285-7e85b2dba8f7	7	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
6098c6dd-2485-4195-b9ed-6f3c0f41413e	1	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
e382654d-1c79-4a4d-a755-674757486571	6	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
5f13fa6d-545f-4f4e-93e5-552edaffd83f	4	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
5f3ff3b7-d672-467c-abf4-f38f7e5f6ec4	8	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
3f49d9a1-2f7a-4e8e-ad3d-085bf8fddee2	2	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
02cbde76-9e7d-44a3-a594-58759aebf972	5	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
daa95815-0c86-415a-89f1-2d77c7eefd5b	10	e4b4fc3a-39a3-497b-8665-c474a21231d1	1	\N
920e77c2-2530-48fd-a5c9-97a9e36c4ba0	9	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
cdb7a229-9e4b-4b03-a58f-7cd68fa0406d	3	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
ef06dc2f-2001-49c1-b680-19c234ec0f59	7	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
6290b887-91d1-4908-abb6-bc580902f2bc	1	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
56b4e2d3-c3b8-4f9d-b559-faf230298e4d	6	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
5b44c92e-3aed-4aac-b7f3-95223bbcbb86	4	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
79333bdc-7585-4cf5-8d50-cc3986b00462	8	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
42fe66ae-1311-4b98-b2e6-16ddd22d6e28	2	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
f1c62f63-638e-4a8b-8e30-4b4edaa7b62e	5	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
36e4e0f0-0946-4ec8-ad39-1754c80dc02c	10	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1	\N
79105085-f156-4a7a-abd4-434ca1f960aa	9	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
dabbaf56-33c8-4cf6-8668-da8dd914e84d	3	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
3d1f52d4-ff38-4bf5-8af5-07c498fa49bd	7	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
9bba0c5d-6ac7-44c0-88be-7d17f2b4d614	1	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
acb73b87-9b1e-48d6-b326-ac2a0f8e8c40	6	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
7d4c5a1d-d134-479f-9711-e9f0ca738a05	4	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
969d2fa1-162d-45d7-b216-bf093d807c67	8	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
b81c1c55-00bb-4f92-a895-cb918bf64809	2	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
f407ff5c-6e38-4fe1-bce1-3a2248414fca	5	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
918c2b33-161a-4290-bfc8-d8eacd0d25f4	10	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1	\N
677e26d2-4491-498e-a171-0bd02177d9c8	9	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
0fecc54a-223c-4c6d-94c9-1a361b114bef	3	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
e9039b4d-78c4-4e48-9dc9-71af55d4ef79	7	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
cfd597f2-7869-4344-884a-b7d0f48bf598	1	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
2c3d210b-aa67-4d51-8674-6d532e6ff49d	6	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
1ca77586-a4e6-428a-8b88-99dd36920794	4	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
8558c27d-9df1-48c4-af55-aeb36e113a3b	8	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
6335d4e2-3e70-4dd7-b2cd-8735e0918aa0	2	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
fb2c891a-4cc3-46b1-b24a-e2c96c21340a	5	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
1595b759-0ee7-426e-9071-14f4da40bdbf	10	ea1e8d2c-0555-4054-817f-f63edfbdb650	1	\N
5ac01eab-ede3-4a2c-91f6-d3563a53d91b	9	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
6d2cb6cd-484e-4449-87cf-9b2a430d3480	3	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
684db820-0f64-4267-a5f6-3e8bc6ca4645	7	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
aac2e102-9f32-493d-ba99-3bb1fea4f278	1	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
fbc8d70b-321a-46c5-b632-e8be11c39813	6	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
5bb8500c-ac5f-4e2a-9dee-daa46e64e6ff	4	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
621c5623-fa91-48a5-a1aa-964589c7debc	8	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
1585a88d-e5e7-4b83-b19e-9fbdfba94c0e	2	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
8e314b83-b5e9-404d-b8bb-720d0c9e38d8	5	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
56783ac8-b9f0-4672-901b-be55db1f8498	10	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1	\N
13adea08-9f40-455f-ba70-101cad4f1d26	9	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
6d0271a0-a4f2-43b6-85fd-52157838d2ac	3	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
b3a901cd-4af7-451a-8d8f-730bb8996ff7	7	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
791ceab7-d2f1-460c-b0de-f698687a5404	1	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
b7ebab6c-5d65-4b7e-8441-19a717e9228d	6	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
781de11a-b87c-4dd8-b24c-6d1b5fb187c4	4	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
08a40ab1-c13b-46d4-b4fe-3a446bf73f09	8	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
078a127e-41e0-459b-b5a7-365b4f44d0af	2	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
4d8387bd-d2c8-4512-907c-c8bac2dd5a16	5	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
53e884cf-9328-492c-a64e-e05dc4fb7534	10	59616e13-3367-4ce1-bcae-3ba14a12d965	1	\N
8256453f-ddfa-4711-9385-552e53b8b254	9	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
7ef634c5-04fe-47a0-8b66-feac965d0358	3	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
ef36b0d8-94e7-440d-ac22-4a852beea2bf	7	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
4937cc8a-be5f-4910-8fef-77f102ab76ed	1	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
870785b3-611f-4ade-aef0-893d8bf67cae	6	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
3b0d9acc-a15b-4e51-b4e7-492c7237b7bd	4	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
d190a186-b5d7-4af9-8306-342ae535c710	8	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
35b4c363-0c29-4b8a-ae91-542a58eef089	2	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
db237b40-07b0-4097-8dd6-d1691e4a4f24	5	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
2ffdcb07-e9fc-4b2d-a63b-15ae5f2890b1	10	b46d78f2-fce9-477e-af13-11f4903ee0b0	1	\N
9d45f816-a343-4af0-a7dc-00e954aed649	9	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
9b91dd44-8dda-4c94-92b8-e3ac523a6ba4	3	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
752ab7b4-c25e-494d-bb14-103eae207a58	7	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
b25b5675-2aa4-4e53-885b-c3b5003b28df	1	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
4a7b9e27-4fe2-4e40-8390-a3770355eb6e	6	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
30a2d510-7f4e-47f4-b3bd-32d7aacc9175	4	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
39817a2d-f647-4195-8884-8e3fe623f848	8	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
e0f5c24a-3da6-43da-a3c0-ab704951260c	2	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
4e9bd07f-e789-4ac6-a2dc-d126f137b64b	5	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
e898aaf2-6443-4031-81e6-3eeb165cd678	10	8ce6bee0-0202-42a1-a944-438dd77309cb	1	\N
f0cc147e-2c45-4cc8-ab1e-cabd82fabf8a	9	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
45b01ab4-c630-4cba-af7c-5a5fb1d2cb4a	3	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
e9c731dc-94d9-4710-97a1-41de748446ee	7	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
1ce06cec-2a5c-4119-a5b7-9f6e97fcbd25	1	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
b80d30e1-7c8b-48bd-8756-781b4d062f71	6	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
0add3483-461a-41ae-9aa7-fde2bb05f88d	4	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
7108d325-75c5-4099-87e2-7d459452167a	8	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
dc9430a1-0101-4c70-a78c-fb51934012fc	2	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
2f68b2c1-1d4b-4e3b-8955-6326570eba60	5	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
2f0cbd05-9a80-44d8-8327-a5eb55abbdd1	10	277facf5-f177-43e8-886e-e9520f8a1e58	1	\N
848248d1-f62d-4845-9a37-0f6c2696a5a5	9	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
041b6bb8-d28b-41b3-a64b-a284416c3949	3	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
073c709f-08a8-4262-8a8f-1269a37239a0	7	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
72f0744f-ba3b-4ee7-bd4a-861946207de0	1	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
8eb68e7b-6adf-40ac-a5b5-b4cc3f9deb41	6	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
64740fdf-fd58-4f8e-bb8f-72fecc60b2f4	4	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
0c6f51c9-7bcc-4d4d-bbf8-2b420851b8ff	8	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
881ff827-9985-4d28-b1a8-648469f1828f	2	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
c06a260e-1073-48c1-b413-76939bbfcc9e	5	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
720a3ea4-76cc-4719-92c9-fe1fbbb84475	10	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1	\N
8b5fc1b9-1a18-40b6-8168-96e4475d8f50	9	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
a1b6b2de-e58a-4caa-8833-ee71c3a7bb3d	3	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
c9f5d1c7-1692-453e-8ad0-5daddb072631	7	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
153f13f5-387d-45b3-9626-98ac74f6b5e9	1	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
5655db35-4b77-4c7e-b849-019cedd07835	6	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
311c241e-befe-4c92-b303-e550ffbc2a1c	4	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
0fcdb71e-b9fe-4145-afd7-9aead0679e8a	8	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
02aa00dd-417d-48f1-bd4e-bd22b4d9eda6	2	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
065b143d-3ff2-420a-b5f8-bdb93fbe9890	5	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
3c216dc7-ea99-485a-b954-0dca05630939	10	86f950f5-482f-4385-a2ce-052586067f5a	1	\N
4306ce5e-afdc-46a5-91c5-5a03ce2fb439	9	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
5dd4e823-693f-4a55-bda6-c1d630a0f512	3	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
f3344dc6-bfac-45d5-ae7f-df9eeb5c8128	7	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
31bd6e80-e636-437d-8628-804bb253deca	1	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
badbdb7d-2d42-45ee-a9ce-66d9351f9c2f	6	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
47663ebf-251a-4400-ac4e-2964d1e4754f	4	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
f0ae3f97-e1b0-4fa3-8eba-bd7b3b324370	8	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
a812defb-cd10-404e-a775-c2deb697ce9c	2	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
023c0256-2b82-409e-bea0-ee6505df7b6e	5	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
24480c33-8dd7-47d2-bfd3-ad31bc9bcd0a	10	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1	\N
3cf1abf9-7427-45fb-857e-cd2e626347cf	10	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
540fab18-0aa8-41ef-b884-1729b6648613	2	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
0aeec3a2-abf5-454e-a36c-8557a29b8662	1	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
1ba8dfdf-f582-445f-bb0b-300ae08db593	8	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
3a7fbc92-5f1c-4409-b006-b540acab12c6	4	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
6fd2f958-8d83-401a-9bd6-9cbff0f8e505	6	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
fced1bba-93ac-4fb2-bbd8-b81bbbf5996b	5	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
75a4f331-df9d-4945-bbd9-e4763583b1e6	3	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
1494eb82-a869-413f-bca6-8b2dbe54c527	7	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
3f66b9e6-4ab9-41d0-a5d5-01056ebeaca4	9	ac193cda-be9f-423c-9c24-9ab7bbc807f4	2	\N
ba04c802-395b-4f8a-a9e6-0518797c954e	10	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
62719e49-abd5-481a-ae26-d9008dcafa43	1	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
9a576a23-7e59-4ac6-a533-0e3f46854386	2	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
358fdb8c-0c5f-4762-91c3-9648b8d83f1b	8	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
ac9201a0-b908-4661-9ab0-5a18350053f7	4	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
163c0f2c-32b8-42e6-810c-2300ae3dc7b3	6	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
0494ba30-99b1-4330-99d7-f000fb9f1800	5	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
d9010747-0070-4760-97ac-7c4a409277bb	7	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
58d797a3-8041-41e9-937c-1b2939ebad7b	3	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
7e6cb4ff-f125-4715-bd0e-5ef1f1ac5f0f	9	8f783c88-580d-45bc-8d4f-6d84aa806a81	2	\N
84e5c325-5ec1-463c-9b6c-f32a3975c437	10	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
a8cfc84a-03c8-41e4-aaf4-a65980c4f7d0	1	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
bd09b687-7eec-444a-bca0-bbb22a5f942e	2	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
a08f1f4b-c3a2-4f2d-992e-00cd140e2a4e	8	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
0668f1ad-535e-46b5-bec7-6bdd31b3f9ec	4	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
087c60fc-791f-45f4-9b32-1ecec2db14f3	6	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
64e355b0-535e-4c03-9d4b-d314ac63df44	5	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
6926ad8d-b7e0-45a8-a9ec-c21d8accf161	7	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
f02fcac9-7439-48d9-a741-4a4a048c6419	3	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
d0f95b5d-e3e3-415f-8dad-68f3d0b79492	9	3dfac9da-32af-4ce1-970e-9d84c9ec7ff4	2	\N
700b7da8-df2c-42fa-9160-d86acca082bb	10	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
77b7da24-eafe-4a82-b693-2548776f2119	2	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
ecfb8e81-05af-41fd-9814-3ed295cfb6d7	1	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
4857d418-ee1d-43a5-94ee-b6e5b076b5d8	8	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
6ab17af7-d165-400f-9cc3-1582ef29812c	4	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
92360e25-23c7-46cd-8ae1-4a6db4aca736	5	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
ffd8833f-b6a9-42ff-b12e-3df14dd906e8	6	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
ab307c9b-f893-4c76-9088-bf30ea7978ba	3	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
d1dcea36-84ca-48a3-8c24-cdd40a511a62	7	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
780aea2e-aaad-49bd-b4e8-c07780c4335e	9	60f725e0-3b9a-4199-86ca-fc70c2692b0d	2	\N
06e26c34-277e-40de-a20f-9324791e0f1d	10	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
cb73dfab-1335-42ae-b12f-13446dfd0d14	1	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
8da75bcd-81fc-487e-8bd7-1fdcdbcd2583	2	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
46b48537-b27d-4580-b87d-a26de3a4cd7c	8	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
4f84f367-dd6e-4d40-b69f-3298d513cd43	4	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
40827207-0a46-4d5c-be62-7237bb5dce55	6	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
e306fcfa-2e94-4a89-a56e-7c1abe13e35b	5	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
a7986fc9-ce62-4648-828c-07e636114b86	3	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
02eb7871-2025-432f-86f5-ebb19f3da12f	7	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
c20c4475-e65e-4d16-a8cc-8df2e5120aa9	9	df1d0f90-bdbb-45b2-a97d-d1439a49d2d4	2	\N
87df3436-07e0-4946-bd66-c2e979a068fe	10	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
b128dfc2-c63c-4ed0-a09b-ae919b46ab84	2	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
dd393d58-8956-499e-aa04-9c30ca190697	1	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
e350536a-0458-4866-8ad7-3c60b88239e2	8	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
ed6d157f-ba96-4674-b5a8-0ae5eca2ea7f	4	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
b33524b4-966a-45c1-a85a-40fa8b5669bd	6	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
f9f27a18-6dfd-45fb-aa20-0fc3a478be1d	5	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
930e60bd-1244-4823-a757-f406d1c7c442	3	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
2ad6579e-d09e-4560-9034-319be61a6da2	7	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
93f935c0-a773-46b5-842c-0eae70a006ec	9	c250ac28-5424-44d2-ae5b-6c04dae71a0e	2	\N
923d023b-9e95-43a8-8b7d-9e447de16a73	10	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
1e170eac-b6b1-4c41-bc84-06a9ee74ae4a	2	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
3fdfb331-54ec-48ff-b44f-b1f700e5ffb0	1	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
fb3b3806-e57b-4788-aa9f-742d819acac5	8	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
13c8e637-781d-4a04-94fe-ad9892c1b17f	4	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
9530a61e-7a36-4a2e-8826-5b48e4d95c54	6	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
f8ab64c4-d0bb-4114-ace0-038612c31372	5	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
01aebc73-cad0-460d-8e2d-7694f1e3e406	7	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
b34f4cae-9e4f-4895-8c80-8574d7526b92	3	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
4712cf8d-6e43-4978-aafa-133d8ee1ac08	9	5c72b385-2b09-4a3e-b8d5-a0f3250e5a3c	2	\N
b32d9156-c401-4732-bf2d-2583853ca403	10	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
8fcea843-aaee-4f7e-ae6a-fc68b92501c2	2	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
82f643bb-d411-4346-9cd8-380faf06f46e	1	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
06e3c53d-81a3-4566-b3f1-783fe6881ed5	8	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
1f53d6ff-2c31-4617-8d20-ab4fe5a8fac4	4	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
0de3d93a-50a1-4be2-820f-0031f4c25456	5	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
859dc8bd-9f55-45cc-9329-38227f4f03ed	6	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
bf4fd03d-ff14-4c37-a4b0-e4ce33123d6e	3	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
cd19c9a3-467d-4ee0-95f6-dfbfa5b30ade	7	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
a445084f-24da-46ca-9542-b47ddfe030fa	9	9be265af-972e-4a05-a5b3-8c916d0ba306	2	\N
76d0080c-aa47-4644-843b-f70272bb4db6	10	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
540c6dbc-c48a-446e-bf21-af5e17a767ae	1	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
72abb4d2-3bbc-4b2a-b847-1cca327bca17	2	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
95af1aae-2c59-4840-b7aa-d1ca6d128e23	8	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
ff4ab8ea-3a5b-4d8f-8cee-c44aceb1306a	4	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
072badff-739f-4f52-b02e-96697a4663e1	5	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
02d99760-8969-42d9-bc5c-db6470c01fd3	6	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
6d892f8b-ec94-4c35-b11c-811d5ddb7bf3	3	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
2b603051-e55e-4484-8586-76160e8b7ce2	7	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
c06a7b4e-9376-4888-8504-172af52554b6	9	425c7d41-de8a-4b74-a2d1-657e70eeb87f	2	\N
bf16f4e8-3e1a-42fa-9df7-0e4fe6f29278	10	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
23338a85-834a-409c-bb5d-bceedcc6c8a0	2	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
df6a1992-e68e-458b-8451-dfbaf3c22577	1	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
7a019012-c165-4ab3-9be2-899696aec948	8	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
14355a83-1d37-445c-aaa7-779765ac788c	4	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
2aad9d65-7ab3-43b9-b634-8ec2938dea67	5	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
ea9dce18-2f10-4c29-bd17-78c51a8fbd43	6	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
28b368bc-2d02-44e5-980d-b0349ce08a6b	3	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
dbfd3291-ea21-45c3-a298-3b1cfeb8d71d	7	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
53ab0a14-47a9-4fef-a3d9-11299f7f368a	9	3f7e9308-eabd-4f9a-8cc7-d43c3d848958	2	\N
9a88091d-41f7-4592-b4b3-c38bad74a822	10	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
072a21b5-c64b-4a3d-93c0-b417ba194cba	1	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
6e4d3ff0-6d16-48b9-9256-600f1c959e55	2	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
34bdfb85-7c63-4021-89e8-5004b0f6a8b6	8	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
52ae4f00-bb0b-4aa7-b531-7869c256cb84	4	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
35af151a-c56f-42ae-aab1-9df96d182d94	6	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
4c3c57db-048e-426c-aeca-c00dbadb6f53	5	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
7a6bff89-674f-4f01-ac09-35a28b4011ca	7	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
714ee1b5-871a-4c4a-9b93-ad2b60a1f9d0	3	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
bb6f01d9-a345-441d-b6fd-21cc6ca4907e	9	a25b42bc-0576-4936-be2f-4eb8136417ce	2	\N
b0e772f5-e777-4c3d-86e7-b3eb35cf4a3d	10	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
e4137996-b278-425e-813b-56135d934d1a	1	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
9a9da23a-aa92-4c5c-b8a6-11ea33e8b602	2	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
b0248141-264c-4506-bfa8-20a6abfdd8ed	8	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
5c7e014a-1488-4a33-9b43-c8607e9aadbc	4	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
a3876541-2d6b-4d67-aaa8-4e64fbd43566	5	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
b562773a-e7df-4564-ab5c-d1984bc10157	6	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
11cc8c44-178c-4122-83a2-fa6ae6721d78	3	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
7c215f4c-9980-4c10-b61a-45a100e66133	7	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
d18fbef6-c870-40c5-bd88-41ebb4b744f5	9	fa6db026-55f8-41ab-971f-b2ccc1bb9bb6	2	\N
40306bff-bf0c-4049-af45-c134abfdd1c1	10	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
d15dc68d-e3a6-4462-9de3-4618f18d60d7	1	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
311696dc-bd56-4e74-835a-2d366cc4b2ac	2	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
fa8be374-23a3-4038-aec7-f0fdcedd4a2c	8	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
a95d0935-05b0-4981-a139-f3d10d587c61	4	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
d3ca2d81-cf9e-4f57-a2f8-70887d763c4a	6	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
6edf1650-49fb-4ac5-9db7-e92d5026885a	5	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
ee0744c3-31ad-4a89-a7bb-276baf069767	3	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
fdd82ae0-f1ee-4c49-8ec9-0d6ca7724a15	7	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
1b007797-4d7c-449e-8ea1-fbf6075f5ee8	9	faef09e7-1275-4854-88d3-a50aa90e0a47	2	\N
5b332240-991f-4a9d-ad4c-b5881ff1477b	10	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
53c567fe-5efe-423c-917d-2a928f8ee580	1	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
51afd5d5-f518-4e0f-bed6-41eacb3c1962	2	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
ab7b8a13-384c-48b2-9438-b63c5a1ec70b	8	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
fdb2464c-1238-4e16-9f43-9641949f259c	4	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
78859b7c-2371-43bc-b506-09811bf4aa7a	5	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
7158d76b-5482-421b-8315-c4b34d92d9ac	6	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
feb462f0-17fe-4247-8624-8456941b4f6c	7	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
2a9a6d07-b176-4457-b246-af984432589b	3	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
7a7d07e1-f9dc-49ee-b6f6-1753f06531ec	9	f0004dea-f619-4f42-a87a-bda3a9129aeb	2	\N
a9f56fd8-2b78-4281-8005-ba4746b5a750	10	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
5527e50c-34f3-45cc-a7b8-7556a6fb8a9a	2	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
2d148952-a3af-4cef-b492-05c0764071f4	1	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
3b99ecf6-3479-43ca-8ad3-8c28e260ce99	8	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
da262f22-6aaf-4288-87af-91d7fe526105	4	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
ddabc3da-fe81-4cfc-8a23-e4b02b16bbc2	6	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
73046252-cb5d-48e5-965a-3983fb4f0594	5	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
1ab7e955-45d1-47a5-a4c6-65c4de5e97cf	3	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
31d67a6c-08cc-4bce-b9ea-f2a973f3207e	7	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
2850c5e9-0ea5-47eb-be83-05b04f354df0	9	25912394-202e-42a9-a3e8-07dc2d4e6178	2	\N
35678ccf-dedd-43f1-8bce-f8290df66b81	10	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
0bce5328-94c1-421e-b3b1-ef7fd2c9a07f	2	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
10bc17f9-0ca6-4201-8c81-b2e35bdb0263	1	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
bc8ba7cc-ef66-46e5-b4e6-cfe461fc88b1	8	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
1c2d8339-7d7b-4090-8bfa-6c76cda491e3	4	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
199aafdb-634a-4d4f-bbe4-5a67d13dc3b4	6	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
47a7897e-8e4d-4c6c-879c-92e4673b5c54	5	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
04c8018e-f9b0-4a58-bdd3-0e0630bba9b2	7	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
ed343d88-5e70-41ec-8bba-2650a40148fe	3	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
781083d4-ae7a-474e-92c4-4bfdb35da837	9	1e92dcd9-2dc4-4fec-a953-e23b27b35e17	2	\N
3596e64b-0de1-4371-b0b4-560239200156	10	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
fc176824-5495-484a-8dee-3466a5f3671c	1	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
c70b74aa-e116-4589-aa09-2000bbe71483	2	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
145603f7-514c-4d59-a05c-fb675b05c8bc	8	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
90913069-3045-4a6f-84ea-fe6f15e6ba41	4	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
bce7a838-4f01-4540-910c-cd771d899ead	6	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
c79a992d-30b7-4ddc-9638-302adb59f35a	5	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
fcc0add6-ec92-47c1-9274-b3ae08b5189c	7	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
dcfb7b0c-3d91-4143-b71a-45863f9fde3a	3	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
40cfa488-c441-4540-b489-8e467e0efdcb	9	bf4ef706-2ed1-49c8-9e6f-23416b29cfd1	2	\N
8b32fb1e-03ce-42eb-957a-2910ed57d998	10	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
d7566972-49dc-4e3a-8708-fa9e7eb83175	2	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
f43e22b2-5697-420f-bc59-ac4bcdd7b3d0	1	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
a9109e11-d937-4c4d-aca7-ae4cb3070207	8	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
eed83fee-8528-4a24-a855-b86b3bfcf562	4	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
30ead4c8-37b5-4d73-8606-22f427aefa50	5	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
a41f605c-3bd7-416f-acd3-5972c08d90f7	6	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
f07d87db-38c9-48f3-91f2-f18f4d2b0c88	7	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
f4c7a59b-2e65-42c0-9f0a-74629b9c8bfa	3	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
1931dcd6-dc4b-4eb9-b12b-443df19848e7	9	6d65476b-9452-4438-8092-fcbf514081cd	2	\N
a31b9743-fa1d-4698-96fd-40c47692f28d	10	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
32bf7301-0414-4c90-a7a8-66913baf9220	2	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
403347d7-b9be-4c97-ac36-7efbefe0f8e0	1	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
13b9023c-632a-44b4-89cf-cc9e07657088	8	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
16b01c87-cc90-408e-b0f8-f66491c8eefe	4	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
8cb3694e-0cb8-43d3-b86f-6014e20d5fd3	6	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
355597d3-686a-4f84-a0b7-24475f51c929	5	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
fb48b9d5-848d-4686-ac47-aa8a55e84a84	3	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
777553fa-151a-4c09-83a4-3670fae23113	7	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
bd28d261-7cc3-423d-8c37-c220907a1249	9	e9127edd-4638-4ce9-a929-b943a2d368fa	2	\N
74daf3ff-16d2-4152-bc5f-cfd6d4531f9b	10	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
70b1b965-e5cd-498d-bbd8-09d892b26d13	1	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
7601b61d-2add-4a29-b11f-2a3c33cdfc56	2	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
8d396f86-ea20-425e-bc85-3a459c2136bd	8	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
b8ddb57c-8493-4c15-901d-cbc2c2d89f7f	4	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
9015f7db-4fe9-444e-9915-e7799eb55cbc	6	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
fab6d7fa-2bf0-42dc-89d5-d4480ecb935c	5	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
8fd4e7ad-75e9-4001-ac6a-c8ccd55210fb	7	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
afc7d6be-6b5b-42d3-ba12-da9e21cecd1a	3	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
1a607e1a-309f-4550-8abe-63b761951ffb	9	58dfb291-eaa3-4ba2-a3b8-00a394a16d60	2	\N
0eedc05c-8b53-49ba-9107-6de6c8d8a273	1	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1	Test npc
\.


--
-- Data for Name: npc_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.npc_text (npc_id, text) FROM stdin;
0eedc05c-8b53-49ba-9107-6de6c8d8a273	Howdy!!
0eedc05c-8b53-49ba-9107-6de6c8d8a273	Hello!
\.


--
-- Data for Name: player_statistic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_statistic (id, knowledge, user_id, username, course_id, current_area_id) FROM stdin;
6ee03d4d-af5b-4349-9c40-cbb8e5bba3e3	0	1	Maik	1	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3
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
6ee03d4d-af5b-4349-9c40-cbb8e5bba3e3	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3
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

SELECT pg_catalog.setval('public.hibernate_sequence', 2, true);


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
-- PostgreSQL database dump complete
--

