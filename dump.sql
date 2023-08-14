--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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
-- Name: pets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pets (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "petName" character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    about character varying(255) NOT NULL,
    "phoneInfo" character varying(255) NOT NULL
);


--
-- Name: pets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pets_id_seq OWNED BY public.pets.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer,
    token text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    cpf character varying(11) NOT NULL,
    phone character varying(11) NOT NULL,
    email character varying(50) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    password character varying(255) NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: pets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets ALTER COLUMN id SET DEFAULT nextval('public.pets_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pets VALUES (6, 4, true, '2023-08-10 10:06:57.527213', 'Pingo', 'https://cobasi.vteximg.com.br/arquivos/ids/711533/AdobeStock_272667418.png?v=637581771455600000', 'Pingo é um husky muito alegre e brincalhão.', '55555555555');
INSERT INTO public.pets VALUES (7, 5, true, '2023-08-10 10:20:46.625577', 'João Pedro', 'https://t2.ea.ltmcdn.com/pt/posts/2/5/6/racas_de_gatos_brancos_lista_completa_23652_orig.jpg', 'O gato mais carinhoso que você vai conhecer!', '88888888888');
INSERT INTO public.pets VALUES (8, 5, true, '2023-08-10 11:17:25.671511', 'Hamert', 'https://media.istockphoto.com/id/91778222/pt/foto/fofo-hamster.jpg?s=612x612&w=0&k=20&c=r7iuKzAtvhH-7r4mU-6dfsXwhEbo7866Rio-1vS5qY4=', 'Brincalhão e esfomeado!', '88888888888');
INSERT INTO public.pets VALUES (14, 6, true, '2023-08-14 09:35:32.763157', 'Zeca Urubu', 'https://www.parquedasaves.com.br/wp-content/uploads/2022/05/papagaio-de-cara-roxa-especie-em-risco-de-extincao-960x640-1.jpg', 'Um papagaio comunicativo e fotogênico!', '32988636723');
INSERT INTO public.pets VALUES (12, 3, true, '2023-08-10 12:50:32.781912', 'Theo e Marley', 'https://i.im.ge/2023/08/10/jbsirJ.WhatsApp-Image-2023-08-10-at-11-08-41-fotor-20230810124932.png', 'Duplinha de yorkshires!', '32777777777');
INSERT INTO public.pets VALUES (13, 3, true, '2023-08-10 12:52:13.589046', 'Dalila', 'https://i.im.ge/2023/08/10/jbsmI6.WhatsApp-Image-2023-08-10-at-11-09-22-1.jpg', 'Gata mais linda que você verá hoje!', '32777777777');
INSERT INTO public.pets VALUES (9, 3, true, '2023-08-10 12:42:58.340768', 'Chloe', 'https://media.istockphoto.com/id/1018110882/pt/foto/purebred-puppy-rottweiler.jpg?s=170667a&w=0&k=20&c=owh75idVc2cZ1lTyDd9rZddG3k4GN1B4DHl73-97uQQ=', 'LInda filhote de rotweiller!', '32777777777');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'ad92d4ed-30d4-4b77-9c89-fdba5b370c11', '2023-08-08 14:11:24.979912');
INSERT INTO public.sessions VALUES (2, 2, 'cb217303-5174-478b-aa14-3c0d2bef46e2', '2023-08-09 18:16:29.02416');
INSERT INTO public.sessions VALUES (3, 3, '0f8abd63-fe06-4eca-982a-a88975fcd08e', '2023-08-09 21:20:56.431971');
INSERT INTO public.sessions VALUES (4, 3, '353aead9-cdc7-4c1b-9ffd-59c7f265f55d', '2023-08-09 21:46:12.178712');
INSERT INTO public.sessions VALUES (5, 3, 'aec5fd1d-a48b-416d-a0ca-11361b600d06', '2023-08-10 10:02:26.376334');
INSERT INTO public.sessions VALUES (6, 4, 'fd73cc42-2c4f-4c0e-9118-9ad226ebbe1f', '2023-08-10 10:05:20.75503');
INSERT INTO public.sessions VALUES (7, 4, 'd9421832-1b2c-4f19-8cc1-6e67ee3e7934', '2023-08-10 10:07:20.843679');
INSERT INTO public.sessions VALUES (8, 5, '4dd06cd2-28de-4c79-b516-b21d2d48af8b', '2023-08-10 10:18:23.160265');
INSERT INTO public.sessions VALUES (9, 3, '78946d86-499e-4fbb-8d1c-94c267b46ae8', '2023-08-10 10:58:15.661288');
INSERT INTO public.sessions VALUES (10, 2, '516018e0-4ec8-45eb-b6f0-2b63c1522dc2', '2023-08-10 11:13:40.249827');
INSERT INTO public.sessions VALUES (11, 3, '5f978d16-9418-4867-a1ee-1f51876d6c9a', '2023-08-10 11:33:29.897439');
INSERT INTO public.sessions VALUES (12, 6, '7eae41b1-9a8e-40fb-b11c-3d1876f32cbf', '2023-08-14 09:32:56.780206');
INSERT INTO public.sessions VALUES (13, 6, 'be4e77ca-327b-4f23-afb1-558ddb7052b6', '2023-08-14 09:32:58.073946');
INSERT INTO public.sessions VALUES (14, 6, '31d2b1b4-2c27-4c97-9812-52f8ee17705c', '2023-08-14 09:32:59.441535');
INSERT INTO public.sessions VALUES (15, 6, '9d90b760-8e98-43db-9a5b-cec8fb30b838', '2023-08-14 09:32:59.869161');
INSERT INTO public.sessions VALUES (16, 6, '55a0f128-db3d-43eb-988f-7b1617b26b13', '2023-08-14 09:32:59.994793');
INSERT INTO public.sessions VALUES (17, 6, 'f20e1f16-12b6-41b2-9257-34f62113fa75', '2023-08-14 09:33:22.12406');
INSERT INTO public.sessions VALUES (18, 6, 'bafca661-1881-40d4-8859-eb039c2807f6', '2023-08-14 09:50:07.694144');
INSERT INTO public.sessions VALUES (19, 6, 'bc2466c7-604d-44c7-bb3d-a7a68fd71379', '2023-08-14 09:51:26.404967');
INSERT INTO public.sessions VALUES (20, 2, '10f74c2f-b8da-4030-9ac4-6586e7d47592', '2023-08-14 10:54:42.886174');
INSERT INTO public.sessions VALUES (21, 3, 'a9fa35f8-650f-4322-9cd1-907a818ef16d', '2023-08-14 10:55:48.257879');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Gustavo', '11111111111', '11111111111', 'gustavo@driven.com.br', '2023-08-08 14:10:31.576707', '$2b$10$cUNURAvST0GfeaaFAUXuruU7feRJTS2brXc5qf86BneDmV3L8hWhC');
INSERT INTO public.users VALUES (2, 'Marcelo', '22222222222', '32888888888', 'marcelo@driven.com', '2023-08-09 18:16:05.495235', '$2b$10$YcVtpkAa5Hkr4Oz905i./OwBVlDOfzy7QKYLntUB31bg6VedifcJu');
INSERT INTO public.users VALUES (3, 'Gu', '77777777777', '32777777777', 'gu@driven.com', '2023-08-09 21:20:45.800853', '$2b$10$PbaUDcD8/PWnCQ.q.SXOBOKkIwiMvTNyZyRxef2AuaY4FzQxf7Zj6');
INSERT INTO public.users VALUES (4, 'alvaro', '55555555555', '55555555555', 'alvaro@driven.com', '2023-08-10 10:05:08.947176', '$2b$10$we18FZDKBoXtholMBdkZ2OLpsRY67yUuYDhKWdA3Vx9K8wSnqLZC.');
INSERT INTO public.users VALUES (5, 'jhibram', '88888888888', '88888888888', 'gibran@driven.com', '2023-08-10 10:18:08.540842', '$2b$10$/6lEn9nQ1g14/r2GODBRFeedrvuDJZNBeK1jnDH8YIwYBpnSOBK6q');
INSERT INTO public.users VALUES (6, 'Gu', '12345678912', '32988636723', 'gusta@driven.com', '2023-08-14 09:30:46.401354', '$2b$10$la2LMT8hWjhrLAoVN2.8aOFD06EDThKLiwj0IfI2b56GsSkMA1WbK');


--
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pets_id_seq', 14, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 21, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cpf_key UNIQUE (cpf);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: pets pets_phoneInfo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT "pets_phoneInfo_fkey" FOREIGN KEY ("phoneInfo") REFERENCES public.users(phone);


--
-- Name: pets pets_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT "pets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

