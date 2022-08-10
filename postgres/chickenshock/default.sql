--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuration (
    id uuid NOT NULL
);


ALTER TABLE public.configuration OWNER TO postgres;

--
-- Name: configuration_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuration_questions (
    configuration_id uuid NOT NULL,
    questions_id uuid NOT NULL
);


ALTER TABLE public.configuration_questions OWNER TO postgres;

--
-- Name: game_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_result (
    id bigint NOT NULL,
    configuration_asuuid uuid,
    correct_kills_count integer NOT NULL,
    finished_in_seconds real NOT NULL,
    kills_count integer NOT NULL,
    played_time timestamp without time zone,
    player_id character varying(255),
    points integer NOT NULL,
    question_count integer NOT NULL,
    shot_count integer NOT NULL,
    time_limit real NOT NULL,
    wrong_kills_count integer NOT NULL
);


ALTER TABLE public.game_result OWNER TO postgres;

--
-- Name: game_result_correct_answered_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_result_correct_answered_questions (
    game_result_id bigint NOT NULL,
    correct_answered_questions_id uuid NOT NULL
);


ALTER TABLE public.game_result_correct_answered_questions OWNER TO postgres;

--
-- Name: game_result_wrong_answered_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_result_wrong_answered_questions (
    game_result_id bigint NOT NULL,
    wrong_answered_questions_id uuid NOT NULL
);


ALTER TABLE public.game_result_wrong_answered_questions OWNER TO postgres;

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
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id uuid NOT NULL,
    right_answer character varying(255),
    text character varying(255)
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_wrong_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_wrong_answers (
    question_id uuid NOT NULL,
    wrong_answers character varying(255)
);


ALTER TABLE public.question_wrong_answers OWNER TO postgres;

--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration (id) FROM stdin;
f0d9bdea-46cc-478d-9b52-e07dcad95bf3
\.


--
-- Data for Name: configuration_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration_questions (configuration_id, questions_id) FROM stdin;
f0d9bdea-46cc-478d-9b52-e07dcad95bf3	8789576a-e34d-43d6-a277-92a0aa78d3aa
f0d9bdea-46cc-478d-9b52-e07dcad95bf3	913506b6-5fe7-4ad3-b996-71ae42ff6f48
f0d9bdea-46cc-478d-9b52-e07dcad95bf3	be741ad3-c070-4f8a-be8a-1516d63f9d48
f0d9bdea-46cc-478d-9b52-e07dcad95bf3	97e75e5a-cc9d-4d26-ba28-21d4023d9371
f0d9bdea-46cc-478d-9b52-e07dcad95bf3	69959070-8b7c-4b8b-93c1-f74d71a74e12
f0d9bdea-46cc-478d-9b52-e07dcad95bf3	4328162c-8e68-46af-bbce-6123c69533e9
\.


--
-- Data for Name: game_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_result (id, configuration_asuuid, correct_kills_count, finished_in_seconds, kills_count, played_time, player_id, points, question_count, shot_count, time_limit, wrong_kills_count) FROM stdin;
\.


--
-- Data for Name: game_result_correct_answered_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_result_correct_answered_questions (game_result_id, correct_answered_questions_id) FROM stdin;
\.


--
-- Data for Name: game_result_wrong_answered_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_result_wrong_answered_questions (game_result_id, wrong_answered_questions_id) FROM stdin;
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, right_answer, text) FROM stdin;
8789576a-e34d-43d6-a277-92a0aa78d3aa	6	1 + 5
913506b6-5fe7-4ad3-b996-71ae42ff6f48	7	1 + 6
be741ad3-c070-4f8a-be8a-1516d63f9d48	x = 2	x + 2 = 4
97e75e5a-cc9d-4d26-ba28-21d4023d9371	3	9 / 3
69959070-8b7c-4b8b-93c1-f74d71a74e12	110	88 + 22
4328162c-8e68-46af-bbce-6123c69533e9	6	2*3
\.


--
-- Data for Name: question_wrong_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_wrong_answers (question_id, wrong_answers) FROM stdin;
8789576a-e34d-43d6-a277-92a0aa78d3aa	1
8789576a-e34d-43d6-a277-92a0aa78d3aa	2
913506b6-5fe7-4ad3-b996-71ae42ff6f48	8
913506b6-5fe7-4ad3-b996-71ae42ff6f48	9
be741ad3-c070-4f8a-be8a-1516d63f9d48	x = 4
97e75e5a-cc9d-4d26-ba28-21d4023d9371	6
69959070-8b7c-4b8b-93c1-f74d71a74e12	100
69959070-8b7c-4b8b-93c1-f74d71a74e12	130
4328162c-8e68-46af-bbce-6123c69533e9	34
4328162c-8e68-46af-bbce-6123c69533e9	23
4328162c-8e68-46af-bbce-6123c69533e9	4
4328162c-8e68-46af-bbce-6123c69533e9	5
4328162c-8e68-46af-bbce-6123c69533e9	7
4328162c-8e68-46af-bbce-6123c69533e9	3465
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- Name: configuration configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (id);


--
-- Name: configuration_questions configuration_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_questions
    ADD CONSTRAINT configuration_questions_pkey PRIMARY KEY (configuration_id, questions_id);


--
-- Name: game_result game_result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_result
    ADD CONSTRAINT game_result_pkey PRIMARY KEY (id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: configuration_questions uk_87jmj05cn4rqb8wfq6qxej42w; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_questions
    ADD CONSTRAINT uk_87jmj05cn4rqb8wfq6qxej42w UNIQUE (questions_id);


--
-- Name: question_wrong_answers fk9thusvh2s8wjgxjf3gkwr7bnu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_wrong_answers
    ADD CONSTRAINT fk9thusvh2s8wjgxjf3gkwr7bnu FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- Name: game_result_wrong_answered_questions fkbmqsqjwwrhconh1qhvfv7nyta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_result_wrong_answered_questions
    ADD CONSTRAINT fkbmqsqjwwrhconh1qhvfv7nyta FOREIGN KEY (game_result_id) REFERENCES public.game_result(id);


--
-- Name: configuration_questions fkewy22y8x7me09uka66yaovavm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_questions
    ADD CONSTRAINT fkewy22y8x7me09uka66yaovavm FOREIGN KEY (questions_id) REFERENCES public.question(id);


--
-- Name: game_result_wrong_answered_questions fkga35xl106v79dtchoimlbicw7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_result_wrong_answered_questions
    ADD CONSTRAINT fkga35xl106v79dtchoimlbicw7 FOREIGN KEY (wrong_answered_questions_id) REFERENCES public.question(id);


--
-- Name: game_result_correct_answered_questions fkgm8p880wwyn9cuuxjuc6yadve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_result_correct_answered_questions
    ADD CONSTRAINT fkgm8p880wwyn9cuuxjuc6yadve FOREIGN KEY (correct_answered_questions_id) REFERENCES public.question(id);


--
-- Name: configuration_questions fkpuxg1dtbsi0no6cj8ynv0f8tt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_questions
    ADD CONSTRAINT fkpuxg1dtbsi0no6cj8ynv0f8tt FOREIGN KEY (configuration_id) REFERENCES public.configuration(id);


--
-- Name: game_result_correct_answered_questions fkrf30lgepnva24yiwi6en9oedc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_result_correct_answered_questions
    ADD CONSTRAINT fkrf30lgepnva24yiwi6en9oedc FOREIGN KEY (game_result_id) REFERENCES public.game_result(id);


--
-- PostgreSQL database dump complete
--

