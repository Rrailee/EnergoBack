--
-- PostgreSQL database dump
--

\restrict 6VI7wphkcgHcn0AeSbPAmqDhMTn1BTkalMX37bSkkbKZyGvzhU2i6qk6up2hx3d

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
2	ОСТ 36-94-83(ГОСТ 14911-82)	Описание для ОСТ 36-94-83	""
3	Серия 4.903-10	Описание для Серии 4.903-10	""
4	Серия 5.903-13	Описание для Серии 5.903-13	""
\.


--
-- Data for Name: Execution; Type: TABLE DATA; Schema: public; Owner: EnergoDetal
--

COPY public."Execution" (id, name, description, model3durl, certificate, imageurls, "drawingId") FROM stdin;
1	КП	Описание для КП	https://storage.yandexcloud.net/energodetal/Models/%D0%9E%D0%BF%D0%BE%D1%80%D1%8B%20%D0%9A%D0%A5%20%D0%9E%D0%A1%D0%A2%2036-146-88%20Restailed.glb	https://storage.yandexcloud.net/energodetal/Certificate/%D0%A1%D0%B5%D1%80%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%82.jpg	{https://storage.yandexcloud.net/energodetal/Main/%D0%9A%D0%9F1.png,https://storage.yandexcloud.net/energodetal/Main/%D0%9A%D0%9F2.jpg,https://storage.yandexcloud.net/energodetal/Main/%D0%9A%D0%9F3.jpg}	1
2	КХ	Описание для КХ	""	""	{""}	1
5	ТП	Описание для ТП	""	""	{"",""}	1
6	ТО	Описание для ТО	""	""	{"",""}	1
7	ТР	Описание для ТР	""	""	{"",""}	1
8	ТХ	Описание для ТХ	""	""	{"",""}	1
9	ВП	Описание для ВП	""	""	{"",""}	1
10	ХБ	Описание для ХБ	""	""	{"",""}	1
11	УП	Описание для УП	""	""	{"",""}	1
12	ШП	Описание для ШП	""	""	{"",""}	1
13	КН	Описание для КН	""	""	{"",""}	1
\.


--
-- Data for Name: ExecutionItem; Type: TABLE DATA; Schema: public; Owner: EnergoDetal
--

COPY public."ExecutionItem" (id, name, mass, price1, price2, "executionId") FROM stdin;
2	57-КП-А11	1.3	260	286	1
3	57-КП-А12	2.6	520	572	1
4	57-КП-А21	1.8	360	396	1
5	57-КП-А22	3.6	720	792	1
6	76-КП-А11	1.3	260	286	1
7	76-КП-А12	2.5	500	550	1
8	76-КП-А21	1.8	360	396	1
9	76-КП-А22	3.5	700	770	1
10	89-КП-А11	1.2	240	264	1
11	89-КП-А12	2.5	500	550	1
12	89-КП-А21	1.7	340	374	1
13	89-КП-А22	3.5	700	770	1
14	108-КП-А11	1.5	300	330	1
15	108-КП-А12	3	600	660	1
16	108-КП-А21	2.1	420	462	1
17	108-КП-А22	4.2	840	924	1
18	133-КП-А11	1.5	300	330	1
19	133-КП-А12	3	600	660	1
20	133-КП-А21	2	400	440	1
21	133-КП-А22	4.1	820	902	1
22	159-КП-А11	1.5	300	330	1
23	159-КП-А12	3	600	660	1
24	159-КП-А21	2	400	440	1
25	159-КП-А22	4.1	820	902	1
26	219-КП-А11	2.7	540	594	1
27	219-КП-А12	6.1	1220	1342	1
28	219-КП-А13	11	2200	2420	1
29	219-КП-Б12	7	1400	1540	1
30	219-КП-Б13	11.9	2380	2618	1
31	219-КП-А21	3.4	680	748	1
32	219-КП-А22	7.3	1460	1606	1
33	219-КП-А23	13.3	2660	2926	1
34	219-КП-Б22	8.2	1640	1804	1
35	219-КП-Б23	14.2	2840	3124	1
36	273-КП-А11	2.6	520	572	1
37	273-КП-А12	7.1	1420	1562	1
38	273-КП-А13	13.3	2660	2926	1
39	273-КП-Б12	8.1	1620	1782	1
40	273-КП-Б13	14.3	2860	3146	1
41	273-КП-А21	3.2	640	704	1
42	273-КП-А22	9	1800	1980	1
43	273-КП-А23	16.6	3320	3652	1
44	273-КП-Б22	10	2000	2200	1
45	273-КП-Б23	17.6	3520	3872	1
46	325-КП-А11	3.3	660	726	1
47	325-КП-А12	6.9	1380	1518	1
48	325-КП-А13	12.8	2560	2816	1
49	325-КП-Б12	7.9	1580	1738	1
50	325-КП-Б13	13.8	2760	3036	1
51	325-КП-А21	4.2	840	924	1
52	325-КП-А22	8.7	1740	1914	1
53	325-КП-А23	16.2	3240	3564	1
54	325-КП-Б22	9.7	1940	2134	1
55	325-КП-Б23	17.2	3440	3784	1
56	377-КП-А11	3.2	640	704	1
57	377-КП-А12	6.7	1340	1474	1
58	377-КП-А13	12.5	2500	2750	1
59	377-КП-Б12	7.7	1540	1694	1
60	377-КП-Б13	13.5	2700	2970	1
61	377-КП-А21	4.1	820	902	1
62	377-КП-А22	8.6	1720	1892	1
63	377-КП-А23	15.7	3140	3454	1
64	377-КП-Б22	9.6	1920	2112	1
65	377-КП-Б23	16.7	3340	3674	1
66	426-КП-А11	4.6	920	1012	1
67	426-КП-А12	9.8	1960	2156	1
68	426-КП-А13	18.3	3660	4026	1
69	426-КП-Б12	11.2	2240	2464	1
70	426-КП-Б13	19.7	3940	4334	1
71	426-КП-А21	6.1	1220	1342	1
72	426-КП-А22	12.5	2500	2750	1
73	426-КП-А23	23.2	4640	5104	1
74	426-КП-Б22	13.9	2780	3058	1
75	426-КП-Б23	24.6	4920	5412	1
76	530-КП-А11	6.3	1260	1386	1
77	530-КП-А12	13.7	2740	3014	1
78	530-КП-А13	25.1	5020	5522	1
79	530-КП-Б12	16.4	3280	3608	1
80	530-КП-Б13	27.8	5560	6116	1
81	530-КП-А21	8	1600	1760	1
82	530-КП-А22	17.1	3420	3762	1
83	530-КП-А23	30.9	6180	6798	1
84	530-КП-Б22	19.8	3960	4356	1
85	530-КП-Б23	33.6	6720	7392	1
86	630-КП-А11	6.2	1240	1364	1
87	630-КП-А12	13.3	2660	2926	1
88	630-КП-А13	24.4	4880	5368	1
89	630-КП-Б12	16	3200	3520	1
90	630-КП-Б13	27.1	5420	5962	1
91	630-КП-А21	7.9	1580	1738	1
92	630-КП-А22	16.6	3320	3652	1
93	630-КП-А23	30.2	6040	6644	1
94	630-КП-Б22	19.3	3860	4246	1
95	630-КП-Б23	32.9	6580	7238	1
96	820-КП-А12	17	3400	3740	1
97	820-КП-А13	31.1	6220	6842	1
98	820-КП-Б12	20.5	4100	4510	1
99	820-КП-Б13	34.6	6920	7612	1
100	820-КП-А22	21.3	4260	4686	1
101	820-КП-А23	38.8	7760	8536	1
102	820-КП-Б22	24.8	4960	5456	1
103	820-КП-Б23	42.3	8460	9306	1
104	1020-КП-А12	27.6	5520	6072	1
105	1020-КП-А13	49.3	9860	10846	1
106	1020-КП-Б12	37.3	7460	8206	1
107	1020-КП-Б13	59	11800	12980	1
108	1020-КП-А22	33.3	6660	7326	1
109	1020-КП-А23	59	11800	12980	1
110	1020-КП-Б22	43	8600	9460	1
111	1020-КП-Б23	68.7	13740	15114	1
112	1220-КП-А12	26.8	5360	5896	1
113	1220-КП-А13	47.9	9580	10538	1
114	1220-КП-Б12	36.4	7280	8008	1
115	1220-КП-Б13	57.5	11500	12650	1
116	1220-КП-А22	32.5	6500	7150	1
117	1220-КП-А23	57.6	11520	12672	1
118	1220-КП-Б22	42.1	8420	9262	1
119	1220-КП-Б23	67.2	13440	14784	1
120	1420-КП-А12	32.5	6500	7150	1
121	1420-КП-А13	58.2	11640	12804	1
122	1420-КП-Б12	44.3	8860	9746	1
123	1420-КП-Б13	70	14000	15400	1
124	1420-КП-А22	39.5	7900	8690	1
125	1420-КП-А23	70.3	14060	15466	1
126	1420-КП-Б22	51.3	10260	11286	1
127	1420-КП-Б23	82.1	16420	18062	1
128	57-КХ-А11	2.1	420	462	2
129	57-КХ-А12	4.2	840	924	2
130	57-КХ-А21	2.5	500	550	2
131	57-КХ-А22	5.2	1040	1144	2
132	76-КХ-А11	2.2	440	484	2
133	76-КХ-А12	4.3	860	946	2
134	76-КХ-А21	2.7	540	594	2
135	76-КХ-А22	5.3	1060	1166	2
136	89-КХ-А11	2.2	440	484	2
137	89-КХ-А12	4.5	900	990	2
138	89-КХ-А21	2.8	560	616	2
139	89-КХ-А22	5.5	1100	1210	2
140	108-КХ-А11	5.4	1080	1188	2
141	108-КХ-А12	6.9	1380	1518	2
142	108-КХ-А21	6	1200	1320	2
143	108-КХ-А22	8.1	1620	1782	2
144	133-КХ-А11	6.3	1260	1386	2
145	133-КХ-А12	7.8	1560	1716	2
146	133-КХ-А21	6.8	1360	1496	2
147	133-КХ-А22	8.9	1780	1958	2
148	159-КХ-А11	6.9	1380	1518	2
149	159-КХ-А12	8.4	1680	1848	2
150	159-КХ-А21	7.4	1480	1628	2
151	159-КХ-А22	9.5	1900	2090	2
152	219-КХ-А11	13.4	2680	2948	2
153	219-КХ-А12	16.8	3360	3696	2
154	219-КХ-А13	21.7	4340	4774	2
155	219-КХ-А21	14.1	2820	3102	2
156	219-КХ-А22	18	3600	3960	2
157	219-КХ-А23	24	4800	5280	2
158	273-КХ-А11	15.1	3020	3322	2
159	273-КХ-А12	19.6	3920	4312	2
160	273-КХ-А13	25.8	5160	5676	2
161	273-КХ-А21	15.7	3140	3454	2
162	273-КХ-А22	21.5	4300	4730	2
163	273-КХ-А23	29.1	5820	6402	2
164	325-КХ-А11	17.4	3480	3828	2
165	325-КХ-А12	21	4200	4620	2
166	325-КХ-А13	26.9	5380	5918	2
167	325-КХ-А21	18.3	3660	4026	2
168	325-КХ-А22	22.8	4560	5016	2
169	325-КХ-А23	30.3	6060	6666	2
170	377-КХ-А11	19.1	3820	4202	2
171	377-КХ-А12	22.6	4520	4972	2
172	377-КХ-А13	28.4	5680	6248	2
173	377-КХ-А21	20	4000	4400	2
174	377-КХ-А22	24.5	4900	5390	2
175	377-КХ-А23	31.6	6320	6952	2
176	426-КХ-А11	22.1	4420	4862	2
177	426-КХ-А12	27.3	5460	6006	2
178	426-КХ-А13	35.8	7160	7876	2
179	426-КХ-А21	23.6	4720	5192	2
180	426-КХ-А22	30	6000	6600	2
181	426-КХ-А23	40.7	8140	8954	2
182	530-КХ-А11	36.5	7300	8030	2
183	530-КХ-А12	43.9	8780	9658	2
184	530-КХ-А13	55.3	11060	12166	2
185	530-КХ-А21	38.2	7640	8404	2
186	530-КХ-А22	47.3	9460	10406	2
187	530-КХ-А23	61.1	12220	13442	2
188	630-КХ-А11	41	8200	9020	2
189	630-КХ-А12	48.1	9620	10582	2
190	630-КХ-А13	59.2	11840	13024	2
191	630-КХ-А21	42.7	8540	9394	2
192	630-КХ-А22	51.4	10280	11308	2
193	630-КХ-А23	65	13000	14300	2
194	18-ТП-АС00	0.6	120	132	5
195	18-ТП-АС10	0.7	140	154	5
196	25-ТП-АС00	0.6	120	132	5
197	25-ТП-АС10	0.7	140	154	5
198	32-ТП-АС00	0.6	120	132	5
199	32-ТП-АС10	0.7	140	154	5
200	38-ТП-АС00	0.6	120	132	5
201	38-ТП-АС10	0.7	140	154	5
202	45-ТП-АС00	0.6	120	132	5
203	45-ТП-АС10	0.7	140	154	5
204	57-ТП-А11	1.8	360	396	5
205	57-ТП-А12	3.6	720	792	5
206	57-ТП-АС11	1.7	340	374	5
207	57-ТП-АС12	3.4	680	748	5
208	57-ТП-А21	3.1	620	682	5
209	57-ТП-А22	6.2	1240	1364	5
210	57-ТП-АС21	2.2	440	484	5
211	57-ТП-АС22	4.4	880	968	5
212	76-ТП-А11	1.8	360	396	5
213	76-ТП-А12	3.6	720	792	5
214	76-ТП-АС11	1.7	340	374	5
215	76-ТП-АС12	3.4	680	748	5
216	76-ТП-А21	3.1	620	682	5
217	76-ТП-А22	6.2	1240	1364	5
218	76-ТП-АС21	2.2	440	484	5
219	76-ТП-АС22	4.4	880	968	5
220	89-ТП-А11	1.8	360	396	5
221	89-ТП-А12	3.6	720	792	5
222	89-ТП-АС11	1.7	340	374	5
223	89-ТП-АС12	3.4	680	748	5
224	89-ТП-А21	3.1	620	682	5
225	89-ТП-А22	6.2	1240	1364	5
226	89-ТП-АС21	2.2	440	484	5
227	89-ТП-АС22	4.4	880	968	5
228	108-ТП-Б12	4	800	880	5
229	108-ТП-БС12	3.8	760	836	5
230	108-ТП-Б22	7	1400	1540	5
231	108-ТП-БС22	5	1000	1100	5
232	133-ТП-Б12	4	800	880	5
233	133-ТП-БС12	3.8	760	836	5
234	133-ТП-Б22	7	1400	1540	5
235	133-ТП-БС22	5	1000	1100	5
236	159-ТП-Б12	4	800	880	5
237	159-ТП-БС12	3.8	760	836	5
238	159-ТП-Б22	7	1400	1540	5
239	159-ТП-БС22	5	1000	1100	5
240	57-ТО-А1	1.2	240	264	6
241	57-ТО-А2	1.4	280	308	6
242	76-ТО-А1	1.5	300	330	6
243	76-ТО-А2	1.8	360	396	6
244	89-ТО-А1	2.2	440	484	6
245	89-ТО-А2	2.6	520	572	6
246	108-ТО-А1	2.3	460	506	6
247	108-ТО-А2	2.6	520	572	6
248	133-ТО-А1	4.2	840	924	6
249	133-ТО-А2	4.8	960	1056	6
250	159-ТО-А1	4.3	860	946	6
251	159-ТО-А2	4.9	980	1078	6
252	219-ТО-А1	10.3	2060	2266	6
253	219-ТО-А2	11.6	2320	2552	6
254	273-ТО-А1	11.5	2300	2530	6
255	273-ТО-А2	12.8	2560	2816	6
256	325-ТО-А1	20.1	4020	4422	6
257	325-ТО-А2	22	4400	4840	6
258	377-ТО-А1	34.4	6880	7568	6
259	377-ТО-А2	37.4	7480	8228	6
260	426-ТО-А1	35.9	7180	7898	6
261	426-ТО-А2	38.9	7780	8558	6
262	530-ТО-А1	47.3	9460	10406	6
263	530-ТО-А2	50.9	10180	11198	6
264	630-ТО-А1	86.8	17360	19096	6
265	630-ТО-А2	92.7	18540	20394	6
266	57-ТР-А1	1.4	280	308	7
267	57-ТР-А2	1.6	320	352	7
268	57-ТР-Б1	0.5	100	110	7
269	57-ТР-Б2	0.7	140	154	7
270	76-ТР-А1	1.4	280	308	7
271	76-ТР-А2	1.6	320	352	7
272	76-ТР-Б1	0.5	100	110	7
273	76-ТР-Б2	0.7	140	154	7
274	89-ТР-А1	1.9	380	418	7
275	89-ТР-А2	2.2	440	484	7
276	89-ТР-Б1	0.7	140	154	7
277	89-ТР-Б2	1	200	220	7
278	108-ТР-А1	1.9	380	418	7
279	108-ТР-А2	2.2	440	484	7
280	108-ТР-Б1	0.7	140	154	7
281	108-ТР-Б2	1	200	220	7
282	133-ТР-А1	3.2	640	704	7
283	133-ТР-А2	3.8	760	836	7
284	133-ТР-Б1	1.3	260	286	7
285	133-ТР-Б2	1.9	380	418	7
286	159-ТР-А1	3.2	640	704	7
287	159-ТР-А2	3.8	760	836	7
288	159-ТР-Б1	1.3	260	286	7
289	159-ТР-Б2	1.9	380	418	7
290	219-ТР-А1	7	1400	1540	7
291	219-ТР-А2	8.8	1760	1936	7
292	219-ТР-Б1	3	600	660	7
293	219-ТР-Б2	4.3	860	946	7
294	273-ТР-А1	7	1400	1540	7
295	273-ТР-А2	8.8	1760	1936	7
296	273-ТР-Б1	3	600	660	7
297	273-ТР-Б2	4.3	860	946	7
298	325-ТР-А1	12.9	2580	2838	7
299	325-ТР-А2	14.7	2940	3234	7
300	325-ТР-Б1	4.3	860	946	7
301	325-ТР-Б2	6.1	1220	1342	7
302	377-ТР-А1	20.2	4040	4444	7
303	377-ТР-А2	23.2	4640	5104	7
304	377-ТР-Б1	7.5	1500	1650	7
305	377-ТР-Б2	10.5	2100	2310	7
306	426-ТР-А1	20.2	4040	4444	7
307	426-ТР-А2	23.2	4640	5104	7
308	426-ТР-Б1	7.5	1500	1650	7
309	426-ТР-Б2	10.5	2100	2310	7
310	530-ТР-А1	34.1	6820	7502	7
311	530-ТР-А2	37.7	7540	8294	7
312	530-ТР-Б1	9.1	1820	2002	7
313	530-ТР-Б2	12.8	2560	2816	7
314	630-ТР-А1	60.4	12080	13288	7
315	630-ТР-А2	66.3	13260	14586	7
316	630-ТР-Б1	16.7	3340	3674	7
317	630-ТР-Б2	22.6	4520	4972	7
318	18-ТХ-АС00	1	200	220	8
319	18-ТХ-АС10	1.1	220	242	8
320	25-ТХ-АС00	1	200	220	8
321	25-ТХ-АС10	1.1	220	242	8
322	32-ТХ-АС00	1	200	220	8
323	32-ТХ-АС10	1.1	220	242	8
324	38-ТХ-АС00	1	200	220	8
325	38-ТХ-АС10	1.1	220	242	8
326	45-ТХ-АС00	1	200	220	8
327	45-ТХ-АС10	1.1	220	242	8
328	57-ТХ-А11	2.6	520	572	8
329	57-ТХ-А12	5.2	1040	1144	8
330	57-ТХ-АС11	2.5	500	550	8
331	57-ТХ-АС12	5	1000	1100	8
332	57-ТХ-А21	3.9	780	858	8
333	57-ТХ-А22	7.8	1560	1716	8
334	57-ТХ-АС21	3	600	660	8
335	57-ТХ-АС22	6	1200	1320	8
336	76-ТХ-А11	2.7	540	594	8
337	76-ТХ-А12	5.4	1080	1188	8
338	76-ТХ-АС11	2.6	520	572	8
339	76-ТХ-АС12	5.2	1040	1144	8
340	76-ТХ-А21	4	800	880	8
341	76-ТХ-А22	8	1600	1760	8
342	76-ТХ-АС21	3.1	620	682	8
343	76-ТХ-АС22	6.2	1240	1364	8
344	89-ТХ-А11	2.8	560	616	8
345	89-ТХ-А12	5.6	1120	1232	8
346	89-ТХ-АС11	2.7	540	594	8
347	89-ТХ-АС12	5.4	1080	1188	8
348	89-ТХ-А21	4.1	820	902	8
349	89-ТХ-А22	8.2	1640	1804	8
350	89-ТХ-АС21	3.2	640	704	8
351	89-ТХ-АС22	6.4	1280	1408	8
352	108-ТХ-Б12	7.9	1580	1738	8
353	108-ТХ-БС12	7.7	1540	1694	8
354	108-ТХ-Б22	10.9	2180	2398	8
355	108-ТХ-БС22	8.9	1780	1958	8
356	133-ТХ-Б12	8.7	1740	1914	8
357	133-ТХ-БС12	8.5	1700	1870	8
358	133-ТХ-Б22	11.7	2340	2574	8
359	133-ТХ-БС22	9.7	1940	2134	8
360	159-ТХ-Б12	9.3	1860	2046	8
361	159-ТХ-БС12	9.1	1820	2002	8
362	159-ТХ-Б22	12.3	2460	2706	8
363	159-ТХ-БС22	10.3	2060	2266	8
364	57-ВП-А1	0.8	160	176	9
365	57-ВП-А2	1.2	240	264	9
366	76-ВП-А1	0.8	160	176	9
367	76-ВП-А2	1.2	240	264	9
368	89-ВП-А1	0.8	160	176	9
369	89-ВП-А2	1.2	240	264	9
370	108-ВП-А1	1.8	360	396	9
371	108-ВП-А2	4.4	880	968	9
372	133-ВП-А1	1.8	360	396	9
373	133-ВП-А2	4.4	880	968	9
374	159-ВП-А1	1.8	360	396	9
375	159-ВП-А2	4.4	880	968	9
376	219-ВП-А1	1.8	360	396	9
377	219-ВП-Б1	3.4	680	748	9
378	219-ВП-А2	4.4	880	968	9
379	219-ВП-Б2	6	1200	1320	9
380	273-ВП-А1	6.8	1360	1496	9
381	273-ВП-Б1	14.2	2840	3124	9
382	273-ВП-А2	13.2	2640	2904	9
383	273-ВП-Б2	20.6	4120	4532	9
384	325-ВП-А1	6.8	1360	1496	9
385	325-ВП-Б1	14.2	2840	3124	9
386	325-ВП-А2	13.2	2640	2904	9
387	325-ВП-Б2	20.6	4120	4532	9
388	377-ВП-А1	6.8	1360	1496	9
389	377-ВП-Б1	14.2	2840	3124	9
390	377-ВП-А2	13.2	2640	2904	9
391	377-ВП-Б2	20.6	4120	4532	9
392	426-ВП-А1	6.8	1360	1496	9
393	426-ВП-Б1	14.2	2840	3124	9
394	426-ВП-А2	13.2	2640	2904	9
395	426-ВП-Б2	20.6	4120	4532	9
396	530-ВП-А1	14.8	2960	3256	9
397	530-ВП-Б1	28	5600	6160	9
398	530-ВП-А2	25.2	5040	5544	9
399	530-ВП-Б2	38.4	7680	8448	9
400	630-ВП-А1	14.8	2960	3256	9
401	630-ВП-Б1	28	5600	6160	9
402	630-ВП-А2	25.2	5040	5544	9
403	630-ВП-Б2	38.4	7680	8448	9
404	820-ВП-А1	14.8	2960	3256	9
405	820-ВП-Б1	28	5600	6160	9
406	820-ВП-А2	25.2	5040	5544	9
407	820-ВП-Б2	38.4	7680	8448	9
408	1020-ВП-А1	14.8	2960	3256	9
409	1020-ВП-Б1	28	5600	6160	9
410	1020-ВП-А2	25.2	5040	5544	9
411	1020-ВП-Б2	38.4	7680	8448	9
412	1220-ВП-А1	32.4	6480	7128	9
413	1220-ВП-Б1	54	10800	11880	9
414	1220-ВП-А2	37.6	7520	8272	9
415	1220-ВП-Б2	59.4	11880	13068	9
416	1420-ВП-А1	32.4	6480	7128	9
417	1420-ВП-Б1	54	10800	11880	9
418	1420-ВП-А2	37.6	7520	8272	9
419	1420-ВП-Б2	59.4	11880	13068	9
420	25-ХБ-А	0.1	20	22	10
421	25-ХБ-Б	0.14	28	31	10
422	25-ХБ-В	0.1	20	22	10
423	25-ХБ-Г	0.14	28	31	10
424	32-ХБ-А	0.1	20	22	10
425	32-ХБ-Б	0.18	36	40	10
426	32-ХБ-В	0.1	20	22	10
427	32-ХБ-Г	0.18	36	40	10
428	38-ХБ-А	0.2	40	44	10
429	38-ХБ-Б	0.28	56	62	10
430	38-ХБ-В	0.1	20	22	10
431	38-ХБ-Г	0.18	36	40	10
432	45-ХБ-А	0.2	40	44	10
433	45-ХБ-Б	0.32	64	70	10
434	45-ХБ-В	0.1	20	22	10
435	45-ХБ-Г	0.22	44	48	10
436	57-ХБ-А	0.3	60	66	10
437	57-ХБ-Б	0.5	100	110	10
438	57-ХБ-В	0.2	40	44	10
439	57-ХБ-Г	0.4	80	88	10
440	76-ХБ-А	0.4	80	88	10
441	76-ХБ-Б	0.6	120	132	10
442	76-ХБ-В	0.3	60	66	10
443	76-ХБ-Г	0.5	100	110	10
444	89-ХБ-А	0.4	80	88	10
445	89-ХБ-Б	0.6	120	132	10
446	89-ХБ-В	0.3	60	66	10
447	89-ХБ-Г	0.5	100	110	10
448	108-ХБ-А	0.8	160	176	10
449	108-ХБ-Б	1.08	216	238	10
450	108-ХБ-В	0.6	120	132	10
451	108-ХБ-Г	0.88	176	194	10
452	133-ХБ-А	1	200	220	10
453	133-ХБ-Б	1.52	304	334	10
454	133-ХБ-В	0.7	140	154	10
455	133-ХБ-Г	1.22	244	268	10
456	159-ХБ-А	1.8	360	396	10
457	159-ХБ-Б	2.32	464	510	10
458	159-ХБ-В	1.3	260	286	10
459	159-ХБ-Г	1.82	364	400	10
460	219-ХБ-А	2.2	440	484	10
461	219-ХБ-Б	3.24	648	713	10
462	273-ХБ-А	2.6	520	572	10
463	273-ХБ-Б	3.64	728	801	10
464	325-ХБ-А	3	600	660	10
465	325-ХБ-Б	4.04	808	889	10
466	377-ХБ-А	5	1000	1100	10
467	377-ХБ-Б	6.24	1248	1373	10
468	426-ХБ-А	5.5	1100	1210	10
469	426-ХБ-Б	8.4	1680	1848	10
470	530-ХБ-А	6.6	1320	1452	10
471	530-ХБ-Б	9.5	1900	2090	10
472	1020-УП-А	25	5000	5500	11
473	1020-УП-Б	34.7	6940	7634	11
474	1220-УП-А	35.3	7060	7766	11
475	1220-УП-Б	44.8	8960	9856	11
476	1420-УП-А	38.9	7780	8558	11
477	1420-УП-Б	50.7	10140	11154	11
478	57-ШП-А1	0.5	100	110	12
479	57-ШП-А2	1	200	220	12
480	76-ШП-А1	0.5	100	110	12
481	76-ШП-А2	1	200	220	12
482	89-ШП-А1	0.7	140	154	12
483	89-ШП-А2	1.4	280	308	12
484	108-ШП-А1	0.7	140	154	12
485	108-ШП-А2	1.4	280	308	12
486	133-ШП-А1	0.9	180	198	12
487	133-ШП-А2	2.1	420	462	12
488	159-ШП-А1	0.9	180	198	12
489	159-ШП-А2	2.1	420	462	12
490	219-ШП-А1	1.6	320	352	12
491	219-ШП-А2	2.6	520	572	12
492	273-ШП-А1	2.1	420	462	12
493	273-ШП-А2	3.1	620	682	12
494	325-ШП-А1	2.1	420	462	12
495	325-ШП-А2	3.1	620	682	12
496	377-ШП-А1	2.8	560	616	12
497	377-ШП-А2	4.3	860	946	12
498	426-ШП-А1	2.8	560	616	12
499	426-ШП-А2	4.3	860	946	12
500	530-ШП-А1	4.6	920	1012	12
501	530-ШП-А2	7.4	1480	1628	12
502	630-ШП-А1	4.6	920	1012	12
503	630-ШП-А2	7.4	1480	1628	12
504	820-ШП-А1	12.7	2540	2794	12
505	219-КН-А11	17.5	3500	3850	13
506	219-КН-Х11	27.1	5420	5962	13
507	219-КН-А12	39.9	7980	8778	13
508	219-КН-А13	62.5	12500	13750	13
509	219-КН-Б12	40.8	8160	8976	13
510	219-КН-Б13	63.4	12680	13948	13
511	219-КН-Х12	49.5	9900	10890	13
512	219-КН-Х13	72.1	14420	15862	13
513	273-КН-А11	17.4	3480	3828	13
514	273-КН-Х11	28.8	5760	6336	13
515	273-КН-А12	40.9	8180	8998	13
516	273-КН-А13	64.8	12960	14256	13
517	273-КН-Б12	41.9	8380	9218	13
518	273-КН-Б13	65.8	13160	14476	13
519	273-КН-Х12	52.3	10460	11506	13
520	273-КН-Х13	76.2	15240	16764	13
521	325-КН-А11	18.1	3620	3982	13
522	325-КН-Х11	31.1	6220	6842	13
523	325-КН-А12	40.7	8140	8954	13
524	325-КН-А13	64.3	12860	14146	13
525	325-КН-Б12	41.7	8340	9174	13
526	325-КН-Б13	65.3	13060	14366	13
527	325-КН-Х12	53.7	10740	11814	13
528	325-КН-Х13	77.3	15460	17006	13
529	377-КН-А11	18.1	3620	3982	13
530	377-КН-Х11	32.9	6580	7238	13
531	377-КН-А12	40.5	8100	8910	13
532	377-КН-А13	64	12800	14080	13
533	377-КН-Б12	41.5	8300	9130	13
534	377-КН-Б13	65	13000	14300	13
535	377-КН-Х12	55.3	11060	12166	13
536	377-КН-Х13	78.3	15660	17226	13
537	426-КН-А11	19.5	3900	4290	13
538	426-КН-Х11	35.9	7180	7898	13
539	426-КН-А12	43.6	8720	9592	13
540	426-КН-А13	69.3	13860	15246	13
541	426-КН-Б12	45	9000	9900	13
542	426-КН-Б13	71.2	14240	15664	13
543	426-КН-Х12	60	12000	13200	13
544	426-КН-Х13	86.2	17240	18964	13
545	530-КН-А11	27	5400	5940	13
546	530-КН-Х11	55.2	11040	12144	13
547	530-КН-А12	60.2	12040	13244	13
548	530-КН-А13	91.9	18380	20218	13
549	530-КН-Б12	61.5	12300	13530	13
550	530-КН-Б13	94.6	18920	20812	13
551	530-КН-Х12	88.4	17680	19448	13
552	530-КН-Х13	120.1	24020	26422	13
553	630-КН-А11	26.8	5360	5896	13
554	630-КН-Х11	59.6	11920	13112	13
555	630-КН-А12	59.8	11960	13156	13
556	630-КН-А13	91.2	18240	20064	13
557	630-КН-Б12	61.5	12300	13530	13
558	630-КН-Б13	93.9	18780	20658	13
559	630-КН-Х12	92.6	18520	20372	13
560	630-КН-Х13	124	24800	27280	13
561	820-КН-А12	63.5	12700	13970	13
562	820-КН-А13	97.9	19580	21538	13
563	820-КН-Б12	67	13400	14740	13
564	820-КН-Б13	101.4	20280	22308	13
565	1020-КН-А12	95	19000	20900	13
566	1020-КН-А13	146.4	29280	32208	13
567	1020-КН-Б12	104	20800	22880	13
568	1020-КН-Б13	156.3	31260	34386	13
569	1220-КН-А12	100	20000	22000	13
570	1220-КН-А13	155	31000	34100	13
571	1220-КН-Б12	112	22400	24640	13
572	1220-КН-Б13	167	33400	36740	13
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

SELECT pg_catalog.setval('public."Drawing_id_seq"', 4, true);


--
-- Name: ExecutionItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EnergoDetal
--

SELECT pg_catalog.setval('public."ExecutionItem_id_seq"', 572, true);


--
-- Name: Execution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EnergoDetal
--

SELECT pg_catalog.setval('public."Execution_id_seq"', 13, true);


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

\unrestrict 6VI7wphkcgHcn0AeSbPAmqDhMTn1BTkalMX37bSkkbKZyGvzhU2i6qk6up2hx3d

