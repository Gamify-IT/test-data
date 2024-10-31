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
-- Name: configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuration (
    id uuid NOT NULL,
    "time" integer NOT NULL
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
    id uuid NOT NULL,
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
    game_result_id uuid NOT NULL,
    correct_answered_questions_id uuid NOT NULL
);


ALTER TABLE public.game_result_correct_answered_questions OWNER TO postgres;

--
-- Name: game_result_wrong_answered_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_result_wrong_answered_questions (
    game_result_id uuid NOT NULL,
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
-- Name: round_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.round_result (
    id uuid NOT NULL,
    answer character varying(255),
    question_id uuid
);


ALTER TABLE public.round_result OWNER TO postgres;

--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration (id, "time") FROM stdin;
70fcd00c-b67c-46f2-be73-961dc0bc8de1	50
\.


--
-- Data for Name: configuration_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration_questions (configuration_id, questions_id) FROM stdin;
70fcd00c-b67c-46f2-be73-961dc0bc8de1	cac917ea-c4c2-461e-92db-7a5497cd70e4
70fcd00c-b67c-46f2-be73-961dc0bc8de1	a3c83db6-b224-41d3-a7f9-a56befa6e1e3
70fcd00c-b67c-46f2-be73-961dc0bc8de1	89fc0ef6-5ccc-497f-b838-8feea770db29
70fcd00c-b67c-46f2-be73-961dc0bc8de1	83148f4b-2d7f-4c73-b5fe-51a002ef8473
70fcd00c-b67c-46f2-be73-961dc0bc8de1	1b65c09d-4b2f-4bce-a76f-48e08ab57cd9
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
cac917ea-c4c2-461e-92db-7a5497cd70e4	'8'       'How many bits are in one byte?'	                            
a3c83db6-b224-41d3-a7f9-a56befa6e1e3	'10010'   'What is the binary representation of the number 18?'	        
89fc0ef6-5ccc-497f-b838-8feea770db29	'27'      'Which number is not a prime number?'
83148f4b-2d7f-4c73-b5fe-51a002ef8473	'3'       'What is the greatest common divisor of 27 and 42?'
1b65c09d-4b2f-4bce-a76f-48e08ab57cd9	'string'  'What variable type should be used for a persons name?'
\.


--
-- Data for Name: question_wrong_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_wrong_answers (question_id, wrong_answers) FROM stdin;
cac917ea-c4c2-461e-92db-7a5497cd70e4	2
cac917ea-c4c2-461e-92db-7a5497cd70e4	4
a3c83db6-b224-41d3-a7f9-a56befa6e1e3	1001
a3c83db6-b224-41d3-a7f9-a56befa6e1e3	1111
89fc0ef6-5ccc-497f-b838-8feea770db29	17
83148f4b-2d7f-4c73-b5fe-51a002ef8473	6
1b65c09d-4b2f-4bce-a76f-48e08ab57cd9	boolean
1b65c09d-4b2f-4bce-a76f-48e08ab57cd9    integer
\.


--
-- Data for Name: round_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.round_result (id, answer, question_id) FROM stdin;
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
-- Name: round_result round_result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_result
    ADD CONSTRAINT round_result_pkey PRIMARY KEY (id);


--
-- Name: configuration_questions uk_87jmj05cn4rqb8wfq6qxej42w; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_questions
    ADD CONSTRAINT uk_87jmj05cn4rqb8wfq6qxej42w UNIQUE (questions_id);


--
-- Name: game_result_correct_answered_questions fk2yr4n6edjx6h62qhjfj0x0n9h; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_result_correct_answered_questions
    ADD CONSTRAINT fk2yr4n6edjx6h62qhjfj0x0n9h FOREIGN KEY (correct_answered_questions_id) REFERENCES public.round_result(id);


--
-- Name: game_result_wrong_answered_questions fk5l5weg5gvyjdyjutrqiigreqc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_result_wrong_answered_questions
    ADD CONSTRAINT fk5l5weg5gvyjdyjutrqiigreqc FOREIGN KEY (wrong_answered_questions_id) REFERENCES public.round_result(id);


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
-- Name: round_result fknbh8yrgf47myl1mfiv2johows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.round_result
    ADD CONSTRAINT fknbh8yrgf47myl1mfiv2johows FOREIGN KEY (question_id) REFERENCES public.question(id);


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

