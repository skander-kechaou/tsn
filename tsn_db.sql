--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-05-27 14:17:42

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
-- TOC entry 884 (class 1247 OID 16516)
-- Name: genderenum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.genderenum AS ENUM (
    'MALE',
    'FEMALE',
    'OTHER',
    'PREFER_NOT_TO_SAY'
);


ALTER TYPE public.genderenum OWNER TO postgres;

--
-- TOC entry 866 (class 1247 OID 16414)
-- Name: visibilityenum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.visibilityenum AS ENUM (
    'PUBLIC',
    'FRIENDS',
    'PRIVATE'
);


ALTER TYPE public.visibilityenum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16394)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16546)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    content text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16545)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_id_seq OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 228
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- TOC entry 222 (class 1259 OID 16435)
-- Name: friendships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendships (
    user_id integer NOT NULL,
    friend_id integer NOT NULL
);


ALTER TABLE public.friendships OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16451)
-- Name: like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."like" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer,
    comment_id integer,
    share_id integer,
    "timestamp" timestamp without time zone
);


ALTER TABLE public."like" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16450)
-- Name: like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.like_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.like_id_seq OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 223
-- Name: like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.like_id_seq OWNED BY public."like".id;


--
-- TOC entry 221 (class 1259 OID 16422)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    visibility public.visibilityenum NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    media character varying(255)
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16421)
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_id_seq OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 220
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- TOC entry 226 (class 1259 OID 16470)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(80),
    description character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16469)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 225
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 227 (class 1259 OID 16478)
-- Name: roles_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_users (
    user_id integer,
    role_id integer
);


ALTER TABLE public.roles_users OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16565)
-- Name: share; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    content text,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.share OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16564)
-- Name: share_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.share_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.share_id_seq OWNER TO postgres;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 230
-- Name: share_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.share_id_seq OWNED BY public.share.id;


--
-- TOC entry 219 (class 1259 OID 16400)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    username character varying(64) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(64) NOT NULL,
    date_birth date NOT NULL,
    gender public.genderenum NOT NULL,
    fs_uniquifier character varying(255) NOT NULL,
    confirmed_at timestamp without time zone,
    profile_pic character varying(255) NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    biography text,
    location character varying(100),
    date_joined date NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16399)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 4790 (class 2604 OID 16549)
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 16454)
-- Name: like id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like" ALTER COLUMN id SET DEFAULT nextval('public.like_id_seq'::regclass);


--
-- TOC entry 4787 (class 2604 OID 16425)
-- Name: post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 16473)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16568)
-- Name: share id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share ALTER COLUMN id SET DEFAULT nextval('public.share_id_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 16403)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 4982 (class 0 OID 16394)
-- Dependencies: 217
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
ec924eaede78
\.


--
-- TOC entry 4994 (class 0 OID 16546)
-- Dependencies: 229
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, user_id, post_id, content, "timestamp") FROM stdin;
1	1	13	hey there :)	2025-05-26 17:18:43.9477
2	1	14	TAKE ME BACK!!!	2025-05-26 17:25:48.564477
3	1	14	mamz	2025-05-26 17:32:15.610815
4	1	14	hello!	2025-05-27 12:06:56.197899
\.


--
-- TOC entry 4987 (class 0 OID 16435)
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
\.


--
-- TOC entry 4989 (class 0 OID 16451)
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
25	1	12	\N	\N	2025-05-26 14:18:36.396669
26	1	14	\N	\N	2025-05-26 16:57:58.049762
27	1	13	\N	\N	2025-05-26 17:20:37.209816
28	1	2	\N	\N	2025-05-26 17:26:06.338584
\.


--
-- TOC entry 4986 (class 0 OID 16422)
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
-- TOC entry 4991 (class 0 OID 16470)
-- Dependencies: 226
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name, description) FROM stdin;
\.


--
-- TOC entry 4992 (class 0 OID 16478)
-- Dependencies: 227
-- Data for Name: roles_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_users (user_id, role_id) FROM stdin;
\.


--
-- TOC entry 4996 (class 0 OID 16565)
-- Dependencies: 231
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.share (id, user_id, post_id, content, "timestamp") FROM stdin;
\.


--
-- TOC entry 4984 (class 0 OID 16400)
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
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 228
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 4, true);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 223
-- Name: like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.like_id_seq', 28, true);


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

SELECT pg_catalog.setval('public.share_id_seq', 1, false);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- TOC entry 4793 (class 2606 OID 16398)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4821 (class 2606 OID 16553)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 4807 (class 2606 OID 16439)
-- Name: friendships friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (user_id, friend_id);


--
-- TOC entry 4809 (class 2606 OID 16456)
-- Name: like like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_pkey PRIMARY KEY (id);


--
-- TOC entry 4805 (class 2606 OID 16429)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- TOC entry 4817 (class 2606 OID 16477)
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- TOC entry 4819 (class 2606 OID 16475)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 4823 (class 2606 OID 16572)
-- Name: share share_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_pkey PRIMARY KEY (id);


--
-- TOC entry 4811 (class 2606 OID 16584)
-- Name: like uq_user_comment_like; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT uq_user_comment_like UNIQUE (user_id, comment_id);


--
-- TOC entry 4813 (class 2606 OID 16586)
-- Name: like uq_user_post_like; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT uq_user_post_like UNIQUE (user_id, post_id);


--
-- TOC entry 4815 (class 2606 OID 16588)
-- Name: like uq_user_share_like; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT uq_user_share_like UNIQUE (user_id, share_id);


--
-- TOC entry 4795 (class 2606 OID 16410)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 4797 (class 2606 OID 16492)
-- Name: user user_fs_uniquifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_fs_uniquifier_key UNIQUE (fs_uniquifier);


--
-- TOC entry 4799 (class 2606 OID 16494)
-- Name: user user_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_key UNIQUE (phone);


--
-- TOC entry 4801 (class 2606 OID 16408)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 4803 (class 2606 OID 16412)
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- TOC entry 4833 (class 2606 OID 16554)
-- Name: comment comment_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id) ON DELETE CASCADE;


--
-- TOC entry 4834 (class 2606 OID 16559)
-- Name: comment comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 4825 (class 2606 OID 16440)
-- Name: friendships friendships_friend_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_friend_id_fkey FOREIGN KEY (friend_id) REFERENCES public."user"(id);


--
-- TOC entry 4826 (class 2606 OID 16445)
-- Name: friendships friendships_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4827 (class 2606 OID 16589)
-- Name: like like_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(id) ON DELETE CASCADE;


--
-- TOC entry 4828 (class 2606 OID 16599)
-- Name: like like_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id) ON DELETE CASCADE;


--
-- TOC entry 4829 (class 2606 OID 16594)
-- Name: like like_share_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_share_id_fkey FOREIGN KEY (share_id) REFERENCES public.share(id) ON DELETE CASCADE;


--
-- TOC entry 4830 (class 2606 OID 16604)
-- Name: like like_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 4824 (class 2606 OID 16430)
-- Name: post post_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4831 (class 2606 OID 16481)
-- Name: roles_users roles_users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_users
    ADD CONSTRAINT roles_users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- TOC entry 4832 (class 2606 OID 16486)
-- Name: roles_users roles_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_users
    ADD CONSTRAINT roles_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4835 (class 2606 OID 16573)
-- Name: share share_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id) ON DELETE CASCADE;


--
-- TOC entry 4836 (class 2606 OID 16578)
-- Name: share share_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


-- Completed on 2025-05-27 14:17:42

--
-- PostgreSQL database dump complete
--

