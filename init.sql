--
-- PostgreSQL database dump
--

\restrict UtuSwxPUYugCEuUrTAXdpp8MkoNx4ojsOg61zYvWwR2WaB3InBKb8KnzEMmcj22

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: EnergoDetal
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO "EnergoDetal";

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: EnergoDetal
--

COMMENT ON SCHEMA public IS '';


--
-- Name: Type; Type: TYPE; Schema: public; Owner: EnergoDetal
--

CREATE TYPE public."Type" AS ENUM (
    'Products',
    'Machines',
    'Production'
);


ALTER TYPE public."Type" OWNER TO "EnergoDetal";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Drawing; Type: TABLE; Schema: public; Owner: EnergoDetal
--

CREATE TABLE public."Drawing" (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    imageurl text NOT NULL
);


ALTER TABLE public."Drawing" OWNER TO "EnergoDetal";

--
-- Name: Drawing_id_seq; Type: SEQUENCE; Schema: public; Owner: EnergoDetal
--

CREATE SEQUENCE public."Drawing_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Drawing_id_seq" OWNER TO "EnergoDetal";

--
-- Name: Drawing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EnergoDetal
--

ALTER SEQUENCE public."Drawing_id_seq" OWNED BY public."Drawing".id;


--
-- Name: Execution; Type: TABLE; Schema: public; Owner: EnergoDetal
--

CREATE TABLE public."Execution" (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    model3durl text NOT NULL,
    certificate text NOT NULL,
    imageurls text[],
    "drawingId" integer NOT NULL
);


ALTER TABLE public."Execution" OWNER TO "EnergoDetal";

--
-- Name: ExecutionItem; Type: TABLE; Schema: public; Owner: EnergoDetal
--

CREATE TABLE public."ExecutionItem" (
    id integer NOT NULL,
    name text NOT NULL,
    mass double precision NOT NULL,
    price1 double precision NOT NULL,
    price2 double precision NOT NULL,
    "executionId" integer NOT NULL
);


ALTER TABLE public."ExecutionItem" OWNER TO "EnergoDetal";

--
-- Name: ExecutionItem_id_seq; Type: SEQUENCE; Schema: public; Owner: EnergoDetal
--

CREATE SEQUENCE public."ExecutionItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ExecutionItem_id_seq" OWNER TO "EnergoDetal";

--
-- Name: ExecutionItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EnergoDetal
--

ALTER SEQUENCE public."ExecutionItem_id_seq" OWNED BY public."ExecutionItem".id;


--
-- Name: Execution_id_seq; Type: SEQUENCE; Schema: public; Owner: EnergoDetal
--

CREATE SEQUENCE public."Execution_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Execution_id_seq" OWNER TO "EnergoDetal";

--
-- Name: Execution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EnergoDetal
--

ALTER SEQUENCE public."Execution_id_seq" OWNED BY public."Execution".id;


--
-- Name: Image; Type: TABLE; Schema: public; Owner: EnergoDetal
--

CREATE TABLE public."Image" (
    id integer NOT NULL,
    type public."Type" NOT NULL,
    url text NOT NULL
);


ALTER TABLE public."Image" OWNER TO "EnergoDetal";

--
-- Name: Image_id_seq; Type: SEQUENCE; Schema: public; Owner: EnergoDetal
--

CREATE SEQUENCE public."Image_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Image_id_seq" OWNER TO "EnergoDetal";

--
-- Name: Image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EnergoDetal
--

ALTER SEQUENCE public."Image_id_seq" OWNED BY public."Image".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: EnergoDetal
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO "EnergoDetal";

--
-- Name: Drawing id; Type: DEFAULT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public."Drawing" ALTER COLUMN id SET DEFAULT nextval('public."Drawing_id_seq"'::regclass);


--
-- Name: Execution id; Type: DEFAULT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public."Execution" ALTER COLUMN id SET DEFAULT nextval('public."Execution_id_seq"'::regclass);


--
-- Name: ExecutionItem id; Type: DEFAULT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public."ExecutionItem" ALTER COLUMN id SET DEFAULT nextval('public."ExecutionItem_id_seq"'::regclass);


--
-- Name: Image id; Type: DEFAULT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public."Image" ALTER COLUMN id SET DEFAULT nextval('public."Image_id_seq"'::regclass);


--
-- Data for Name: Drawing; Type: TABLE DATA; Schema: public; Owner: EnergoDetal
--

COPY public."Drawing" (id, name, description, imageurl) FROM stdin;
1	ОСТ 36-146-88	Описание для ОСТ 36-146-88	https://storage.yandexcloud.net/energodetal/Main/%D0%A4%D0%BE%D1%82%D0%BE%20%D1%87%D0%B5%D1%80%D1%82%D0%B5%D0%B6%20%D0%9E%D0%A1%D0%A2%2036-146-88.jpg
\.


--
-- Data for Name: Execution; Type: TABLE DATA; Schema: public; Owner: EnergoDetal
--

COPY public."Execution" (id, name, description, model3durl, certificate, imageurls, "drawingId") FROM stdin;
1	КП	Описание для КП	https://storage.yandexcloud.net/energodetal/Models/%D0%9C%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C.glb	https://storage.yandexcloud.net/energodetal/Certificate/%D0%A1%D0%B5%D1%80%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%82.jpg	{https://storage.yandexcloud.net/energodetal/Main/%D0%9A%D0%9F1.png,https://storage.yandexcloud.net/energodetal/Main/%D0%9A%D0%9F2.jpg,https://storage.yandexcloud.net/energodetal/Main/%D0%9A%D0%9F3.jpg}	1
\.


--
-- Data for Name: ExecutionItem; Type: TABLE DATA; Schema: public; Owner: EnergoDetal
--

COPY public."ExecutionItem" (id, name, mass, price1, price2, "executionId") FROM stdin;
1	57-A22	1	100	200	1
\.


--
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: EnergoDetal
--

COPY public."Image" (id, type, url) FROM stdin;
1	Products	https://storage.yandexcloud.net/energodetal/Galery/%D0%9D%D0%B0%20%D0%B3%D0%B0%D0%BB%D0%B5%D1%80%D0%B5%D1%8E%20%D0%9F%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%86%D0%B8%D1%8F.jpg
2	Machines	https://storage.yandexcloud.net/energodetal/Galery/%D0%94%D0%BB%D1%8F%20%D0%B3%D0%B0%D0%BB%D0%B5%D1%80%D0%B5%D0%B8%20%D0%BE%D0%B1%D0%BE%D1%80%D1%83%D0%B4%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5.jpg
3	Production	https://storage.yandexcloud.net/energodetal/Galery/%D0%94%D0%BB%D1%8F%20%D0%B3%D0%B0%D0%BB%D0%B5%D1%80%D0%B5%D0%B8%20%D0%A6%D0%B5%D1%85.jpg
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: EnergoDetal
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
2c717aad-19c2-40f3-9146-189ed4f3fdae	64590c9b69a386b592fe9a525c52354f9163243592f7a5c561d4fb607e3e16f9	2025-08-19 22:01:03.160684+00	20250819220103_stage	\N	\N	2025-08-19 22:01:03.094425+00	1
\.


--
-- Name: Drawing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EnergoDetal
--

SELECT pg_catalog.setval('public."Drawing_id_seq"', 1, true);


--
-- Name: ExecutionItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EnergoDetal
--

SELECT pg_catalog.setval('public."ExecutionItem_id_seq"', 1, true);


--
-- Name: Execution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EnergoDetal
--

SELECT pg_catalog.setval('public."Execution_id_seq"', 1, true);


--
-- Name: Image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EnergoDetal
--

SELECT pg_catalog.setval('public."Image_id_seq"', 3, true);


--
-- Name: Drawing Drawing_pkey; Type: CONSTRAINT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public."Drawing"
    ADD CONSTRAINT "Drawing_pkey" PRIMARY KEY (id);


--
-- Name: ExecutionItem ExecutionItem_pkey; Type: CONSTRAINT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public."ExecutionItem"
    ADD CONSTRAINT "ExecutionItem_pkey" PRIMARY KEY (id);


--
-- Name: Execution Execution_pkey; Type: CONSTRAINT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public."Execution"
    ADD CONSTRAINT "Execution_pkey" PRIMARY KEY (id);


--
-- Name: Image Image_pkey; Type: CONSTRAINT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Drawing_name_key; Type: INDEX; Schema: public; Owner: EnergoDetal
--

CREATE UNIQUE INDEX "Drawing_name_key" ON public."Drawing" USING btree (name);


--
-- Name: ExecutionItem_executionId_name_idx; Type: INDEX; Schema: public; Owner: EnergoDetal
--

CREATE INDEX "ExecutionItem_executionId_name_idx" ON public."ExecutionItem" USING btree ("executionId", name);


--
-- Name: ExecutionItem ExecutionItem_executionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public."ExecutionItem"
    ADD CONSTRAINT "ExecutionItem_executionId_fkey" FOREIGN KEY ("executionId") REFERENCES public."Execution"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Execution Execution_drawingId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: EnergoDetal
--

ALTER TABLE ONLY public."Execution"
    ADD CONSTRAINT "Execution_drawingId_fkey" FOREIGN KEY ("drawingId") REFERENCES public."Drawing"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: EnergoDetal
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict UtuSwxPUYugCEuUrTAXdpp8MkoNx4ojsOg61zYvWwR2WaB3InBKb8KnzEMmcj22

