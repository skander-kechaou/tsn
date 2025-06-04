--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-03 16:44:35

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
-- TOC entry 4985 (class 0 OID 16394)
-- Dependencies: 217
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
2a5d580f5ccf
\.


--
-- TOC entry 4987 (class 0 OID 16400)
-- Dependencies: 219
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, is_active, username, email, password, phone, date_birth, gender, fs_uniquifier, confirmed_at, profile_pic, first_name, last_name, biography, location, date_joined) FROM stdin;
1	t	skan2308	skander.kechaou.e@gmail.com	$argon2id$v=19$m=65536,t=3,p=4$i1HKGeNc6x3DeA8hpFTqfQ$r+wa6/zPqRPFzHqPpK6xjfMu41RbXJK87bkS5U+og1Q	+33758781503	2002-08-23	MALE	e2b867f8982c4018a397b0ea5c860153	\N	images/profile_pics/257f69bc52cda8a3.jpg	Skander	Kechaou	mi polyglotte à l'international, mi geek sous insomnie	Paris	2025-05-20
2	t	test123	test@contact.net	$argon2id$v=19$m=65536,t=3,p=4$3HuP0bo3xjjnnNO6N8Y45w$TGgqP0NNDYa00tTiqZeQl7oGJzm8fsfUBoM3bYz465A	+21654706621	1977-01-29	PREFER_NOT_TO_SAY	289fef23e1994336a8c8bfd00aedde27	\N	images/profile_pics/8b0a34446da040a7.jpg	Test	Test	I'm just a test unfortunately	Somewhere over the rainbow	2025-05-22
3	t	skander	kechaou.skander@gmail.com	gbX1jVxUbMmrsMDey6QX6d_HRbyso5bM	+21621635020	2002-08-23	MALE	32cf8738-c497-4839-a7ef-18207675370d	2025-05-23 15:56:24.660326	images/default.jpg	John	Doe	I'm just John Doe :)	Unknown	2025-05-23
4	t	deep	deeplearning050@gmail.com	MowWoQUFPE3uAb8MLJWPFWXT0W6p62Ok	+33758781504	1900-01-01	PREFER_NOT_TO_SAY	fe698b91-4b64-4cfa-9dad-d25c488a6b71	2025-05-24 12:27:52.983338	images/profile_pics/f775c4d6a1ee2888.jpg	deep	learning	I'm just here for testing purposes :'(	The Cloud	2025-05-24
\.


--
-- TOC entry 4989 (class 0 OID 16422)
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
\.


--
-- TOC entry 4999 (class 0 OID 16565)
-- Dependencies: 231
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.share (id, user_id, post_id, content, "timestamp") FROM stdin;
1	1	12	It's working, thankfully!	2025-05-28 14:41:20.026705
2	1	9	\N	2025-05-28 15:40:16.714135
3	4	14	wow!	2025-06-03 12:59:32.866636
\.


--
-- TOC entry 4997 (class 0 OID 16546)
-- Dependencies: 229
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, user_id, post_id, content, "timestamp", share_id) FROM stdin;
1	1	13	hey there :)	2025-05-26 17:18:43.9477	\N
2	1	14	TAKE ME BACK!!!	2025-05-26 17:25:48.564477	\N
3	1	14	mamz	2025-05-26 17:32:15.610815	\N
4	1	14	hello!	2025-05-27 12:06:56.197899	\N
\.


--
-- TOC entry 4990 (class 0 OID 16435)
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
\.


--
-- TOC entry 4992 (class 0 OID 16451)
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
\.


--
-- TOC entry 5001 (class 0 OID 16611)
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
\.


--
-- TOC entry 4994 (class 0 OID 16470)
-- Dependencies: 226
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name, description) FROM stdin;
\.


--
-- TOC entry 4995 (class 0 OID 16478)
-- Dependencies: 227
-- Data for Name: roles_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_users (user_id, role_id) FROM stdin;
\.


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 228
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 4, true);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 223
-- Name: like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.like_id_seq', 32, true);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 232
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_id_seq', 10, true);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 220
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 14, true);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 225
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 230
-- Name: share_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.share_id_seq', 3, true);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


-- Completed on 2025-06-03 16:44:35

--
-- PostgreSQL database dump complete
--

