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
    id uuid NOT NULL,
    name character varying(255) NOT NULL
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
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id uuid NOT NULL,
    answer character varying(255) NOT NULL,
    question_text character varying(255) NOT NULL
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration (id, name) FROM stdin;
4f3af39f-1a0c-44f1-8a07-460786ab4fb1	general
599a6ad9-8776-4be9-b270-0e4e9785a003	uml
\.


--
-- Data for Name: configuration_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration_questions (configuration_id, questions_id) FROM stdin;
4f3af39f-1a0c-44f1-8a07-460786ab4fb1	03275eb4-5596-43bc-a842-d64487c36b18
4f3af39f-1a0c-44f1-8a07-460786ab4fb1	c96e8579-804a-438d-94f2-71c9973c983c
4f3af39f-1a0c-44f1-8a07-460786ab4fb1	7e6d684b-335b-4db3-a562-1e734c3c71f9
4f3af39f-1a0c-44f1-8a07-460786ab4fb1	cbc3ac32-ebf3-4a02-9421-7e41e9152ed6
599a6ad9-8776-4be9-b270-0e4e9785a003	7c32eb04-7f8b-4756-9db0-bfb9eea4ca84
599a6ad9-8776-4be9-b270-0e4e9785a003	a79043c6-e77e-4707-aa13-314fbdef1606
599a6ad9-8776-4be9-b270-0e4e9785a003	5fd45e7e-37c0-4bbe-a7c4-8c84902b81de
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, answer, question_text) FROM stdin;
03275eb4-5596-43bc-a842-d64487c36b18	CPU	What is the abbreviation of the computing unit in a computer?
c96e8579-804a-438d-94f2-71c9973c983c	Typescript	Which language extends Javascript with type safety?
7e6d684b-335b-4db3-a562-1e734c3c71f9	for-loop	Which loop allows to set the count of iterations in the head?
cbc3ac32-ebf3-4a02-9421-7e41e9152ed6	Syntax	How is the system of rules called which defines well-formed expressions?
7c32eb04-7f8b-4756-9db0-bfb9eea4ca84	UML-Class-Diagram	Which UML diagram is used to describe objects in a object oriented system?
a79043c6-e77e-4707-aa13-314fbdef1606	UML-Sequence-Diagram	Which UML diagram is used to describe a sequence?
5fd45e7e-37c0-4bbe-a7c4-8c84902b81de	UML-Component-Diagram	Which UML diagram is used to describe the relation between components?
\.


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
-- Name: configuration_questions fkewy22y8x7me09uka66yaovavm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_questions
    ADD CONSTRAINT fkewy22y8x7me09uka66yaovavm FOREIGN KEY (questions_id) REFERENCES public.question(id);


--
-- Name: configuration_questions fkpuxg1dtbsi0no6cj8ynv0f8tt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_questions
    ADD CONSTRAINT fkpuxg1dtbsi0no6cj8ynv0f8tt FOREIGN KEY (configuration_id) REFERENCES public.configuration(id);


--
-- PostgreSQL database dump complete
--

