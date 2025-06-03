--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-03 18:02:33

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
-- TOC entry 4987 (class 0 OID 16394)
-- Dependencies: 217
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
2a5d580f5ccf
\.


--
-- TOC entry 4989 (class 0 OID 16400)
-- Dependencies: 219
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, is_active, username, email, password, phone, date_birth, gender, fs_uniquifier, confirmed_at, profile_pic, first_name, last_name, biography, location, date_joined) FROM stdin;
1	t	skan2308	skander.kechaou.e@gmail.com	$argon2id$v=19$m=65536,t=3,p=4$i1HKGeNc6x3DeA8hpFTqfQ$r+wa6/zPqRPFzHqPpK6xjfMu41RbXJK87bkS5U+og1Q	+33758781503	2002-08-23	MALE	e2b867f8982c4018a397b0ea5c860153	\N	images/profile_pics/257f69bc52cda8a3.jpg	Skander	Kechaou	mi polyglotte à l'international, mi geek sous insomnie	Paris	2025-05-20
2	t	test123	test@contact.net	$argon2id$v=19$m=65536,t=3,p=4$3HuP0bo3xjjnnNO6N8Y45w$TGgqP0NNDYa00tTiqZeQl7oGJzm8fsfUBoM3bYz465A	+21654706621	1977-01-29	PREFER_NOT_TO_SAY	289fef23e1994336a8c8bfd00aedde27	\N	images/profile_pics/8b0a34446da040a7.jpg	Test	Test	I'm just a test unfortunately	Somewhere over the rainbow	2025-05-22
3	t	skander	kechaou.skander@gmail.com	gbX1jVxUbMmrsMDey6QX6d_HRbyso5bM	+21621635020	2002-08-23	MALE	32cf8738-c497-4839-a7ef-18207675370d	2025-05-23 15:56:24.660326	images/default.jpg	John	Doe	I'm just John Doe :)	Unknown	2025-05-23
4	t	deep	deeplearning050@gmail.com	MowWoQUFPE3uAb8MLJWPFWXT0W6p62Ok	+33758781504	1900-01-01	PREFER_NOT_TO_SAY	fe698b91-4b64-4cfa-9dad-d25c488a6b71	2025-05-24 12:27:52.983338	images/profile_pics/f775c4d6a1ee2888.jpg	deep	learning	I'm just here for testing purposes :'(	The Cloud	2025-05-24
5	t	hstone	troyphelps@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	+1-498-264-3073	1971-02-23	FEMALE	14f0e522-abb0-4649-9e7d-7b7b501cd413	2025-04-13 17:51:01.000286	images/default.jpg	Bianca	Nash	\N	Alexanderhaven	2023-09-10
6	t	mcbridebrenda	charlesjohnson@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	(363)347-4485x0202	2017-07-25	FEMALE	7e2d8d93-ccfb-4fea-9c25-779cffaa3050	2025-04-08 17:51:01.003285	images/default.jpg	Michael	Ortiz	Nearly young gun spend. Baby threat instead peace seem see.\nWhile age stage me. Give money may she color. Yes offer structure nothing pick.	\N	2024-07-19
7	t	cmedina	connie37@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	+1-803-554-2577x740	1999-01-02	MALE	99d56597-0152-4119-8e6d-964dedf02f9d	2025-04-25 17:51:01.006285	images/default.jpg	John	Williams	\N	Glassstad	2023-04-08
8	t	susangonzalez	cochrananita@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	001-287-521-1794x969	2009-05-08	OTHER	dfdbfe12-28f3-4814-b1c6-a2955b9ee3ec	\N	images/default.jpg	Chad	Gibson	Piece money important bed. Six fly however game.	Baileyshire	2023-12-30
9	t	thompsoncarol	hudsonchad@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	251.877.0761x753	1952-10-17	MALE	b86df9b4-204b-4b1f-8d34-76e141bf9824	2025-05-18 17:51:01.011309	images/default.jpg	Todd	Ford	\N	Carlsonburgh	2022-10-25
10	t	john85	hallrobert@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	323-309-7778	1925-01-28	FEMALE	e280aaf2-5034-4ad9-be17-13b6b4bbdfd6	2025-05-04 17:51:01.013308	images/default.jpg	Karen	Warner	\N	\N	2024-11-14
11	t	brenda98	johnathanmaddox@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	879-453-0247x2756	1925-07-23	MALE	ebc87b77-bf97-4adf-87cb-34f66675ed2e	\N	images/default.jpg	Barbara	Thomas	Build second listen similar big. Can year cover shake especially. Investment then analysis remember house. Step agency business read.	\N	2024-05-31
12	t	james51	ashley89@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	001-868-776-1865x9546	1916-03-27	FEMALE	7e5710fd-611c-42ca-b974-42f50045ff85	2025-05-06 17:51:01.018309	images/default.jpg	Alyssa	Mendez	However wall among story growth. Method choose system available yourself sometimes science.	East Wendybury	2024-08-07
13	t	brittany29	dkaiser@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	(334)318-0455x00902	1998-07-14	OTHER	e1143b6f-4d08-4b00-b9a0-fe24d45908df	2025-05-06 17:51:01.020314	images/default.jpg	Kristina	Kelley	\N	Casefurt	2023-08-31
14	t	brady10	kelly59@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	653.529.7509x672	1990-10-20	FEMALE	9b4982b7-4e41-421c-b4db-dcf7c02ae293	\N	images/default.jpg	Miguel	Morrow	Age card only open wide pretty which. Relate what school according strategy. Cell heart food exist without house establish.	Gabrielville	2022-08-09
15	t	bmurphy	walternelson@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	509.846.9031	1930-02-09	FEMALE	4fa467e3-6244-4c73-9727-2ea7551676a1	\N	images/default.jpg	Ana	Mclean	Least section surface six image various. Surface care movie threat support management.	\N	2024-01-20
16	t	jmiller	rebecca52@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	001-341-576-4194x740	1959-05-29	MALE	a9a3db18-d9ee-4e80-a95c-493dcc7d21b3	\N	images/default.jpg	Steven	Lucero	Let task water any laugh television close. Score eye land stop which send lot trade.	New John	2025-03-13
17	t	samuelgreen	vlindsey@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	+1-309-280-2307	1971-02-01	MALE	420672ba-b723-4dab-bdf6-829dc6916587	2025-05-12 17:51:01.031831	images/default.jpg	Jamie	Nixon	Democratic rest car these. Until entire sign design.\nListen stay ball man. Heart most anyone her article.	\N	2023-08-22
18	t	smithrebekah	sarahdavis@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	387.813.1990x7148	1916-07-25	OTHER	eaebe420-f128-4b4a-8c26-c613b821140a	2025-05-12 17:51:01.034831	images/default.jpg	Sarah	Smith	\N	Port Alexisbury	2023-05-04
19	t	kevinyoung	halljoshua@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	3519172040	1917-06-02	PREFER_NOT_TO_SAY	305c206a-04c3-43bc-b391-386cf11f66e5	\N	images/default.jpg	Margaret	Jones	Agreement personal sell most attention while plant. Civil free have black.	North Katieshire	2023-12-22
20	t	charlesstevens	philip84@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	001-602-762-9091x0246	1958-10-25	OTHER	ed3e2b3c-7054-4790-b911-f9acad3e47b7	2025-04-20 17:51:01.039842	images/default.jpg	Michelle	Harrington	Tough stuff final population drive better approach. Military local father red structure quality notice paper. Marriage it bill rule hear item quickly call.	\N	2025-04-06
21	t	wmiller	boothphillip@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	495-859-2431x499	2009-05-27	OTHER	f0a450e2-4cbf-49a3-aaeb-0baa0ebed5f7	2025-05-23 17:51:01.041845	images/default.jpg	Christopher	Chavez	Head question least. Us age about more involve reality. Should everything hundred task on too.\nBudget size then car couple. Do week good change money.	\N	2023-02-10
22	t	alexanderashley	lanezachary@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	473.449.3494	1950-05-19	MALE	6a6987e8-6b7c-4ff8-ad5c-47967609bc10	2025-06-02 17:51:01.044844	images/default.jpg	Angela	Pugh	Style mouth lay tell yeah. Report without skill issue time. Do five require worker Congress great trip person.	North Matthewhaven	2024-06-02
23	t	npetersen	orobbins@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	838.929.8017	1991-03-08	FEMALE	5f3ea651-3b3c-4545-b288-f25959010660	2025-04-27 17:51:01.046844	images/default.jpg	Joshua	Smith	People same treat anyone visit leg near. Health radio listen participant rich left.\nPosition yes through cause. Country white identify form.	New Morganshire	2022-09-27
24	t	dwinters	charlesjenkins@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	643.598.9979x6964	1943-10-06	PREFER_NOT_TO_SAY	3a054bd0-a2ee-412a-b9d0-c40940cdfbbb	2025-04-13 17:51:01.049844	images/default.jpg	Benjamin	Stewart	\N	\N	2025-02-03
25	t	sharpjames	richardlloyd@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	001-339-547-8580x734	1917-03-28	FEMALE	75c9bb28-3f13-4658-88fe-5e2076c89172	2025-05-03 17:51:01.051844	images/default.jpg	Trevor	Combs	Attention however movement from kitchen leader. Likely one those free allow. Society report professor style gas.	Jennifershire	2023-02-08
26	t	nramirez	christieellis@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	001-821-302-7407	1918-04-03	OTHER	2771324f-8173-4b4c-84c1-178a0eb3c496	2025-05-03 17:51:01.054379	images/default.jpg	Beverly	Vazquez	Degree around interesting. Far term different really well.\nKnow organization carry war. Land defense today scientist can simply fight. Campaign shake customer.	\N	2024-12-18
27	t	benjamin86	brianwilkinson@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	(669)226-0816	1972-10-20	PREFER_NOT_TO_SAY	47bbc47e-d610-4849-85e4-46e07e89c45a	2025-04-22 17:51:01.057391	images/default.jpg	Elizabeth	Taylor	She environment medical father year note moment thus. Talk move she available miss visit sea wrong. New economic address full mind. Free mean pass lot.	New Claudia	2024-03-13
28	t	lauren29	ulynch@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	(217)527-6582x17404	2018-12-10	PREFER_NOT_TO_SAY	cc5fa910-815e-4a7d-9a33-4f0489cf0b74	2025-05-15 17:51:01.060388	images/default.jpg	Erin	Booker	Oil movie election store poor sign group.\nDevelopment boy study avoid evidence watch. Professor control establish difference for herself decade.	\N	2024-06-26
29	t	livingstonedward	jennifermorgan@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	226-739-8584	1918-05-02	PREFER_NOT_TO_SAY	4ade9fc5-342e-4f3c-8f1d-e3e79a9c81c5	2025-05-06 17:51:01.063392	images/default.jpg	Anthony	Blankenship	\N	\N	2022-07-22
30	t	michael87	morganlynn@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	714-708-7442x47971	2023-11-13	MALE	b68519e7-3cdc-4375-8ab3-9b241754b910	2025-05-19 17:51:01.066668	images/default.jpg	Christina	Wang	So article her daughter ever hear risk. Party staff more free from area. Or himself mind might age.	Morganfort	2024-05-24
31	t	lwilliams	wilsonmary@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	001-451-483-7973x800	1916-03-15	FEMALE	095fda9d-bae4-44fa-a369-e72fbb30486a	2025-04-17 17:51:01.069669	images/default.jpg	April	Flores	Rather oil center message how let. Special style lay how foreign majority.	\N	2024-07-23
32	t	rdavis	jenniferwagner@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	808.279.9019	1953-05-28	FEMALE	7d356e01-7320-4cfb-9364-2df497b3ed13	2025-05-30 17:51:01.072668	images/default.jpg	Barbara	Lopez	Very sell pull tree sign rest occur. Dream where sell even support somebody. Weight here hear certain.	\N	2023-07-26
33	t	kevinmyers	uferguson@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	(901)880-4592x66918	1989-03-20	OTHER	300ec9b3-e207-4767-b819-9d79ee3410b1	\N	images/default.jpg	Gerald	Johnson	Simple result leave we somebody entire. Effect camera suggest here all administration get debate. Part check until reduce through seem whether rule.	\N	2022-09-16
34	t	james98	kendrawilliams@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	+1-507-890-9350x4281	1959-02-19	OTHER	2960017f-6356-4cf7-b7f9-b7cc4fa764b8	2025-05-03 17:51:01.077717	images/default.jpg	Daniel	Archer	Different know election arrive recognize. Once where college hand meet.\nCourt six family wonder or everything discuss.	\N	2023-01-15
35	t	scott84	nwilson@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	574-765-6113	1928-02-25	OTHER	feb95440-40e1-4c41-bc46-2dc09006e79e	2025-05-27 17:51:01.080636	images/default.jpg	Lori	Walker	\N	\N	2024-01-03
36	t	morgandaniel	laura49@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	3796443233	1959-05-29	FEMALE	127ef3ca-2d63-45f2-af64-e33a2d918994	\N	images/default.jpg	Kathleen	Cross	Others state certain. Cause tree most mention major soldier air guess.	East Karenville	2022-10-22
37	t	kharris	simscody@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	001-208-205-9438x635	1943-07-21	MALE	7075bc54-cd45-4861-8387-8ab48dbf4b68	2025-05-11 17:51:01.085646	images/default.jpg	Daniel	Dunlap	Evening begin she action responsibility cultural.\nDirector certain relationship. Catch woman arrive official citizen wall. Event office big center morning.	Nancyfort	2024-09-06
38	t	lisa87	jonathan05@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	510-855-4830	1973-05-06	MALE	dcd89e3e-37da-44b4-ad29-72656fb4e6a2	2025-04-18 17:51:01.087635	images/default.jpg	Carrie	Vargas	Economic between small. Option week know how investment. Simply exist involve official protect those.\nPolitics on woman else.	Vincentchester	2024-12-08
39	t	smurphy	jacobsontracey@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	699-994-4451x301	1940-08-05	PREFER_NOT_TO_SAY	28471a9e-8e77-4bc0-a15f-7e68332d6b92	2025-04-16 17:51:01.090637	images/default.jpg	Amy	Pham	East college plan activity bit turn. Catch woman guy industry.\nKey meeting three surface each. Believe wear believe young military.	\N	2025-04-21
40	t	justinfox	kanderson@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	739-343-6869x58261	1998-07-12	MALE	d9e66b73-d676-44d6-b27b-3d131fd74846	2025-04-24 17:51:01.092635	images/default.jpg	Carol	Howard	\N	Codymouth	2024-09-22
41	t	popecourtney	rayclayton@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	5848285665	1974-02-14	OTHER	3d211b03-888b-4de8-85f1-3738bcfbc85c	\N	images/default.jpg	Martin	Jones	Grow have cut girl before. Wonder practice plan most make government.\nType science light could later. Weight stand instead remain might.	Lyonsbury	2023-07-19
42	t	qdavis	john88@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	001-285-427-7849x9267	1944-10-17	PREFER_NOT_TO_SAY	080c609e-394d-4354-a72f-1dc03743795e	2025-04-08 17:51:01.098637	images/default.jpg	Dr.	Berry	\N	North Matthew	2023-01-22
43	t	penaeric	chase51@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	(619)383-1131	2018-07-28	FEMALE	b0a41305-e9b7-4c89-83a8-66f0bc46a592	2025-05-04 17:51:01.100637	images/default.jpg	Charles	Carroll	Leader fish world image first support. Hard happy few collection image everybody business sure. Ahead issue to personal carry need.	\N	2022-09-07
44	t	john02	robert08@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	990-394-1350x382	2025-02-24	MALE	e856ccbd-ec57-4459-b30d-2975210d9882	2025-05-02 17:51:01.102637	images/default.jpg	Jeffrey	Johnson	Fly ready property western few series. Above course avoid allow. Meeting industry professor road laugh.	Brianborough	2022-10-09
45	t	justinlutz	lsnyder@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	+1-638-436-6918x24755	2025-03-07	MALE	f5a3d65c-1b3e-476b-90d7-45e047adc4a8	2025-05-05 17:51:01.105637	images/default.jpg	Lisa	Ewing	Various government blue treat reflect. Something always low painting situation. Stop environmental prevent she he might challenge. Pm along of assume.	\N	2024-04-04
46	t	destiny89	howarddebra@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	524-410-7602x458	1997-05-11	OTHER	4da75489-3e27-4f0e-b5b5-b9283bab4323	\N	images/default.jpg	Mandy	Thomas	Tv let them gun open note wife. Partner step read protect son network.\nEye support carry development approach. Ability ground push prepare ok religious police.	Donaldchester	2022-07-18
47	t	lori86	davismichele@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	880-232-2519x868	1921-11-25	PREFER_NOT_TO_SAY	fd01c9c8-0e2e-432d-9bb3-ca94c596f553	2025-04-13 17:51:01.111402	images/default.jpg	Sarah	French	Paper policy newspaper center try this. Age appear fight author more. Tax east remain page peace.	\N	2022-07-06
48	t	ortizkirk	joshuamurray@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	+1-360-808-0226	1937-06-01	PREFER_NOT_TO_SAY	14705308-4040-4c20-ab3c-ce0e36fc492a	2025-05-07 17:51:01.114403	images/default.jpg	Sheila	Fleming	Fly trade assume set. Discover true speech federal teacher. Clearly outside executive attorney shake.\nBag whose back term. Leader study girl health important.	Normantown	2023-06-19
49	t	hnelson	melissa67@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	(810)763-5393x0845	2007-12-05	MALE	fd1ad060-0287-47ca-a738-45e500a79843	2025-04-17 17:51:01.117401	images/default.jpg	Brendan	Morrison	Baby minute evening key. I particular reach goal include.	West Belindaburgh	2022-07-02
50	t	victoria52	evanserica@example.org	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	(816)862-4292	1939-05-30	PREFER_NOT_TO_SAY	52eb07dc-b151-4571-b008-686722ba3a5c	2025-05-11 17:51:01.119401	images/default.jpg	Evelyn	Woods	Town meet pressure. Value conference southern south. Race soldier choice point.	\N	2023-04-14
51	t	ashley02	wallacejason@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	610.397.7382	1961-04-09	PREFER_NOT_TO_SAY	8e7303b6-69fc-4968-8bc5-46f948557a5b	\N	images/default.jpg	Robert	Harrison	Successful tough recently our main. Both wish alone common. Up city although technology.\nCar then explain medical family city.	\N	2024-11-06
52	t	shawdavid	michael89@example.net	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	277-872-8663x9334	2010-10-16	FEMALE	8a9d196e-99bf-4c50-9f30-e5b2eb56a517	2025-04-04 17:51:01.126404	images/default.jpg	Dr.	Jr.	\N	Stephaniefort	2022-06-18
53	t	rebeccawilson	troy09@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	+1-541-641-4799x96830	1929-10-21	FEMALE	4db9fb18-9270-4a86-a85f-101a8042b55b	2025-05-18 17:51:01.128401	images/default.jpg	Randall	Le	\N	Holttown	2024-09-29
54	t	reynoldsbrandon	xalvarado@example.com	ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f	+1-411-207-0829x0634	1950-10-05	FEMALE	d8843209-c1d7-4c65-936a-aa6a060b25b4	2025-05-09 17:51:01.131404	images/default.jpg	Christy	Martinez	\N	\N	2025-01-14
\.


--
-- TOC entry 4991 (class 0 OID 16422)
-- Dependencies: 221
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id, user_id, content, visibility, "timestamp", media) FROM stdin;
2	1	Trying to make the profile view work!	FRIENDS	2025-05-20 23:21:22.934969	\N
3	1	Let's try again	PUBLIC	2025-05-20 23:22:48.909074	\N
4	2	Hey! I'm new here :)	PUBLIC	2025-05-22 19:08:13.026123	\N
5	3	hello!	PUBLIC	2025-05-23 15:58:20.047328	\N
6	3	I'm trying to populate with more posts	FRIENDS	2025-05-23 15:58:26.701554	\N
7	4	안녕하세요! 꽃길만 걷자 	PUBLIC	2025-05-24 12:38:11.070737	\N
8	4	Prueba	PUBLIC	2025-05-24 15:34:33.933603	\N
9	4	Creo que la prueba funciona!	PUBLIC	2025-05-24 15:35:17.479683	\N
10	3	I'm trying to upload media in posts	PUBLIC	2025-05-26 12:45:30.544221	\N
11	3	Hey	PUBLIC	2025-05-26 13:04:53.518734	\N
12	3	please work	PUBLIC	2025-05-26 13:36:16.292419	post_media/416af30e14b68a47.gif
13	3	hi	FRIENDS	2025-05-26 13:56:35.179353	\N
14	1	Escapade à Nabeul <3	PUBLIC	2025-05-26 14:18:21.275917	post_media/63eefd8acfd93fa1.MP4
15	6	Out information if threat technology cultural together.	PUBLIC	2024-11-14 16:51:01.209063	\N
16	6	Laugh dark bag cultural. White window might window budget get. Blue include picture he agree short interest.\nNational doctor prevent president author. Interest center more appear reflect high. Wear act soldier too term.\nThan win officer second. Can answer from house thousand with activity.	FRIENDS	2024-01-28 16:51:01.209063	\N
17	6	Where really sport prepare ground determine.	FRIENDS	2024-03-10 16:51:01.209063	\N
18	9	Government today room under strategy Democrat. Those game machine.\nRespond executive necessary senior notice. Single accept add get. Leader white head member consider site.	PRIVATE	2023-07-29 17:51:01.209063	\N
19	10	Effect whole smile stand. Left different range financial key rise break employee.	PRIVATE	2024-09-21 17:51:01.209063	post_media/sample2.jpg
20	10	Affect nature over. Stop our practice role.	PRIVATE	2024-04-18 17:51:01.209063	\N
21	11	Own choice until. Bed bill value actually anything. Street travel during year.\nWrite down teach industry industry should manage. Section kid cell. Process set language.\nRecently outside decade store people about. Stock moment politics thus fact various include.	PUBLIC	2024-05-06 17:51:01.209063	\N
22	11	Be company rise explain. Provide edge dream dark. Themselves size east eat individual also save.\nNow suffer reality bed church image war. Interesting cultural option finally item. Environmental leader sport job war.\nPass serve test even. Human determine edge thousand wonder pass decision. Reflect similar rest policy.\nParent low prepare nation. Reach itself establish require along.\nLate media short full happen. Six Mr better say up.	PUBLIC	2023-08-24 17:51:01.209063	\N
23	11	Behavior although PM. Couple professor sign.	FRIENDS	2023-10-13 17:51:01.210059	\N
24	13	Never rather same wrong we successful. Middle we black federal. Hour than spring detail.	PRIVATE	2024-04-17 17:51:01.210059	\N
25	13	Nation heavy after lot argue.\nMajor your simply. Church impact apply wonder close.\nMember truth hard issue season church theory. Commercial president fly on hundred usually.\nHuge international American available task film himself. Green current agreement hair gun.\nSchool wait audience. Fire political big body half seek work risk.	PUBLIC	2024-02-28 16:51:01.210059	post_media/sample2.jpg
26	13	A wish culture somebody brother crime glass. Side camera agent. Ten audience put admit.\nLook star hold career.\nDo bring young race beautiful choose. Provide industry attorney fight. Difference among what huge. Agent future goal trade sense cold Republican.\nQuickly hour tend understand only street. Trial maintain outside. Send never shoulder born benefit require lay.	PRIVATE	2024-01-05 16:51:01.210059	\N
27	14	Message thus ever price. Defense off kind often two.	PRIVATE	2024-04-10 17:51:01.210059	post_media/sample1.jpeg
28	14	Society always west. Everybody management across company. Special ahead oil artist away social ask himself.\nCourt imagine little would. Huge treatment partner yes TV career wonder. Group others population food. Push clear five.	FRIENDS	2024-09-12 17:51:01.210059	post_media/sample3.jpg
29	14	Throughout ability away soldier remember put science. Already middle house camera couple fine. Born medical have east admit well.	PUBLIC	2025-06-03 17:51:01.210059	post_media/sample3.jpg
30	15	Trade effect black. Method picture actually likely general. Green teach just member follow follow various. Million budget perform arm sense toward.\nQuality less agent wrong. Million also about local system.	PRIVATE	2024-02-24 16:51:01.210059	post_media/sample2.jpg
31	15	Behind send old east. Role three car today listen item. Church society pressure road already.\nDetail value explain rather or. Board rise vote sister list hotel appear. Gun charge recent.	PRIVATE	2023-07-10 17:51:01.210059	\N
32	16	Action apply adult particular involve husband.\nStaff policy environment view simply management heart. There wall sister.\nShoulder cost campaign arrive choice. Change election if president scene decide adult.	FRIENDS	2025-05-06 17:51:01.210059	post_media/sample3.jpg
33	16	Yes sit enough oil base. Future maintain end others recently skin. Practice scientist test water couple interview practice my.	FRIENDS	2023-06-27 17:51:01.210059	post_media/sample3.jpg
34	17	Successful conference now when once work agent.	PRIVATE	2025-02-22 16:51:01.211058	\N
35	17	Coach nice hear culture between development. Crime why political expect.	PRIVATE	2024-03-21 16:51:01.211058	\N
36	18	Popular east economy billion subject sport. Modern go president form nice wrong institution.\nEvidence true stock. Like recognize mean structure cost appear. Style memory fine.\nLand second student still stay bed rather. Year send sport as teacher commercial. Always gun in. Article share hotel itself challenge too good.	PUBLIC	2024-01-24 16:51:01.211058	post_media/sample1.jpeg
37	18	Nor half worker outside action because down. Population nearly important check side finish.\nShort movie suffer step those reflect around. Always service court opportunity. One security student region their share south once. I serve message doctor argue.\nAgain business crime several they. Wrong president ten anyone security source. Mrs wife attorney fill.	FRIENDS	2024-04-14 17:51:01.211058	post_media/sample2.jpg
38	18	One fear network allow water.\nExpect yet the always there. Ground cut policy agency hotel. Month nearly hand newspaper protect seat add.\nThroughout goal point three. Employee stay husband skin. Public set budget action relationship home son.	PRIVATE	2025-04-20 17:51:01.211058	\N
39	20	Family behavior campaign player place manage live.	FRIENDS	2024-11-04 16:51:01.211058	\N
40	20	Development I smile social home best administration may. Fear daughter hear pull list certain husband million.\nLarge technology training quickly. Rock after relate phone back help responsibility. Real lay very rather phone you money.	FRIENDS	2023-07-12 17:51:01.211058	\N
41	20	Right player from look what draw. Training play leg describe her late then. Without realize voice war.\nClearly religious teach.\nCoach really minute. Nature back half to Democrat employee.\nDetermine try order sea leave then. Range anything win material. Play their stand mind keep course.\nMan course then less change amount. Pick about beat main you get most. Fire business training significant whatever rich start rule.	FRIENDS	2023-08-26 17:51:01.211058	\N
42	22	Defense myself main available black simple worker behavior. Us later stuff there trouble effort enjoy store. Light concern role life choose control.	FRIENDS	2025-02-21 16:51:01.211058	\N
43	22	Bank senior interest without beyond. Woman process apply team service kind official.\nTop in wind. Glass involve theory end land success.\nParticularly today two road. Something already sister early drug.	PRIVATE	2024-08-05 17:51:01.211058	\N
44	23	Recognize despite agreement plan allow nor toward. Remember similar here too physical leave home.\nTeam film local style traditional record collection. Six staff society Republican discussion hundred.\nLead degree down item impact market. Word end market as.	PRIVATE	2024-11-23 16:51:01.212067	\N
45	23	End fly either deal floor. Car can power.\nShoulder world vote may. Information third ball. Control serious security involve.\nAudience seat newspaper culture add whom. Discuss ask agree put next.\nBeat story eat miss approach. Himself wall plant require owner mention. Protect amount lawyer right add nearly.	PUBLIC	2023-07-19 17:51:01.212067	\N
46	24	Single require wish many quickly. Ball both know result country. Save office front game law note officer.	PUBLIC	2023-09-02 17:51:01.212067	\N
47	24	Finally forget side sure. Control continue Mr century lose management.\nCustomer song one charge.	FRIENDS	2024-02-24 16:51:01.212067	\N
48	24	Raise smile recognize only source majority blue. Name investment Republican set.\nGroup possible event subject use ok away. Establish girl personal page risk.\nBox program whatever front war.\nDirector chair word ball serve lay. The ask become officer. Drop policy surface trial sign out national reason.\nPrice reach discover difference. Usually claim glass oil.\nSomebody red eat support from. Home hand task product effect talk role. Institution in box she.	PRIVATE	2024-02-08 16:51:01.212067	post_media/sample3.jpg
49	25	Kid environmental test study. Tend either throw sometimes. Heart seem expert PM such deep.	FRIENDS	2024-07-07 17:51:01.212067	\N
50	25	Although page next.	PRIVATE	2025-03-06 16:51:01.212067	\N
51	25	Public develop news. Social race board need.	PUBLIC	2023-07-07 17:51:01.212067	post_media/sample1.jpeg
52	26	Goal professional eat lay no leg step. Bar turn feeling several. Country stuff instead market way firm.	PRIVATE	2024-10-16 17:51:01.212067	\N
53	27	Same science our herself team. Where station traditional much experience.	PUBLIC	2024-08-16 17:51:01.212067	post_media/sample3.jpg
54	28	North budget community visit author. At fire seek.\nWhole size leader fly wall beyond. Bar yeah clearly describe. Approach whom senior without school girl card. Where gas camera high season.\nWorld religious message assume letter our. Second speech anything I name possible side. Firm teach fight visit note task music.\nOther rock government first prove night. Thus money at page. Example set safe.	PUBLIC	2023-09-26 17:51:01.212067	\N
55	28	Improve commercial under each positive TV guy. Film ball message eat station like let. Grow camera score force result chair society.\nBox present tonight yes wrong rate future. Toward begin product sometimes. Successful community move coach baby.	PRIVATE	2023-07-24 17:51:01.213058	post_media/sample1.jpeg
56	28	Nearly character maybe ability discussion. Director development nearly job pull receive.\nMajor these win town three page. From general seven prove.\nHeavy might garden day.	PUBLIC	2023-12-01 16:51:01.213058	\N
57	30	Get sing manage project interest age. Need those along style. Full threat similar technology nearly away stuff.\nTest about question toward resource station. Two note official brother.	PRIVATE	2025-04-28 17:51:01.213058	post_media/sample3.jpg
58	30	Military affect as per. Lot specific clearly. Partner toward learn some lot way skin.	FRIENDS	2024-09-07 17:51:01.213058	\N
59	30	Room rule forward major news. Major want safe check popular.\nRead door either help push hard his two. Job loss age test never speak. Voice treat water former home just serve.\nSpeech southern letter leader I value campaign. Soon mission throw continue popular.\nI speak else especially wind performance rise. Relationship ready sure so large over against. None growth want party statement consumer.	FRIENDS	2024-07-08 17:51:01.213058	post_media/sample2.jpg
60	32	Language wonder up position statement wait. Soon thought forget require close how star.\nSort beautiful series role image hear industry. Night decade realize whole threat church. Rise health accept wonder audience different particularly.\nCoach sort third before TV. Process rather message second. Down behavior itself take body.	PUBLIC	2023-10-01 17:51:01.213058	\N
61	32	Case off us authority. Fish check page night probably this fight.	PUBLIC	2024-07-09 17:51:01.213058	\N
62	33	Social wish step however need police country yes. Return enjoy believe letter energy project.\nAir store what. Level wife anyone seek five method would.\nFear subject certain city generation follow view. Each coach push rule red treatment nice behind.\nLead staff should film. Fact green sense school property list guess. Mouth national appear cultural glass evening often difficult.\nHowever information dark two. Space trip performance scene. Reason skill but memory size.	FRIENDS	2023-11-16 16:51:01.213058	post_media/sample3.jpg
63	34	Certainly physical national support their like doctor administration. Common leg century structure officer. Sing color almost six gas politics believe their.	PUBLIC	2025-04-21 17:51:01.213058	\N
64	36	Attorney mission either defense everyone part staff. Staff threat west opportunity experience her. Whom often next if crime pick.\nEffect particular at would position our and. Civil question son speak themselves bring.\nReason live speech live. Within true street central.	PUBLIC	2025-01-16 16:51:01.214058	\N
65	36	Spring soon quite class study. Opportunity personal action number play.	FRIENDS	2025-02-22 16:51:01.214058	\N
66	36	Again event prepare style Republican. Hour street than yeah hair. Agency outside service action one though image.	PUBLIC	2024-05-06 17:51:01.214058	post_media/sample1.jpeg
67	37	Coach talk owner social but. Enjoy entire idea not house lot nearly. Nature begin likely between though base between.\nCreate recent nor nation participant little actually.\nBall tend into attack claim among. Likely concern spend arrive area. Fight available offer voice kitchen white.	FRIENDS	2023-10-15 17:51:01.214058	post_media/sample1.jpeg
68	37	See end institution central itself administration none. Even wind someone month two father hot involve.\nSecond newspaper admit include and college. More by yard picture even use accept development. Health blue picture style culture.\nLight reason they name fine half reach strategy. Yourself thus prevent make.	PRIVATE	2024-05-14 17:51:01.214058	\N
69	37	Show big democratic board each open question. Start change water use tough forward would.\nNecessary who half quality officer tax television. Through just report hair. Us home owner now miss under third position.\nActivity public road lot work language. Seek phone season keep design usually.\nBetter mission hair science memory either.\nOperation tough program office establish day key civil. Common including step medical.	PUBLIC	2024-11-19 16:51:01.214058	\N
70	38	American job wind be American project stuff.	PUBLIC	2024-06-07 17:51:01.214058	\N
71	39	Interesting need term collection chair. Yet source dark idea.\nStop score face soon that. Modern interesting energy last. Walk toward attorney bring represent.	PRIVATE	2023-06-09 17:51:01.214058	\N
72	41	Special process military thought authority. Help event statement money market opportunity possible. Eye involve card sit skill.	PUBLIC	2024-05-29 17:51:01.214058	\N
73	42	Popular tax type position. Production particularly return pretty company.\nMaybe direction after worker game daughter anything less. Catch current beautiful current way baby.\nMethod some himself he. Five be big in way which gas.\nMoment may test itself fund help. Of involve final ten floor hair. Agency firm situation.	FRIENDS	2024-07-27 17:51:01.214058	\N
74	48	Water his former skill dinner item. Face particular morning reality. Kitchen why than item administration.\nIncluding dream agree. Talk face us near much.\nPhysical practice arm. Partner what page program control.\nGuy surface position. On to force name movement area. Network ok see. Light key itself day risk staff food.\nAnswer there case letter market. Significant letter maintain low.	PUBLIC	2024-02-23 16:51:01.215058	\N
75	49	Wear represent force always maybe think well. Each very local east after. Least culture boy.\nMind too blue. However moment forward debate would develop part. Although write store institution small member. All sell medical life.	PUBLIC	2023-08-29 17:51:01.215058	\N
76	49	Whether public commercial article car road. Describe outside set thus. Member test present everyone agency.\nWorld idea attack wonder. Real approach pattern president along task quite watch. Letter itself garden of mission old.\nCollection court glass yard foot. Box power whether bed yard two. Degree cover improve.	FRIENDS	2024-04-14 17:51:01.215058	\N
77	49	Own pass ground choose shake change. Picture little wait then wind open trial public. Yet site amount your bring find morning.\nThreat travel only thought. Some media almost evening politics door economic. Per parent establish building benefit.\nArrive position everyone of center participant level about. Research human light. Everyone eight politics economy stand.\nHundred raise miss morning rule business. Build some past blood author. Deep process road attack then consumer.	PUBLIC	2024-10-20 17:51:01.215058	\N
78	50	Despite matter only friend. Early perhaps wrong stock. Space should much.\nClaim they year behavior. Fast senior upon detail one. Entire for unit none people election.\nCharge sell big environmental compare left project all. Two order window else church middle outside doctor. Mrs property president.\nTreatment ahead bed trouble thus. Threat through listen catch president position.	PUBLIC	2024-10-06 17:51:01.215058	\N
79	50	Drug spend young perhaps family plant my. Although future why stage.\nWhom care station specific among tax win. Three trip natural somebody tree activity.\nStudy hundred parent I probably. College significant person sound realize garden.	FRIENDS	2025-05-24 17:51:01.215058	\N
80	50	Political debate pick even environment interview medical. Operation pattern once close hotel quickly service. Mention Republican now over senior garden throw.\nInstitution property save authority real trade. Throw onto himself section well majority color.\nLaw less fly herself property make identify. Care analysis two kitchen agree. Analysis his establish million defense between evening.	PUBLIC	2024-02-06 16:51:01.215058	post_media/sample1.jpeg
81	51	These success so force music. Appear quality build. Modern perhaps away political child.\nOffer quite community plant. Success activity article civil across however.\nHome on concern week. Number claim south fear raise fire act down.	PUBLIC	2023-06-20 17:51:01.215058	\N
82	51	Each science several alone. Mind every democratic outside.\nVery more daughter. Employee city however produce.\nIssue people view individual turn together well. Main music until least.\nItem fire TV near black tonight. Upon expert tell officer. Full whose face shake people.\nLeg military quickly everyone group natural. That only a himself interest ready civil.\nBehavior institution century office western.	PUBLIC	2025-04-01 17:51:01.216058	post_media/sample3.jpg
83	53	Rise audience marriage why hair else. Audience light fire north itself. Stay part effect up history serious.\nLevel society often represent. West south in now meeting picture. Including camera set hand evening theory big.\nEarly brother possible usually word.\nScience far wind public character sea beat. Manage region author sure place key.\nThrough institution lawyer. He available general. Staff though condition design.	PRIVATE	2024-01-23 16:51:01.216058	post_media/sample2.jpg
84	53	Successful throughout can four shoulder trip. Campaign office approach. Along tax general wait day purpose before.\nTruth five without direction she glass. Tax moment cold upon agree perform. Successful standard few next already government you. Better go property agent money live.	PRIVATE	2023-08-03 17:51:01.216058	post_media/sample3.jpg
\.


--
-- TOC entry 5001 (class 0 OID 16565)
-- Dependencies: 231
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.share (id, user_id, post_id, content, "timestamp") FROM stdin;
1	1	12	It's working, thankfully!	2025-05-28 14:41:20.026705
2	1	9	\N	2025-05-28 15:40:16.714135
3	4	14	wow!	2025-06-03 12:59:32.866636
4	36	25	Purpose the modern after artist.	2025-05-22 14:24:01.267219
5	23	45	\N	2025-05-26 13:07:01.267219
6	31	51	Take in behind challenge movement popular.	2025-05-24 05:57:01.267219
7	41	52	Same citizen magazine produce pattern involve most.	2025-05-31 03:54:01.267219
8	51	55	\N	2025-06-02 09:23:01.267219
9	21	82	\N	2025-06-03 00:40:01.267219
\.


--
-- TOC entry 4999 (class 0 OID 16546)
-- Dependencies: 229
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, user_id, post_id, content, "timestamp", share_id) FROM stdin;
1	1	13	hey there :)	2025-05-26 17:18:43.9477	\N
2	1	14	TAKE ME BACK!!!	2025-05-26 17:25:48.564477	\N
3	1	14	mamz	2025-05-26 17:32:15.610815	\N
4	1	14	hello!	2025-05-27 12:06:56.197899	\N
5	6	15	Factor why before before blood next.	2025-05-26 02:10:01.243026	\N
6	43	15	Cost station better wonder politics show rule quickly.	2025-05-11 11:37:01.243026	\N
7	22	18	Head could administration available soldier Mr address evidence.	2025-06-02 03:28:01.243026	\N
8	6	19	Nice true environmental happen.	2025-05-17 12:02:01.243026	\N
9	25	19	Particular money whether paper focus.	2025-05-08 20:33:01.243026	\N
10	36	21	Act know hope interview talk reflect.	2025-05-20 18:49:01.243026	\N
11	48	21	Ahead property relate kid from.	2025-05-13 12:07:01.243026	\N
12	6	23	Simple professor subject.	2025-05-25 21:30:01.243026	\N
13	20	23	Suffer risk man decade film keep.	2025-06-01 04:52:01.243026	\N
14	24	28	Education hand peace support indicate.	2025-05-24 13:25:01.243026	\N
15	35	28	Get suddenly gun your probably involve.	2025-05-23 21:35:01.243026	\N
16	10	30	Maybe nearly course nation so physical.	2025-05-23 00:54:01.243026	\N
17	29	31	Successful nice because.	2025-05-06 19:19:01.243026	\N
18	5	31	Thus little rest there.	2025-06-01 14:08:01.243026	\N
19	39	32	Gas size Mr short.	2025-05-20 11:01:01.243026	\N
20	20	32	Box month goal wrong technology three cause.	2025-05-11 20:35:01.243026	\N
21	29	33	Major citizen during fly create today national.	2025-05-20 16:25:01.243026	\N
22	12	33	Blood smile cover recent success dream possible.	2025-05-21 13:17:01.243026	\N
23	16	34	General artist could affect.	2025-05-11 12:14:01.243026	\N
24	5	35	Lay indeed child example sort where court large.	2025-05-05 09:12:01.243026	\N
25	15	35	Old family my stock.	2025-05-08 09:08:01.243026	\N
26	7	36	Evidence try option.	2025-06-01 14:33:01.243026	\N
27	5	37	Industry summer after financial short order call writer.	2025-05-10 02:51:01.243026	\N
28	45	39	Country defense ever memory institution.	2025-05-26 00:59:01.243026	\N
29	42	40	Boy effort treatment if either red fish.	2025-06-03 07:56:01.243026	\N
30	37	40	Stop law during across.	2025-05-12 11:39:01.243026	\N
31	12	41	Chance fill difficult believe whole cell run garden.	2025-05-25 00:18:01.243026	\N
32	16	42	Art these near institution.	2025-05-10 15:46:01.243026	\N
33	50	43	Board successful learn economic until he business.	2025-05-11 09:35:01.243026	\N
34	8	44	Husband take at language identify wall put.	2025-05-07 09:32:01.243026	\N
35	10	44	Reason despite rock others move cost exist.	2025-05-23 12:40:01.243026	\N
36	47	46	Off only share amount heart.	2025-05-17 06:42:01.243026	\N
37	23	46	Somebody amount activity physical before.	2025-05-11 21:21:01.243026	\N
38	40	47	Market from hope up Congress rise hot.	2025-05-25 19:29:01.243026	\N
39	38	49	Officer old add project purpose face.	2025-05-24 15:21:01.243026	\N
40	12	49	Day forward edge those someone majority however.	2025-05-31 05:16:01.243026	\N
41	42	52	Dinner the training measure feel hope computer sound.	2025-05-05 04:02:01.243026	\N
42	52	52	Say position capital energy serious oil down.	2025-05-18 11:53:01.243026	\N
43	44	54	Opportunity paper everything.	2025-05-06 03:01:01.244026	\N
44	14	55	Factor ground high trial.	2025-05-04 19:14:01.244026	\N
45	52	55	Compare catch set people meeting wife.	2025-05-16 04:02:01.244026	\N
46	46	58	Behind must evidence score.	2025-05-22 23:05:01.244026	\N
47	16	58	Work college director audience night dream.	2025-05-06 15:32:01.244026	\N
48	36	60	Hit herself recognize career leader reflect scene power.	2025-05-06 01:56:01.244026	\N
49	54	60	Hope always commercial this good scientist no.	2025-05-29 02:18:01.244026	\N
50	35	63	Fund bed well city.	2025-05-14 21:30:01.244026	\N
51	25	63	Role card clearly Republican skin care arm create.	2025-05-16 04:53:01.244026	\N
52	23	64	East vote this model girl.	2025-05-16 13:54:01.244026	\N
53	48	65	Impact less quite begin figure feeling.	2025-05-08 17:43:01.244026	\N
54	44	65	Direction east push.	2025-05-14 01:56:01.244026	\N
55	50	67	Build life career leader off.	2025-05-16 18:28:01.244026	\N
56	12	68	Model picture member really eat be explain.	2025-05-05 00:18:01.244026	\N
57	17	69	Turn world establish subject room.	2025-05-29 08:34:01.244026	\N
58	33	69	Relationship form free.	2025-05-24 20:41:01.244026	\N
59	33	70	Hour although mind food.	2025-05-30 19:53:01.244026	\N
60	15	70	According election level relationship discuss the.	2025-05-30 09:08:01.244026	\N
61	49	73	Phone drive strong pull challenge back appear.	2025-05-26 19:23:01.244026	\N
62	38	74	Race particularly strong identify hot easy anyone check.	2025-05-11 05:56:01.244026	\N
63	32	75	Alone education include whose.	2025-05-04 19:32:01.244026	\N
64	44	75	Cost would community piece someone thought own become.	2025-05-19 10:39:01.244026	\N
65	8	76	Type shoulder space wrong which.	2025-05-18 23:01:01.244026	\N
66	30	76	Finally talk resource whole world fight sometimes.	2025-05-27 06:22:01.244026	\N
67	13	78	Paper into produce house husband particular.	2025-05-15 09:32:01.244026	\N
68	22	79	Clearly head pattern enough.	2025-05-07 02:49:01.244026	\N
69	39	81	Suggest security with hope.	2025-05-29 03:42:01.244026	\N
70	12	81	Piece run mother bad everything difference.	2025-05-05 02:17:01.244026	\N
71	29	82	Various line form partner poor.	2025-05-17 11:50:01.244026	\N
72	45	84	Across government food decide off.	2025-05-25 04:20:01.244026	\N
\.


--
-- TOC entry 4992 (class 0 OID 16435)
-- Dependencies: 222
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendships (user_id, friend_id) FROM stdin;
3	4
4	3
3	1
1	3
3	2
2	3
1	4
4	1
4	2
2	4
5	34
34	5
6	39
39	6
7	42
42	7
7	35
35	7
7	54
54	7
7	45
45	7
7	52
52	7
9	48
48	9
9	12
12	9
9	31
31	9
9	43
43	9
9	14
14	9
9	49
49	9
10	26
26	10
10	30
30	10
10	52
52	10
10	43
43	10
11	44
44	11
11	22
22	11
11	19
19	11
11	48
48	11
11	26
26	11
11	32
32	11
11	29
29	11
12	28
28	12
12	50
50	12
13	54
54	13
13	40
40	13
13	39
39	13
14	5
5	14
14	16
16	14
14	6
6	14
14	40
40	14
14	18
18	14
14	23
23	14
14	8
8	14
15	44
44	15
15	54
54	15
16	50
50	16
17	7
7	17
17	23
23	17
18	39
39	18
19	52
52	19
20	22
22	20
20	16
16	20
20	31
31	20
20	25
25	20
20	39
39	20
20	15
15	20
20	21
21	20
22	52
52	22
22	18
18	22
23	28
28	23
25	36
36	25
25	53
53	25
25	16
16	25
25	12
12	25
25	34
34	25
26	51
51	26
26	33
33	26
26	43
43	26
26	52
52	26
27	24
24	27
27	41
41	27
27	14
14	27
27	22
22	27
29	25
25	29
29	6
6	29
30	52
52	30
30	28
28	30
30	21
21	30
30	36
36	30
30	37
37	30
31	44
44	31
31	17
17	31
31	19
19	31
31	11
11	31
31	26
26	31
32	34
34	32
32	50
50	32
34	11
11	34
34	17
17	34
34	15
15	34
34	8
8	34
35	36
36	35
36	12
12	36
36	42
42	36
36	37
37	36
36	45
45	36
36	51
51	36
36	44
44	36
37	12
12	37
37	8
8	37
37	53
53	37
37	44
44	37
37	7
7	37
37	18
18	37
38	17
17	38
38	20
20	38
38	52
52	38
38	25
25	38
40	7
7	40
41	47
47	41
41	39
39	41
41	31
31	41
41	22
22	41
42	30
30	42
42	22
22	42
42	32
32	42
43	53
53	43
44	17
17	44
44	14
14	44
44	53
53	44
44	38
38	44
46	49
49	46
46	22
22	46
46	39
39	46
46	34
34	46
46	5
5	46
47	27
27	47
47	9
9	47
48	26
26	48
48	5
5	48
48	14
14	48
48	30
30	48
48	15
15	48
48	46
46	48
50	10
10	50
50	19
19	50
51	7
7	51
51	49
49	51
52	5
5	52
53	33
33	53
53	49
49	53
53	8
8	53
53	51
51	53
53	41
41	53
54	49
49	54
54	41
41	54
54	29
29	54
54	37
37	54
\.


--
-- TOC entry 4994 (class 0 OID 16451)
-- Dependencies: 224
-- Data for Name: like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."like" (id, user_id, post_id, comment_id, share_id, "timestamp") FROM stdin;
3	1	3	\N	\N	\N
5	2	3	\N	\N	\N
6	1	4	\N	\N	\N
8	4	3	\N	\N	\N
9	4	4	\N	\N	\N
10	4	5	\N	\N	\N
14	4	7	\N	\N	\N
15	4	9	\N	\N	2025-05-24 16:41:36.790249
16	3	9	\N	\N	2025-05-25 13:10:43.129831
17	3	8	\N	\N	2025-05-25 13:10:44.691712
18	3	7	\N	\N	2025-05-25 13:10:46.709828
19	3	5	\N	\N	2025-05-25 13:10:48.984311
22	3	4	\N	\N	2025-05-25 13:47:50.94415
23	3	2	\N	\N	2025-05-25 13:49:27.944787
24	3	3	\N	\N	2025-05-25 13:50:44.134194
27	1	13	\N	\N	2025-05-26 17:20:37.209816
28	1	2	\N	\N	2025-05-26 17:26:06.338584
29	1	14	\N	\N	2025-05-27 13:21:16.192958
30	1	12	\N	\N	2025-05-28 15:31:10.865611
31	4	\N	\N	3	2025-06-03 12:59:38.878101
32	1	\N	\N	3	2025-06-03 14:27:12.804177
33	5	70	\N	\N	2025-05-03 11:18:46.271225
34	5	68	\N	\N	2025-04-24 00:59:43.271225
35	5	75	\N	\N	2025-03-08 13:11:08.271225
36	5	73	\N	\N	2025-05-17 15:55:19.271225
37	5	43	\N	\N	2025-05-10 03:18:14.271225
38	5	16	\N	\N	2025-04-08 22:04:48.271225
39	5	74	\N	\N	2025-05-07 18:28:50.271225
40	5	46	\N	\N	2025-05-01 18:00:41.271225
41	5	30	\N	\N	2025-05-03 22:39:45.271225
42	5	15	\N	\N	2025-05-16 13:11:37.271225
43	5	\N	25	\N	2025-05-20 00:47:58.271225
44	5	78	\N	\N	2025-04-29 16:14:55.271225
45	5	61	\N	\N	2025-04-29 23:50:42.271225
46	6	74	\N	\N	2025-05-23 21:57:10.271225
47	6	55	\N	\N	2025-05-21 11:06:18.271225
48	6	43	\N	\N	2025-03-21 08:34:15.271225
49	6	69	\N	\N	2025-05-06 10:03:21.271225
50	6	61	\N	\N	2025-04-29 22:13:20.271225
51	6	\N	49	\N	2025-03-27 16:44:30.271225
52	6	75	\N	\N	2025-05-27 11:17:06.271225
53	6	63	\N	\N	2025-03-29 02:22:08.271225
54	6	\N	40	\N	2025-03-29 16:38:35.271225
55	6	33	\N	\N	2025-05-29 07:47:20.271225
56	6	60	\N	\N	2025-05-09 03:03:13.271225
57	6	18	\N	\N	2025-03-26 22:23:11.271225
58	7	72	\N	\N	2025-03-27 05:05:30.271225
59	7	62	\N	\N	2025-03-15 12:08:55.271225
60	7	\N	\N	9	2025-06-01 08:27:38.271225
61	7	78	\N	\N	2025-03-08 10:02:26.271225
62	7	65	\N	\N	2025-05-25 19:38:32.271225
63	7	\N	22	\N	2025-04-27 02:27:57.271225
64	8	\N	22	\N	2025-05-09 02:04:39.271225
65	8	44	\N	\N	2025-04-12 06:23:14.271225
66	8	41	\N	\N	2025-05-06 10:14:21.271225
67	8	39	\N	\N	2025-03-29 14:05:16.271225
68	8	\N	65	\N	2025-05-28 09:41:23.271225
69	8	57	\N	\N	2025-05-29 10:54:50.271225
70	8	21	\N	\N	2025-03-15 05:47:33.271225
71	8	18	\N	\N	2025-04-14 22:13:08.271225
72	8	20	\N	\N	2025-03-10 11:32:28.271225
73	8	58	\N	\N	2025-05-03 18:07:41.271225
74	8	62	\N	\N	2025-03-05 20:32:30.271225
75	9	35	\N	\N	2025-05-30 02:51:18.271225
76	9	75	\N	\N	2025-06-03 15:31:36.271225
77	9	\N	\N	9	2025-05-30 17:21:53.271225
78	9	69	\N	\N	2025-04-03 09:11:57.271225
79	9	82	\N	\N	2025-05-02 19:02:11.271225
80	9	62	\N	\N	2025-04-24 20:16:05.271225
81	9	65	\N	\N	2025-03-10 07:35:32.271225
82	9	\N	14	\N	2025-03-20 12:53:20.271225
83	9	\N	9	\N	2025-05-16 10:56:34.271225
84	9	84	\N	\N	2025-04-24 15:52:20.271225
85	9	70	\N	\N	2025-04-27 03:55:18.271225
86	9	15	\N	\N	2025-04-04 00:57:36.271225
87	9	72	\N	\N	2025-04-18 19:10:12.271225
88	9	44	\N	\N	2025-03-29 07:13:13.271225
89	9	77	\N	\N	2025-04-05 09:52:46.271225
90	10	60	\N	\N	2025-04-20 20:46:49.271225
91	10	72	\N	\N	2025-05-28 09:49:49.271225
92	10	\N	64	\N	2025-04-09 21:31:12.271225
93	10	35	\N	\N	2025-04-13 23:09:22.271225
94	10	\N	\N	5	2025-04-18 03:49:40.271225
95	10	62	\N	\N	2025-03-26 08:15:09.271225
96	10	33	\N	\N	2025-05-11 22:06:12.271225
97	10	\N	65	\N	2025-03-08 14:44:25.271225
98	10	\N	\N	8	2025-05-16 01:21:18.271225
99	10	\N	28	\N	2025-03-30 17:30:59.271225
100	10	38	\N	\N	2025-04-01 17:59:22.271225
101	11	66	\N	\N	2025-05-02 20:56:11.271225
102	11	76	\N	\N	2025-05-26 17:03:35.271225
103	11	24	\N	\N	2025-03-19 10:21:51.271225
104	11	84	\N	\N	2025-04-18 02:51:10.271225
105	11	\N	42	\N	2025-04-12 17:12:07.271225
106	11	\N	\N	9	2025-05-06 08:30:05.271225
107	11	36	\N	\N	2025-04-10 11:17:30.271225
108	11	78	\N	\N	2025-03-29 06:23:11.271225
109	12	47	\N	\N	2025-04-13 07:01:12.271225
110	12	\N	23	\N	2025-04-08 22:12:52.271225
111	12	\N	\N	9	2025-05-25 19:27:11.271225
112	12	50	\N	\N	2025-05-03 16:36:00.271225
113	12	37	\N	\N	2025-04-04 05:04:05.271225
114	12	\N	43	\N	2025-04-16 05:08:31.271225
115	12	\N	54	\N	2025-05-26 19:23:28.271225
116	12	\N	69	\N	2025-05-17 02:25:58.271225
117	12	73	\N	\N	2025-04-22 06:40:37.271225
118	12	74	\N	\N	2025-05-10 19:04:32.271225
119	12	70	\N	\N	2025-04-06 15:25:56.271225
120	13	73	\N	\N	2025-04-23 18:15:00.271225
121	13	\N	\N	9	2025-04-04 19:59:07.271225
122	13	75	\N	\N	2025-04-28 03:19:35.271225
123	13	\N	29	\N	2025-05-03 12:45:09.271225
124	13	\N	7	\N	2025-04-29 08:50:36.271225
125	14	\N	41	\N	2025-05-31 12:39:19.271225
126	14	23	\N	\N	2025-05-03 19:29:55.271225
127	14	61	\N	\N	2025-03-30 21:54:36.271225
128	14	\N	19	\N	2025-04-17 22:06:08.271225
129	14	37	\N	\N	2025-05-29 05:11:10.271225
130	14	72	\N	\N	2025-04-17 03:58:59.271225
131	15	\N	\N	5	2025-05-19 17:22:56.271225
132	15	46	\N	\N	2025-05-07 01:08:56.271225
133	15	45	\N	\N	2025-05-20 01:45:58.271225
134	15	23	\N	\N	2025-05-16 22:51:57.271225
135	16	\N	\N	5	2025-04-01 02:28:05.271225
136	16	24	\N	\N	2025-05-02 05:10:48.271225
137	16	84	\N	\N	2025-05-27 03:01:04.271225
138	17	33	\N	\N	2025-05-17 07:56:11.271225
139	17	59	\N	\N	2025-04-01 20:08:12.271225
140	17	\N	24	\N	2025-05-04 16:52:25.271225
141	18	\N	41	\N	2025-03-27 18:30:39.271225
142	18	23	\N	\N	2025-04-25 20:53:41.271225
143	18	60	\N	\N	2025-04-19 23:49:50.271225
144	18	70	\N	\N	2025-04-13 16:45:16.271225
145	18	\N	22	\N	2025-03-27 11:49:33.271225
146	18	\N	56	\N	2025-04-28 21:45:39.271225
147	18	55	\N	\N	2025-04-28 15:48:10.271225
148	18	63	\N	\N	2025-05-31 03:44:00.271225
149	18	24	\N	\N	2025-05-07 03:22:05.271225
150	19	\N	68	\N	2025-04-14 00:56:55.271225
151	19	\N	63	\N	2025-04-02 23:48:44.271225
152	19	83	\N	\N	2025-04-08 12:27:32.271225
153	19	51	\N	\N	2025-03-12 23:04:22.271225
154	20	42	\N	\N	2025-03-10 08:15:09.271225
155	20	43	\N	\N	2025-04-03 18:18:55.271225
156	20	50	\N	\N	2025-04-16 04:02:03.271225
157	20	31	\N	\N	2025-03-12 18:14:58.271225
158	20	15	\N	\N	2025-04-21 19:45:07.271225
159	21	22	\N	\N	2025-05-20 18:11:01.271225
160	21	\N	\N	6	2025-04-24 13:25:09.271225
161	21	63	\N	\N	2025-05-28 23:31:24.271225
162	21	\N	27	\N	2025-05-05 20:20:37.271225
163	21	\N	\N	5	2025-04-08 15:49:25.271225
164	21	53	\N	\N	2025-05-29 14:36:13.271225
165	22	27	\N	\N	2025-04-03 17:59:18.271225
166	22	\N	8	\N	2025-04-15 07:25:57.271225
167	22	30	\N	\N	2025-05-23 05:20:55.271225
168	22	48	\N	\N	2025-04-13 02:44:54.271225
169	22	49	\N	\N	2025-04-06 10:54:23.271225
170	22	80	\N	\N	2025-04-18 03:34:05.271225
171	22	\N	\N	8	2025-04-04 12:07:33.271225
172	22	32	\N	\N	2025-03-23 21:11:30.271225
173	22	58	\N	\N	2025-05-10 03:06:51.271225
174	22	64	\N	\N	2025-04-11 20:10:22.271225
175	23	58	\N	\N	2025-03-31 21:35:21.272221
176	23	\N	63	\N	2025-03-07 22:13:50.272221
177	23	31	\N	\N	2025-05-02 08:38:25.272221
178	23	71	\N	\N	2025-03-06 10:36:37.272221
179	23	75	\N	\N	2025-04-22 08:08:38.272221
180	23	45	\N	\N	2025-04-09 03:32:10.272221
181	23	18	\N	\N	2025-03-06 21:14:49.272221
182	23	\N	23	\N	2025-04-30 15:53:08.272221
183	24	66	\N	\N	2025-03-09 20:36:12.272221
184	24	64	\N	\N	2025-06-01 05:40:59.272221
185	24	71	\N	\N	2025-04-30 05:44:36.272221
186	24	17	\N	\N	2025-05-04 14:37:42.272221
187	24	19	\N	\N	2025-04-19 00:22:32.272221
188	24	40	\N	\N	2025-03-29 00:07:51.272221
189	24	47	\N	\N	2025-03-15 16:09:00.272221
190	24	34	\N	\N	2025-03-18 03:34:40.272221
191	25	52	\N	\N	2025-03-12 07:04:18.272221
192	25	51	\N	\N	2025-04-12 19:59:13.272221
193	25	24	\N	\N	2025-04-06 19:48:10.272221
194	25	44	\N	\N	2025-03-28 06:28:04.272221
195	26	38	\N	\N	2025-05-23 13:52:48.272221
196	26	\N	36	\N	2025-03-23 17:28:06.272221
197	26	\N	45	\N	2025-05-15 21:06:49.272221
198	26	41	\N	\N	2025-03-06 15:47:13.272221
199	27	\N	42	\N	2025-05-05 08:18:51.272221
200	27	\N	65	\N	2025-05-02 04:30:43.272221
201	27	44	\N	\N	2025-03-31 04:37:40.272221
202	27	77	\N	\N	2025-05-30 00:10:07.272221
203	27	84	\N	\N	2025-04-20 21:04:23.272221
204	27	16	\N	\N	2025-03-25 14:43:04.272221
205	27	53	\N	\N	2025-05-24 09:04:47.272221
206	28	15	\N	\N	2025-04-04 16:11:59.272221
207	30	84	\N	\N	2025-05-07 13:18:30.272221
208	30	70	\N	\N	2025-03-16 21:42:01.272221
209	30	\N	7	\N	2025-03-15 08:55:11.272221
210	30	\N	25	\N	2025-03-13 22:56:06.272221
211	30	59	\N	\N	2025-04-16 07:39:47.272221
212	31	72	\N	\N	2025-04-03 19:47:51.272221
213	31	16	\N	\N	2025-05-19 01:40:59.272221
214	31	52	\N	\N	2025-05-12 14:28:31.272221
215	31	38	\N	\N	2025-03-29 13:54:04.272221
216	31	\N	47	\N	2025-04-24 08:03:19.272221
217	31	79	\N	\N	2025-04-26 03:22:00.272221
218	31	74	\N	\N	2025-05-08 11:04:12.272221
219	31	44	\N	\N	2025-04-16 16:01:17.272221
220	32	\N	\N	8	2025-03-30 15:16:54.272221
221	32	70	\N	\N	2025-03-29 01:06:30.272221
222	32	26	\N	\N	2025-04-28 11:01:52.272221
223	32	30	\N	\N	2025-03-29 05:15:20.272221
224	32	58	\N	\N	2025-04-26 10:19:25.272221
225	32	80	\N	\N	2025-05-07 13:48:32.272221
226	32	77	\N	\N	2025-04-12 04:02:13.272221
227	32	24	\N	\N	2025-03-18 02:38:14.272221
228	32	\N	35	\N	2025-03-12 13:10:22.272221
229	32	82	\N	\N	2025-03-16 21:55:20.272221
230	33	\N	\N	7	2025-03-10 18:43:18.272221
231	33	32	\N	\N	2025-03-06 11:47:53.272221
232	33	71	\N	\N	2025-04-22 13:53:48.272221
233	33	83	\N	\N	2025-05-11 16:08:49.272221
234	33	\N	29	\N	2025-04-17 04:26:23.272221
235	33	63	\N	\N	2025-03-30 00:31:51.272221
236	33	51	\N	\N	2025-05-26 02:38:24.272221
237	33	\N	62	\N	2025-04-24 23:04:19.272221
238	33	\N	\N	9	2025-03-16 20:50:13.272221
239	33	\N	32	\N	2025-06-03 05:03:12.272221
240	33	31	\N	\N	2025-03-11 13:51:33.272221
241	33	38	\N	\N	2025-03-17 13:34:16.272221
242	34	43	\N	\N	2025-03-19 04:12:40.272221
243	34	42	\N	\N	2025-03-23 08:44:14.272221
244	34	56	\N	\N	2025-04-06 06:58:27.272221
245	35	41	\N	\N	2025-04-04 22:30:14.272221
246	36	\N	\N	5	2025-05-30 07:00:38.272221
247	36	\N	24	\N	2025-03-31 21:20:47.272221
248	36	\N	\N	7	2025-03-11 06:31:54.272221
249	36	\N	\N	6	2025-04-30 12:39:37.272221
250	37	81	\N	\N	2025-03-08 02:49:01.272221
251	37	58	\N	\N	2025-04-19 21:27:02.272221
252	37	72	\N	\N	2025-05-24 05:25:16.272221
253	37	25	\N	\N	2025-04-22 09:42:31.272221
254	37	\N	43	\N	2025-05-30 10:04:27.272221
255	37	73	\N	\N	2025-05-03 15:51:56.272221
256	38	83	\N	\N	2025-05-01 21:03:33.272221
257	38	76	\N	\N	2025-04-05 20:40:33.272221
258	38	\N	28	\N	2025-04-02 16:18:54.272221
259	38	38	\N	\N	2025-04-05 16:45:31.272221
260	38	\N	\N	5	2025-05-18 01:18:39.272221
261	39	72	\N	\N	2025-03-18 22:14:08.272221
262	39	18	\N	\N	2025-03-31 13:57:37.272221
263	39	68	\N	\N	2025-05-27 03:21:25.272221
264	39	27	\N	\N	2025-03-11 04:14:08.272221
265	39	71	\N	\N	2025-04-05 10:45:27.272221
266	39	37	\N	\N	2025-05-19 03:04:03.272221
267	39	\N	12	\N	2025-04-22 23:55:39.272221
268	39	\N	\N	9	2025-03-22 05:19:46.272221
269	39	\N	\N	7	2025-03-17 14:39:15.272221
270	39	16	\N	\N	2025-03-21 17:44:20.272221
271	39	\N	42	\N	2025-05-09 15:18:01.272221
272	39	84	\N	\N	2025-05-19 22:56:53.272221
273	40	23	\N	\N	2025-04-08 02:48:23.272221
274	40	39	\N	\N	2025-05-24 11:07:31.272221
275	40	51	\N	\N	2025-06-02 13:56:28.272221
276	40	62	\N	\N	2025-03-31 04:11:28.272221
277	40	36	\N	\N	2025-04-08 03:48:29.272221
278	40	28	\N	\N	2025-04-07 08:55:32.272221
279	40	\N	63	\N	2025-03-26 18:34:54.272221
280	40	18	\N	\N	2025-05-03 17:59:54.272221
281	40	31	\N	\N	2025-05-13 10:21:07.272221
282	40	\N	51	\N	2025-05-11 02:05:55.272221
283	40	\N	\N	8	2025-04-17 19:34:30.272221
284	40	56	\N	\N	2025-04-09 06:22:16.272221
285	40	\N	\N	7	2025-05-12 09:01:57.272221
286	41	\N	23	\N	2025-03-07 14:34:56.272221
287	41	\N	\N	4	2025-03-26 14:50:00.272221
288	41	\N	\N	9	2025-04-16 23:29:55.272221
289	41	78	\N	\N	2025-04-26 21:40:40.272221
290	41	19	\N	\N	2025-04-08 18:12:59.272221
291	41	56	\N	\N	2025-03-12 08:34:28.272221
292	41	18	\N	\N	2025-04-04 01:57:35.272221
293	42	\N	46	\N	2025-04-10 12:12:48.272221
294	42	78	\N	\N	2025-03-17 23:13:03.272221
295	43	\N	47	\N	2025-03-06 10:27:14.272221
296	43	79	\N	\N	2025-03-27 12:14:12.272221
297	43	53	\N	\N	2025-03-13 08:42:44.272221
298	43	\N	\N	7	2025-03-22 21:59:03.272221
299	44	\N	72	\N	2025-04-08 20:54:17.272221
300	44	16	\N	\N	2025-04-12 21:58:20.272221
301	44	75	\N	\N	2025-04-26 14:11:25.272221
302	44	\N	\N	7	2025-03-13 01:13:00.272221
303	44	72	\N	\N	2025-03-09 18:02:05.272221
304	44	83	\N	\N	2025-05-11 11:40:18.272221
305	44	\N	\N	9	2025-05-12 13:28:16.272221
306	44	61	\N	\N	2025-04-24 18:50:13.272221
307	44	63	\N	\N	2025-04-15 04:33:46.272221
308	44	76	\N	\N	2025-04-03 07:03:14.272221
309	44	53	\N	\N	2025-05-26 22:33:27.272221
310	44	\N	28	\N	2025-03-06 21:42:31.272221
311	45	51	\N	\N	2025-03-07 21:54:04.272221
312	45	39	\N	\N	2025-05-12 13:25:00.272221
313	45	44	\N	\N	2025-05-17 22:52:52.272221
314	45	77	\N	\N	2025-03-23 19:06:53.272221
315	45	30	\N	\N	2025-04-27 03:03:34.272221
316	45	82	\N	\N	2025-03-13 12:10:38.272221
317	45	40	\N	\N	2025-04-24 02:13:32.272221
318	46	\N	\N	9	2025-03-17 17:15:09.272221
319	46	79	\N	\N	2025-05-13 01:56:48.272221
320	46	\N	52	\N	2025-04-30 13:14:35.272221
321	46	\N	29	\N	2025-03-20 06:03:14.272221
322	46	28	\N	\N	2025-05-18 00:09:38.272221
323	47	47	\N	\N	2025-05-25 06:47:16.272221
324	47	44	\N	\N	2025-04-16 08:32:56.272221
325	47	68	\N	\N	2025-05-18 10:37:59.272221
326	47	24	\N	\N	2025-05-26 06:41:50.272221
327	47	42	\N	\N	2025-04-05 03:55:53.272221
328	47	19	\N	\N	2025-05-06 10:13:48.272221
329	47	73	\N	\N	2025-04-06 17:22:57.272221
330	47	\N	\N	5	2025-05-20 12:25:59.272221
331	47	58	\N	\N	2025-05-18 09:25:55.272221
332	47	\N	54	\N	2025-03-13 13:00:02.272221
333	47	\N	52	\N	2025-03-16 23:27:30.272221
334	47	46	\N	\N	2025-03-14 23:51:51.272221
335	48	\N	40	\N	2025-04-23 05:53:12.272221
336	48	62	\N	\N	2025-05-17 15:58:55.272221
337	48	\N	17	\N	2025-03-21 06:28:36.272221
338	48	67	\N	\N	2025-04-19 22:19:31.272221
339	48	45	\N	\N	2025-05-05 04:36:05.272221
340	48	65	\N	\N	2025-05-10 04:02:53.272221
341	49	54	\N	\N	2025-04-08 02:26:27.272221
342	49	21	\N	\N	2025-05-30 15:54:14.272221
343	49	\N	10	\N	2025-04-19 15:40:10.272221
344	49	58	\N	\N	2025-03-18 20:31:32.272221
345	49	75	\N	\N	2025-05-02 01:28:52.272221
346	49	26	\N	\N	2025-05-22 02:54:00.272221
347	49	50	\N	\N	2025-03-17 14:43:57.272221
348	49	18	\N	\N	2025-05-05 10:50:17.272221
349	49	61	\N	\N	2025-04-04 03:59:12.272221
350	50	49	\N	\N	2025-03-24 17:51:43.272221
351	50	\N	43	\N	2025-04-30 00:42:16.272221
352	50	\N	55	\N	2025-04-19 03:12:30.272221
353	52	22	\N	\N	2025-03-24 14:33:16.272221
354	52	18	\N	\N	2025-05-15 22:24:35.272221
355	52	73	\N	\N	2025-04-17 02:00:40.272221
356	53	60	\N	\N	2025-05-28 19:42:41.272221
357	53	50	\N	\N	2025-04-25 18:46:53.272221
358	53	83	\N	\N	2025-05-14 18:26:51.272221
359	53	76	\N	\N	2025-03-20 20:00:35.272221
360	53	46	\N	\N	2025-03-25 15:18:31.272221
361	53	34	\N	\N	2025-04-02 08:16:23.272221
362	53	20	\N	\N	2025-04-16 13:41:36.272221
363	53	\N	29	\N	2025-04-03 23:02:35.272221
364	53	41	\N	\N	2025-05-30 05:34:02.272221
365	53	73	\N	\N	2025-04-26 05:34:50.272221
366	53	\N	\N	7	2025-03-29 05:53:45.272221
367	53	35	\N	\N	2025-05-13 01:10:06.272221
368	53	23	\N	\N	2025-03-26 06:15:10.272221
369	53	47	\N	\N	2025-03-08 01:16:34.272221
370	54	60	\N	\N	2025-05-16 02:46:12.272221
371	54	\N	69	\N	2025-05-14 17:31:31.272221
372	1	82	\N	\N	2025-06-03 15:54:55.575414
373	1	29	\N	\N	2025-06-03 15:55:22.228285
\.


--
-- TOC entry 5003 (class 0 OID 16611)
-- Dependencies: 233
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message (id, sender_id, recipient_id, content, "timestamp", is_read) FROM stdin;
1	1	4	hello there!	2025-06-03 14:18:27.516	f
2	4	1	hey!! xx	2025-06-03 14:27:44.256	f
3	1	4	how are you ?	2025-06-03 14:28:34.712	f
4	4	1	fine and you xx	2025-06-03 14:28:53.09	f
5	1	4	so what's new ?	2025-06-03 14:34:01.683	f
6	4	1	nothing much.. just projects and exams	2025-06-03 14:34:48.929	f
7	1	4	so this is working	2025-06-03 14:35:21.304	f
8	4	1	well yes!	2025-06-03 14:35:27.081	f
9	1	4	anyways...	2025-06-03 14:47:57.156	f
10	4	2	hey :)	2025-06-03 14:49:05.706	f
11	5	12	Increase teach close want have.	2025-05-31 07:58:01.352114	t
12	6	46	Attack successful ready half cold trial knowledge. Something age however return like dinner key.	2025-05-27 21:21:01.352114	f
13	6	25	Course meet at important this pretty laugh. Know customer enter word its us open. Smile win picture business game recently.	2025-05-28 23:19:01.352114	f
14	6	47	Respond key any leg put establish. Part total see develop.	2025-05-30 20:10:01.352114	f
15	10	36	Far rich would real season agency while.	2025-06-02 20:03:01.352114	t
16	10	46	Catch south land begin value building. Recently entire do choose system crime.\nWe serve half most sense during. Deal reveal network watch step other.	2025-06-01 12:02:01.352114	t
17	10	18	Own you role picture two side knowledge. Same network identify food.\nMyself turn stuff task choose both. Civil main television including kitchen throughout that.	2025-06-02 17:55:01.352114	t
18	11	36	Lay last hour travel state effect under. Able business kind itself war state check.\nQuestion matter tell company. Listen threat nation. Play pick I movie expect.	2025-06-02 02:15:01.353125	f
19	11	38	Huge significant a production.	2025-05-28 10:05:01.353125	f
20	11	29	Smile gas trial husband. Discussion something he letter far production close design.	2025-05-28 09:01:01.353125	f
21	12	42	Decision ahead old how.	2025-05-30 09:47:01.353125	f
22	12	30	Role pattern beautiful certain. Spend dream himself bank.\nAnd school clear beyond. Drug hundred factor.	2025-06-01 04:39:01.353125	f
23	12	20	East notice on purpose. Challenge six lose game report. Such central such look human.\nArrive true method report. Project lot military special smile indeed.	2025-05-30 19:45:01.353125	f
24	13	46	Threat live size court public least his.	2025-06-02 15:18:01.353125	f
25	13	6	Mission meeting church not mother audience central. Sell ago compare good century.	2025-05-27 20:07:01.353125	t
26	13	6	Community themselves benefit learn. School population cover make cell our everybody fight. Three project third protect return week.	2025-05-29 11:11:01.353125	t
27	14	23	Could southern plan.	2025-06-02 22:16:01.353125	t
28	14	6	Call rest hot around once. Task dog somebody mind century summer wear. Program voice worker election good four.	2025-05-29 21:32:01.353125	t
29	15	10	Consumer Republican tax never despite teach. Couple player make campaign skin. Fund consider throughout dinner establish during cost.	2025-05-28 22:47:01.353125	f
30	15	31	Attack computer leg year window financial. Relate green accept stage gun bed understand. Center most animal. Increase improve pass front.	2025-06-02 22:51:01.353125	t
31	16	12	Popular bar provide if and her.	2025-06-01 03:21:01.353125	t
32	17	10	Game meeting analysis glass.\nHelp end just west page. Among tax well worker. Policy hour hold box growth response.	2025-05-29 16:15:01.353125	f
33	18	17	Respond space produce shake. Others why well yes.\nRealize measure evidence great. Benefit fact whatever available to expect rather.	2025-06-03 03:12:01.354126	t
34	18	23	Then change matter ever. Buy kind media.	2025-05-31 13:18:01.354126	t
35	19	43	Challenge nor letter land indeed. Thus best serious card prove hear response.	2025-05-30 16:57:01.354126	f
36	20	52	Push several model between.	2025-05-31 11:48:01.354126	f
37	20	48	Range this other hundred their operation. Thing rule dinner.\nClass but government land end. Possible great whose three factor fact prevent catch.	2025-05-31 02:29:01.354126	f
38	21	12	Cold shoulder say. Floor idea guy age play factor.	2025-05-28 07:07:01.354126	f
39	22	54	Training late teach yet get. Big purpose your car. Economic answer actually some large pretty.	2025-06-02 03:57:01.354126	f
40	23	10	Treatment that feel care send red. Certainly give cup book building me your market.	2025-05-31 17:38:01.354126	t
41	24	27	Voice goal blue program fish return sit.\nSet approach near recently interest. Chair everyone type machine. Star authority administration up remain.	2025-05-31 19:53:01.354126	t
42	26	9	Civil human second computer eight than. Economic support life couple hear.	2025-05-27 19:07:01.354126	t
43	26	44	Draw show race onto.	2025-06-01 12:02:01.354126	t
44	26	52	South common song nature born. Remember know someone like.	2025-05-31 10:28:01.354126	t
45	27	24	Care onto of address sort similar.	2025-06-02 13:21:01.354126	f
46	27	30	See again case. Page situation main if. Economic red leader property bit.\nUntil management brother purpose allow play. Particularly finish national.	2025-05-30 17:51:01.354126	f
47	27	26	Stock ten address list finish. Human worker over.\nWhom continue same relate. Spend card somebody half future. Town everybody end social job operation.	2025-06-02 02:26:01.354126	t
48	28	48	Alone party production simple meet. Right strong impact mention several.	2025-05-29 21:53:01.354126	f
49	28	44	Include dark well significant.	2025-05-28 21:16:01.354126	f
50	28	15	Statement century bed interview international buy whose. Worry box sell down.\nSeat father choose. Buy nor kitchen future out rule through ahead.	2025-05-28 02:02:01.355123	f
51	29	9	Heavy various purpose notice mother.	2025-06-01 08:13:01.355123	f
52	30	12	Hope wrong up term.	2025-06-01 00:57:01.355123	f
53	31	25	Cause behind wait state book seat. Beyond generation brother natural.\nAlready general reduce want. Service crime foot. Item operation wide few hot.	2025-05-28 07:51:01.355123	f
54	32	8	Investment candidate several way.	2025-05-29 05:42:01.355123	t
55	34	6	Term return while provide amount year. Land whose age difficult blue draw just.\nTable majority offer heavy edge accept difficult.	2025-06-01 22:46:01.355123	f
56	35	12	Again indeed your want attention what. Every particularly white cultural whatever.	2025-06-01 07:31:01.355626	f
57	35	14	Large share stay project. Become sense eight century. Economy away interview people.	2025-05-30 04:00:01.355626	f
58	35	10	Set see right fish like soldier imagine window. Interview true until. Notice blood environmental.	2025-06-02 12:27:01.355626	f
59	36	6	Election difficult go type stage.	2025-05-31 17:42:01.355626	t
60	36	38	Cell light money over yourself speech choose. Most number purpose forward position together measure cut.	2025-05-31 21:52:01.355626	t
61	38	42	Forget deep your director position.	2025-05-28 11:00:01.355626	t
62	39	19	Out along cup good. Else above huge behavior population present.	2025-05-30 00:53:01.355626	f
63	39	9	Fear network travel let card decision inside. Rather occur blue health. Big expert sense through new decision.	2025-05-28 20:49:01.355626	t
64	39	52	Fill husband summer draw. Design baby majority long court perform about trial. Rather in great respond walk account individual.	2025-06-02 16:03:01.355626	t
65	40	35	Because exist culture if college peace during. Laugh everyone various suggest least official eight. Resource minute lot suggest.	2025-05-27 23:47:01.355626	t
66	40	21	Positive citizen training.	2025-05-29 19:19:01.355626	f
67	40	17	Choose focus whose popular speak them contain develop. See TV consumer rule side.	2025-05-31 12:36:01.355626	f
68	41	26	Whole rule political across couple.	2025-05-30 03:40:01.35663	f
69	42	24	Reduce indeed century meeting. Order campaign someone performance collection win assume almost. Blue area cover.	2025-05-31 13:46:01.35663	t
70	42	7	City exist task computer maybe while admit. Realize pattern feeling world perhaps.\nFront father get early. List traditional forward necessary American would.	2025-06-02 17:38:01.35663	f
71	42	43	Set our southern gas game more. Talk big serve.\nStudent information represent. Eat send certain first according upon.	2025-05-28 21:01:01.35663	t
72	43	30	Professional best himself morning. Food year art. Lot energy yard across cause billion where.	2025-06-02 02:13:01.35663	f
73	43	13	Game half a.	2025-05-29 21:24:01.35663	f
74	43	34	Person eat change thing because offer language painting.	2025-05-28 09:08:01.35663	f
75	44	46	For newspaper become budget mouth table. Carry nice light window.	2025-05-30 03:11:01.35663	f
76	44	50	Down result spring general effort collection claim result.	2025-06-03 15:51:01.35663	f
77	44	46	Spend include office explain town by truth. Art show as form.	2025-05-28 09:10:01.35663	f
78	45	49	Win different reason hope nice. Even smile culture any.\nSouth impact expert determine. Great language boy similar.	2025-06-01 22:12:01.35663	t
79	46	10	Bag commercial according everyone.	2025-06-01 20:37:01.35663	f
80	46	25	Little realize go position.\nDoor want say main civil. Business world general style. A stock somebody point bank play require.	2025-06-03 15:59:01.35663	f
81	47	26	Thought professor night.	2025-05-31 00:24:01.35663	f
82	48	34	Fact yard ready test. Everybody pay all. Law ask today fill.	2025-05-28 17:36:01.35763	t
83	48	20	Blue we officer radio.	2025-05-31 06:49:01.35763	f
84	49	50	Owner stuff guess want.	2025-06-01 13:03:01.35763	t
85	50	35	Drive prevent save generation prove.\nFrom practice coach weight war take focus level. Talk middle decision.	2025-06-02 11:12:01.35763	f
86	50	43	Citizen important training live condition.	2025-05-29 09:12:01.35763	f
87	51	17	Employee firm threat your. Make among stock house miss. Anything store war either staff skin. Something such letter able media indicate feel.	2025-05-29 13:37:01.35763	t
88	51	21	Through join interesting feeling. Maybe really near while happen you. Police drive before door figure stuff key.	2025-06-01 03:10:01.35763	t
89	52	40	Popular best moment yard election city.	2025-06-02 09:41:01.35763	f
90	52	18	Free store difference security certainly time none wear. Pull past different alone ability find.	2025-05-30 04:04:01.35763	f
91	52	9	Grow true world apply. Write main leave myself American.	2025-05-28 09:33:01.35763	f
92	53	12	Mr view pattern catch three Mrs.	2025-05-28 14:03:01.35763	t
93	54	44	Never thus see service Republican close. Enough section actually.	2025-05-28 00:59:01.35763	f
94	54	40	Summer identify citizen participant. Draw change little sort heart condition himself. Customer eight available could daughter go.\nPrice night respond. Last one something.	2025-05-29 11:36:01.35763	f
\.


--
-- TOC entry 4996 (class 0 OID 16470)
-- Dependencies: 226
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name, description) FROM stdin;
1	user	Regular User
2	admin	Administrator
\.


--
-- TOC entry 4997 (class 0 OID 16478)
-- Dependencies: 227
-- Data for Name: roles_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_users (user_id, role_id) FROM stdin;
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
\.


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 228
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 72, true);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 223
-- Name: like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.like_id_seq', 373, true);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 232
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_id_seq', 94, true);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 220
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 84, true);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 225
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 2, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 230
-- Name: share_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.share_id_seq', 9, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 54, true);


-- Completed on 2025-06-03 18:02:34

--
-- PostgreSQL database dump complete
--

