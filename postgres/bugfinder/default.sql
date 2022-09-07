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
-- Name: bug; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bug (
    id uuid NOT NULL,
    correct_value character varying(255),
    error_type integer,
    word_id uuid
);


ALTER TABLE public.bug OWNER TO postgres;

--
-- Name: code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.code (
    id uuid NOT NULL
);


ALTER TABLE public.code OWNER TO postgres;

--
-- Name: code_words; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.code_words (
    code_id uuid NOT NULL,
    words_id uuid NOT NULL
);


ALTER TABLE public.code_words OWNER TO postgres;

--
-- Name: configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuration (
    id uuid NOT NULL
);


ALTER TABLE public.configuration OWNER TO postgres;

--
-- Name: configuration_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuration_codes (
    configuration_id uuid NOT NULL,
    codes_id uuid NOT NULL
);


ALTER TABLE public.configuration_codes OWNER TO postgres;

--
-- Name: solution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solution (
    id uuid NOT NULL,
    code_id uuid
);


ALTER TABLE public.solution OWNER TO postgres;

--
-- Name: solution_bugs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solution_bugs (
    solution_id uuid NOT NULL,
    bugs_id uuid NOT NULL
);


ALTER TABLE public.solution_bugs OWNER TO postgres;

--
-- Name: word; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.word (
    id uuid NOT NULL,
    word character varying(255)
);


ALTER TABLE public.word OWNER TO postgres;

--
-- Data for Name: bug; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bug (id, correct_value, error_type, word_id) FROM stdin;
f0ced717-365c-4677-9825-61c9884e1538	int	1	c639468b-0cae-4b46-b390-1c48a49c53de
b405603e-9814-4f6a-92c4-303c2df3a4d6	moveAndPickupGrain(final Hamster paule)	0	385557cc-816a-403d-a07b-e06fa5f451d4
b189538c-d4d8-4398-b764-46db71f1069b	forYou()	4	27cc4081-f27f-436d-978d-725c05741c88
d2142487-9a22-40d4-a36b-9c20262b7c06	System.out.println("Have you found it?");	2	2329ae02-18d6-468a-949b-bab64fd5363b
c8b4057d-61a2-40bf-a5ca-c1221f655f13	paule.pickupGrain();	5	0b338e93-df4f-49d0-ad92-4a56fe860fc6
36bca57d-7d38-4ab1-9b03-d5fc0537be64	final	0	6b522161-5159-4b23-bdef-b43c7f6c1035
dcca5af1-1294-429a-b175-6ca42c74d055	BigError(final String name, final Date birthDate)	0	0d7ba21d-f17c-481a-a3c1-061c50705736
67e54ee6-f34b-4ab6-a21b-599200e2e1d1	final	0	32863e73-9eb8-4def-8949-009105885e72
\.


--
-- Data for Name: code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.code (id) FROM stdin;
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be
a65fd433-0645-45a2-8e6a-55081dd80c60
11453384-b966-4f46-a4ec-608fd4270652
ee4b1f31-2487-43c0-89e2-da645273af27
9eae7c5b-1994-4f1a-a025-12f3d79a236c
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663
1ba912d4-c578-444b-8e87-e0f31e3c15bc
a6617f1a-3bfb-4e33-a072-cb52f33de710
1bbfef09-ab9e-49d8-9f66-9b122199f978
6b4d1b4d-08b7-4eac-8584-44a2f7621a01
\.


--
-- Data for Name: code_words; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.code_words (code_id, words_id) FROM stdin;
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	d2a8bedf-c590-4a0b-b901-e0602903f9f5
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	161ff240-5efa-4952-9dac-603afbf416b0
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	b1873030-93f8-4c1e-b158-f415f3f360f1
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	97608329-db06-4d89-949b-b07c280b9f68
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	8a9b2e40-0702-4768-b11a-5cbede65b16c
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	27cc4081-f27f-436d-978d-725c05741c88
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	2640caf4-d53c-4dfb-800a-617ecd451d2e
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	dc622a0e-ed34-4753-b679-c86e6e533561
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	72baa943-f720-4a09-8a39-bd5bd549c1d6
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	6a1ee602-4e92-4e3c-bb86-5a7f7f0b5a1c
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	7f11058f-dd62-448d-9f87-aab61fdf42a6
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	d0c1b3c4-01ed-4a7d-8b9d-fe14240395c7
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	6fe8ec78-5399-41b4-8315-f27798dd4b8f
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	7cadbd86-77a6-4948-b9d0-9294e5371856
92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be	579dc25e-c966-4fe3-aed0-9747e5c751cd
a65fd433-0645-45a2-8e6a-55081dd80c60	12ca3efc-32eb-4221-a251-6bcb792d59da
a65fd433-0645-45a2-8e6a-55081dd80c60	4bdce44e-e957-4842-b4f8-3e0dc4b4cf36
a65fd433-0645-45a2-8e6a-55081dd80c60	e3924892-98d3-4801-b30c-56a9696f5ec4
a65fd433-0645-45a2-8e6a-55081dd80c60	8d7b7b40-1ec9-45a3-ae7e-87371bbd22dc
a65fd433-0645-45a2-8e6a-55081dd80c60	b68329ee-f7ad-47bf-92d2-4eecf9029e05
a65fd433-0645-45a2-8e6a-55081dd80c60	385557cc-816a-403d-a07b-e06fa5f451d4
a65fd433-0645-45a2-8e6a-55081dd80c60	58021c93-80fb-43dc-9580-efee84810fd2
a65fd433-0645-45a2-8e6a-55081dd80c60	205a1648-673a-4bab-aa35-e6ac8033c321
a65fd433-0645-45a2-8e6a-55081dd80c60	780b3ad4-f526-4de0-b7a4-3bc225970f37
a65fd433-0645-45a2-8e6a-55081dd80c60	b5cc28de-22e7-4ff7-a66c-7d54d168dff7
a65fd433-0645-45a2-8e6a-55081dd80c60	51787cde-85ee-41b5-a6fd-49151dc88678
a65fd433-0645-45a2-8e6a-55081dd80c60	3950e5f9-ad43-4349-9f27-ccdcff2410a3
a65fd433-0645-45a2-8e6a-55081dd80c60	b91f6d5a-ffc4-4b0a-aae3-acabaf606070
a65fd433-0645-45a2-8e6a-55081dd80c60	da511844-d32f-48f3-a290-d2b5cb66d99f
a65fd433-0645-45a2-8e6a-55081dd80c60	c2be7caf-f0ee-44a5-a092-f228614eff74
a65fd433-0645-45a2-8e6a-55081dd80c60	0b338e93-df4f-49d0-ad92-4a56fe860fc6
a65fd433-0645-45a2-8e6a-55081dd80c60	55def606-315b-4640-bf15-78749f79ae51
a65fd433-0645-45a2-8e6a-55081dd80c60	e4023a32-032b-4cf3-9ff1-1c4de4e0f4fe
a65fd433-0645-45a2-8e6a-55081dd80c60	46d95328-3cff-4559-a5ae-fc45c0631bca
11453384-b966-4f46-a4ec-608fd4270652	e2c42f42-6d6b-4dcb-ad04-dc1c2705093d
11453384-b966-4f46-a4ec-608fd4270652	b319467e-6a78-4bff-bea8-93503a036725
11453384-b966-4f46-a4ec-608fd4270652	15b637aa-e486-41ee-b2e2-625f49b0e618
11453384-b966-4f46-a4ec-608fd4270652	4538d57a-ea91-4ba9-88b9-c30889ebd0dd
11453384-b966-4f46-a4ec-608fd4270652	f6d17109-d4d9-4e17-ad55-dbc13fb6be7c
11453384-b966-4f46-a4ec-608fd4270652	4a28851d-a6d5-4e9c-9118-2473fea4cd76
11453384-b966-4f46-a4ec-608fd4270652	7fd294de-4919-41aa-9143-648ea450f939
11453384-b966-4f46-a4ec-608fd4270652	a52d209b-f405-4e44-bd1e-bb767ba89f82
11453384-b966-4f46-a4ec-608fd4270652	6d01d6f5-27f9-4411-be35-f2f7334c86bf
11453384-b966-4f46-a4ec-608fd4270652	0512dd4a-2665-45da-b580-a9443c1e13dc
11453384-b966-4f46-a4ec-608fd4270652	a769b1bd-a898-4da5-86b8-b3b9374e125f
11453384-b966-4f46-a4ec-608fd4270652	f43ecbfd-27db-4376-969c-ca93913d2a3d
11453384-b966-4f46-a4ec-608fd4270652	a3ffdc62-9800-476e-a806-535481c08abc
11453384-b966-4f46-a4ec-608fd4270652	c639468b-0cae-4b46-b390-1c48a49c53de
11453384-b966-4f46-a4ec-608fd4270652	7ea0d23d-3906-4d16-87b9-7514d3af7d34
11453384-b966-4f46-a4ec-608fd4270652	7e28829b-9936-421f-93a4-646e531c4748
11453384-b966-4f46-a4ec-608fd4270652	550c2d42-7f78-4b3a-b564-396437f26529
11453384-b966-4f46-a4ec-608fd4270652	d208e95d-3c00-41bd-8823-ef3bc8a7dc1b
11453384-b966-4f46-a4ec-608fd4270652	56f373d5-10db-454e-8114-3128fca1d945
11453384-b966-4f46-a4ec-608fd4270652	8164a4f4-63ca-4010-b206-fa4aab804c47
11453384-b966-4f46-a4ec-608fd4270652	e21fe934-a638-4080-88d8-bb7902d8da4c
11453384-b966-4f46-a4ec-608fd4270652	f03ac0aa-042f-425f-878e-b61dffa60ae2
11453384-b966-4f46-a4ec-608fd4270652	facb7a9b-fedf-40aa-b421-b686680948cf
ee4b1f31-2487-43c0-89e2-da645273af27	4798e368-3055-4ab7-82f9-cced2d6fc2e7
ee4b1f31-2487-43c0-89e2-da645273af27	bce7cb6a-dc65-4d3e-8df2-0bd75f6d617c
ee4b1f31-2487-43c0-89e2-da645273af27	c71fbfa7-7ee4-4ac5-85ed-2efb42741e91
ee4b1f31-2487-43c0-89e2-da645273af27	f58e8c03-d724-4517-8945-fd6eff6a8611
ee4b1f31-2487-43c0-89e2-da645273af27	5389c618-564c-40e9-8382-c6f25b49e54a
ee4b1f31-2487-43c0-89e2-da645273af27	b3f223f8-a068-4787-9835-a86a7ffe3749
ee4b1f31-2487-43c0-89e2-da645273af27	5adc7e66-8857-4d72-a68f-078a1d7c08ca
ee4b1f31-2487-43c0-89e2-da645273af27	08b51564-d336-47c1-ba7b-18ad2a0df63f
ee4b1f31-2487-43c0-89e2-da645273af27	9f00e9e9-c7de-41a7-8644-235ef4aa4618
ee4b1f31-2487-43c0-89e2-da645273af27	4826b9cb-87a3-4dbb-ae19-781bc5b11044
ee4b1f31-2487-43c0-89e2-da645273af27	32863e73-9eb8-4def-8949-009105885e72
ee4b1f31-2487-43c0-89e2-da645273af27	e76ac68a-643f-40f8-8b57-97a136ceb234
ee4b1f31-2487-43c0-89e2-da645273af27	21a5960c-ad33-4af7-881b-2c0507ce9c20
ee4b1f31-2487-43c0-89e2-da645273af27	55b84459-8111-45be-8aa6-34a1287a1817
ee4b1f31-2487-43c0-89e2-da645273af27	2a6b579b-9749-427d-954d-8503c057306b
ee4b1f31-2487-43c0-89e2-da645273af27	e27ddadb-6cb1-486f-81b7-355afa1ac80d
ee4b1f31-2487-43c0-89e2-da645273af27	6b522161-5159-4b23-bdef-b43c7f6c1035
ee4b1f31-2487-43c0-89e2-da645273af27	8395125e-008c-4bdd-9280-5d24b852412d
ee4b1f31-2487-43c0-89e2-da645273af27	f1c9587e-15c4-4c94-b76b-622458110b4c
ee4b1f31-2487-43c0-89e2-da645273af27	443f265b-309a-4426-bc2b-61c142b7eda9
ee4b1f31-2487-43c0-89e2-da645273af27	c79d2486-49ce-470a-b88d-ffca4d43a455
ee4b1f31-2487-43c0-89e2-da645273af27	e1e6cc42-2d14-4d53-bf18-ee03672f3149
ee4b1f31-2487-43c0-89e2-da645273af27	eea5ef2c-c9f8-4e34-99e3-86b75c0dd174
ee4b1f31-2487-43c0-89e2-da645273af27	23aeb490-fc3a-4629-8f69-9197c0a43268
ee4b1f31-2487-43c0-89e2-da645273af27	815bf695-54cb-4990-8740-616e57adef85
ee4b1f31-2487-43c0-89e2-da645273af27	2576e06a-64e6-4eeb-a635-794cef25ec78
ee4b1f31-2487-43c0-89e2-da645273af27	0d7ba21d-f17c-481a-a3c1-061c50705736
ee4b1f31-2487-43c0-89e2-da645273af27	a9f6a5dc-1dd8-47d3-a094-adbffab7ffa7
ee4b1f31-2487-43c0-89e2-da645273af27	354b21b2-1a6f-49d7-b5ab-b9bda87e7352
ee4b1f31-2487-43c0-89e2-da645273af27	5a052ab7-5ce2-4ff4-ba2c-2fae111d474a
ee4b1f31-2487-43c0-89e2-da645273af27	910e0fd5-f984-4aaa-9d92-c0f871bdba0e
ee4b1f31-2487-43c0-89e2-da645273af27	39a72759-0a08-42b4-9651-0c1f5c48a8f4
ee4b1f31-2487-43c0-89e2-da645273af27	6bb00056-9140-48e9-954b-b07526623ba6
ee4b1f31-2487-43c0-89e2-da645273af27	ec1ba017-4c05-4c66-9aec-52fa2405b7be
ee4b1f31-2487-43c0-89e2-da645273af27	ecc1d6dd-ea51-4cf7-aa4a-795c9f3c04f4
ee4b1f31-2487-43c0-89e2-da645273af27	39139ff7-661f-43e2-9f73-8e0d59753f0d
ee4b1f31-2487-43c0-89e2-da645273af27	67c57ab9-8d50-49df-a445-88ed3b46e9cd
ee4b1f31-2487-43c0-89e2-da645273af27	6464125b-8b54-476c-87ae-e26b11d93802
ee4b1f31-2487-43c0-89e2-da645273af27	3b627ebd-d71d-4311-aa55-0b8fe2285004
ee4b1f31-2487-43c0-89e2-da645273af27	fbe99108-98c4-45e2-83c7-8bd0657c8cb9
ee4b1f31-2487-43c0-89e2-da645273af27	3930c50d-e392-429a-85cb-1491f3f8f10d
ee4b1f31-2487-43c0-89e2-da645273af27	3ed1e644-e642-4161-8b47-9e5d04edd821
ee4b1f31-2487-43c0-89e2-da645273af27	755bbb52-17af-4916-8fee-1f80a8d9f0f2
ee4b1f31-2487-43c0-89e2-da645273af27	0cc71141-f3f3-44f0-9a50-9b6d807cf447
ee4b1f31-2487-43c0-89e2-da645273af27	ab7c4cbf-f954-46db-b29a-165675487a83
ee4b1f31-2487-43c0-89e2-da645273af27	9276dcea-070f-4f02-83d0-6ef848da3acd
ee4b1f31-2487-43c0-89e2-da645273af27	e22da763-fe0b-4763-bf12-449908887946
ee4b1f31-2487-43c0-89e2-da645273af27	b4ec803a-7fa7-4b6e-8699-a1a740cb2a3e
ee4b1f31-2487-43c0-89e2-da645273af27	6d429614-486e-4e6d-a1b8-34d753f55586
ee4b1f31-2487-43c0-89e2-da645273af27	8d129735-2e03-4694-b086-d9b4e3a4dc3a
ee4b1f31-2487-43c0-89e2-da645273af27	efafcd11-7f21-470b-95e9-295a1e94c3ef
ee4b1f31-2487-43c0-89e2-da645273af27	588d450f-9162-4a67-aafd-3f39c45648da
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	1d670615-a663-4b75-9bdb-3c541a3e0709
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	b79c0c3f-3931-4a68-9bde-b3c2a02cd996
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	3e683058-af5a-4b43-a742-3e06fb6567f5
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	3fcad2d6-5440-4396-8082-7e6d6a32ed99
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	0a0948a0-df40-4e34-9919-e9e87a05fa95
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	99192589-5871-418a-82c1-40062549ad65
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	ac0e5eed-86a5-437c-8c49-74c731cd0ef3
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	70a8138c-c468-48dc-8273-0863e5d42f7b
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	01fc14b2-1b68-4b98-8738-bda75b1af1bb
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	c264d2ce-da9c-4050-be33-0ecba444fd04
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	2329ae02-18d6-468a-949b-bab64fd5363b
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	37552440-c55e-4f0a-8ddd-8342d7887ec3
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	894cd43b-5016-4706-b52c-0ea2d1fc8d0b
6b4d1b4d-08b7-4eac-8584-44a2f7621a01	109ba59d-4672-4e41-b1f7-35673f782d76
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration (id) FROM stdin;
2e5d0718-fdfe-4738-87da-b55b6ed62a35
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9
\.


--
-- Data for Name: configuration_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration_codes (configuration_id, codes_id) FROM stdin;
2e5d0718-fdfe-4738-87da-b55b6ed62a35	6b4d1b4d-08b7-4eac-8584-44a2f7621a01
2e5d0718-fdfe-4738-87da-b55b6ed62a35	92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be
2e5d0718-fdfe-4738-87da-b55b6ed62a35	a65fd433-0645-45a2-8e6a-55081dd80c60
2e5d0718-fdfe-4738-87da-b55b6ed62a35	ee4b1f31-2487-43c0-89e2-da645273af27
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9	9eae7c5b-1994-4f1a-a025-12f3d79a236c
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9	34ea10c1-75c3-48b0-8a8e-3fabbe4e9663
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9	a6617f1a-3bfb-4e33-a072-cb52f33de710
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9	1bbfef09-ab9e-49d8-9f66-9b122199f978
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9	1ba912d4-c578-444b-8e87-e0f31e3c15bc
2e5d0718-fdfe-4738-87da-b55b6ed62a35	11453384-b966-4f46-a4ec-608fd4270652
\.


--
-- Data for Name: solution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solution (id, code_id) FROM stdin;
f2434023-1510-43bc-947f-8ec402c9908a	11453384-b966-4f46-a4ec-608fd4270652
95ecba23-f404-4dbc-b9cd-91cc2e116366	a65fd433-0645-45a2-8e6a-55081dd80c60
b6af7693-4b47-438c-a9b1-abac03069c15	6b4d1b4d-08b7-4eac-8584-44a2f7621a01
84012c85-f99f-4470-ada6-a7902ef08ae8	ee4b1f31-2487-43c0-89e2-da645273af27
f97b91d4-3fee-40da-9506-cae496451e9b	\N
527616e1-2719-4597-8a3f-dee53c258354	\N
d7c16bc7-02b9-410a-b8df-0c1f33e16610	\N
4930cdc8-00eb-4e9a-8000-a190cea8b190	\N
340145dc-8119-4e9e-9a76-3d37f1689d85	\N
d7320b6d-4711-4115-b322-912173bb7c18	92c1f3a2-0cd0-4aee-9e81-a938f6f5c8be
\.


--
-- Data for Name: solution_bugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solution_bugs (solution_id, bugs_id) FROM stdin;
f2434023-1510-43bc-947f-8ec402c9908a	f0ced717-365c-4677-9825-61c9884e1538
d7320b6d-4711-4115-b322-912173bb7c18	b189538c-d4d8-4398-b764-46db71f1069b
b6af7693-4b47-438c-a9b1-abac03069c15	d2142487-9a22-40d4-a36b-9c20262b7c06
95ecba23-f404-4dbc-b9cd-91cc2e116366	b405603e-9814-4f6a-92c4-303c2df3a4d6
95ecba23-f404-4dbc-b9cd-91cc2e116366	c8b4057d-61a2-40bf-a5ca-c1221f655f13
84012c85-f99f-4470-ada6-a7902ef08ae8	36bca57d-7d38-4ab1-9b03-d5fc0537be64
84012c85-f99f-4470-ada6-a7902ef08ae8	dcca5af1-1294-429a-b175-6ca42c74d055
84012c85-f99f-4470-ada6-a7902ef08ae8	67e54ee6-f34b-4ab6-a21b-599200e2e1d1
\.


--
-- Data for Name: word; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.word (id, word) FROM stdin;
d2a8bedf-c590-4a0b-b901-e0602903f9f5	 
161ff240-5efa-4952-9dac-603afbf416b0	public
b1873030-93f8-4c1e-b158-f415f3f360f1	 
97608329-db06-4d89-949b-b07c280b9f68	void
8a9b2e40-0702-4768-b11a-5cbede65b16c	 
27cc4081-f27f-436d-978d-725c05741c88	4You()
2640caf4-d53c-4dfb-800a-617ecd451d2e	 
dc622a0e-ed34-4753-b679-c86e6e533561	{
72baa943-f720-4a09-8a39-bd5bd549c1d6	\n
6a1ee602-4e92-4e3c-bb86-5a7f7f0b5a1c	<tab>
7f11058f-dd62-448d-9f87-aab61fdf42a6	 
d0c1b3c4-01ed-4a7d-8b9d-fe14240395c7	System.out.println("What is this bug about?");
6fe8ec78-5399-41b4-8315-f27798dd4b8f	\n
7cadbd86-77a6-4948-b9d0-9294e5371856	 
579dc25e-c966-4fe3-aed0-9747e5c751cd	}
4798e368-3055-4ab7-82f9-cced2d6fc2e7	 
bce7cb6a-dc65-4d3e-8df2-0bd75f6d617c	public
c71fbfa7-7ee4-4ac5-85ed-2efb42741e91	 
f58e8c03-d724-4517-8945-fd6eff6a8611	class
5389c618-564c-40e9-8382-c6f25b49e54a	 
b3f223f8-a068-4787-9835-a86a7ffe3749	BigError
5adc7e66-8857-4d72-a68f-078a1d7c08ca	 
08b51564-d336-47c1-ba7b-18ad2a0df63f	{
9f00e9e9-c7de-41a7-8644-235ef4aa4618	\n
4826b9cb-87a3-4dbb-ae19-781bc5b11044	<tab>
32863e73-9eb8-4def-8949-009105885e72	 
e76ac68a-643f-40f8-8b57-97a136ceb234	String
21a5960c-ad33-4af7-881b-2c0507ce9c20	 
55b84459-8111-45be-8aa6-34a1287a1817	name;
2a6b579b-9749-427d-954d-8503c057306b	\n
e27ddadb-6cb1-486f-81b7-355afa1ac80d	<tab>
6b522161-5159-4b23-bdef-b43c7f6c1035	 
8395125e-008c-4bdd-9280-5d24b852412d	Date
f1c9587e-15c4-4c94-b76b-622458110b4c	 
443f265b-309a-4426-bc2b-61c142b7eda9	birthDate;
c79d2486-49ce-470a-b88d-ffca4d43a455	\n
e1e6cc42-2d14-4d53-bf18-ee03672f3149	
eea5ef2c-c9f8-4e34-99e3-86b75c0dd174	\n
23aeb490-fc3a-4629-8f69-9197c0a43268	<tab>
815bf695-54cb-4990-8740-616e57adef85	public
2576e06a-64e6-4eeb-a635-794cef25ec78	 
0d7ba21d-f17c-481a-a3c1-061c50705736	BigError(String name, Date birthDate)
a9f6a5dc-1dd8-47d3-a094-adbffab7ffa7	 
354b21b2-1a6f-49d7-b5ab-b9bda87e7352	{
5a052ab7-5ce2-4ff4-ba2c-2fae111d474a	\n
910e0fd5-f984-4aaa-9d92-c0f871bdba0e	<tab>
39a72759-0a08-42b4-9651-0c1f5c48a8f4	<tab>
6bb00056-9140-48e9-954b-b07526623ba6	 
ec1ba017-4c05-4c66-9aec-52fa2405b7be	this.name
ecc1d6dd-ea51-4cf7-aa4a-795c9f3c04f4	 
39139ff7-661f-43e2-9f73-8e0d59753f0d	=
67c57ab9-8d50-49df-a445-88ed3b46e9cd	 
6464125b-8b54-476c-87ae-e26b11d93802	name;
3b627ebd-d71d-4311-aa55-0b8fe2285004	\n
fbe99108-98c4-45e2-83c7-8bd0657c8cb9	<tab>
3930c50d-e392-429a-85cb-1491f3f8f10d	<tab>
3ed1e644-e642-4161-8b47-9e5d04edd821	 
755bbb52-17af-4916-8fee-1f80a8d9f0f2	this.birthDate
0cc71141-f3f3-44f0-9a50-9b6d807cf447	 
ab7c4cbf-f954-46db-b29a-165675487a83	=
9276dcea-070f-4f02-83d0-6ef848da3acd	 
e22da763-fe0b-4763-bf12-449908887946	birthDate;
b4ec803a-7fa7-4b6e-8699-a1a740cb2a3e	\n
6d429614-486e-4e6d-a1b8-34d753f55586	<tab>
8d129735-2e03-4694-b086-d9b4e3a4dc3a	}
efafcd11-7f21-470b-95e9-295a1e94c3ef	\n
588d450f-9162-4a67-aafd-3f39c45648da	}
b0b5ebfa-950c-4adb-8b98-936e027df27e	 
fdeaf388-4da8-4c76-9308-8d9e761adf97	public
534b407c-c7ed-46de-8d93-e486124e13de	 
e3c7656a-7e56-4ccd-9bc9-b453ded21d47	void
cd3af2d9-a6f5-45e8-9814-f12b6b0eb73d	 
32c44642-f0ef-43cd-a795-71dbb60db7e2	moveAndPickupGrain(Hamster paule)
1abd125e-1dad-48fd-ba8f-df1e60c72c0a	 
f8fc03f9-b09d-4b62-ba12-adb5d864f8da	{
8a8c0c4b-6206-40a9-9e84-25f733bd3ccd	\n
fe51966c-16d1-4325-9046-ef77f8eb74af	<tab>
e47acb34-c18c-4e11-b38c-decc40a95864	 
2c1dce42-616d-4175-b7cd-618bd361722f	paule.move();
9ef68125-c4c3-4891-9c40-68f6cea62813	\n
3d854b13-c1e2-450a-a028-6bfaec0fa83d	<tab>
d8da1404-195d-4ed9-8079-8e5961d456f7	 
8bef76b4-77f1-4f75-86df-61e0a79a2eac	paule.dropGrain();
4a8fdb2b-9fb0-4056-a801-4c60108df3be	\n
99541e37-24c7-4c4b-9998-2bfef8a2e4e2	 
b0a7b6e0-5c89-459a-b74c-2b56efcfef94	}
3dd08e9b-ce80-43c1-a510-ac10d5dd7a13	 
35b31022-86cd-4df2-8895-2f67a7cd97d2	public
a54414a8-1297-4a11-b29f-6e381059690a	 
66b0f2e1-1a5a-4bd0-b1ba-4772c741d5fe	void
f4c2509f-f00b-477e-9117-052360440e28	public
68f5c65a-2f2f-4f8c-8250-24d41ff81b0c	 
3b234f85-d667-40f4-9bc3-856d23b83e49	 
a1a2758a-8835-4fb7-a39b-6be6ec774570	takeACloserLook()
9655d15d-174f-43b0-a96d-ce2c2cf7c363	void
eaa2526c-1de2-4fcf-b42d-2dbb71268dc9	 
44e85f16-1f2f-453a-a5c6-d947938c4e91	{
6c4b71dc-5301-4855-a904-e44f32ecf9b2	 
a6818c91-a04d-4f67-8edf-0bdbfd7d42d3	\n
79784a69-548d-43fb-bf25-7c67f397b396	4You()
783024ca-6883-4a18-864e-666f4127e657	 
26355796-0d3f-4428-982f-6586211bc6ae	<tab>
29672311-6655-48b1-81de-fea9cefab958	{
0f106dda-e6f4-4619-b3a7-478b8a725493	 
d62f82a4-a3d5-4325-b9c1-89354f68e858	\n
1e0b0743-94b1-4c35-87cd-d884a6a14f66	<tab>
a8c394b2-a187-4367-b609-d31b1aace0b3	System.out.println("Have you found it?")
0e9405f0-dc9d-45ba-81c4-182630f46990	\n
1d6203a3-9396-472f-b385-924182d9f9f7	 
c9c8b6df-1ab1-4498-a120-c3443eb3b527	 
c3d7d145-bd96-45d5-84ff-00c9b24b2aed	System.out.println("What is this bug about?");
0d09ca1f-1961-4039-84c3-776fa05ea730	}
51c5813a-7617-43f4-b572-6335dc14c722	\n
f9f6cd42-adc5-4146-80d9-bc00ad3f6be4	 
9382a237-d606-43f6-9c9a-6e2f975a5394	}
66c635d7-ee40-4a54-aff5-2aea77d275eb	 
d05e30c2-f89e-4de5-b336-aa37b6339d79	public
c9bee9e3-b0b9-4c6d-bcf2-ff60a627c919	 
2126e57d-6179-4d12-ac71-bdf5a10cb80e	class
0d64d777-6dba-46ad-8d8c-0f093174211d	 
8471295d-a636-4b17-b8ac-3880e830a1ed	BigError
fc39b324-a176-45a7-b422-6d5a604b037e	 
c269ddc8-3b44-48f9-8844-371ccdfea789	{
f873f33c-be21-487c-bf47-7ee9fed02be6	\n
95486304-9ea0-49ed-ac8b-c3e07646ef60	<tab>
796685e0-6ed8-4c2c-9928-e7b2f1940f63	 
8cda4799-ee08-4db0-a9bb-0b9101378b4d	String
69fe6511-3c2a-472e-af48-47f030df17b2	 
77400304-04e5-49bc-9c21-0a9c3c895793	name;
a75ad254-28de-47f3-b9a2-e3dbdd6bfc10	\n
c7130281-5fef-48fc-a6c2-78097d44dc43	<tab>
1da41ed8-c535-49dc-b80e-cb4e7613d456	 
f6fe1e2b-cf2b-4ee7-b42b-b63fdc551590	Date
d3859655-f35b-42cc-a337-0863ed9c944c	 
ed1d72a3-38e3-475c-a002-012e914d7af1	birthDate;
0290dc25-53a4-4e13-bfc2-f05e03661431	\n
9a4a3145-9376-4bd2-925c-4b6f27a3d4e5	
4b9f9c0e-6f26-485a-8aa3-79bd269b17a0	\n
ed9a0a2a-7801-40b6-9498-83fd356f1864	<tab>
53038aee-ef7c-4b48-9658-fccff9383930	public
0b8ca8c6-23c6-467c-a717-ddc872dfb2fb	 
40d13541-54fa-4c06-868c-62ff54c56047	BigError(String name, Date birthDate)
625fe545-163a-4a7d-8096-5be47e4167ef	 
07f41760-77e4-42cc-92be-c5d0884d4263	{
55c11d9c-0c5c-4be5-adad-92198dff6d2d	\n
ee20fddb-37ae-46f6-b179-2efba602e251	<tab>
bd0b66b5-dbfd-4c19-93ab-0e057815d24f	<tab>
de2b5065-11dc-48c7-8885-82f9981162ac	 
41b5d9a1-c948-4b2a-874e-42608fe33079	this.name
b206cf48-88db-4b32-88f9-3ba2fee5b200	 
aae186e1-c2df-4419-ae3e-459ebd77a1c8	=
12b29286-bff3-4b14-93b5-e564a11ee99d	 
7fcec45a-2af1-49a3-bac5-00a7d944e22b	name;
f64a58af-8766-46d4-a80c-a68e2b02046f	\n
bbf814dd-b525-445e-b1be-15d255c165da	<tab>
8abd3782-6705-437d-b1c8-5dddbb6ef16a	<tab>
38d411d9-d341-4e7c-99ee-b57971f3b3cd	 
255719d0-e461-4629-916d-184d64e07d0b	this.birthDate
4fb180e7-782f-448d-93ed-62e64dbfae02	 
e53d2bf4-3835-4cf9-9a3e-7f02b18c7be6	=
39f99e4e-9ae0-4925-8f21-f767e2dc0d1f	 
bb18976b-d528-4a01-b193-54336dceb8df	birthDate;
eef67b1f-2fec-4001-8477-70c2bdb784e9	\n
882e8876-fc37-467c-8a56-7461e47f3fab	<tab>
ebe464a5-a7ca-4cc3-9802-f086ae951363	}
7d15e609-362f-49fb-b0b4-4fc912b7a5ff	\n
04f5a4d7-7b20-4007-a844-a73eae86fc9d	}
53d010ed-483b-497b-b4f0-3c38ad3fbc77	 
2cc167c7-f976-4241-98bb-cba16833f887	public
959fb25a-56ab-4858-b748-721125bd4225	 
72cf4c53-10ee-4c84-b26e-f4bcdbb26e36	class
3039f759-7978-49a0-b91d-76756c95df80	 
8c77f6a7-09ac-43dc-8583-b14fafdfd9e5	ErrorClass
fa1d8b79-1ab9-4ab9-9c16-74f8cee95958	 
e6c9a313-2f6b-436a-8eb4-48b1b8d66896	{
b5afd2d0-75c5-4d0f-a21f-25114ba6f9e9	\n
3d86c2d3-9f64-4074-9e35-32dd7eff1036	<tab>
81e54b7e-9aff-4dfa-96a0-28933b7e10b0	 
37406490-3340-44c2-9c6d-b8695410bada	final
ee7a0360-7499-487a-977c-e1f0da0a39df	 
df7666e2-4a3f-4e5b-bbc5-a7d5ab5f9b24	String
8251f7c8-3068-4cde-9c24-54ec0f79ccca	 
b7d6fbf4-9089-4009-b3fc-097cbf8b875a	value
e4ebf51a-1897-4b9e-a749-0ebdef73affc	 
4e22b405-27e0-4bd1-94f0-bf8993aa1dfe	=
7a5765bb-1d10-4ea8-bb2a-b8287e9bb884	 
333e30ca-273f-47a8-9110-f86b06a457d5	2;
b8c09186-c1f0-477d-8c47-15fc18116236	\n
ca98675d-04c9-4a26-9f39-b67b508461d8	 
1626d8be-5077-4155-9cf8-c5e2dd1d0d4d	}
e2c42f42-6d6b-4dcb-ad04-dc1c2705093d	 
b319467e-6a78-4bff-bea8-93503a036725	public
15b637aa-e486-41ee-b2e2-625f49b0e618	 
4538d57a-ea91-4ba9-88b9-c30889ebd0dd	class
f6d17109-d4d9-4e17-ad55-dbc13fb6be7c	 
4a28851d-a6d5-4e9c-9118-2473fea4cd76	ErrorClass
7fd294de-4919-41aa-9143-648ea450f939	 
a52d209b-f405-4e44-bd1e-bb767ba89f82	{
6d01d6f5-27f9-4411-be35-f2f7334c86bf	\n
0512dd4a-2665-45da-b580-a9443c1e13dc	<tab>
a769b1bd-a898-4da5-86b8-b3b9374e125f	 
f43ecbfd-27db-4376-969c-ca93913d2a3d	final
a3ffdc62-9800-476e-a806-535481c08abc	 
c639468b-0cae-4b46-b390-1c48a49c53de	String
7ea0d23d-3906-4d16-87b9-7514d3af7d34	 
7e28829b-9936-421f-93a4-646e531c4748	value
550c2d42-7f78-4b3a-b564-396437f26529	 
d208e95d-3c00-41bd-8823-ef3bc8a7dc1b	=
56f373d5-10db-454e-8114-3128fca1d945	 
8164a4f4-63ca-4010-b206-fa4aab804c47	2;
e21fe934-a638-4080-88d8-bb7902d8da4c	\n
f03ac0aa-042f-425f-878e-b61dffa60ae2	 
facb7a9b-fedf-40aa-b421-b686680948cf	}
1d670615-a663-4b75-9bdb-3c541a3e0709	 
b79c0c3f-3931-4a68-9bde-b3c2a02cd996	public
3e683058-af5a-4b43-a742-3e06fb6567f5	void
3fcad2d6-5440-4396-8082-7e6d6a32ed99	 
0a0948a0-df40-4e34-9919-e9e87a05fa95	takeACloserLook()
99192589-5871-418a-82c1-40062549ad65	 
ac0e5eed-86a5-437c-8c49-74c731cd0ef3	{
70a8138c-c468-48dc-8273-0863e5d42f7b	\n
01fc14b2-1b68-4b98-8738-bda75b1af1bb	<tab>
c264d2ce-da9c-4050-be33-0ecba444fd04	 
2329ae02-18d6-468a-949b-bab64fd5363b	System.out.println("Have you found it?")
37552440-c55e-4f0a-8ddd-8342d7887ec3	\n
894cd43b-5016-4706-b52c-0ea2d1fc8d0b	 
109ba59d-4672-4e41-b1f7-35673f782d76	}
12ca3efc-32eb-4221-a251-6bcb792d59da	 
4bdce44e-e957-4842-b4f8-3e0dc4b4cf36	public
e3924892-98d3-4801-b30c-56a9696f5ec4	 
8d7b7b40-1ec9-45a3-ae7e-87371bbd22dc	void
b68329ee-f7ad-47bf-92d2-4eecf9029e05	 
385557cc-816a-403d-a07b-e06fa5f451d4	moveAndPickupGrain(Hamster paule)
58021c93-80fb-43dc-9580-efee84810fd2	 
205a1648-673a-4bab-aa35-e6ac8033c321	{
780b3ad4-f526-4de0-b7a4-3bc225970f37	\n
b5cc28de-22e7-4ff7-a66c-7d54d168dff7	<tab>
51787cde-85ee-41b5-a6fd-49151dc88678	 
3950e5f9-ad43-4349-9f27-ccdcff2410a3	paule.move();
b91f6d5a-ffc4-4b0a-aae3-acabaf606070	\n
da511844-d32f-48f3-a290-d2b5cb66d99f	<tab>
c2be7caf-f0ee-44a5-a092-f228614eff74	 
0b338e93-df4f-49d0-ad92-4a56fe860fc6	paule.dropGrain();
55def606-315b-4640-bf15-78749f79ae51	\n
e4023a32-032b-4cf3-9ff1-1c4de4e0f4fe	 
46d95328-3cff-4559-a5ae-fc45c0631bca	}
\.


--
-- Name: bug bug_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_pkey PRIMARY KEY (id);


--
-- Name: code code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code
    ADD CONSTRAINT code_pkey PRIMARY KEY (id);


--
-- Name: configuration_codes configuration_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_codes
    ADD CONSTRAINT configuration_codes_pkey PRIMARY KEY (configuration_id, codes_id);


--
-- Name: configuration configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (id);


--
-- Name: solution_bugs solution_bugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solution_bugs
    ADD CONSTRAINT solution_bugs_pkey PRIMARY KEY (solution_id, bugs_id);


--
-- Name: solution solution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solution
    ADD CONSTRAINT solution_pkey PRIMARY KEY (id);


--
-- Name: configuration_codes uk_ojb48o72tahwues3uvlrsm3i9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_codes
    ADD CONSTRAINT uk_ojb48o72tahwues3uvlrsm3i9 UNIQUE (codes_id);


--
-- Name: code_words uk_rnftyyvtm3o21whfbxb8ys7dt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_words
    ADD CONSTRAINT uk_rnftyyvtm3o21whfbxb8ys7dt UNIQUE (words_id);


--
-- Name: solution_bugs uk_t6949bp8xqli9wp3yge2ki1g0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solution_bugs
    ADD CONSTRAINT uk_t6949bp8xqli9wp3yge2ki1g0 UNIQUE (bugs_id);


--
-- Name: word word_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word
    ADD CONSTRAINT word_pkey PRIMARY KEY (id);


--
-- Name: solution fk20ltujstgdyb0ecmkjg2r9hyp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solution
    ADD CONSTRAINT fk20ltujstgdyb0ecmkjg2r9hyp FOREIGN KEY (code_id) REFERENCES public.code(id);


--
-- Name: configuration_codes fk2ukcuug7ve2764uau9s6ow7kh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_codes
    ADD CONSTRAINT fk2ukcuug7ve2764uau9s6ow7kh FOREIGN KEY (codes_id) REFERENCES public.code(id);


--
-- Name: bug fkdkqevhvo9ou92q6bvqrtbgt1h; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug
    ADD CONSTRAINT fkdkqevhvo9ou92q6bvqrtbgt1h FOREIGN KEY (word_id) REFERENCES public.word(id);


--
-- Name: configuration_codes fkeu1jbi9ygfualavyrmban6frf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration_codes
    ADD CONSTRAINT fkeu1jbi9ygfualavyrmban6frf FOREIGN KEY (configuration_id) REFERENCES public.configuration(id);


--
-- Name: solution_bugs fki2bngjltgjgspthdfr950lqx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solution_bugs
    ADD CONSTRAINT fki2bngjltgjgspthdfr950lqx FOREIGN KEY (solution_id) REFERENCES public.solution(id);


--
-- Name: code_words fkju0l4dvy0qamwtdj5mipxt9x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_words
    ADD CONSTRAINT fkju0l4dvy0qamwtdj5mipxt9x FOREIGN KEY (words_id) REFERENCES public.word(id);


--
-- Name: code_words fkkix1vyriqpnnll47eei8s452v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_words
    ADD CONSTRAINT fkkix1vyriqpnnll47eei8s452v FOREIGN KEY (code_id) REFERENCES public.code(id);


--
-- Name: solution_bugs fko8ankki1ifj8fvd1s64i0qvip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solution_bugs
    ADD CONSTRAINT fko8ankki1ifj8fvd1s64i0qvip FOREIGN KEY (bugs_id) REFERENCES public.bug(id);


--
-- PostgreSQL database dump complete
--

