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
    id uuid NOT NULL
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
8b5fc412-d0f9-4acb-9b2b-e467d4c4e13c	int	1	a75ad254-28de-47f3-b9a2-e3dbdd6bfc10
b81538dc-0c10-4118-97eb-df6a75103c83	final	0	796685e0-6ed8-4c2c-9928-e7b2f1940f63
3b3d9bbc-e544-4883-88f9-2d471f934dfa	BigError(final String name, final Date birthDate)	0	40d13541-54fa-4c06-868c-62ff54c56047
f1e9f822-06a1-40fb-81ab-43ea9e61d493	System.out.println("Have you found it?");	2	8cda4799-ee08-4db0-a9bb-0b9101378b4d
6e06f3af-9e86-48de-b3a9-9ad073cdbc7a	paule.pickupGrain();	5	1da41ed8-c535-49dc-b80e-cb4e7613d456
d2ad4470-668d-4105-888b-ade77691ef29	final	0	1da41ed8-c535-49dc-b80e-cb4e7613d456
e25c6757-861d-4fd0-909b-f075934b6473	forYou()	4	fc39b324-a176-45a7-b422-6d5a604b037e
905df55b-4542-4b05-b373-c640fa11de43	moveAndPickupGrain(final Hamster paule)	0	fc39b324-a176-45a7-b422-6d5a604b037e
\.


--
-- Data for Name: code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.code (id) FROM stdin;
9eae7c5b-1994-4f1a-a025-12f3d79a236c
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663
1ba912d4-c578-444b-8e87-e0f31e3c15bc
a6617f1a-3bfb-4e33-a072-cb52f33de710
1bbfef09-ab9e-49d8-9f66-9b122199f978
\.


--
-- Data for Name: code_words; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.code_words (code_id, words_id) FROM stdin;
9eae7c5b-1994-4f1a-a025-12f3d79a236c	a54414a8-1297-4a11-b29f-6e381059690a
1ba912d4-c578-444b-8e87-e0f31e3c15bc	b0b5ebfa-950c-4adb-8b98-936e027df27e
a6617f1a-3bfb-4e33-a072-cb52f33de710	53d010ed-483b-497b-b4f0-3c38ad3fbc77
9eae7c5b-1994-4f1a-a025-12f3d79a236c	f4c2509f-f00b-477e-9117-052360440e28
1ba912d4-c578-444b-8e87-e0f31e3c15bc	fdeaf388-4da8-4c76-9308-8d9e761adf97
a6617f1a-3bfb-4e33-a072-cb52f33de710	2cc167c7-f976-4241-98bb-cba16833f887
1ba912d4-c578-444b-8e87-e0f31e3c15bc	534b407c-c7ed-46de-8d93-e486124e13de
9eae7c5b-1994-4f1a-a025-12f3d79a236c	3b234f85-d667-40f4-9bc3-856d23b83e49
a6617f1a-3bfb-4e33-a072-cb52f33de710	959fb25a-56ab-4858-b748-721125bd4225
1ba912d4-c578-444b-8e87-e0f31e3c15bc	e3c7656a-7e56-4ccd-9bc9-b453ded21d47
9eae7c5b-1994-4f1a-a025-12f3d79a236c	9655d15d-174f-43b0-a96d-ce2c2cf7c363
a6617f1a-3bfb-4e33-a072-cb52f33de710	72cf4c53-10ee-4c84-b26e-f4bcdbb26e36
1ba912d4-c578-444b-8e87-e0f31e3c15bc	cd3af2d9-a6f5-45e8-9814-f12b6b0eb73d
a6617f1a-3bfb-4e33-a072-cb52f33de710	3039f759-7978-49a0-b91d-76756c95df80
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	3dd08e9b-ce80-43c1-a510-ac10d5dd7a13
9eae7c5b-1994-4f1a-a025-12f3d79a236c	6c4b71dc-5301-4855-a904-e44f32ecf9b2
1ba912d4-c578-444b-8e87-e0f31e3c15bc	32c44642-f0ef-43cd-a795-71dbb60db7e2
a6617f1a-3bfb-4e33-a072-cb52f33de710	8c77f6a7-09ac-43dc-8583-b14fafdfd9e5
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	35b31022-86cd-4df2-8895-2f67a7cd97d2
9eae7c5b-1994-4f1a-a025-12f3d79a236c	79784a69-548d-43fb-bf25-7c67f397b396
1ba912d4-c578-444b-8e87-e0f31e3c15bc	1abd125e-1dad-48fd-ba8f-df1e60c72c0a
a6617f1a-3bfb-4e33-a072-cb52f33de710	fa1d8b79-1ab9-4ab9-9c16-74f8cee95958
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	66b0f2e1-1a5a-4bd0-b1ba-4772c741d5fe
a6617f1a-3bfb-4e33-a072-cb52f33de710	e6c9a313-2f6b-436a-8eb4-48b1b8d66896
1ba912d4-c578-444b-8e87-e0f31e3c15bc	f8fc03f9-b09d-4b62-ba12-adb5d864f8da
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	68f5c65a-2f2f-4f8c-8250-24d41ff81b0c
9eae7c5b-1994-4f1a-a025-12f3d79a236c	783024ca-6883-4a18-864e-666f4127e657
a6617f1a-3bfb-4e33-a072-cb52f33de710	b5afd2d0-75c5-4d0f-a21f-25114ba6f9e9
1ba912d4-c578-444b-8e87-e0f31e3c15bc	8a8c0c4b-6206-40a9-9e84-25f733bd3ccd
9eae7c5b-1994-4f1a-a025-12f3d79a236c	29672311-6655-48b1-81de-fea9cefab958
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	a1a2758a-8835-4fb7-a39b-6be6ec774570
a6617f1a-3bfb-4e33-a072-cb52f33de710	3d86c2d3-9f64-4074-9e35-32dd7eff1036
1ba912d4-c578-444b-8e87-e0f31e3c15bc	fe51966c-16d1-4325-9046-ef77f8eb74af
9eae7c5b-1994-4f1a-a025-12f3d79a236c	d62f82a4-a3d5-4325-b9c1-89354f68e858
9eae7c5b-1994-4f1a-a025-12f3d79a236c	1e0b0743-94b1-4c35-87cd-d884a6a14f66
9eae7c5b-1994-4f1a-a025-12f3d79a236c	1d6203a3-9396-472f-b385-924182d9f9f7
9eae7c5b-1994-4f1a-a025-12f3d79a236c	c3d7d145-bd96-45d5-84ff-00c9b24b2aed
9eae7c5b-1994-4f1a-a025-12f3d79a236c	51c5813a-7617-43f4-b572-6335dc14c722
9eae7c5b-1994-4f1a-a025-12f3d79a236c	f9f6cd42-adc5-4146-80d9-bc00ad3f6be4
9eae7c5b-1994-4f1a-a025-12f3d79a236c	9382a237-d606-43f6-9c9a-6e2f975a5394
1ba912d4-c578-444b-8e87-e0f31e3c15bc	e47acb34-c18c-4e11-b38c-decc40a95864
1ba912d4-c578-444b-8e87-e0f31e3c15bc	2c1dce42-616d-4175-b7cd-618bd361722f
1ba912d4-c578-444b-8e87-e0f31e3c15bc	9ef68125-c4c3-4891-9c40-68f6cea62813
a6617f1a-3bfb-4e33-a072-cb52f33de710	81e54b7e-9aff-4dfa-96a0-28933b7e10b0
1ba912d4-c578-444b-8e87-e0f31e3c15bc	3d854b13-c1e2-450a-a028-6bfaec0fa83d
a6617f1a-3bfb-4e33-a072-cb52f33de710	37406490-3340-44c2-9c6d-b8695410bada
1ba912d4-c578-444b-8e87-e0f31e3c15bc	d8da1404-195d-4ed9-8079-8e5961d456f7
a6617f1a-3bfb-4e33-a072-cb52f33de710	ee7a0360-7499-487a-977c-e1f0da0a39df
a6617f1a-3bfb-4e33-a072-cb52f33de710	df7666e2-4a3f-4e5b-bbc5-a7d5ab5f9b24
1ba912d4-c578-444b-8e87-e0f31e3c15bc	8bef76b4-77f1-4f75-86df-61e0a79a2eac
a6617f1a-3bfb-4e33-a072-cb52f33de710	8251f7c8-3068-4cde-9c24-54ec0f79ccca
1ba912d4-c578-444b-8e87-e0f31e3c15bc	4a8fdb2b-9fb0-4056-a801-4c60108df3be
a6617f1a-3bfb-4e33-a072-cb52f33de710	b7d6fbf4-9089-4009-b3fc-097cbf8b875a
1ba912d4-c578-444b-8e87-e0f31e3c15bc	99541e37-24c7-4c4b-9998-2bfef8a2e4e2
a6617f1a-3bfb-4e33-a072-cb52f33de710	e4ebf51a-1897-4b9e-a749-0ebdef73affc
1ba912d4-c578-444b-8e87-e0f31e3c15bc	b0a7b6e0-5c89-459a-b74c-2b56efcfef94
a6617f1a-3bfb-4e33-a072-cb52f33de710	4e22b405-27e0-4bd1-94f0-bf8993aa1dfe
a6617f1a-3bfb-4e33-a072-cb52f33de710	7a5765bb-1d10-4ea8-bb2a-b8287e9bb884
a6617f1a-3bfb-4e33-a072-cb52f33de710	333e30ca-273f-47a8-9110-f86b06a457d5
a6617f1a-3bfb-4e33-a072-cb52f33de710	b8c09186-c1f0-477d-8c47-15fc18116236
a6617f1a-3bfb-4e33-a072-cb52f33de710	ca98675d-04c9-4a26-9f39-b67b508461d8
a6617f1a-3bfb-4e33-a072-cb52f33de710	1626d8be-5077-4155-9cf8-c5e2dd1d0d4d
1bbfef09-ab9e-49d8-9f66-9b122199f978	66c635d7-ee40-4a54-aff5-2aea77d275eb
1bbfef09-ab9e-49d8-9f66-9b122199f978	d05e30c2-f89e-4de5-b336-aa37b6339d79
1bbfef09-ab9e-49d8-9f66-9b122199f978	c9bee9e3-b0b9-4c6d-bcf2-ff60a627c919
1bbfef09-ab9e-49d8-9f66-9b122199f978	2126e57d-6179-4d12-ac71-bdf5a10cb80e
1bbfef09-ab9e-49d8-9f66-9b122199f978	0d64d777-6dba-46ad-8d8c-0f093174211d
1bbfef09-ab9e-49d8-9f66-9b122199f978	8471295d-a636-4b17-b8ac-3880e830a1ed
1bbfef09-ab9e-49d8-9f66-9b122199f978	fc39b324-a176-45a7-b422-6d5a604b037e
1bbfef09-ab9e-49d8-9f66-9b122199f978	c269ddc8-3b44-48f9-8844-371ccdfea789
1bbfef09-ab9e-49d8-9f66-9b122199f978	f873f33c-be21-487c-bf47-7ee9fed02be6
1bbfef09-ab9e-49d8-9f66-9b122199f978	95486304-9ea0-49ed-ac8b-c3e07646ef60
1bbfef09-ab9e-49d8-9f66-9b122199f978	796685e0-6ed8-4c2c-9928-e7b2f1940f63
1bbfef09-ab9e-49d8-9f66-9b122199f978	8cda4799-ee08-4db0-a9bb-0b9101378b4d
1bbfef09-ab9e-49d8-9f66-9b122199f978	69fe6511-3c2a-472e-af48-47f030df17b2
1bbfef09-ab9e-49d8-9f66-9b122199f978	77400304-04e5-49bc-9c21-0a9c3c895793
1bbfef09-ab9e-49d8-9f66-9b122199f978	a75ad254-28de-47f3-b9a2-e3dbdd6bfc10
1bbfef09-ab9e-49d8-9f66-9b122199f978	c7130281-5fef-48fc-a6c2-78097d44dc43
1bbfef09-ab9e-49d8-9f66-9b122199f978	1da41ed8-c535-49dc-b80e-cb4e7613d456
1bbfef09-ab9e-49d8-9f66-9b122199f978	f6fe1e2b-cf2b-4ee7-b42b-b63fdc551590
1bbfef09-ab9e-49d8-9f66-9b122199f978	d3859655-f35b-42cc-a337-0863ed9c944c
1bbfef09-ab9e-49d8-9f66-9b122199f978	ed1d72a3-38e3-475c-a002-012e914d7af1
1bbfef09-ab9e-49d8-9f66-9b122199f978	0290dc25-53a4-4e13-bfc2-f05e03661431
1bbfef09-ab9e-49d8-9f66-9b122199f978	9a4a3145-9376-4bd2-925c-4b6f27a3d4e5
1bbfef09-ab9e-49d8-9f66-9b122199f978	4b9f9c0e-6f26-485a-8aa3-79bd269b17a0
1bbfef09-ab9e-49d8-9f66-9b122199f978	ed9a0a2a-7801-40b6-9498-83fd356f1864
1bbfef09-ab9e-49d8-9f66-9b122199f978	53038aee-ef7c-4b48-9658-fccff9383930
1bbfef09-ab9e-49d8-9f66-9b122199f978	0b8ca8c6-23c6-467c-a717-ddc872dfb2fb
1bbfef09-ab9e-49d8-9f66-9b122199f978	40d13541-54fa-4c06-868c-62ff54c56047
1bbfef09-ab9e-49d8-9f66-9b122199f978	625fe545-163a-4a7d-8096-5be47e4167ef
1bbfef09-ab9e-49d8-9f66-9b122199f978	07f41760-77e4-42cc-92be-c5d0884d4263
1bbfef09-ab9e-49d8-9f66-9b122199f978	55c11d9c-0c5c-4be5-adad-92198dff6d2d
1bbfef09-ab9e-49d8-9f66-9b122199f978	ee20fddb-37ae-46f6-b179-2efba602e251
1bbfef09-ab9e-49d8-9f66-9b122199f978	bd0b66b5-dbfd-4c19-93ab-0e057815d24f
1bbfef09-ab9e-49d8-9f66-9b122199f978	de2b5065-11dc-48c7-8885-82f9981162ac
1bbfef09-ab9e-49d8-9f66-9b122199f978	41b5d9a1-c948-4b2a-874e-42608fe33079
1bbfef09-ab9e-49d8-9f66-9b122199f978	b206cf48-88db-4b32-88f9-3ba2fee5b200
1bbfef09-ab9e-49d8-9f66-9b122199f978	aae186e1-c2df-4419-ae3e-459ebd77a1c8
1bbfef09-ab9e-49d8-9f66-9b122199f978	12b29286-bff3-4b14-93b5-e564a11ee99d
1bbfef09-ab9e-49d8-9f66-9b122199f978	7fcec45a-2af1-49a3-bac5-00a7d944e22b
1bbfef09-ab9e-49d8-9f66-9b122199f978	f64a58af-8766-46d4-a80c-a68e2b02046f
1bbfef09-ab9e-49d8-9f66-9b122199f978	bbf814dd-b525-445e-b1be-15d255c165da
1bbfef09-ab9e-49d8-9f66-9b122199f978	8abd3782-6705-437d-b1c8-5dddbb6ef16a
1bbfef09-ab9e-49d8-9f66-9b122199f978	38d411d9-d341-4e7c-99ee-b57971f3b3cd
1bbfef09-ab9e-49d8-9f66-9b122199f978	255719d0-e461-4629-916d-184d64e07d0b
1bbfef09-ab9e-49d8-9f66-9b122199f978	4fb180e7-782f-448d-93ed-62e64dbfae02
1bbfef09-ab9e-49d8-9f66-9b122199f978	e53d2bf4-3835-4cf9-9a3e-7f02b18c7be6
1bbfef09-ab9e-49d8-9f66-9b122199f978	39f99e4e-9ae0-4925-8f21-f767e2dc0d1f
1bbfef09-ab9e-49d8-9f66-9b122199f978	bb18976b-d528-4a01-b193-54336dceb8df
1bbfef09-ab9e-49d8-9f66-9b122199f978	eef67b1f-2fec-4001-8477-70c2bdb784e9
1bbfef09-ab9e-49d8-9f66-9b122199f978	882e8876-fc37-467c-8a56-7461e47f3fab
1bbfef09-ab9e-49d8-9f66-9b122199f978	ebe464a5-a7ca-4cc3-9802-f086ae951363
1bbfef09-ab9e-49d8-9f66-9b122199f978	7d15e609-362f-49fb-b0b4-4fc912b7a5ff
1bbfef09-ab9e-49d8-9f66-9b122199f978	04f5a4d7-7b20-4007-a844-a73eae86fc9d
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	eaa2526c-1de2-4fcf-b42d-2dbb71268dc9
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	44e85f16-1f2f-453a-a5c6-d947938c4e91
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	a6818c91-a04d-4f67-8edf-0bdbfd7d42d3
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	26355796-0d3f-4428-982f-6586211bc6ae
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	0f106dda-e6f4-4619-b3a7-478b8a725493
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	a8c394b2-a187-4367-b609-d31b1aace0b3
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	0e9405f0-dc9d-45ba-81c4-182630f46990
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	c9c8b6df-1ab1-4498-a120-c3443eb3b527
34ea10c1-75c3-48b0-8a8e-3fabbe4e9663	0d09ca1f-1961-4039-84c3-776fa05ea730
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration (id) FROM stdin;
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9
\.


--
-- Data for Name: configuration_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration_codes (configuration_id, codes_id) FROM stdin;
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9	9eae7c5b-1994-4f1a-a025-12f3d79a236c
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9	34ea10c1-75c3-48b0-8a8e-3fabbe4e9663
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9	a6617f1a-3bfb-4e33-a072-cb52f33de710
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9	1bbfef09-ab9e-49d8-9f66-9b122199f978
85b3c9be-58ec-48d8-a91a-1b8fcdb99ae9	1ba912d4-c578-444b-8e87-e0f31e3c15bc
\.


--
-- Data for Name: solution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solution (id) FROM stdin;
f97b91d4-3fee-40da-9506-cae496451e9b
527616e1-2719-4597-8a3f-dee53c258354
d7c16bc7-02b9-410a-b8df-0c1f33e16610
4930cdc8-00eb-4e9a-8000-a190cea8b190
340145dc-8119-4e9e-9a76-3d37f1689d85
\.


--
-- Data for Name: solution_bugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solution_bugs (solution_id, bugs_id) FROM stdin;
f97b91d4-3fee-40da-9506-cae496451e9b	8b5fc412-d0f9-4acb-9b2b-e467d4c4e13c
527616e1-2719-4597-8a3f-dee53c258354	b81538dc-0c10-4118-97eb-df6a75103c83
4930cdc8-00eb-4e9a-8000-a190cea8b190	e25c6757-861d-4fd0-909b-f075934b6473
340145dc-8119-4e9e-9a76-3d37f1689d85	f1e9f822-06a1-40fb-81ab-43ea9e61d493
d7c16bc7-02b9-410a-b8df-0c1f33e16610	6e06f3af-9e86-48de-b3a9-9ad073cdbc7a
527616e1-2719-4597-8a3f-dee53c258354	3b3d9bbc-e544-4883-88f9-2d471f934dfa
527616e1-2719-4597-8a3f-dee53c258354	d2ad4470-668d-4105-888b-ade77691ef29
d7c16bc7-02b9-410a-b8df-0c1f33e16610	905df55b-4542-4b05-b373-c640fa11de43
\.


--
-- Data for Name: word; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.word (id, word) FROM stdin;
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

