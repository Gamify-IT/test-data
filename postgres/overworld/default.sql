--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

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
    course_id integer
);


ALTER TABLE public.minigame_task OWNER TO postgres;

--
-- Name: npc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.npc (
    id uuid NOT NULL,
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
\.


--
-- Data for Name: minigame_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.minigame_task (id, configuration_id, game, index, area_id, course_id) FROM stdin;
58fdb041-d376-409a-90bb-52cc4f607168	\N	\N	7	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
1527f59d-7797-44bb-89eb-cce3ee73dfbb	\N	\N	6	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
07c15751-08ba-4f0e-a51d-3d64726e4428	\N	\N	8	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
74cd15ff-8fb9-4b30-9a74-bbe3735869a3	\N	\N	11	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
8a221278-d341-4618-98f7-7abd1fa2e431	\N	\N	4	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
67a5a78c-b824-42ee-adba-d0f82be8b371	\N	\N	10	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
1837a281-5fab-4f96-82d3-635bd3e78c96	\N	\N	12	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
27ca6eaa-fdea-4833-917b-f330c2f91f0f	\N	\N	2	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
3648b70c-722c-412b-bff2-73b520ffdbf5	\N	\N	3	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
0770c651-0856-4158-b7ae-88f4878b5c17	\N	\N	5	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
41b4bfa2-9e0c-433e-9c77-8d51529fe3c1	\N	\N	9	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
419dc1c5-f3d4-4ce5-aea4-d725158fc35e	\N	\N	7	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
515dac09-f85d-4fef-ba6a-4bd71a5704e6	\N	\N	6	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
a605ca42-f0c4-4a7e-b8ec-32f6d0d43ee1	\N	\N	8	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
15136fb6-9658-4c83-9b2a-b2afab49f675	\N	\N	11	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
372d2f0a-421d-4fc7-b2c2-76a2e53dc286	\N	\N	4	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
681f9b41-d383-47a7-a571-4dad0ead835e	\N	\N	10	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
e59f9c8e-835c-4cb3-a85d-ca60a1d6d4b3	\N	\N	12	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
b27fd32d-cee6-4fcf-b67d-74856e476916	\N	\N	1	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
481b84fe-9e93-4d24-860e-264a6c0bcf30	\N	\N	2	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
177a5146-2720-496d-b2ab-27fee2ea5f31	\N	\N	3	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
32bbf2ee-e242-43ac-ac40-6e2d47ddeef0	\N	\N	5	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
1b131cb5-9d50-4f86-bed3-04b849fda88e	\N	\N	9	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
91f68abf-deb9-47af-a5fc-760561f41527	\N	\N	7	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
87c235e9-622e-47aa-95fd-88857b179c00	\N	\N	6	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
e2f52572-4ce0-4e6f-9ad9-9d7289ef23cb	\N	\N	8	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
4ec9394d-a50f-4f0a-95c5-e2ccbd457032	\N	\N	11	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
ed8ec599-377c-47a7-bfae-ccaa493b8e32	\N	\N	4	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
80f12240-6df5-451c-abfe-60cad835c073	\N	\N	10	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
f9461fe7-d1cc-47b1-aaa5-0e4a7ffc500c	\N	\N	12	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
5557a63b-c5ba-4c46-ac07-053df7d40edf	\N	\N	1	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
cb19136b-69b3-4fed-94a8-5fab0aa4bc89	\N	\N	2	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
3f696ad2-5a9f-49ef-8e98-ed157347afe5	\N	\N	3	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
49f520c8-b0d5-4ebe-a24f-045ccb30af0e	\N	\N	5	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
0edc94b3-413d-49c2-a583-61d724049be2	\N	\N	9	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
a3eec8ad-e632-4e71-83c2-c4ff29d259aa	\N	\N	7	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
772405b0-ef5a-4572-aa06-6d0d16dbea17	\N	\N	6	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
8be5af24-b9f7-4e86-8cf5-cf484625c985	\N	\N	8	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
0b733bdc-b79b-4452-8d58-776ed574e77a	\N	\N	11	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
23a48d49-fce7-4a18-8fca-86f989eb3e94	\N	\N	4	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
760940ba-4d17-4055-b3b7-e0cf49a37512	\N	\N	10	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
0763be19-d3e8-4a0d-9689-3b771ce3455e	\N	\N	12	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
5d52ddc9-1781-47ea-881c-2fb5cac0012e	\N	\N	1	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
d68a1d70-324a-4521-8af4-965afbb77cae	\N	\N	2	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
dc79ca00-0d0b-4742-b302-82741d728fee	\N	\N	3	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
823430c9-02fe-415b-ba13-0cb3a32e72ea	\N	\N	5	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
1b30adf9-516f-47fd-b94a-275ddd4e21e8	\N	\N	9	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
62e3ebf5-dd4c-46ea-8e4e-ced3985b9fef	\N	\N	7	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
4782e644-b047-4193-990d-9ab90da6696f	\N	\N	6	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
f49c733a-35d9-4e0d-87c0-d44641007fcd	\N	\N	8	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
486a3fa0-6133-4175-8f64-d14f06899b30	\N	\N	11	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
64f63f34-4749-4715-b39a-859831d8862b	\N	\N	4	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
ff2992e5-852e-4e04-a78a-076f32f18e02	\N	\N	10	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
86892e58-bfeb-4719-8ef7-c7d9bc01a58c	\N	\N	12	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
d427961c-663d-4341-8808-fe73f7cbbd81	\N	\N	1	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
0fe34899-dd56-46b3-806f-261adc310000	\N	\N	2	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
0d1c9b8b-de24-4b8a-a90d-284793732efa	\N	\N	3	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
3fa14eb9-4c03-4499-b3cf-cb436f2fc5d4	\N	\N	5	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
5e419152-7e72-4c40-99cc-b25315173ed1	\N	\N	9	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
4cc1efc6-4005-4124-bcf0-85f2182c81c1	\N	\N	7	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
886144b5-3802-4fa2-ba7b-8aed055fa203	\N	\N	6	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
b591c02d-796d-40b4-91dd-104a726b3006	\N	\N	8	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
d8b08984-a569-4e10-8866-1cc1b17c6092	\N	\N	11	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
70d41876-cc0f-4c81-8628-c6d1c8b45f61	\N	\N	4	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
4912b617-7992-46b7-83d1-f88182be7d0c	\N	\N	10	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
50e0ced4-f26f-4cc7-8c2f-e6583e6f781f	\N	\N	12	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
3cfe0f0b-bbf9-474e-99ae-668b09d3bca1	\N	\N	1	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
dac0ecc5-a20e-44df-9f49-071bec950cdf	\N	\N	2	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
d53e4b01-f476-4fb3-885c-b6d69729c590	\N	\N	3	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
8067b12f-c241-42bc-b9c1-b71796b7fcef	\N	\N	5	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
d10827a0-2f09-4ec9-aa5b-8c07f21be8e2	\N	\N	9	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
3a15b2d8-7bc3-41b0-b4c2-a5d56c9704df	\N	\N	7	26be4da3-0c43-4aab-b783-856672e5427b	1
8a701c30-a468-47e2-9fda-8ab819c81190	\N	\N	6	26be4da3-0c43-4aab-b783-856672e5427b	1
57660fa8-b6de-4210-90e2-e93bad21187d	\N	\N	8	26be4da3-0c43-4aab-b783-856672e5427b	1
a53f5edc-950f-449d-96c3-72359f45ed94	\N	\N	11	26be4da3-0c43-4aab-b783-856672e5427b	1
4b09050a-9f85-4566-aec7-7743d9dbfcfb	\N	\N	4	26be4da3-0c43-4aab-b783-856672e5427b	1
2369ce32-1c98-45b2-98c4-c5331c8a811a	\N	\N	10	26be4da3-0c43-4aab-b783-856672e5427b	1
3e00c145-a287-4025-bd73-3a458b5b3529	\N	\N	12	26be4da3-0c43-4aab-b783-856672e5427b	1
07b990b1-747d-4631-8034-475e4c0c7ea2	\N	\N	1	26be4da3-0c43-4aab-b783-856672e5427b	1
b4aef722-217c-4012-8e62-1453eacdd9b2	\N	\N	2	26be4da3-0c43-4aab-b783-856672e5427b	1
b495240e-fd5c-4ae7-a8ca-a91e6c41a860	\N	\N	3	26be4da3-0c43-4aab-b783-856672e5427b	1
e210d13d-4dd7-44cc-9396-9c0577ca580b	\N	\N	5	26be4da3-0c43-4aab-b783-856672e5427b	1
7fab7273-c1f9-4da6-a409-7ab65ec5766c	\N	\N	9	26be4da3-0c43-4aab-b783-856672e5427b	1
42862f09-4a2e-46e5-9e50-d783d9618be7	\N	\N	7	351488de-5c35-4445-89a6-0217da326e5c	1
6d4c1874-6593-4574-a64a-9f9b96c309b4	\N	\N	6	351488de-5c35-4445-89a6-0217da326e5c	1
e72f0f3e-577e-4672-b406-32da87f5e0f1	\N	\N	8	351488de-5c35-4445-89a6-0217da326e5c	1
4b82d2a5-4d76-4926-984a-126dc281db66	\N	\N	11	351488de-5c35-4445-89a6-0217da326e5c	1
648c7908-cded-474f-bd03-6d155851b254	\N	\N	4	351488de-5c35-4445-89a6-0217da326e5c	1
4ec10077-2358-4b38-858b-a2f83ab91ea4	\N	\N	10	351488de-5c35-4445-89a6-0217da326e5c	1
b2cff975-f0fd-44e1-b486-daa2e8804bcd	\N	\N	12	351488de-5c35-4445-89a6-0217da326e5c	1
1d704e95-91e4-4339-ac27-19e153a0797b	\N	\N	1	351488de-5c35-4445-89a6-0217da326e5c	1
c3c97387-d7cf-4d70-abe9-55f7b0e058d8	\N	\N	2	351488de-5c35-4445-89a6-0217da326e5c	1
d5668093-980f-46c7-bc10-277afaad0468	\N	\N	3	351488de-5c35-4445-89a6-0217da326e5c	1
b4dcb323-99f6-47a8-8ed6-81eae709eb82	\N	\N	5	351488de-5c35-4445-89a6-0217da326e5c	1
ffa40b27-5e14-4e8f-a577-a71e1c876965	\N	\N	9	351488de-5c35-4445-89a6-0217da326e5c	1
3ff6734b-88aa-47ce-b587-54255c790f3d	\N	\N	7	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
5d0274b8-4bac-4bda-a0b9-875aa9df659b	\N	\N	6	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
7e6a4fe7-db1b-4e42-a714-640fe17626eb	\N	\N	8	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
dd2f2038-0c8c-4db9-aafb-baaa845c1047	\N	\N	11	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
4d8bc3d7-721b-4c35-9211-a660769c2812	\N	\N	4	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
d1ca7862-0e13-46b6-b4a5-56cd635c67d4	\N	\N	10	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
404cdbfc-43d0-4ca8-bf4d-9a2715f274ab	\N	\N	12	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
d8cc45bf-5735-4f80-8b55-8d09b20cad08	\N	\N	1	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
7ad0b6d3-21de-4d60-9e41-7c8d405676e7	\N	\N	2	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
583118a2-2f3d-40b8-831a-e425742fad61	\N	\N	3	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
63440c16-5fa8-42fa-8a2c-332a125b9374	\N	\N	5	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
0acefa4e-2921-4466-8647-4a0d2fba15b6	\N	\N	9	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
ca372ae4-cee4-4165-8221-e26ea03e6de4	\N	\N	7	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
1f48b25a-41f9-4ee3-926e-e21282fa30c8	\N	\N	6	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
aa1e9e9e-7b83-4705-8af1-efa98cbce656	\N	\N	8	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
1d96a115-b396-477b-a482-81b401d94c5d	\N	\N	11	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
dbcf9a68-599c-4917-b228-22d916d0a66a	\N	\N	4	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
984be6a9-1c2a-49e9-a4d8-81ed061a5d45	\N	\N	10	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
b64ebf62-f069-4e2f-a96b-f65ad7d20e06	\N	\N	12	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
bf13ed03-5b71-433b-99b9-658b270d819e	\N	\N	1	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
c89d3b02-9e88-40cb-9f63-a55341d160fa	\N	\N	2	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
cff0b772-c7dc-4da6-a7fb-be0df3ddbc26	\N	\N	3	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
6fbb160f-84ef-4806-8579-cb3ccf5d4161	\N	\N	5	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
9ad6cc18-438e-4767-b126-521d5a085b77	\N	\N	9	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
b2108304-518f-4cc6-a0d9-d1440377d699	\N	\N	7	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
87409b75-3054-4cec-a699-63c32c4c1df5	\N	\N	6	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
8a9dbf27-8de2-4002-b1b3-cb7dd709b78e	\N	\N	8	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
339b74d0-7067-4783-a521-7667bbc56b92	\N	\N	11	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
52ab7a0f-6de1-42b2-bdf1-1a24128222e0	\N	\N	4	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
c26f1397-19d6-4106-a0c2-ea76f43dc2da	\N	\N	10	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
dd7dbc48-e273-4585-8b57-14bc4dc74527	\N	\N	12	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
396d53d4-985b-4106-9bca-4a658f0038a1	\N	\N	1	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
180aa5e6-4977-4e0f-ae5f-29abf59c7824	\N	\N	2	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
a65ca80e-c54a-436e-94ed-fb85ad62bb47	\N	\N	3	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
d6b56378-265c-4538-a1c3-04f8d7c48898	\N	\N	5	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
beb4be93-b027-4a4b-8891-3f14a7859d8c	\N	\N	9	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
0919ff4f-84c8-4da4-8afe-fe9af80e9eb8	\N	\N	7	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
5b8270c5-d74d-4180-8f0d-5df43c3212c9	\N	\N	6	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
e71f0ec7-6efe-4a19-b338-6435a6cebbe5	\N	\N	8	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
fec38a87-f43c-4ffe-87c8-36e3bafb78db	\N	\N	11	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
6ef72fe4-19fd-44b9-bf06-d4ffad75a9a6	\N	\N	4	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
ca69fc1f-3548-4131-9238-9da9f171c14b	\N	\N	10	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
2912e5d3-a477-4245-aa80-5d58117b2e17	\N	\N	12	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
c589733a-1a1c-4ba1-91d8-848184d117d8	\N	\N	1	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
6b037898-3c14-4962-b348-f1d0ac68a103	\N	\N	2	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
809dd4c1-c36e-4beb-91ac-833d769d7245	\N	\N	3	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
de4ac1bf-e5be-435b-9369-4c5d8fecb069	\N	\N	5	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
c96eba51-8e1f-4696-8ec5-65e9d831bf15	\N	\N	9	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
a6fca17d-9382-4021-8921-b58c60504c02	\N	\N	7	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
651323dc-1a71-47a5-adee-f4195075080c	\N	\N	6	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
896984b0-7c75-4cdf-a453-4054cc1d9caf	\N	\N	8	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
83e9f7b0-fc38-4512-a7fd-eabcbd54f994	\N	\N	11	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
c0da56c7-24b5-49e0-93f8-a9cada828986	\N	\N	4	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
ba677353-6904-43d5-a7e9-c54010636ae3	\N	\N	10	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
971440b3-9186-4a63-b594-9c80cde80c89	\N	\N	12	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
cf5c28e5-aac3-4af9-b917-b189e6f60660	\N	\N	1	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
575bcd8c-59cc-41de-8297-c8caac280fef	\N	\N	2	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
81818fca-1512-4812-b14f-86ab855e68d8	\N	\N	3	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
cb23f6b1-acc7-46f6-97b6-e1c661792ca8	\N	\N	5	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
06a61595-dcad-48ba-a7b3-f889133f54b4	\N	\N	9	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
68358f3e-356c-495d-9b27-ea9402e38f8d	\N	\N	7	59616e13-3367-4ce1-bcae-3ba14a12d965	1
581f2ce5-bedb-4366-8ad0-e604a60f874a	\N	\N	6	59616e13-3367-4ce1-bcae-3ba14a12d965	1
a5f7f283-a243-43a2-bc2f-03c3d6f1e527	\N	\N	8	59616e13-3367-4ce1-bcae-3ba14a12d965	1
35321cd2-8fc7-4145-9922-52cfc67d9845	\N	\N	11	59616e13-3367-4ce1-bcae-3ba14a12d965	1
fd46a785-24d5-4c9c-a7fa-c425f405a210	\N	\N	4	59616e13-3367-4ce1-bcae-3ba14a12d965	1
e6ab77f7-c558-4346-acb6-4e874086099a	\N	\N	10	59616e13-3367-4ce1-bcae-3ba14a12d965	1
b5709bf8-fe38-4bc3-b047-f56837808fe9	\N	\N	12	59616e13-3367-4ce1-bcae-3ba14a12d965	1
0d247e5c-7b6d-44fc-b3c7-e67d0c1d5f1e	\N	\N	1	59616e13-3367-4ce1-bcae-3ba14a12d965	1
eb273424-ef39-4b75-909c-17b105166969	\N	\N	2	59616e13-3367-4ce1-bcae-3ba14a12d965	1
5e0d957f-59e1-4c80-8c63-37560d8ab18a	\N	\N	3	59616e13-3367-4ce1-bcae-3ba14a12d965	1
5fced5ee-e66f-46e5-8033-ead4df1c0b9c	\N	\N	5	59616e13-3367-4ce1-bcae-3ba14a12d965	1
488ebedd-d864-471d-b7b5-fc5a29a5a27d	\N	\N	9	59616e13-3367-4ce1-bcae-3ba14a12d965	1
fcb36929-5ee8-48d3-a433-509e4ef0408a	\N	\N	7	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
c258de8d-f7c8-4c81-9504-e4de53266b3d	\N	\N	6	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
56e3ecba-aa84-498c-928f-16a242920893	\N	\N	8	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
e2f32002-a569-40a2-af63-5acea287d208	\N	\N	11	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
2112fbf2-876e-448a-9eff-db510123c895	\N	\N	4	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
827c1c08-68fc-4fe8-be00-3cce8016f989	\N	\N	10	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
0e166a0e-4bdb-40bd-aca7-afb1e721b5d3	\N	\N	12	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
0959b3e9-3f80-4aae-8c84-f31d49aa0ac5	\N	\N	1	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
9d620a8b-28a7-4d44-a748-71039407d7db	\N	\N	2	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
ce3c2e99-7e07-49b9-b0c1-d76197fc114d	\N	\N	3	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
aac664a6-f945-48d4-a3ce-b7ca6040123d	\N	\N	5	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
5615a0a6-b8b3-46fe-8e3a-62327ee00537	\N	\N	9	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
d07cca2a-ab1d-4e4e-8ed7-021c67a319ec	\N	\N	7	8ce6bee0-0202-42a1-a944-438dd77309cb	1
26ea9dca-f00a-43e6-b42b-7e4e56e5fc3f	\N	\N	6	8ce6bee0-0202-42a1-a944-438dd77309cb	1
add69d35-0bc7-40b0-97ed-66b0066bf34c	\N	\N	8	8ce6bee0-0202-42a1-a944-438dd77309cb	1
79cc12af-ba09-4877-b4fd-c2f0ce9f5257	\N	\N	11	8ce6bee0-0202-42a1-a944-438dd77309cb	1
0fdd7b28-0c2b-4c05-9f49-2469f67fe025	\N	\N	4	8ce6bee0-0202-42a1-a944-438dd77309cb	1
7ce1cc84-6428-4604-919f-e1f7f76e699e	\N	\N	10	8ce6bee0-0202-42a1-a944-438dd77309cb	1
9602bce8-5f49-45c3-8b41-eb2aca889ec0	\N	\N	12	8ce6bee0-0202-42a1-a944-438dd77309cb	1
7e25eb3e-707e-4486-a1a5-45d964ca9e0a	\N	\N	1	8ce6bee0-0202-42a1-a944-438dd77309cb	1
5064c936-e34c-4afb-8f4d-19c5d3058e8c	\N	\N	2	8ce6bee0-0202-42a1-a944-438dd77309cb	1
ff0f7bc7-63d4-49a1-93e2-3ec2aaa644cf	\N	\N	3	8ce6bee0-0202-42a1-a944-438dd77309cb	1
83bdeee1-a379-415e-9cf8-935a52407348	\N	\N	5	8ce6bee0-0202-42a1-a944-438dd77309cb	1
25693759-601b-4230-86fc-01fc67385259	\N	\N	9	8ce6bee0-0202-42a1-a944-438dd77309cb	1
50be9504-14b5-4563-a841-8d2d38e40703	\N	\N	7	277facf5-f177-43e8-886e-e9520f8a1e58	1
560fd7ea-0033-4d81-91f4-41672f898800	\N	\N	6	277facf5-f177-43e8-886e-e9520f8a1e58	1
66ff9b56-7cbb-40e9-9a04-4701ac41cdad	\N	\N	8	277facf5-f177-43e8-886e-e9520f8a1e58	1
db71371e-6584-4de2-86a5-31143c97424f	\N	\N	11	277facf5-f177-43e8-886e-e9520f8a1e58	1
2a3fd83f-4303-4169-92e1-5759fb9e6404	\N	\N	4	277facf5-f177-43e8-886e-e9520f8a1e58	1
44c688ba-0d24-4f67-b1c7-51a96d82b573	\N	\N	10	277facf5-f177-43e8-886e-e9520f8a1e58	1
f110133c-3c94-4402-9e29-9edc4af367fa	\N	\N	12	277facf5-f177-43e8-886e-e9520f8a1e58	1
1a44e8cd-7908-49c1-b03c-1f1b36a740eb	\N	\N	1	277facf5-f177-43e8-886e-e9520f8a1e58	1
310358cb-0734-4b6b-a20b-b0cde2b533fd	\N	\N	2	277facf5-f177-43e8-886e-e9520f8a1e58	1
1cfbc939-b719-448b-b934-8a838e82fc94	\N	\N	3	277facf5-f177-43e8-886e-e9520f8a1e58	1
74e3c5ef-e9fb-4aa8-978a-0681a54f70e1	\N	\N	5	277facf5-f177-43e8-886e-e9520f8a1e58	1
dbaaa48d-16ff-4edf-86f2-f15ab0902d80	\N	\N	9	277facf5-f177-43e8-886e-e9520f8a1e58	1
738d23b9-6314-42a9-b296-a140ed73dd90	\N	\N	7	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
bc4573df-9bfc-4931-a1e2-18b885b983da	\N	\N	6	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
ce59bf90-1178-469c-9533-93ed82d22511	\N	\N	8	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
11a7b7a9-f172-4aa4-b643-a80345de980e	\N	\N	11	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
175c8101-ae49-48b5-ba33-694ba289f430	\N	\N	4	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
87ba475c-a445-4a27-8470-c2e5f8769085	\N	\N	10	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
1658726f-86e3-4b12-a179-5de415c4fa88	\N	\N	12	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
8f17771d-8f72-4b6e-bcd3-72ccd3faeb5c	\N	\N	1	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
a5ba06ba-1508-4e37-b657-8e9a02cfc4f3	\N	\N	2	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
e4244178-159c-42b6-b478-5e9306442ef5	\N	\N	3	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
d66c79f1-103e-4dba-a8c9-90eab7bb3365	\N	\N	5	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
914bb778-beab-41eb-8657-6099f4ac6104	\N	\N	9	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
75b8ca71-ecdb-40e4-b512-73c3c4560748	\N	\N	7	86f950f5-482f-4385-a2ce-052586067f5a	1
18f471cb-49b4-4773-a2fd-5d02f94ca22a	\N	\N	6	86f950f5-482f-4385-a2ce-052586067f5a	1
2244d600-2283-4b46-a320-d78a54771b34	\N	\N	8	86f950f5-482f-4385-a2ce-052586067f5a	1
c5090b66-ab7b-40b7-b5f4-932b23451674	\N	\N	11	86f950f5-482f-4385-a2ce-052586067f5a	1
e4977146-1fd4-4dda-97da-67337f8af9a7	\N	\N	4	86f950f5-482f-4385-a2ce-052586067f5a	1
91319a64-b571-4742-8cbf-86de9106b745	\N	\N	10	86f950f5-482f-4385-a2ce-052586067f5a	1
6b7121e9-58e8-445f-ac07-a34862428e71	\N	\N	12	86f950f5-482f-4385-a2ce-052586067f5a	1
89bf8ce4-7782-4094-9891-5c6531bff7dc	\N	\N	1	86f950f5-482f-4385-a2ce-052586067f5a	1
5d61d950-54db-4349-8cb9-b9947b339d00	\N	\N	2	86f950f5-482f-4385-a2ce-052586067f5a	1
3457eb8e-ad73-416b-8b4f-5f40f7e99ae2	\N	\N	3	86f950f5-482f-4385-a2ce-052586067f5a	1
f37250b3-7f28-42e6-abcd-a8cc9951a3b1	\N	\N	5	86f950f5-482f-4385-a2ce-052586067f5a	1
f2277178-41c5-40c8-8cac-9ab7a23f055c	\N	\N	9	86f950f5-482f-4385-a2ce-052586067f5a	1
d873d035-a426-4b4f-9ef0-228d2952c21e	\N	\N	7	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
4e55878c-613a-4990-bef1-1e626b855486	\N	\N	6	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
8175e0e6-dcd8-4b44-8aaa-9abbeb89d1a8	\N	\N	8	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
34d598e0-d78b-4e41-a3cf-d3b3e2ed294e	\N	\N	11	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
3f9fb6d5-9475-4ed6-b440-ebc3245e1ad6	\N	\N	4	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
50be1528-3267-4e5d-9fc2-6dac9b35c3f0	\N	\N	10	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
99f242db-c6fb-4cee-b43f-fd71dccf2d3c	\N	\N	12	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
8eae5ba3-a639-4287-86d9-3bcdbf6e2e62	\N	\N	1	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
1eb5cac2-4c4a-4113-bdcd-976e656f704d	\N	\N	2	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
02cbbbaf-9334-4bd1-ab8a-af131338bd4e	\N	\N	3	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
38d04012-3ab7-4f42-a979-225cbd5f37da	\N	\N	5	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
b380a336-c40c-40ab-92fa-1152214f50a6	\N	\N	9	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
c4310355-a449-4408-8fe1-998f8941a748	70fcd00c-b67c-46f2-be73-961dc0bc8de1	CHICKENSHOCK	1	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
\.


--
-- Data for Name: npc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.npc (id, index, area_id, course_id) FROM stdin;
79a2a848-5540-4af2-ad8c-ae362ad956b8	9	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
aa1239c3-12bb-4f12-9db0-3a1d711361df	3	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
ac9384bc-f7ab-4b7b-8eba-fabf3d237bcf	7	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
0eedc05c-8b53-49ba-9107-6de6c8d8a273	1	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
4f83114f-909b-49d3-9b35-5455a0c4d307	6	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
5cd60ca7-1ea7-45ad-99dc-f1656a3665ac	4	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
8f5551e3-d6f2-4b21-8d97-54ef0351b38d	8	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
6728e8ca-af7c-4e50-829c-e4c297a691b6	2	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
5228c86b-dad2-43ea-96ff-f726f4a301c0	5	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
e8a08bfa-a6c6-46e9-9e43-2db974e7bc85	10	2348aa33-1ffd-437d-a1c1-510ef6b1a8a3	1
d18f0bc0-9650-40e8-80e7-0b0fe0630c30	9	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
798ac637-cca0-45fa-a24f-74a5d940c214	3	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
024ff217-e067-4616-a637-05da368082c5	7	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
bac7b420-f150-434a-ba12-0514324872b2	1	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
5f97ec40-5a76-4616-8f48-47bcbc5dad3c	6	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
03558060-87dc-4aec-90e8-0e20e9bc20ca	4	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
3adeefb7-0a64-49c5-a68d-a51ee5746451	8	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
09a89ad0-ae78-4a65-b968-77a2556494bb	2	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
7a8442d8-c98b-4f1b-94a7-907f8b14f93b	5	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
db70f056-eda3-4917-8865-f5ba2ff0af3d	10	c9a4d5bf-1c63-4580-9ce6-888e7ac308ee	1
465c7c96-811b-4c5e-86c1-19ca0f26d077	9	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
53773563-c732-4462-9098-03880c5b76f7	3	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
702ed12b-235d-4e94-860e-aa08e4dbbb21	7	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
254dd08a-1ca1-4ed4-95f6-e954c686dcd6	1	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
4cfbbdaa-0af9-4a90-944a-01a6ce7a91d5	6	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
04e5dc1d-8237-4557-ac4a-f9d3ddd1ed6d	4	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
400a9590-c94f-4b8e-869a-00823266505a	8	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
d1ba22ad-cd97-47ca-b748-fde42165f0c2	2	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
40f728de-5d85-4d5e-bcbe-35a45d2b65fa	5	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
188c8a6c-ce71-4683-9308-6dae2788307d	10	adcf84fc-5b67-4e7d-8dcf-dec636abab47	1
7698ece3-211a-4019-8c9e-92c7b21c5d7c	9	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
2f09e935-3088-4498-95a9-041eaa6a2d2e	3	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
221005ba-9b2f-4525-be65-f754859f619d	7	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
43957133-fd92-41e3-a1a5-1e3f60ed7599	1	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
e1e54f48-1bb5-4b76-bde0-af552180039e	6	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
0b24710c-71fa-4b4f-889f-654497ce6b4c	4	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
01b0505f-025e-4c9e-b076-098f4ba35e62	8	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
9a27d8c1-c6a4-4b38-9e0d-5c5008164d82	2	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
3c9d02bf-631f-4fd1-aec0-4591a6a092eb	5	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
d309f5ee-c569-4fa8-a406-0a0ceee67f53	10	ee0d859c-be18-4b8a-8e08-b417e79b786d	1
d41da348-98e5-49b3-b5ca-1b2a66f69a03	9	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
8ea037bc-7e38-4dc9-a44f-b9606cbe9146	3	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
84e46405-1db6-454f-b251-84450a1e0e2d	7	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
cf14c2bb-0bb1-4839-95e0-8378ca1c7124	1	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
c1eff64f-dc7d-4a00-af7d-72b15f4a5e1e	6	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
da9e3170-26df-4017-a4fd-c6fa3b31e17c	4	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
75e2fa59-e81f-4821-be33-80ee002087fd	8	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
3529a8eb-80a8-4e17-89c2-b5102f037771	2	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
ceb9f4a2-91fe-4a37-9367-10ae06b1e0c5	5	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
7cd33d39-eb73-4b8b-bd42-e7c469a8e4e8	10	c2fd389c-07ea-4e89-ba9a-795602c0fbe7	1
a936686c-07b7-46a6-91f4-1529eb10c8f7	9	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
14f295fc-bd2d-465f-a670-ffbb69cf1674	3	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
010f3678-bd4b-4c2f-8460-643768fddd38	7	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
95f7b227-5688-475e-93d6-a968a8a180ba	1	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
2d0a2e20-92a1-445c-bd49-b0d804cf888d	6	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
fd18fa1a-d2b2-4669-a48b-d543befba86b	4	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
2714c66b-4321-4d1a-8ea6-62dde422340d	8	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
97090c22-90e1-401c-a059-f3abb1e89a95	2	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
eba3135f-5683-42d9-97fb-03961a1e6649	5	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
a70e95ca-6551-4c48-9166-9463f0f598dd	10	b27f4217-616f-4a62-9ef4-8bc26cc6cd73	1
fddd373d-b199-4f79-84ca-da38490bdab4	9	26be4da3-0c43-4aab-b783-856672e5427b	1
e5c56261-a7f6-4fef-9176-ca4993ea1bbd	3	26be4da3-0c43-4aab-b783-856672e5427b	1
2e9306f1-807e-412a-8de7-c65f66b4a046	7	26be4da3-0c43-4aab-b783-856672e5427b	1
daebf807-1465-4b44-8acf-0cd2d618f963	1	26be4da3-0c43-4aab-b783-856672e5427b	1
e9ff9e0c-f110-4e53-ab40-4717edc8c7f0	6	26be4da3-0c43-4aab-b783-856672e5427b	1
6aa0cdfa-bb81-4e13-b200-345f83c5ce77	4	26be4da3-0c43-4aab-b783-856672e5427b	1
2ec9f4a5-3625-4d55-ba0f-d82ccba64997	8	26be4da3-0c43-4aab-b783-856672e5427b	1
767cd271-04fe-4cee-8019-e519a0750e31	2	26be4da3-0c43-4aab-b783-856672e5427b	1
0662bbe0-d1c3-4629-bba8-d302143706f8	5	26be4da3-0c43-4aab-b783-856672e5427b	1
5dae1e11-7f35-4d8e-b28f-bd64c26be41f	10	26be4da3-0c43-4aab-b783-856672e5427b	1
112f5874-e806-4003-8b24-fd13fee14e9a	9	351488de-5c35-4445-89a6-0217da326e5c	1
946e30b4-8a38-4996-be69-a6f3b602fef4	3	351488de-5c35-4445-89a6-0217da326e5c	1
081d5884-ee4a-4c8e-b547-0ff7034cd8c8	7	351488de-5c35-4445-89a6-0217da326e5c	1
901a6bc1-8ef5-426f-87fa-04d9f4a1499c	1	351488de-5c35-4445-89a6-0217da326e5c	1
2bc28347-caee-442f-9674-bd462ed53e5b	6	351488de-5c35-4445-89a6-0217da326e5c	1
a680f92a-f40e-46b3-a2a1-66bb5ca5cf33	4	351488de-5c35-4445-89a6-0217da326e5c	1
6c4c0bee-deb4-4418-948a-48cabff340c2	8	351488de-5c35-4445-89a6-0217da326e5c	1
6089cf80-7a02-42d6-b2d2-ef2994c1f60a	2	351488de-5c35-4445-89a6-0217da326e5c	1
891ff251-a7a2-42bb-a725-9e40c3bcddf6	5	351488de-5c35-4445-89a6-0217da326e5c	1
3dbd4e97-5d66-4cb2-94a2-c5f068dd3443	10	351488de-5c35-4445-89a6-0217da326e5c	1
e5916d7b-9dfb-4900-83d8-c704f310a50e	9	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
c0b17e1a-d014-46ce-8269-bb4049b5d742	3	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
9a29a29f-2ef6-4902-a285-7e85b2dba8f7	7	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
6098c6dd-2485-4195-b9ed-6f3c0f41413e	1	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
e382654d-1c79-4a4d-a755-674757486571	6	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
5f13fa6d-545f-4f4e-93e5-552edaffd83f	4	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
5f3ff3b7-d672-467c-abf4-f38f7e5f6ec4	8	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
3f49d9a1-2f7a-4e8e-ad3d-085bf8fddee2	2	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
02cbde76-9e7d-44a3-a594-58759aebf972	5	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
daa95815-0c86-415a-89f1-2d77c7eefd5b	10	e4b4fc3a-39a3-497b-8665-c474a21231d1	1
920e77c2-2530-48fd-a5c9-97a9e36c4ba0	9	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
cdb7a229-9e4b-4b03-a58f-7cd68fa0406d	3	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
ef06dc2f-2001-49c1-b680-19c234ec0f59	7	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
6290b887-91d1-4908-abb6-bc580902f2bc	1	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
56b4e2d3-c3b8-4f9d-b559-faf230298e4d	6	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
5b44c92e-3aed-4aac-b7f3-95223bbcbb86	4	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
79333bdc-7585-4cf5-8d50-cc3986b00462	8	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
42fe66ae-1311-4b98-b2e6-16ddd22d6e28	2	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
f1c62f63-638e-4a8b-8e30-4b4edaa7b62e	5	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
36e4e0f0-0946-4ec8-ad39-1754c80dc02c	10	e6104412-e53d-4dde-8667-94d7a0c8ec1f	1
79105085-f156-4a7a-abd4-434ca1f960aa	9	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
dabbaf56-33c8-4cf6-8668-da8dd914e84d	3	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
3d1f52d4-ff38-4bf5-8af5-07c498fa49bd	7	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
9bba0c5d-6ac7-44c0-88be-7d17f2b4d614	1	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
acb73b87-9b1e-48d6-b326-ac2a0f8e8c40	6	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
7d4c5a1d-d134-479f-9711-e9f0ca738a05	4	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
969d2fa1-162d-45d7-b216-bf093d807c67	8	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
b81c1c55-00bb-4f92-a895-cb918bf64809	2	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
f407ff5c-6e38-4fe1-bce1-3a2248414fca	5	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
918c2b33-161a-4290-bfc8-d8eacd0d25f4	10	8aa23d3b-f352-4bc4-9acc-45b83d4aa3fe	1
677e26d2-4491-498e-a171-0bd02177d9c8	9	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
0fecc54a-223c-4c6d-94c9-1a361b114bef	3	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
e9039b4d-78c4-4e48-9dc9-71af55d4ef79	7	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
cfd597f2-7869-4344-884a-b7d0f48bf598	1	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
2c3d210b-aa67-4d51-8674-6d532e6ff49d	6	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
1ca77586-a4e6-428a-8b88-99dd36920794	4	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
8558c27d-9df1-48c4-af55-aeb36e113a3b	8	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
6335d4e2-3e70-4dd7-b2cd-8735e0918aa0	2	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
fb2c891a-4cc3-46b1-b24a-e2c96c21340a	5	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
1595b759-0ee7-426e-9071-14f4da40bdbf	10	ea1e8d2c-0555-4054-817f-f63edfbdb650	1
5ac01eab-ede3-4a2c-91f6-d3563a53d91b	9	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
6d2cb6cd-484e-4449-87cf-9b2a430d3480	3	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
684db820-0f64-4267-a5f6-3e8bc6ca4645	7	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
aac2e102-9f32-493d-ba99-3bb1fea4f278	1	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
fbc8d70b-321a-46c5-b632-e8be11c39813	6	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
5bb8500c-ac5f-4e2a-9dee-daa46e64e6ff	4	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
621c5623-fa91-48a5-a1aa-964589c7debc	8	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
1585a88d-e5e7-4b83-b19e-9fbdfba94c0e	2	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
8e314b83-b5e9-404d-b8bb-720d0c9e38d8	5	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
56783ac8-b9f0-4672-901b-be55db1f8498	10	02e6ac42-f0de-40f3-8902-db0ba9aa9a56	1
13adea08-9f40-455f-ba70-101cad4f1d26	9	59616e13-3367-4ce1-bcae-3ba14a12d965	1
6d0271a0-a4f2-43b6-85fd-52157838d2ac	3	59616e13-3367-4ce1-bcae-3ba14a12d965	1
b3a901cd-4af7-451a-8d8f-730bb8996ff7	7	59616e13-3367-4ce1-bcae-3ba14a12d965	1
791ceab7-d2f1-460c-b0de-f698687a5404	1	59616e13-3367-4ce1-bcae-3ba14a12d965	1
b7ebab6c-5d65-4b7e-8441-19a717e9228d	6	59616e13-3367-4ce1-bcae-3ba14a12d965	1
781de11a-b87c-4dd8-b24c-6d1b5fb187c4	4	59616e13-3367-4ce1-bcae-3ba14a12d965	1
08a40ab1-c13b-46d4-b4fe-3a446bf73f09	8	59616e13-3367-4ce1-bcae-3ba14a12d965	1
078a127e-41e0-459b-b5a7-365b4f44d0af	2	59616e13-3367-4ce1-bcae-3ba14a12d965	1
4d8387bd-d2c8-4512-907c-c8bac2dd5a16	5	59616e13-3367-4ce1-bcae-3ba14a12d965	1
53e884cf-9328-492c-a64e-e05dc4fb7534	10	59616e13-3367-4ce1-bcae-3ba14a12d965	1
8256453f-ddfa-4711-9385-552e53b8b254	9	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
7ef634c5-04fe-47a0-8b66-feac965d0358	3	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
ef36b0d8-94e7-440d-ac22-4a852beea2bf	7	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
4937cc8a-be5f-4910-8fef-77f102ab76ed	1	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
870785b3-611f-4ade-aef0-893d8bf67cae	6	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
3b0d9acc-a15b-4e51-b4e7-492c7237b7bd	4	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
d190a186-b5d7-4af9-8306-342ae535c710	8	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
35b4c363-0c29-4b8a-ae91-542a58eef089	2	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
db237b40-07b0-4097-8dd6-d1691e4a4f24	5	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
2ffdcb07-e9fc-4b2d-a63b-15ae5f2890b1	10	b46d78f2-fce9-477e-af13-11f4903ee0b0	1
9d45f816-a343-4af0-a7dc-00e954aed649	9	8ce6bee0-0202-42a1-a944-438dd77309cb	1
9b91dd44-8dda-4c94-92b8-e3ac523a6ba4	3	8ce6bee0-0202-42a1-a944-438dd77309cb	1
752ab7b4-c25e-494d-bb14-103eae207a58	7	8ce6bee0-0202-42a1-a944-438dd77309cb	1
b25b5675-2aa4-4e53-885b-c3b5003b28df	1	8ce6bee0-0202-42a1-a944-438dd77309cb	1
4a7b9e27-4fe2-4e40-8390-a3770355eb6e	6	8ce6bee0-0202-42a1-a944-438dd77309cb	1
30a2d510-7f4e-47f4-b3bd-32d7aacc9175	4	8ce6bee0-0202-42a1-a944-438dd77309cb	1
39817a2d-f647-4195-8884-8e3fe623f848	8	8ce6bee0-0202-42a1-a944-438dd77309cb	1
e0f5c24a-3da6-43da-a3c0-ab704951260c	2	8ce6bee0-0202-42a1-a944-438dd77309cb	1
4e9bd07f-e789-4ac6-a2dc-d126f137b64b	5	8ce6bee0-0202-42a1-a944-438dd77309cb	1
e898aaf2-6443-4031-81e6-3eeb165cd678	10	8ce6bee0-0202-42a1-a944-438dd77309cb	1
f0cc147e-2c45-4cc8-ab1e-cabd82fabf8a	9	277facf5-f177-43e8-886e-e9520f8a1e58	1
45b01ab4-c630-4cba-af7c-5a5fb1d2cb4a	3	277facf5-f177-43e8-886e-e9520f8a1e58	1
e9c731dc-94d9-4710-97a1-41de748446ee	7	277facf5-f177-43e8-886e-e9520f8a1e58	1
1ce06cec-2a5c-4119-a5b7-9f6e97fcbd25	1	277facf5-f177-43e8-886e-e9520f8a1e58	1
b80d30e1-7c8b-48bd-8756-781b4d062f71	6	277facf5-f177-43e8-886e-e9520f8a1e58	1
0add3483-461a-41ae-9aa7-fde2bb05f88d	4	277facf5-f177-43e8-886e-e9520f8a1e58	1
7108d325-75c5-4099-87e2-7d459452167a	8	277facf5-f177-43e8-886e-e9520f8a1e58	1
dc9430a1-0101-4c70-a78c-fb51934012fc	2	277facf5-f177-43e8-886e-e9520f8a1e58	1
2f68b2c1-1d4b-4e3b-8955-6326570eba60	5	277facf5-f177-43e8-886e-e9520f8a1e58	1
2f0cbd05-9a80-44d8-8327-a5eb55abbdd1	10	277facf5-f177-43e8-886e-e9520f8a1e58	1
848248d1-f62d-4845-9a37-0f6c2696a5a5	9	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
041b6bb8-d28b-41b3-a64b-a284416c3949	3	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
073c709f-08a8-4262-8a8f-1269a37239a0	7	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
72f0744f-ba3b-4ee7-bd4a-861946207de0	1	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
8eb68e7b-6adf-40ac-a5b5-b4cc3f9deb41	6	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
64740fdf-fd58-4f8e-bb8f-72fecc60b2f4	4	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
0c6f51c9-7bcc-4d4d-bbf8-2b420851b8ff	8	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
881ff827-9985-4d28-b1a8-648469f1828f	2	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
c06a260e-1073-48c1-b413-76939bbfcc9e	5	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
720a3ea4-76cc-4719-92c9-fe1fbbb84475	10	081031cf-ce5a-4c4e-ad28-1556ac125cfe	1
8b5fc1b9-1a18-40b6-8168-96e4475d8f50	9	86f950f5-482f-4385-a2ce-052586067f5a	1
a1b6b2de-e58a-4caa-8833-ee71c3a7bb3d	3	86f950f5-482f-4385-a2ce-052586067f5a	1
c9f5d1c7-1692-453e-8ad0-5daddb072631	7	86f950f5-482f-4385-a2ce-052586067f5a	1
153f13f5-387d-45b3-9626-98ac74f6b5e9	1	86f950f5-482f-4385-a2ce-052586067f5a	1
5655db35-4b77-4c7e-b849-019cedd07835	6	86f950f5-482f-4385-a2ce-052586067f5a	1
311c241e-befe-4c92-b303-e550ffbc2a1c	4	86f950f5-482f-4385-a2ce-052586067f5a	1
0fcdb71e-b9fe-4145-afd7-9aead0679e8a	8	86f950f5-482f-4385-a2ce-052586067f5a	1
02aa00dd-417d-48f1-bd4e-bd22b4d9eda6	2	86f950f5-482f-4385-a2ce-052586067f5a	1
065b143d-3ff2-420a-b5f8-bdb93fbe9890	5	86f950f5-482f-4385-a2ce-052586067f5a	1
3c216dc7-ea99-485a-b954-0dca05630939	10	86f950f5-482f-4385-a2ce-052586067f5a	1
4306ce5e-afdc-46a5-91c5-5a03ce2fb439	9	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
5dd4e823-693f-4a55-bda6-c1d630a0f512	3	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
f3344dc6-bfac-45d5-ae7f-df9eeb5c8128	7	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
31bd6e80-e636-437d-8628-804bb253deca	1	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
badbdb7d-2d42-45ee-a9ce-66d9351f9c2f	6	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
47663ebf-251a-4400-ac4e-2964d1e4754f	4	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
f0ae3f97-e1b0-4fa3-8eba-bd7b3b324370	8	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
a812defb-cd10-404e-a775-c2deb697ce9c	2	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
023c0256-2b82-409e-bea0-ee6505df7b6e	5	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
24480c33-8dd7-47d2-bfd3-ad31bc9bcd0a	10	9249d60d-7c1a-420b-bdf7-a346f2023ac1	1
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

SELECT pg_catalog.setval('public.hibernate_sequence', 1, true);


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

