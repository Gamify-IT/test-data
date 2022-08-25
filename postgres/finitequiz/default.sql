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
    played_time timestamp without time zone,
    player_id character varying(255),
    question_count integer NOT NULL,
    score real NOT NULL
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

COPY public.configuration (id) FROM stdin;
98a66aed-6d0e-4966-80f4-053cbb93fd54
\.


--
-- Data for Name: configuration_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration_questions (configuration_id, questions_id) FROM stdin;
98a66aed-6d0e-4966-80f4-053cbb93fd54	c67595ef-f4d5-4c63-9f1b-d7c440f5d9f6
98a66aed-6d0e-4966-80f4-053cbb93fd54	3135a82a-bbbd-4c1e-bd3a-4bb7242aa123
98a66aed-6d0e-4966-80f4-053cbb93fd54	8857aa03-877e-421b-b9cf-6289ecef2b1e
98a66aed-6d0e-4966-80f4-053cbb93fd54	76f39cc1-5054-4742-a7b0-f044b3f65145
98a66aed-6d0e-4966-80f4-053cbb93fd54	6eb60d72-31a9-40db-9140-6effabfb9629
98a66aed-6d0e-4966-80f4-053cbb93fd54	6438b1a5-5c6b-4f32-8ff2-f418584e6641
\.


--
-- Data for Name: game_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_result (id, configuration_asuuid, played_time, player_id, question_count, score) FROM stdin;
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
c67595ef-f4d5-4c63-9f1b-d7c440f5d9f6	6	1 + 5
3135a82a-bbbd-4c1e-bd3a-4bb7242aa123	7	1 + 6
8857aa03-877e-421b-b9cf-6289ecef2b1e	x = 2	x + 2 = 4
76f39cc1-5054-4742-a7b0-f044b3f65145	3	9 / 3
6eb60d72-31a9-40db-9140-6effabfb9629	110	88 + 22
6438b1a5-5c6b-4f32-8ff2-f418584e6641	6	2*3
\.


--
-- Data for Name: question_wrong_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_wrong_answers (question_id, wrong_answers) FROM stdin;
c67595ef-f4d5-4c63-9f1b-d7c440f5d9f6	1
c67595ef-f4d5-4c63-9f1b-d7c440f5d9f6	2
3135a82a-bbbd-4c1e-bd3a-4bb7242aa123	8
3135a82a-bbbd-4c1e-bd3a-4bb7242aa123	9
8857aa03-877e-421b-b9cf-6289ecef2b1e	x = 4
76f39cc1-5054-4742-a7b0-f044b3f65145	6
6eb60d72-31a9-40db-9140-6effabfb9629	100
6eb60d72-31a9-40db-9140-6effabfb9629	130
6438b1a5-5c6b-4f32-8ff2-f418584e6641	34
6438b1a5-5c6b-4f32-8ff2-f418584e6641	23
6438b1a5-5c6b-4f32-8ff2-f418584e6641	4
6438b1a5-5c6b-4f32-8ff2-f418584e6641	5
6438b1a5-5c6b-4f32-8ff2-f418584e6641	7
6438b1a5-5c6b-4f32-8ff2-f418584e6641	3465
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

