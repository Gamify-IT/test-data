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
a8e1daea-6bab-4cf0-83d4-f2cf6ba95200
\.


--
-- Data for Name: configuration_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration_questions (configuration_id, questions_id) FROM stdin;
a8e1daea-6bab-4cf0-83d4-f2cf6ba95200	a8724080-4e43-4036-b613-40e2062f6001
a8e1daea-6bab-4cf0-83d4-f2cf6ba95200	0b2dc709-546d-47c2-a2a0-3aedc21cd296
a8e1daea-6bab-4cf0-83d4-f2cf6ba95200	8f9ea8b1-c648-46a6-9469-9b610e86e0a1
a8e1daea-6bab-4cf0-83d4-f2cf6ba95200	39d0c502-41d7-4552-81dc-e2b62db169ce
a8e1daea-6bab-4cf0-83d4-f2cf6ba95200	659f2cf2-198f-4b87-a68d-d8cca9b82e2e
a8e1daea-6bab-4cf0-83d4-f2cf6ba95200	a759c0aa-3448-45c8-bc31-48a2b159a477
a8e1daea-6bab-4cf0-83d4-f2cf6ba95200	c3b99d9a-2888-44d5-ac0d-56b377e81d5e
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
a8724080-4e43-4036-b613-40e2062f6001	10	5 + 5
0b2dc709-546d-47c2-a2a0-3aedc21cd296	6	1 + 5
8f9ea8b1-c648-46a6-9469-9b610e86e0a1	2	10 / 5
39d0c502-41d7-4552-81dc-e2b62db169ce	256	2^8
659f2cf2-198f-4b87-a68d-d8cca9b82e2e	3	2+1
a759c0aa-3448-45c8-bc31-48a2b159a477	2	1+1
c3b99d9a-2888-44d5-ac0d-56b377e81d5e	x = 2	x + 2 = 4
\.


--
-- Data for Name: question_wrong_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_wrong_answers (question_id, wrong_answers) FROM stdin;
a8724080-4e43-4036-b613-40e2062f6001	1
a8724080-4e43-4036-b613-40e2062f6001	45
a8724080-4e43-4036-b613-40e2062f6001	2
a8724080-4e43-4036-b613-40e2062f6001	3
a8724080-4e43-4036-b613-40e2062f6001	234
0b2dc709-546d-47c2-a2a0-3aedc21cd296	1
0b2dc709-546d-47c2-a2a0-3aedc21cd296	2
8f9ea8b1-c648-46a6-9469-9b610e86e0a1	234
8f9ea8b1-c648-46a6-9469-9b610e86e0a1	324
8f9ea8b1-c648-46a6-9469-9b610e86e0a1	31
39d0c502-41d7-4552-81dc-e2b62db169ce	255
39d0c502-41d7-4552-81dc-e2b62db169ce	234
39d0c502-41d7-4552-81dc-e2b62db169ce	31
659f2cf2-198f-4b87-a68d-d8cca9b82e2e	23
659f2cf2-198f-4b87-a68d-d8cca9b82e2e	34
659f2cf2-198f-4b87-a68d-d8cca9b82e2e	35
a759c0aa-3448-45c8-bc31-48a2b159a477	3
c3b99d9a-2888-44d5-ac0d-56b377e81d5e	x = 6
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

