--
-- PostgreSQL database dump
--

\restrict p5fUTpL5uxlhKyqg2epmyfHVkftACSfPUelo7Xacq371KHvmdNKa60stYmyArg8

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-05 11:28:55

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 17358)
-- Name: Communities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Communities" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    member_count integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."Communities" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17357)
-- Name: Communities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Communities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Communities_id_seq" OWNER TO postgres;

--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 224
-- Name: Communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Communities_id_seq" OWNED BY public."Communities".id;


--
-- TOC entry 227 (class 1259 OID 17380)
-- Name: CommunityMembers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CommunityMembers" (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."CommunityMembers" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17371)
-- Name: CommunityTags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CommunityTags" (
    community_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."CommunityTags" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17467)
-- Name: EventParticipants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EventParticipants" (
    event_id integer NOT NULL,
    user_id integer NOT NULL,
    joined_at timestamp without time zone DEFAULT now(),
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."EventParticipants" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17453)
-- Name: Events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Events" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    event_date timestamp without time zone NOT NULL,
    location character varying(255) NOT NULL,
    created_by integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."Events" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17452)
-- Name: Events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Events_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Events_id_seq" OWNER TO postgres;

--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 236
-- Name: Events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Events_id_seq" OWNED BY public."Events".id;


--
-- TOC entry 235 (class 1259 OID 17437)
-- Name: Messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Messages" (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    receiver_id integer NOT NULL,
    content text NOT NULL,
    is_read boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."Messages" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17436)
-- Name: Messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Messages_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Messages_id_seq" OWNER TO postgres;

--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 234
-- Name: Messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Messages_id_seq" OWNED BY public."Messages".id;


--
-- TOC entry 240 (class 1259 OID 17477)
-- Name: Notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Notifications" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    type character varying(50) NOT NULL,
    source_user_id integer,
    source_id integer,
    content text NOT NULL,
    is_read boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."Notifications" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17476)
-- Name: Notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Notifications_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Notifications_id_seq" OWNER TO postgres;

--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 239
-- Name: Notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Notifications_id_seq" OWNED BY public."Notifications".id;


--
-- TOC entry 233 (class 1259 OID 17422)
-- Name: PostComments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PostComments" (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."PostComments" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17421)
-- Name: PostComments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PostComments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PostComments_id_seq" OWNER TO postgres;

--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 232
-- Name: PostComments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PostComments_id_seq" OWNED BY public."PostComments".id;


--
-- TOC entry 231 (class 1259 OID 17412)
-- Name: PostLikes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PostLikes" (
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."PostLikes" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17403)
-- Name: PostTags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PostTags" (
    post_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."PostTags" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17390)
-- Name: Posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Posts" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    image_url text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."Posts" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17389)
-- Name: Posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Posts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Posts_id_seq" OWNER TO postgres;

--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 228
-- Name: Posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Posts_id_seq" OWNED BY public."Posts".id;


--
-- TOC entry 222 (class 1259 OID 17336)
-- Name: Tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tags" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    color_code character varying(7),
    created_at timestamp without time zone DEFAULT now(),
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."Tags" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17335)
-- Name: Tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Tags_id_seq" OWNER TO postgres;

--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 221
-- Name: Tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tags_id_seq" OWNED BY public."Tags".id;


--
-- TOC entry 223 (class 1259 OID 17348)
-- Name: UserTags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserTags" (
    user_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."UserTags" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17320)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    full_name character varying(255) NOT NULL,
    location character varying(255),
    bio text,
    profile_picture_url text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17319)
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_id_seq" OWNER TO postgres;

--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 219
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- TOC entry 4923 (class 2604 OID 17361)
-- Name: Communities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Communities" ALTER COLUMN id SET DEFAULT nextval('public."Communities_id_seq"'::regclass);


--
-- TOC entry 4945 (class 2604 OID 17456)
-- Name: Events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Events" ALTER COLUMN id SET DEFAULT nextval('public."Events_id_seq"'::regclass);


--
-- TOC entry 4941 (class 2604 OID 17440)
-- Name: Messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Messages" ALTER COLUMN id SET DEFAULT nextval('public."Messages_id_seq"'::regclass);


--
-- TOC entry 4950 (class 2604 OID 17480)
-- Name: Notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notifications" ALTER COLUMN id SET DEFAULT nextval('public."Notifications_id_seq"'::regclass);


--
-- TOC entry 4938 (class 2604 OID 17425)
-- Name: PostComments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PostComments" ALTER COLUMN id SET DEFAULT nextval('public."PostComments_id_seq"'::regclass);


--
-- TOC entry 4931 (class 2604 OID 17393)
-- Name: Posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Posts" ALTER COLUMN id SET DEFAULT nextval('public."Posts_id_seq"'::regclass);


--
-- TOC entry 4918 (class 2604 OID 17339)
-- Name: Tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tags" ALTER COLUMN id SET DEFAULT nextval('public."Tags_id_seq"'::regclass);


--
-- TOC entry 4915 (class 2604 OID 17323)
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- TOC entry 5159 (class 0 OID 17358)
-- Dependencies: 225
-- Data for Name: Communities; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5161 (class 0 OID 17380)
-- Dependencies: 227
-- Data for Name: CommunityMembers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5160 (class 0 OID 17371)
-- Dependencies: 226
-- Data for Name: CommunityTags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5172 (class 0 OID 17467)
-- Dependencies: 238
-- Data for Name: EventParticipants; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5171 (class 0 OID 17453)
-- Dependencies: 237
-- Data for Name: Events; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5169 (class 0 OID 17437)
-- Dependencies: 235
-- Data for Name: Messages; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5174 (class 0 OID 17477)
-- Dependencies: 240
-- Data for Name: Notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5167 (class 0 OID 17422)
-- Dependencies: 233
-- Data for Name: PostComments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5165 (class 0 OID 17412)
-- Dependencies: 231
-- Data for Name: PostLikes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5164 (class 0 OID 17403)
-- Dependencies: 230
-- Data for Name: PostTags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5163 (class 0 OID 17390)
-- Dependencies: 229
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5156 (class 0 OID 17336)
-- Dependencies: 222
-- Data for Name: Tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5157 (class 0 OID 17348)
-- Dependencies: 223
-- Data for Name: UserTags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5154 (class 0 OID 17320)
-- Dependencies: 220
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 224
-- Name: Communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Communities_id_seq"', 1, false);


--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 236
-- Name: Events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Events_id_seq"', 1, false);


--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 234
-- Name: Messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Messages_id_seq"', 1, false);


--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 239
-- Name: Notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Notifications_id_seq"', 1, false);


--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 232
-- Name: PostComments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PostComments_id_seq"', 1, false);


--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 228
-- Name: Posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Posts_id_seq"', 1, false);


--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 221
-- Name: Tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tags_id_seq"', 1, false);


--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 219
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 1, false);


--
-- TOC entry 4965 (class 2606 OID 17370)
-- Name: Communities Communities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Communities"
    ADD CONSTRAINT "Communities_pkey" PRIMARY KEY (id);


--
-- TOC entry 4969 (class 2606 OID 17388)
-- Name: CommunityMembers CommunityMembers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CommunityMembers"
    ADD CONSTRAINT "CommunityMembers_pkey" PRIMARY KEY (community_id, user_id);


--
-- TOC entry 4967 (class 2606 OID 17379)
-- Name: CommunityTags CommunityTags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CommunityTags"
    ADD CONSTRAINT "CommunityTags_pkey" PRIMARY KEY (community_id, tag_id);


--
-- TOC entry 4983 (class 2606 OID 17475)
-- Name: EventParticipants EventParticipants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EventParticipants"
    ADD CONSTRAINT "EventParticipants_pkey" PRIMARY KEY (event_id, user_id);


--
-- TOC entry 4981 (class 2606 OID 17466)
-- Name: Events Events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Events"
    ADD CONSTRAINT "Events_pkey" PRIMARY KEY (id);


--
-- TOC entry 4979 (class 2606 OID 17451)
-- Name: Messages Messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_pkey" PRIMARY KEY (id);


--
-- TOC entry 4985 (class 2606 OID 17491)
-- Name: Notifications Notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notifications"
    ADD CONSTRAINT "Notifications_pkey" PRIMARY KEY (id);


--
-- TOC entry 4977 (class 2606 OID 17435)
-- Name: PostComments PostComments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PostComments"
    ADD CONSTRAINT "PostComments_pkey" PRIMARY KEY (id);


--
-- TOC entry 4975 (class 2606 OID 17420)
-- Name: PostLikes PostLikes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PostLikes"
    ADD CONSTRAINT "PostLikes_pkey" PRIMARY KEY (post_id, user_id);


--
-- TOC entry 4973 (class 2606 OID 17411)
-- Name: PostTags PostTags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PostTags"
    ADD CONSTRAINT "PostTags_pkey" PRIMARY KEY (post_id, tag_id);


--
-- TOC entry 4971 (class 2606 OID 17402)
-- Name: Posts Posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "Posts_pkey" PRIMARY KEY (id);


--
-- TOC entry 4959 (class 2606 OID 17347)
-- Name: Tags Tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_name_key" UNIQUE (name);


--
-- TOC entry 4961 (class 2606 OID 17345)
-- Name: Tags Tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (id);


--
-- TOC entry 4963 (class 2606 OID 17356)
-- Name: UserTags UserTags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserTags"
    ADD CONSTRAINT "UserTags_pkey" PRIMARY KEY (user_id, tag_id);


--
-- TOC entry 4955 (class 2606 OID 17332)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- TOC entry 4957 (class 2606 OID 17334)
-- Name: Users Users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);


--
-- TOC entry 4990 (class 2606 OID 17512)
-- Name: CommunityMembers CommunityMembers_community_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CommunityMembers"
    ADD CONSTRAINT "CommunityMembers_community_id_fkey" FOREIGN KEY (community_id) REFERENCES public."Communities"(id);


--
-- TOC entry 4991 (class 2606 OID 17517)
-- Name: CommunityMembers CommunityMembers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CommunityMembers"
    ADD CONSTRAINT "CommunityMembers_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id);


--
-- TOC entry 4988 (class 2606 OID 17502)
-- Name: CommunityTags CommunityTags_community_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CommunityTags"
    ADD CONSTRAINT "CommunityTags_community_id_fkey" FOREIGN KEY (community_id) REFERENCES public."Communities"(id);


--
-- TOC entry 4989 (class 2606 OID 17507)
-- Name: CommunityTags CommunityTags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CommunityTags"
    ADD CONSTRAINT "CommunityTags_tag_id_fkey" FOREIGN KEY (tag_id) REFERENCES public."Tags"(id);


--
-- TOC entry 5002 (class 2606 OID 17572)
-- Name: EventParticipants EventParticipants_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EventParticipants"
    ADD CONSTRAINT "EventParticipants_event_id_fkey" FOREIGN KEY (event_id) REFERENCES public."Events"(id);


--
-- TOC entry 5003 (class 2606 OID 17577)
-- Name: EventParticipants EventParticipants_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EventParticipants"
    ADD CONSTRAINT "EventParticipants_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id);


--
-- TOC entry 5001 (class 2606 OID 17567)
-- Name: Events Events_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Events"
    ADD CONSTRAINT "Events_created_by_fkey" FOREIGN KEY (created_by) REFERENCES public."Users"(id);


--
-- TOC entry 4999 (class 2606 OID 17562)
-- Name: Messages Messages_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_receiver_id_fkey" FOREIGN KEY (receiver_id) REFERENCES public."Users"(id);


--
-- TOC entry 5000 (class 2606 OID 17557)
-- Name: Messages Messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_sender_id_fkey" FOREIGN KEY (sender_id) REFERENCES public."Users"(id);


--
-- TOC entry 5004 (class 2606 OID 17587)
-- Name: Notifications Notifications_source_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notifications"
    ADD CONSTRAINT "Notifications_source_user_id_fkey" FOREIGN KEY (source_user_id) REFERENCES public."Users"(id);


--
-- TOC entry 5005 (class 2606 OID 17582)
-- Name: Notifications Notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notifications"
    ADD CONSTRAINT "Notifications_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id);


--
-- TOC entry 4997 (class 2606 OID 17547)
-- Name: PostComments PostComments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PostComments"
    ADD CONSTRAINT "PostComments_post_id_fkey" FOREIGN KEY (post_id) REFERENCES public."Posts"(id);


--
-- TOC entry 4998 (class 2606 OID 17552)
-- Name: PostComments PostComments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PostComments"
    ADD CONSTRAINT "PostComments_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id);


--
-- TOC entry 4995 (class 2606 OID 17537)
-- Name: PostLikes PostLikes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PostLikes"
    ADD CONSTRAINT "PostLikes_post_id_fkey" FOREIGN KEY (post_id) REFERENCES public."Posts"(id);


--
-- TOC entry 4996 (class 2606 OID 17542)
-- Name: PostLikes PostLikes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PostLikes"
    ADD CONSTRAINT "PostLikes_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id);


--
-- TOC entry 4993 (class 2606 OID 17527)
-- Name: PostTags PostTags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PostTags"
    ADD CONSTRAINT "PostTags_post_id_fkey" FOREIGN KEY (post_id) REFERENCES public."Posts"(id);


--
-- TOC entry 4994 (class 2606 OID 17532)
-- Name: PostTags PostTags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PostTags"
    ADD CONSTRAINT "PostTags_tag_id_fkey" FOREIGN KEY (tag_id) REFERENCES public."Tags"(id);


--
-- TOC entry 4992 (class 2606 OID 17522)
-- Name: Posts Posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "Posts_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id);


--
-- TOC entry 4986 (class 2606 OID 17497)
-- Name: UserTags UserTags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserTags"
    ADD CONSTRAINT "UserTags_tag_id_fkey" FOREIGN KEY (tag_id) REFERENCES public."Tags"(id);


--
-- TOC entry 4987 (class 2606 OID 17492)
-- Name: UserTags UserTags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserTags"
    ADD CONSTRAINT "UserTags_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id);


-- Completed on 2026-06-05 11:28:55

--
-- PostgreSQL database dump complete
--

\unrestrict p5fUTpL5uxlhKyqg2epmyfHVkftACSfPUelo7Xacq371KHvmdNKa60stYmyArg8

