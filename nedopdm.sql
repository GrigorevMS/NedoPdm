--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-10-27 09:56:58

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
-- TOC entry 221 (class 1259 OID 41015)
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id bigint NOT NULL,
    sql_text character varying,
    "time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 41014)
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO postgres;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 220
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- TOC entry 217 (class 1259 OID 40987)
-- Name: parts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parts (
    id bigint NOT NULL,
    description character varying NOT NULL,
    name character varying,
    parents bigint[],
    text character varying,
    count bigint
);


ALTER TABLE public.parts OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 40986)
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parts_id_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 216
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parts_id_seq OWNED BY public.parts.id;


--
-- TOC entry 219 (class 1259 OID 41005)
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    executor bigint NOT NULL,
    client bigint NOT NULL,
    text character varying NOT NULL,
    target bigint,
    count bigint,
    status character varying NOT NULL,
    "time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    start_time timestamp without time zone,
    finish_time timestamp without time zone
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 41004)
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 218
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- TOC entry 215 (class 1259 OID 40967)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    role character varying NOT NULL,
    name character varying,
    surname character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 40966)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3192 (class 2604 OID 41018)
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 40990)
-- Name: parts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts ALTER COLUMN id SET DEFAULT nextval('public.parts_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 41008)
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 40970)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3351 (class 0 OID 41015)
-- Dependencies: 221
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logs (id, sql_text, "time") VALUES (1, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 12:39:48.15997');
INSERT INTO public.logs (id, sql_text, "time") VALUES (2, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 12:39:48.177717');
INSERT INTO public.logs (id, sql_text, "time") VALUES (3, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 12:39:48.198513');
INSERT INTO public.logs (id, sql_text, "time") VALUES (4, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 12:39:48.199467');
INSERT INTO public.logs (id, sql_text, "time") VALUES (5, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 12:39:48.200251');
INSERT INTO public.logs (id, sql_text, "time") VALUES (6, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 12:39:48.202181');
INSERT INTO public.logs (id, sql_text, "time") VALUES (7, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 12:39:48.203783');
INSERT INTO public.logs (id, sql_text, "time") VALUES (8, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 12:39:48.212022');
INSERT INTO public.logs (id, sql_text, "time") VALUES (9, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 12:39:48.212857');
INSERT INTO public.logs (id, sql_text, "time") VALUES (10, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 12:40:02.777113');
INSERT INTO public.logs (id, sql_text, "time") VALUES (11, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 12:40:02.784974');
INSERT INTO public.logs (id, sql_text, "time") VALUES (12, 'SELECT * FROM parts;', '2023-10-19 12:40:02.785775');
INSERT INTO public.logs (id, sql_text, "time") VALUES (13, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 12:40:31.214387');
INSERT INTO public.logs (id, sql_text, "time") VALUES (14, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 12:40:31.222613');
INSERT INTO public.logs (id, sql_text, "time") VALUES (15, 'INSERT INTO parts (description, name, parents, text, count) VALUES (''BF(3)'', ''Клапанная группа 3 флигеля'', null, ''Udbebdjjedbxh'', 5);', '2023-10-19 12:40:31.223593');
INSERT INTO public.logs (id, sql_text, "time") VALUES (16, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 12:40:31.232543');
INSERT INTO public.logs (id, sql_text, "time") VALUES (17, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 12:40:31.233388');
INSERT INTO public.logs (id, sql_text, "time") VALUES (18, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 12:40:31.234104');
INSERT INTO public.logs (id, sql_text, "time") VALUES (19, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 12:40:31.234833');
INSERT INTO public.logs (id, sql_text, "time") VALUES (20, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 12:40:31.235485');
INSERT INTO public.logs (id, sql_text, "time") VALUES (21, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 12:40:31.236191');
INSERT INTO public.logs (id, sql_text, "time") VALUES (22, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 12:40:31.236839');
INSERT INTO public.logs (id, sql_text, "time") VALUES (23, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 12:40:31.237469');
INSERT INTO public.logs (id, sql_text, "time") VALUES (24, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 12:40:33.44914');
INSERT INTO public.logs (id, sql_text, "time") VALUES (25, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 12:40:33.457351');
INSERT INTO public.logs (id, sql_text, "time") VALUES (26, 'SELECT * FROM parts WHERE id=20;', '2023-10-19 12:40:33.458361');
INSERT INTO public.logs (id, sql_text, "time") VALUES (27, 'SELECT * FROM parts WHERE id=20;', '2023-10-19 12:40:33.45913');
INSERT INTO public.logs (id, sql_text, "time") VALUES (28, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 12:40:34.928945');
INSERT INTO public.logs (id, sql_text, "time") VALUES (29, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 12:40:34.937218');
INSERT INTO public.logs (id, sql_text, "time") VALUES (30, 'SELECT * FROM parts;', '2023-10-19 12:40:34.938193');
INSERT INTO public.logs (id, sql_text, "time") VALUES (31, 'SELECT * FROM parts WHERE id=20;', '2023-10-19 12:40:34.939209');
INSERT INTO public.logs (id, sql_text, "time") VALUES (32, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 12:40:40.276728');
INSERT INTO public.logs (id, sql_text, "time") VALUES (33, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 12:40:40.284603');
INSERT INTO public.logs (id, sql_text, "time") VALUES (34, 'UPDATE parts SET (description, name, parents, text, count) = (''BF(3)'', ''Клапанная группа 3 флигеля'', ''{15}'', ''Udbebdjjedbxh'', 5) WHERE id=20;', '2023-10-19 12:40:40.28551');
INSERT INTO public.logs (id, sql_text, "time") VALUES (35, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 12:40:40.299223');
INSERT INTO public.logs (id, sql_text, "time") VALUES (36, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 12:40:40.300072');
INSERT INTO public.logs (id, sql_text, "time") VALUES (37, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 12:40:40.300776');
INSERT INTO public.logs (id, sql_text, "time") VALUES (38, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 12:40:40.301963');
INSERT INTO public.logs (id, sql_text, "time") VALUES (39, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 12:40:40.302618');
INSERT INTO public.logs (id, sql_text, "time") VALUES (40, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 12:40:40.303313');
INSERT INTO public.logs (id, sql_text, "time") VALUES (41, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 12:40:40.303934');
INSERT INTO public.logs (id, sql_text, "time") VALUES (42, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 12:40:40.304532');
INSERT INTO public.logs (id, sql_text, "time") VALUES (43, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:10:51.486337');
INSERT INTO public.logs (id, sql_text, "time") VALUES (44, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:10:51.531493');
INSERT INTO public.logs (id, sql_text, "time") VALUES (45, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:10:51.545584');
INSERT INTO public.logs (id, sql_text, "time") VALUES (46, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:10:51.547113');
INSERT INTO public.logs (id, sql_text, "time") VALUES (47, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:10:51.54851');
INSERT INTO public.logs (id, sql_text, "time") VALUES (48, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:10:51.55526');
INSERT INTO public.logs (id, sql_text, "time") VALUES (49, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:10:51.558225');
INSERT INTO public.logs (id, sql_text, "time") VALUES (50, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:10:51.569898');
INSERT INTO public.logs (id, sql_text, "time") VALUES (51, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:10:51.570834');
INSERT INTO public.logs (id, sql_text, "time") VALUES (52, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:10:51.571614');
INSERT INTO public.logs (id, sql_text, "time") VALUES (53, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:10:56.740511');
INSERT INTO public.logs (id, sql_text, "time") VALUES (54, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:10:56.741721');
INSERT INTO public.logs (id, sql_text, "time") VALUES (55, 'SELECT * FROM tasks WHERE executor=1 AND status=''finished''  ORDER BY time;', '2023-10-19 15:10:56.74308');
INSERT INTO public.logs (id, sql_text, "time") VALUES (56, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:10:56.745333');
INSERT INTO public.logs (id, sql_text, "time") VALUES (57, 'SELECT * FROM users WHERE id=2', '2023-10-19 15:10:56.748122');
INSERT INTO public.logs (id, sql_text, "time") VALUES (58, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:10:56.749564');
INSERT INTO public.logs (id, sql_text, "time") VALUES (59, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:10:56.750967');
INSERT INTO public.logs (id, sql_text, "time") VALUES (60, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:11:18.45311');
INSERT INTO public.logs (id, sql_text, "time") VALUES (61, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:11:18.461392');
INSERT INTO public.logs (id, sql_text, "time") VALUES (62, 'SELECT * FROM tasks WHERE executor=1 AND status=''finished''  ORDER BY time;', '2023-10-19 15:11:18.46224');
INSERT INTO public.logs (id, sql_text, "time") VALUES (63, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:11:18.4645');
INSERT INTO public.logs (id, sql_text, "time") VALUES (64, 'SELECT * FROM users WHERE id=2', '2023-10-19 15:11:18.465844');
INSERT INTO public.logs (id, sql_text, "time") VALUES (65, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:11:18.467153');
INSERT INTO public.logs (id, sql_text, "time") VALUES (66, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:11:18.468339');
INSERT INTO public.logs (id, sql_text, "time") VALUES (67, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:11:24.667618');
INSERT INTO public.logs (id, sql_text, "time") VALUES (68, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:11:24.668641');
INSERT INTO public.logs (id, sql_text, "time") VALUES (69, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:11:24.689362');
INSERT INTO public.logs (id, sql_text, "time") VALUES (70, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:11:24.69049');
INSERT INTO public.logs (id, sql_text, "time") VALUES (71, 'SELECT * FROM tasks WHERE id=2 ORDER BY time;', '2023-10-19 15:11:24.691763');
INSERT INTO public.logs (id, sql_text, "time") VALUES (72, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:11:24.693129');
INSERT INTO public.logs (id, sql_text, "time") VALUES (73, 'SELECT * FROM users WHERE id=2', '2023-10-19 15:11:24.69392');
INSERT INTO public.logs (id, sql_text, "time") VALUES (74, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:11:50.485803');
INSERT INTO public.logs (id, sql_text, "time") VALUES (75, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:11:50.487797');
INSERT INTO public.logs (id, sql_text, "time") VALUES (76, 'SELECT * FROM tasks WHERE id=2 ORDER BY time;', '2023-10-19 15:11:50.489283');
INSERT INTO public.logs (id, sql_text, "time") VALUES (77, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:11:50.490009');
INSERT INTO public.logs (id, sql_text, "time") VALUES (78, 'SELECT * FROM users WHERE id=2', '2023-10-19 15:11:50.491056');
INSERT INTO public.logs (id, sql_text, "time") VALUES (79, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:11:50.500554');
INSERT INTO public.logs (id, sql_text, "time") VALUES (80, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:11:50.501425');
INSERT INTO public.logs (id, sql_text, "time") VALUES (81, 'SELECT * FROM tasks WHERE id=2 ORDER BY time;', '2023-10-19 15:11:50.502627');
INSERT INTO public.logs (id, sql_text, "time") VALUES (82, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:11:50.503397');
INSERT INTO public.logs (id, sql_text, "time") VALUES (83, 'SELECT * FROM users WHERE id=2', '2023-10-19 15:11:50.504164');
INSERT INTO public.logs (id, sql_text, "time") VALUES (84, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:11:52.578056');
INSERT INTO public.logs (id, sql_text, "time") VALUES (85, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:11:52.586785');
INSERT INTO public.logs (id, sql_text, "time") VALUES (86, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:11:52.587715');
INSERT INTO public.logs (id, sql_text, "time") VALUES (87, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:11:52.58873');
INSERT INTO public.logs (id, sql_text, "time") VALUES (88, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:11:52.589712');
INSERT INTO public.logs (id, sql_text, "time") VALUES (89, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:11:52.591473');
INSERT INTO public.logs (id, sql_text, "time") VALUES (90, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:11:52.592649');
INSERT INTO public.logs (id, sql_text, "time") VALUES (91, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:11:52.593999');
INSERT INTO public.logs (id, sql_text, "time") VALUES (92, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:11:56.181838');
INSERT INTO public.logs (id, sql_text, "time") VALUES (93, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:11:56.190132');
INSERT INTO public.logs (id, sql_text, "time") VALUES (94, 'SELECT * FROM parts;', '2023-10-19 15:11:56.190994');
INSERT INTO public.logs (id, sql_text, "time") VALUES (95, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:12:21.618688');
INSERT INTO public.logs (id, sql_text, "time") VALUES (96, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:12:21.619595');
INSERT INTO public.logs (id, sql_text, "time") VALUES (97, 'SELECT * FROM parts;', '2023-10-19 15:12:21.620284');
INSERT INTO public.logs (id, sql_text, "time") VALUES (98, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:12:22.61235');
INSERT INTO public.logs (id, sql_text, "time") VALUES (99, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:12:22.61314');
INSERT INTO public.logs (id, sql_text, "time") VALUES (100, 'SELECT * FROM parts;', '2023-10-19 15:12:22.613836');
INSERT INTO public.logs (id, sql_text, "time") VALUES (101, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:27:09.807908');
INSERT INTO public.logs (id, sql_text, "time") VALUES (102, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:27:09.826489');
INSERT INTO public.logs (id, sql_text, "time") VALUES (103, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:27:09.827412');
INSERT INTO public.logs (id, sql_text, "time") VALUES (104, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:27:09.829569');
INSERT INTO public.logs (id, sql_text, "time") VALUES (105, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:27:09.832009');
INSERT INTO public.logs (id, sql_text, "time") VALUES (106, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:27:09.840493');
INSERT INTO public.logs (id, sql_text, "time") VALUES (107, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:27:09.841327');
INSERT INTO public.logs (id, sql_text, "time") VALUES (108, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:27:09.842078');
INSERT INTO public.logs (id, sql_text, "time") VALUES (109, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:27:32.820183');
INSERT INTO public.logs (id, sql_text, "time") VALUES (110, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:27:32.821469');
INSERT INTO public.logs (id, sql_text, "time") VALUES (111, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:27:32.829288');
INSERT INTO public.logs (id, sql_text, "time") VALUES (112, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:27:32.830125');
INSERT INTO public.logs (id, sql_text, "time") VALUES (113, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:27:32.831373');
INSERT INTO public.logs (id, sql_text, "time") VALUES (114, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:27:32.833059');
INSERT INTO public.logs (id, sql_text, "time") VALUES (115, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:27:32.834005');
INSERT INTO public.logs (id, sql_text, "time") VALUES (116, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:27:32.834889');
INSERT INTO public.logs (id, sql_text, "time") VALUES (117, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:27:32.835507');
INSERT INTO public.logs (id, sql_text, "time") VALUES (118, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:27:32.836156');
INSERT INTO public.logs (id, sql_text, "time") VALUES (119, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:27:37.565006');
INSERT INTO public.logs (id, sql_text, "time") VALUES (120, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:27:37.573484');
INSERT INTO public.logs (id, sql_text, "time") VALUES (121, 'SELECT * FROM parts;', '2023-10-19 15:27:37.574477');
INSERT INTO public.logs (id, sql_text, "time") VALUES (122, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:27:39.469931');
INSERT INTO public.logs (id, sql_text, "time") VALUES (123, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:27:39.478131');
INSERT INTO public.logs (id, sql_text, "time") VALUES (124, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:27:39.479021');
INSERT INTO public.logs (id, sql_text, "time") VALUES (125, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:27:39.479748');
INSERT INTO public.logs (id, sql_text, "time") VALUES (126, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:27:39.480439');
INSERT INTO public.logs (id, sql_text, "time") VALUES (127, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:27:39.48123');
INSERT INTO public.logs (id, sql_text, "time") VALUES (128, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:27:39.481941');
INSERT INTO public.logs (id, sql_text, "time") VALUES (129, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:27:39.482607');
INSERT INTO public.logs (id, sql_text, "time") VALUES (130, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:28:22.911654');
INSERT INTO public.logs (id, sql_text, "time") VALUES (131, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:28:22.912588');
INSERT INTO public.logs (id, sql_text, "time") VALUES (132, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:28:22.913297');
INSERT INTO public.logs (id, sql_text, "time") VALUES (133, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:28:22.913961');
INSERT INTO public.logs (id, sql_text, "time") VALUES (134, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:28:22.914603');
INSERT INTO public.logs (id, sql_text, "time") VALUES (135, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:28:22.915328');
INSERT INTO public.logs (id, sql_text, "time") VALUES (136, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:28:22.915969');
INSERT INTO public.logs (id, sql_text, "time") VALUES (137, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:28:22.91658');
INSERT INTO public.logs (id, sql_text, "time") VALUES (138, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:28:24.065529');
INSERT INTO public.logs (id, sql_text, "time") VALUES (139, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:28:24.07362');
INSERT INTO public.logs (id, sql_text, "time") VALUES (140, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:28:24.074731');
INSERT INTO public.logs (id, sql_text, "time") VALUES (141, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:28:24.075695');
INSERT INTO public.logs (id, sql_text, "time") VALUES (142, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:28:24.076496');
INSERT INTO public.logs (id, sql_text, "time") VALUES (143, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:28:24.077255');
INSERT INTO public.logs (id, sql_text, "time") VALUES (144, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:28:24.077894');
INSERT INTO public.logs (id, sql_text, "time") VALUES (145, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:28:24.078509');
INSERT INTO public.logs (id, sql_text, "time") VALUES (146, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:28:32.464527');
INSERT INTO public.logs (id, sql_text, "time") VALUES (147, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:28:32.472496');
INSERT INTO public.logs (id, sql_text, "time") VALUES (148, 'SELECT * FROM parts;', '2023-10-19 15:28:32.473247');
INSERT INTO public.logs (id, sql_text, "time") VALUES (149, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:28:36.690763');
INSERT INTO public.logs (id, sql_text, "time") VALUES (150, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:28:36.691592');
INSERT INTO public.logs (id, sql_text, "time") VALUES (151, 'SELECT * FROM users;', '2023-10-19 15:28:36.692447');
INSERT INTO public.logs (id, sql_text, "time") VALUES (152, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:38:09.085602');
INSERT INTO public.logs (id, sql_text, "time") VALUES (153, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:38:09.08784');
INSERT INTO public.logs (id, sql_text, "time") VALUES (232, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:57:18.057706');
INSERT INTO public.logs (id, sql_text, "time") VALUES (154, 'SELECT * FROM tasks WHERE executor=1 AND status=''finished''  ORDER BY time;', '2023-10-19 15:38:09.088524');
INSERT INTO public.logs (id, sql_text, "time") VALUES (155, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:38:09.089407');
INSERT INTO public.logs (id, sql_text, "time") VALUES (156, 'SELECT * FROM users WHERE id=2', '2023-10-19 15:38:09.090118');
INSERT INTO public.logs (id, sql_text, "time") VALUES (157, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:38:09.092941');
INSERT INTO public.logs (id, sql_text, "time") VALUES (158, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:38:09.093724');
INSERT INTO public.logs (id, sql_text, "time") VALUES (159, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:38:11.293462');
INSERT INTO public.logs (id, sql_text, "time") VALUES (160, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:38:11.301839');
INSERT INTO public.logs (id, sql_text, "time") VALUES (161, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:38:11.320055');
INSERT INTO public.logs (id, sql_text, "time") VALUES (162, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:38:11.320844');
INSERT INTO public.logs (id, sql_text, "time") VALUES (163, 'SELECT * FROM tasks WHERE id=3 ORDER BY time;', '2023-10-19 15:38:11.321553');
INSERT INTO public.logs (id, sql_text, "time") VALUES (164, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:38:11.322432');
INSERT INTO public.logs (id, sql_text, "time") VALUES (165, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:38:11.323101');
INSERT INTO public.logs (id, sql_text, "time") VALUES (166, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:54:13.238196');
INSERT INTO public.logs (id, sql_text, "time") VALUES (167, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:54:13.246472');
INSERT INTO public.logs (id, sql_text, "time") VALUES (168, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:54:13.24724');
INSERT INTO public.logs (id, sql_text, "time") VALUES (169, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:54:13.247975');
INSERT INTO public.logs (id, sql_text, "time") VALUES (170, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:54:13.248667');
INSERT INTO public.logs (id, sql_text, "time") VALUES (171, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:54:13.249354');
INSERT INTO public.logs (id, sql_text, "time") VALUES (172, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:54:13.24994');
INSERT INTO public.logs (id, sql_text, "time") VALUES (173, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:54:13.250814');
INSERT INTO public.logs (id, sql_text, "time") VALUES (174, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:54:53.270237');
INSERT INTO public.logs (id, sql_text, "time") VALUES (175, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:54:53.289213');
INSERT INTO public.logs (id, sql_text, "time") VALUES (176, 'SELECT * FROM users;', '2023-10-19 15:54:53.290167');
INSERT INTO public.logs (id, sql_text, "time") VALUES (177, 'SELECT * FROM parts;', '2023-10-19 15:54:53.290903');
INSERT INTO public.logs (id, sql_text, "time") VALUES (178, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:54:56.010368');
INSERT INTO public.logs (id, sql_text, "time") VALUES (179, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:54:56.018673');
INSERT INTO public.logs (id, sql_text, "time") VALUES (180, 'SELECT * FROM users;', '2023-10-19 15:54:56.01945');
INSERT INTO public.logs (id, sql_text, "time") VALUES (181, 'SELECT * FROM parts;', '2023-10-19 15:54:56.020126');
INSERT INTO public.logs (id, sql_text, "time") VALUES (182, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:56:41.156374');
INSERT INTO public.logs (id, sql_text, "time") VALUES (183, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:56:41.175273');
INSERT INTO public.logs (id, sql_text, "time") VALUES (184, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:56:41.176217');
INSERT INTO public.logs (id, sql_text, "time") VALUES (185, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:56:41.178431');
INSERT INTO public.logs (id, sql_text, "time") VALUES (186, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:56:41.18018');
INSERT INTO public.logs (id, sql_text, "time") VALUES (187, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:56:41.188812');
INSERT INTO public.logs (id, sql_text, "time") VALUES (188, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:56:41.189675');
INSERT INTO public.logs (id, sql_text, "time") VALUES (189, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:56:41.190371');
INSERT INTO public.logs (id, sql_text, "time") VALUES (190, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:56:41.329907');
INSERT INTO public.logs (id, sql_text, "time") VALUES (191, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:56:41.338103');
INSERT INTO public.logs (id, sql_text, "time") VALUES (192, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:56:41.339584');
INSERT INTO public.logs (id, sql_text, "time") VALUES (193, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:56:41.340382');
INSERT INTO public.logs (id, sql_text, "time") VALUES (194, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:56:41.341194');
INSERT INTO public.logs (id, sql_text, "time") VALUES (195, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:56:41.342026');
INSERT INTO public.logs (id, sql_text, "time") VALUES (196, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:56:41.342686');
INSERT INTO public.logs (id, sql_text, "time") VALUES (197, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:56:41.343423');
INSERT INTO public.logs (id, sql_text, "time") VALUES (198, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:56:42.968469');
INSERT INTO public.logs (id, sql_text, "time") VALUES (199, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:56:42.96995');
INSERT INTO public.logs (id, sql_text, "time") VALUES (200, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:56:42.970651');
INSERT INTO public.logs (id, sql_text, "time") VALUES (201, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:56:42.971234');
INSERT INTO public.logs (id, sql_text, "time") VALUES (202, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:56:42.971825');
INSERT INTO public.logs (id, sql_text, "time") VALUES (203, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:56:42.972465');
INSERT INTO public.logs (id, sql_text, "time") VALUES (204, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:56:42.973003');
INSERT INTO public.logs (id, sql_text, "time") VALUES (205, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:56:42.973621');
INSERT INTO public.logs (id, sql_text, "time") VALUES (206, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:56:44.819798');
INSERT INTO public.logs (id, sql_text, "time") VALUES (207, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:56:44.828124');
INSERT INTO public.logs (id, sql_text, "time") VALUES (208, 'SELECT * FROM users;', '2023-10-19 15:56:44.831219');
INSERT INTO public.logs (id, sql_text, "time") VALUES (209, 'SELECT * FROM parts;', '2023-10-19 15:56:44.832142');
INSERT INTO public.logs (id, sql_text, "time") VALUES (210, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:57:07.921202');
INSERT INTO public.logs (id, sql_text, "time") VALUES (211, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:57:07.922231');
INSERT INTO public.logs (id, sql_text, "time") VALUES (212, 'SELECT * FROM users;', '2023-10-19 15:57:07.922901');
INSERT INTO public.logs (id, sql_text, "time") VALUES (213, 'INSERT INTO tasks (executor, client, text, status) VALUES (1, 1, ''Выполнить необходимые детали в количестве 3 штук'', ''not started'')', '2023-10-19 15:57:07.923852');
INSERT INTO public.logs (id, sql_text, "time") VALUES (214, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:57:07.937328');
INSERT INTO public.logs (id, sql_text, "time") VALUES (215, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:57:07.938239');
INSERT INTO public.logs (id, sql_text, "time") VALUES (216, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:57:07.938912');
INSERT INTO public.logs (id, sql_text, "time") VALUES (217, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:57:07.939554');
INSERT INTO public.logs (id, sql_text, "time") VALUES (218, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:57:07.940156');
INSERT INTO public.logs (id, sql_text, "time") VALUES (219, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:57:07.940872');
INSERT INTO public.logs (id, sql_text, "time") VALUES (220, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:57:07.941463');
INSERT INTO public.logs (id, sql_text, "time") VALUES (221, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:57:07.942185');
INSERT INTO public.logs (id, sql_text, "time") VALUES (222, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:57:10.550387');
INSERT INTO public.logs (id, sql_text, "time") VALUES (223, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:57:10.558766');
INSERT INTO public.logs (id, sql_text, "time") VALUES (224, 'SELECT * FROM tasks WHERE executor=1 AND status=''not started'' ORDER BY time;', '2023-10-19 15:57:10.5596');
INSERT INTO public.logs (id, sql_text, "time") VALUES (225, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:57:10.560385');
INSERT INTO public.logs (id, sql_text, "time") VALUES (226, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:57:10.56109');
INSERT INTO public.logs (id, sql_text, "time") VALUES (227, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:57:18.03473');
INSERT INTO public.logs (id, sql_text, "time") VALUES (228, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:57:18.035704');
INSERT INTO public.logs (id, sql_text, "time") VALUES (229, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:57:18.054752');
INSERT INTO public.logs (id, sql_text, "time") VALUES (230, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:57:18.055647');
INSERT INTO public.logs (id, sql_text, "time") VALUES (231, 'SELECT * FROM tasks WHERE id=6 ORDER BY time;', '2023-10-19 15:57:18.056502');
INSERT INTO public.logs (id, sql_text, "time") VALUES (233, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:57:18.05886');
INSERT INTO public.logs (id, sql_text, "time") VALUES (234, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:00.445531');
INSERT INTO public.logs (id, sql_text, "time") VALUES (235, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:00.456976');
INSERT INTO public.logs (id, sql_text, "time") VALUES (236, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:58:00.458212');
INSERT INTO public.logs (id, sql_text, "time") VALUES (237, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:58:00.4602');
INSERT INTO public.logs (id, sql_text, "time") VALUES (238, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:58:00.461823');
INSERT INTO public.logs (id, sql_text, "time") VALUES (239, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:58:00.470283');
INSERT INTO public.logs (id, sql_text, "time") VALUES (240, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:58:00.471133');
INSERT INTO public.logs (id, sql_text, "time") VALUES (241, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:58:00.471816');
INSERT INTO public.logs (id, sql_text, "time") VALUES (242, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:05.57736');
INSERT INTO public.logs (id, sql_text, "time") VALUES (243, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:05.585363');
INSERT INTO public.logs (id, sql_text, "time") VALUES (244, 'SELECT * FROM tasks WHERE executor=1 AND status=''not started'' ORDER BY time;', '2023-10-19 15:58:05.586099');
INSERT INTO public.logs (id, sql_text, "time") VALUES (245, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:05.58677');
INSERT INTO public.logs (id, sql_text, "time") VALUES (246, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:05.587457');
INSERT INTO public.logs (id, sql_text, "time") VALUES (247, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:07.344524');
INSERT INTO public.logs (id, sql_text, "time") VALUES (248, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:07.352612');
INSERT INTO public.logs (id, sql_text, "time") VALUES (249, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:07.374685');
INSERT INTO public.logs (id, sql_text, "time") VALUES (250, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:07.375557');
INSERT INTO public.logs (id, sql_text, "time") VALUES (251, 'SELECT * FROM tasks WHERE id=6 ORDER BY time;', '2023-10-19 15:58:07.376244');
INSERT INTO public.logs (id, sql_text, "time") VALUES (252, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:07.376943');
INSERT INTO public.logs (id, sql_text, "time") VALUES (253, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:07.377594');
INSERT INTO public.logs (id, sql_text, "time") VALUES (254, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:10.397066');
INSERT INTO public.logs (id, sql_text, "time") VALUES (255, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:10.405277');
INSERT INTO public.logs (id, sql_text, "time") VALUES (256, 'SELECT * FROM tasks WHERE id=6 ORDER BY time;', '2023-10-19 15:58:10.406327');
INSERT INTO public.logs (id, sql_text, "time") VALUES (257, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:10.407091');
INSERT INTO public.logs (id, sql_text, "time") VALUES (258, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:10.407769');
INSERT INTO public.logs (id, sql_text, "time") VALUES (259, 'UPDATE tasks SET status=''in work'', start_time=CURRENT_TIMESTAMP WHERE id=6;', '2023-10-19 15:58:10.408502');
INSERT INTO public.logs (id, sql_text, "time") VALUES (260, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:10.418209');
INSERT INTO public.logs (id, sql_text, "time") VALUES (261, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:10.419125');
INSERT INTO public.logs (id, sql_text, "time") VALUES (262, 'SELECT * FROM tasks WHERE id=6 ORDER BY time;', '2023-10-19 15:58:10.419794');
INSERT INTO public.logs (id, sql_text, "time") VALUES (263, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:10.420462');
INSERT INTO public.logs (id, sql_text, "time") VALUES (264, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:10.421128');
INSERT INTO public.logs (id, sql_text, "time") VALUES (265, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:14.002803');
INSERT INTO public.logs (id, sql_text, "time") VALUES (266, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:14.003824');
INSERT INTO public.logs (id, sql_text, "time") VALUES (267, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:58:14.004845');
INSERT INTO public.logs (id, sql_text, "time") VALUES (268, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:14.005781');
INSERT INTO public.logs (id, sql_text, "time") VALUES (269, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:14.006769');
INSERT INTO public.logs (id, sql_text, "time") VALUES (270, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:58:14.007395');
INSERT INTO public.logs (id, sql_text, "time") VALUES (271, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:58:14.008228');
INSERT INTO public.logs (id, sql_text, "time") VALUES (272, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:58:14.008957');
INSERT INTO public.logs (id, sql_text, "time") VALUES (273, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:58:14.009511');
INSERT INTO public.logs (id, sql_text, "time") VALUES (274, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:58:14.010082');
INSERT INTO public.logs (id, sql_text, "time") VALUES (275, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:17.84984');
INSERT INTO public.logs (id, sql_text, "time") VALUES (276, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:17.858146');
INSERT INTO public.logs (id, sql_text, "time") VALUES (277, 'SELECT * FROM tasks WHERE id=6 ORDER BY time;', '2023-10-19 15:58:17.859135');
INSERT INTO public.logs (id, sql_text, "time") VALUES (278, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:17.859852');
INSERT INTO public.logs (id, sql_text, "time") VALUES (279, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:17.860532');
INSERT INTO public.logs (id, sql_text, "time") VALUES (280, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:19.064993');
INSERT INTO public.logs (id, sql_text, "time") VALUES (281, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:19.073194');
INSERT INTO public.logs (id, sql_text, "time") VALUES (282, 'SELECT * FROM tasks WHERE id=6 ORDER BY time;', '2023-10-19 15:58:19.073993');
INSERT INTO public.logs (id, sql_text, "time") VALUES (283, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:19.074803');
INSERT INTO public.logs (id, sql_text, "time") VALUES (284, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:19.075569');
INSERT INTO public.logs (id, sql_text, "time") VALUES (285, 'UPDATE tasks SET status=''finished'', finish_time=CURRENT_TIMESTAMP WHERE id=6;', '2023-10-19 15:58:19.076695');
INSERT INTO public.logs (id, sql_text, "time") VALUES (286, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:19.085839');
INSERT INTO public.logs (id, sql_text, "time") VALUES (287, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:19.086626');
INSERT INTO public.logs (id, sql_text, "time") VALUES (288, 'SELECT * FROM tasks WHERE id=6 ORDER BY time;', '2023-10-19 15:58:19.087273');
INSERT INTO public.logs (id, sql_text, "time") VALUES (289, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:19.087938');
INSERT INTO public.logs (id, sql_text, "time") VALUES (290, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:19.088575');
INSERT INTO public.logs (id, sql_text, "time") VALUES (291, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:20.713296');
INSERT INTO public.logs (id, sql_text, "time") VALUES (292, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:20.721471');
INSERT INTO public.logs (id, sql_text, "time") VALUES (293, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 15:58:20.722214');
INSERT INTO public.logs (id, sql_text, "time") VALUES (294, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 15:58:20.723082');
INSERT INTO public.logs (id, sql_text, "time") VALUES (295, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 15:58:20.724968');
INSERT INTO public.logs (id, sql_text, "time") VALUES (296, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 15:58:20.726432');
INSERT INTO public.logs (id, sql_text, "time") VALUES (297, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 15:58:20.727493');
INSERT INTO public.logs (id, sql_text, "time") VALUES (298, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 15:58:20.728244');
INSERT INTO public.logs (id, sql_text, "time") VALUES (299, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 15:58:22.76229');
INSERT INTO public.logs (id, sql_text, "time") VALUES (300, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 15:58:22.771449');
INSERT INTO public.logs (id, sql_text, "time") VALUES (301, 'SELECT * FROM tasks WHERE executor=1 AND status=''finished''  ORDER BY time;', '2023-10-19 15:58:22.772403');
INSERT INTO public.logs (id, sql_text, "time") VALUES (302, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:22.773239');
INSERT INTO public.logs (id, sql_text, "time") VALUES (303, 'SELECT * FROM users WHERE id=2', '2023-10-19 15:58:22.774295');
INSERT INTO public.logs (id, sql_text, "time") VALUES (304, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:22.775729');
INSERT INTO public.logs (id, sql_text, "time") VALUES (305, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:22.776562');
INSERT INTO public.logs (id, sql_text, "time") VALUES (306, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:22.777206');
INSERT INTO public.logs (id, sql_text, "time") VALUES (307, 'SELECT * FROM users WHERE id=1', '2023-10-19 15:58:22.777781');
INSERT INTO public.logs (id, sql_text, "time") VALUES (308, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:01:13.436797');
INSERT INTO public.logs (id, sql_text, "time") VALUES (309, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:01:13.44858');
INSERT INTO public.logs (id, sql_text, "time") VALUES (310, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:01:13.471002');
INSERT INTO public.logs (id, sql_text, "time") VALUES (311, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:01:13.472559');
INSERT INTO public.logs (id, sql_text, "time") VALUES (312, 'SELECT * FROM tasks WHERE id=2 ORDER BY time;', '2023-10-19 16:01:13.473689');
INSERT INTO public.logs (id, sql_text, "time") VALUES (313, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:01:13.475766');
INSERT INTO public.logs (id, sql_text, "time") VALUES (314, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:01:13.476481');
INSERT INTO public.logs (id, sql_text, "time") VALUES (315, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:01:18.225863');
INSERT INTO public.logs (id, sql_text, "time") VALUES (316, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:01:18.234252');
INSERT INTO public.logs (id, sql_text, "time") VALUES (317, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:01:18.242822');
INSERT INTO public.logs (id, sql_text, "time") VALUES (318, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:01:18.243734');
INSERT INTO public.logs (id, sql_text, "time") VALUES (319, 'SELECT * FROM tasks WHERE id=6 ORDER BY time;', '2023-10-19 16:01:18.244697');
INSERT INTO public.logs (id, sql_text, "time") VALUES (320, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:01:18.245698');
INSERT INTO public.logs (id, sql_text, "time") VALUES (321, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:01:18.246537');
INSERT INTO public.logs (id, sql_text, "time") VALUES (322, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:02:45.728887');
INSERT INTO public.logs (id, sql_text, "time") VALUES (323, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:02:45.740489');
INSERT INTO public.logs (id, sql_text, "time") VALUES (324, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:02:45.748985');
INSERT INTO public.logs (id, sql_text, "time") VALUES (325, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:02:45.749918');
INSERT INTO public.logs (id, sql_text, "time") VALUES (326, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:02:45.750677');
INSERT INTO public.logs (id, sql_text, "time") VALUES (327, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:02:45.75306');
INSERT INTO public.logs (id, sql_text, "time") VALUES (328, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:02:45.754771');
INSERT INTO public.logs (id, sql_text, "time") VALUES (329, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:02:45.763413');
INSERT INTO public.logs (id, sql_text, "time") VALUES (330, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:02:45.764215');
INSERT INTO public.logs (id, sql_text, "time") VALUES (331, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:02:45.764825');
INSERT INTO public.logs (id, sql_text, "time") VALUES (332, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:02:56.506406');
INSERT INTO public.logs (id, sql_text, "time") VALUES (333, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:02:56.507251');
INSERT INTO public.logs (id, sql_text, "time") VALUES (334, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:02:56.514052');
INSERT INTO public.logs (id, sql_text, "time") VALUES (335, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:02:56.514839');
INSERT INTO public.logs (id, sql_text, "time") VALUES (336, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:02:56.515529');
INSERT INTO public.logs (id, sql_text, "time") VALUES (337, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:02:56.516182');
INSERT INTO public.logs (id, sql_text, "time") VALUES (338, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:02:56.516829');
INSERT INTO public.logs (id, sql_text, "time") VALUES (339, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:02:56.517539');
INSERT INTO public.logs (id, sql_text, "time") VALUES (340, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:02:56.518441');
INSERT INTO public.logs (id, sql_text, "time") VALUES (341, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:02:56.520217');
INSERT INTO public.logs (id, sql_text, "time") VALUES (342, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:03:01.513534');
INSERT INTO public.logs (id, sql_text, "time") VALUES (343, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:03:01.521797');
INSERT INTO public.logs (id, sql_text, "time") VALUES (344, 'SELECT * FROM tasks WHERE executor=2 AND status=''finished''  ORDER BY time;', '2023-10-19 16:03:01.522754');
INSERT INTO public.logs (id, sql_text, "time") VALUES (345, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:03:01.523488');
INSERT INTO public.logs (id, sql_text, "time") VALUES (346, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:03:01.524713');
INSERT INTO public.logs (id, sql_text, "time") VALUES (347, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:04:04.266252');
INSERT INTO public.logs (id, sql_text, "time") VALUES (348, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:04:04.27449');
INSERT INTO public.logs (id, sql_text, "time") VALUES (349, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:04:04.276175');
INSERT INTO public.logs (id, sql_text, "time") VALUES (350, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:04:04.277176');
INSERT INTO public.logs (id, sql_text, "time") VALUES (351, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:04:04.278112');
INSERT INTO public.logs (id, sql_text, "time") VALUES (352, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:04:04.279655');
INSERT INTO public.logs (id, sql_text, "time") VALUES (353, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:04:04.280533');
INSERT INTO public.logs (id, sql_text, "time") VALUES (354, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:04:04.281145');
INSERT INTO public.logs (id, sql_text, "time") VALUES (355, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:04:05.462332');
INSERT INTO public.logs (id, sql_text, "time") VALUES (356, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:04:05.470787');
INSERT INTO public.logs (id, sql_text, "time") VALUES (357, 'SELECT * FROM tasks WHERE executor=2 AND status=''finished''  ORDER BY time;', '2023-10-19 16:04:05.47212');
INSERT INTO public.logs (id, sql_text, "time") VALUES (358, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:04:06.613981');
INSERT INTO public.logs (id, sql_text, "time") VALUES (359, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:04:06.622116');
INSERT INTO public.logs (id, sql_text, "time") VALUES (360, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:04:06.623011');
INSERT INTO public.logs (id, sql_text, "time") VALUES (361, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:04:06.623759');
INSERT INTO public.logs (id, sql_text, "time") VALUES (362, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:04:06.624474');
INSERT INTO public.logs (id, sql_text, "time") VALUES (363, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:04:06.625213');
INSERT INTO public.logs (id, sql_text, "time") VALUES (364, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:04:06.625889');
INSERT INTO public.logs (id, sql_text, "time") VALUES (365, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:04:06.626564');
INSERT INTO public.logs (id, sql_text, "time") VALUES (366, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:04:08.092203');
INSERT INTO public.logs (id, sql_text, "time") VALUES (367, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:04:08.10104');
INSERT INTO public.logs (id, sql_text, "time") VALUES (368, 'SELECT * FROM tasks WHERE executor=2 AND status=''not started'' ORDER BY time;', '2023-10-19 16:04:08.101808');
INSERT INTO public.logs (id, sql_text, "time") VALUES (369, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:04:08.977755');
INSERT INTO public.logs (id, sql_text, "time") VALUES (370, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:04:08.986042');
INSERT INTO public.logs (id, sql_text, "time") VALUES (371, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:04:08.986926');
INSERT INTO public.logs (id, sql_text, "time") VALUES (372, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:04:08.987809');
INSERT INTO public.logs (id, sql_text, "time") VALUES (373, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:04:08.988532');
INSERT INTO public.logs (id, sql_text, "time") VALUES (374, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:04:08.989403');
INSERT INTO public.logs (id, sql_text, "time") VALUES (375, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:04:08.990598');
INSERT INTO public.logs (id, sql_text, "time") VALUES (376, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:04:08.991421');
INSERT INTO public.logs (id, sql_text, "time") VALUES (377, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:04:10.191068');
INSERT INTO public.logs (id, sql_text, "time") VALUES (378, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:04:10.199047');
INSERT INTO public.logs (id, sql_text, "time") VALUES (379, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:04:10.205707');
INSERT INTO public.logs (id, sql_text, "time") VALUES (380, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:04:10.206594');
INSERT INTO public.logs (id, sql_text, "time") VALUES (381, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:04:10.207253');
INSERT INTO public.logs (id, sql_text, "time") VALUES (382, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:04:10.207961');
INSERT INTO public.logs (id, sql_text, "time") VALUES (383, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:04:10.208633');
INSERT INTO public.logs (id, sql_text, "time") VALUES (384, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:04:10.209324');
INSERT INTO public.logs (id, sql_text, "time") VALUES (385, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:04:10.20995');
INSERT INTO public.logs (id, sql_text, "time") VALUES (386, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:04:10.21051');
INSERT INTO public.logs (id, sql_text, "time") VALUES (387, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:04:14.078264');
INSERT INTO public.logs (id, sql_text, "time") VALUES (388, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:04:14.086377');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1185, 'SELECT * FROM parts;', '2023-10-19 18:00:56.452578');
INSERT INTO public.logs (id, sql_text, "time") VALUES (389, 'SELECT * FROM tasks WHERE executor=1 AND status=''finished''  ORDER BY time;', '2023-10-19 16:04:14.08785');
INSERT INTO public.logs (id, sql_text, "time") VALUES (390, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:04:16.304444');
INSERT INTO public.logs (id, sql_text, "time") VALUES (391, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:04:16.312913');
INSERT INTO public.logs (id, sql_text, "time") VALUES (392, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:04:16.313927');
INSERT INTO public.logs (id, sql_text, "time") VALUES (393, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:04:16.314963');
INSERT INTO public.logs (id, sql_text, "time") VALUES (394, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:04:16.317468');
INSERT INTO public.logs (id, sql_text, "time") VALUES (395, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:04:16.318825');
INSERT INTO public.logs (id, sql_text, "time") VALUES (396, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:04:16.319516');
INSERT INTO public.logs (id, sql_text, "time") VALUES (397, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:04:16.320145');
INSERT INTO public.logs (id, sql_text, "time") VALUES (398, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:04:17.25347');
INSERT INTO public.logs (id, sql_text, "time") VALUES (399, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:04:17.261604');
INSERT INTO public.logs (id, sql_text, "time") VALUES (400, 'SELECT * FROM tasks WHERE executor=1 AND status=''not started'' ORDER BY time;', '2023-10-19 16:04:17.262394');
INSERT INTO public.logs (id, sql_text, "time") VALUES (401, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:04:18.043382');
INSERT INTO public.logs (id, sql_text, "time") VALUES (402, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:04:18.051497');
INSERT INTO public.logs (id, sql_text, "time") VALUES (403, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:04:18.052223');
INSERT INTO public.logs (id, sql_text, "time") VALUES (404, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:04:18.052864');
INSERT INTO public.logs (id, sql_text, "time") VALUES (405, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:04:18.053517');
INSERT INTO public.logs (id, sql_text, "time") VALUES (406, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:04:18.054227');
INSERT INTO public.logs (id, sql_text, "time") VALUES (407, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:04:18.054863');
INSERT INTO public.logs (id, sql_text, "time") VALUES (408, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:04:18.055525');
INSERT INTO public.logs (id, sql_text, "time") VALUES (409, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:04:18.962032');
INSERT INTO public.logs (id, sql_text, "time") VALUES (410, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:04:18.969943');
INSERT INTO public.logs (id, sql_text, "time") VALUES (411, 'SELECT * FROM users;', '2023-10-19 16:04:18.97061');
INSERT INTO public.logs (id, sql_text, "time") VALUES (412, 'SELECT * FROM parts;', '2023-10-19 16:04:18.971251');
INSERT INTO public.logs (id, sql_text, "time") VALUES (413, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:04:20.590529');
INSERT INTO public.logs (id, sql_text, "time") VALUES (414, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:04:20.598628');
INSERT INTO public.logs (id, sql_text, "time") VALUES (415, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:04:20.599341');
INSERT INTO public.logs (id, sql_text, "time") VALUES (416, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:04:20.59999');
INSERT INTO public.logs (id, sql_text, "time") VALUES (417, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:04:20.600608');
INSERT INTO public.logs (id, sql_text, "time") VALUES (418, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:04:20.60137');
INSERT INTO public.logs (id, sql_text, "time") VALUES (419, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:04:20.602062');
INSERT INTO public.logs (id, sql_text, "time") VALUES (420, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:04:20.6027');
INSERT INTO public.logs (id, sql_text, "time") VALUES (421, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:04:22.332153');
INSERT INTO public.logs (id, sql_text, "time") VALUES (422, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:04:22.340182');
INSERT INTO public.logs (id, sql_text, "time") VALUES (423, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:04:22.348306');
INSERT INTO public.logs (id, sql_text, "time") VALUES (424, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:04:22.349281');
INSERT INTO public.logs (id, sql_text, "time") VALUES (425, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:04:22.349903');
INSERT INTO public.logs (id, sql_text, "time") VALUES (426, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:04:22.350517');
INSERT INTO public.logs (id, sql_text, "time") VALUES (427, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:04:22.35123');
INSERT INTO public.logs (id, sql_text, "time") VALUES (428, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:04:22.352388');
INSERT INTO public.logs (id, sql_text, "time") VALUES (429, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:04:22.353807');
INSERT INTO public.logs (id, sql_text, "time") VALUES (430, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:04:22.354655');
INSERT INTO public.logs (id, sql_text, "time") VALUES (431, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:07:23.50628');
INSERT INTO public.logs (id, sql_text, "time") VALUES (432, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:07:23.515585');
INSERT INTO public.logs (id, sql_text, "time") VALUES (433, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:07:23.518176');
INSERT INTO public.logs (id, sql_text, "time") VALUES (434, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:07:23.519447');
INSERT INTO public.logs (id, sql_text, "time") VALUES (435, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 16:07:23.5201');
INSERT INTO public.logs (id, sql_text, "time") VALUES (436, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:07:41.290659');
INSERT INTO public.logs (id, sql_text, "time") VALUES (437, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:07:41.298736');
INSERT INTO public.logs (id, sql_text, "time") VALUES (438, 'SELECT * FROM tasks WHERE executor=1 AND status=''finished''  ORDER BY time;', '2023-10-19 16:07:41.299406');
INSERT INTO public.logs (id, sql_text, "time") VALUES (439, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:07:44.47955');
INSERT INTO public.logs (id, sql_text, "time") VALUES (440, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:07:44.487681');
INSERT INTO public.logs (id, sql_text, "time") VALUES (441, 'SELECT * FROM users;', '2023-10-19 16:07:44.488976');
INSERT INTO public.logs (id, sql_text, "time") VALUES (442, 'SELECT * FROM parts;', '2023-10-19 16:07:44.490043');
INSERT INTO public.logs (id, sql_text, "time") VALUES (443, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:09:59.960368');
INSERT INTO public.logs (id, sql_text, "time") VALUES (444, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:09:59.978263');
INSERT INTO public.logs (id, sql_text, "time") VALUES (445, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:09:59.979157');
INSERT INTO public.logs (id, sql_text, "time") VALUES (446, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:09:59.981161');
INSERT INTO public.logs (id, sql_text, "time") VALUES (447, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:09:59.983432');
INSERT INTO public.logs (id, sql_text, "time") VALUES (448, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:09:59.991645');
INSERT INTO public.logs (id, sql_text, "time") VALUES (449, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:09:59.99245');
INSERT INTO public.logs (id, sql_text, "time") VALUES (450, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:09:59.993154');
INSERT INTO public.logs (id, sql_text, "time") VALUES (451, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:10:02.886175');
INSERT INTO public.logs (id, sql_text, "time") VALUES (452, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:10:02.895184');
INSERT INTO public.logs (id, sql_text, "time") VALUES (453, 'SELECT * FROM users;', '2023-10-19 16:10:02.896076');
INSERT INTO public.logs (id, sql_text, "time") VALUES (454, 'SELECT * FROM parts;', '2023-10-19 16:10:02.896769');
INSERT INTO public.logs (id, sql_text, "time") VALUES (455, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:11:17.467257');
INSERT INTO public.logs (id, sql_text, "time") VALUES (456, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:11:17.486295');
INSERT INTO public.logs (id, sql_text, "time") VALUES (457, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:11:17.487272');
INSERT INTO public.logs (id, sql_text, "time") VALUES (458, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:11:17.489357');
INSERT INTO public.logs (id, sql_text, "time") VALUES (459, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:11:17.491349');
INSERT INTO public.logs (id, sql_text, "time") VALUES (460, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:11:17.49967');
INSERT INTO public.logs (id, sql_text, "time") VALUES (461, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:11:17.500607');
INSERT INTO public.logs (id, sql_text, "time") VALUES (462, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:11:17.501343');
INSERT INTO public.logs (id, sql_text, "time") VALUES (463, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:11:19.01112');
INSERT INTO public.logs (id, sql_text, "time") VALUES (464, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:11:19.012085');
INSERT INTO public.logs (id, sql_text, "time") VALUES (465, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:11:19.012961');
INSERT INTO public.logs (id, sql_text, "time") VALUES (466, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:11:19.014267');
INSERT INTO public.logs (id, sql_text, "time") VALUES (467, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:11:19.015629');
INSERT INTO public.logs (id, sql_text, "time") VALUES (468, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:11:19.016382');
INSERT INTO public.logs (id, sql_text, "time") VALUES (469, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:11:19.017047');
INSERT INTO public.logs (id, sql_text, "time") VALUES (470, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:11:19.017903');
INSERT INTO public.logs (id, sql_text, "time") VALUES (471, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:11:20.474842');
INSERT INTO public.logs (id, sql_text, "time") VALUES (472, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:11:20.482904');
INSERT INTO public.logs (id, sql_text, "time") VALUES (473, 'SELECT * FROM users;', '2023-10-19 16:11:20.484219');
INSERT INTO public.logs (id, sql_text, "time") VALUES (474, 'SELECT * FROM parts;', '2023-10-19 16:11:20.485347');
INSERT INTO public.logs (id, sql_text, "time") VALUES (475, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:11:29.541956');
INSERT INTO public.logs (id, sql_text, "time") VALUES (476, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:11:29.55019');
INSERT INTO public.logs (id, sql_text, "time") VALUES (477, 'SELECT * FROM parts;', '2023-10-19 16:11:29.550903');
INSERT INTO public.logs (id, sql_text, "time") VALUES (478, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:12:04.792419');
INSERT INTO public.logs (id, sql_text, "time") VALUES (479, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:12:04.800915');
INSERT INTO public.logs (id, sql_text, "time") VALUES (480, 'SELECT * FROM users;', '2023-10-19 16:12:04.801714');
INSERT INTO public.logs (id, sql_text, "time") VALUES (481, 'SELECT * FROM parts;', '2023-10-19 16:12:04.802382');
INSERT INTO public.logs (id, sql_text, "time") VALUES (482, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:12:51.349223');
INSERT INTO public.logs (id, sql_text, "time") VALUES (483, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:12:51.367904');
INSERT INTO public.logs (id, sql_text, "time") VALUES (484, 'SELECT * FROM users;', '2023-10-19 16:12:51.368892');
INSERT INTO public.logs (id, sql_text, "time") VALUES (485, 'SELECT * FROM parts;', '2023-10-19 16:12:51.369623');
INSERT INTO public.logs (id, sql_text, "time") VALUES (486, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:12:52.806702');
INSERT INTO public.logs (id, sql_text, "time") VALUES (487, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:12:52.815867');
INSERT INTO public.logs (id, sql_text, "time") VALUES (488, 'SELECT * FROM users;', '2023-10-19 16:12:52.816875');
INSERT INTO public.logs (id, sql_text, "time") VALUES (489, 'SELECT * FROM parts;', '2023-10-19 16:12:52.817556');
INSERT INTO public.logs (id, sql_text, "time") VALUES (490, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:14:30.689465');
INSERT INTO public.logs (id, sql_text, "time") VALUES (491, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:14:30.707753');
INSERT INTO public.logs (id, sql_text, "time") VALUES (492, 'SELECT * FROM users;', '2023-10-19 16:14:30.708761');
INSERT INTO public.logs (id, sql_text, "time") VALUES (493, 'SELECT * FROM parts;', '2023-10-19 16:14:30.709474');
INSERT INTO public.logs (id, sql_text, "time") VALUES (494, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:14:35.719546');
INSERT INTO public.logs (id, sql_text, "time") VALUES (495, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:14:35.728173');
INSERT INTO public.logs (id, sql_text, "time") VALUES (496, 'SELECT * FROM tasks WHERE executor=1 AND status=''finished''  ORDER BY time;', '2023-10-19 16:14:35.729925');
INSERT INTO public.logs (id, sql_text, "time") VALUES (497, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:14:37.886073');
INSERT INTO public.logs (id, sql_text, "time") VALUES (498, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:14:37.894187');
INSERT INTO public.logs (id, sql_text, "time") VALUES (499, 'SELECT * FROM users;', '2023-10-19 16:14:37.895061');
INSERT INTO public.logs (id, sql_text, "time") VALUES (500, 'SELECT * FROM parts;', '2023-10-19 16:14:37.895911');
INSERT INTO public.logs (id, sql_text, "time") VALUES (501, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:14:55.398079');
INSERT INTO public.logs (id, sql_text, "time") VALUES (502, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:14:55.399564');
INSERT INTO public.logs (id, sql_text, "time") VALUES (503, 'SELECT * FROM users;', '2023-10-19 16:14:55.400422');
INSERT INTO public.logs (id, sql_text, "time") VALUES (504, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:16:22.739309');
INSERT INTO public.logs (id, sql_text, "time") VALUES (505, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:16:22.751298');
INSERT INTO public.logs (id, sql_text, "time") VALUES (506, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:16:22.766902');
INSERT INTO public.logs (id, sql_text, "time") VALUES (507, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:16:22.767905');
INSERT INTO public.logs (id, sql_text, "time") VALUES (508, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:16:22.768711');
INSERT INTO public.logs (id, sql_text, "time") VALUES (509, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:16:22.770775');
INSERT INTO public.logs (id, sql_text, "time") VALUES (510, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:16:22.772456');
INSERT INTO public.logs (id, sql_text, "time") VALUES (511, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:16:22.780538');
INSERT INTO public.logs (id, sql_text, "time") VALUES (512, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:16:22.781294');
INSERT INTO public.logs (id, sql_text, "time") VALUES (513, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:16:22.782513');
INSERT INTO public.logs (id, sql_text, "time") VALUES (514, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:16:24.682022');
INSERT INTO public.logs (id, sql_text, "time") VALUES (515, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:16:24.683082');
INSERT INTO public.logs (id, sql_text, "time") VALUES (516, 'SELECT * FROM users;', '2023-10-19 16:16:24.68401');
INSERT INTO public.logs (id, sql_text, "time") VALUES (517, 'SELECT * FROM parts;', '2023-10-19 16:16:24.684777');
INSERT INTO public.logs (id, sql_text, "time") VALUES (518, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:16:43.373498');
INSERT INTO public.logs (id, sql_text, "time") VALUES (519, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:16:43.374856');
INSERT INTO public.logs (id, sql_text, "time") VALUES (520, 'SELECT * FROM users;', '2023-10-19 16:16:43.375627');
INSERT INTO public.logs (id, sql_text, "time") VALUES (521, 'INSERT INTO tasks (executor, client, text, target, count, status) VALUES (2, 1, ''Выполнить детали в необходимом количестве'', 18, 3, ''not started'')', '2023-10-19 16:16:43.376686');
INSERT INTO public.logs (id, sql_text, "time") VALUES (522, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:16:43.385212');
INSERT INTO public.logs (id, sql_text, "time") VALUES (523, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:16:43.386143');
INSERT INTO public.logs (id, sql_text, "time") VALUES (524, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:16:43.386799');
INSERT INTO public.logs (id, sql_text, "time") VALUES (525, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:16:43.387401');
INSERT INTO public.logs (id, sql_text, "time") VALUES (526, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:16:43.388107');
INSERT INTO public.logs (id, sql_text, "time") VALUES (527, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:16:43.389342');
INSERT INTO public.logs (id, sql_text, "time") VALUES (528, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:16:43.390372');
INSERT INTO public.logs (id, sql_text, "time") VALUES (529, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:16:43.391007');
INSERT INTO public.logs (id, sql_text, "time") VALUES (530, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:16:46.146933');
INSERT INTO public.logs (id, sql_text, "time") VALUES (531, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:16:46.147791');
INSERT INTO public.logs (id, sql_text, "time") VALUES (532, 'SELECT * FROM tasks WHERE executor=2 AND status=''not started'' ORDER BY time;', '2023-10-19 16:16:46.14883');
INSERT INTO public.logs (id, sql_text, "time") VALUES (533, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:16:46.150034');
INSERT INTO public.logs (id, sql_text, "time") VALUES (534, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:16:46.151351');
INSERT INTO public.logs (id, sql_text, "time") VALUES (535, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:16:59.459582');
INSERT INTO public.logs (id, sql_text, "time") VALUES (536, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:16:59.46851');
INSERT INTO public.logs (id, sql_text, "time") VALUES (537, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:16:59.486342');
INSERT INTO public.logs (id, sql_text, "time") VALUES (538, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:16:59.487269');
INSERT INTO public.logs (id, sql_text, "time") VALUES (539, 'SELECT * FROM tasks WHERE id=7 ORDER BY time;', '2023-10-19 16:16:59.488374');
INSERT INTO public.logs (id, sql_text, "time") VALUES (540, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:16:59.489139');
INSERT INTO public.logs (id, sql_text, "time") VALUES (541, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:16:59.489834');
INSERT INTO public.logs (id, sql_text, "time") VALUES (542, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:23:23.526418');
INSERT INTO public.logs (id, sql_text, "time") VALUES (543, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:23:23.544472');
INSERT INTO public.logs (id, sql_text, "time") VALUES (544, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:23:23.545405');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1269, 'SELECT * FROM parts;', '2023-10-19 18:01:47.741603');
INSERT INTO public.logs (id, sql_text, "time") VALUES (545, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:23:23.547596');
INSERT INTO public.logs (id, sql_text, "time") VALUES (546, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:23:23.549507');
INSERT INTO public.logs (id, sql_text, "time") VALUES (547, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:23:23.558036');
INSERT INTO public.logs (id, sql_text, "time") VALUES (548, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:23:23.558934');
INSERT INTO public.logs (id, sql_text, "time") VALUES (549, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:23:23.559632');
INSERT INTO public.logs (id, sql_text, "time") VALUES (550, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:23:25.305381');
INSERT INTO public.logs (id, sql_text, "time") VALUES (551, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:23:25.31362');
INSERT INTO public.logs (id, sql_text, "time") VALUES (552, 'SELECT * FROM tasks WHERE executor=2 AND status=''finished''  ORDER BY time;', '2023-10-19 16:23:25.315837');
INSERT INTO public.logs (id, sql_text, "time") VALUES (553, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:23:26.486428');
INSERT INTO public.logs (id, sql_text, "time") VALUES (554, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:23:26.494712');
INSERT INTO public.logs (id, sql_text, "time") VALUES (555, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:23:26.496057');
INSERT INTO public.logs (id, sql_text, "time") VALUES (556, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:23:26.4975');
INSERT INTO public.logs (id, sql_text, "time") VALUES (557, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:23:26.498414');
INSERT INTO public.logs (id, sql_text, "time") VALUES (558, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:23:26.49948');
INSERT INTO public.logs (id, sql_text, "time") VALUES (559, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:23:26.500581');
INSERT INTO public.logs (id, sql_text, "time") VALUES (560, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:23:26.501289');
INSERT INTO public.logs (id, sql_text, "time") VALUES (561, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:23:28.590889');
INSERT INTO public.logs (id, sql_text, "time") VALUES (562, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:23:28.598951');
INSERT INTO public.logs (id, sql_text, "time") VALUES (563, 'SELECT * FROM users;', '2023-10-19 16:23:28.60003');
INSERT INTO public.logs (id, sql_text, "time") VALUES (564, 'SELECT * FROM parts;', '2023-10-19 16:23:28.601091');
INSERT INTO public.logs (id, sql_text, "time") VALUES (565, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:24:36.94757');
INSERT INTO public.logs (id, sql_text, "time") VALUES (566, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:24:36.948744');
INSERT INTO public.logs (id, sql_text, "time") VALUES (567, 'SELECT * FROM users;', '2023-10-19 16:24:36.949465');
INSERT INTO public.logs (id, sql_text, "time") VALUES (568, 'INSERT INTO tasks (executor, client, text, target, count, status) VALUES (2, 1, ''Выполнить детали в необходимом количестве'', 18, 3, ''not started'')', '2023-10-19 16:24:36.950277');
INSERT INTO public.logs (id, sql_text, "time") VALUES (569, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:24:36.962419');
INSERT INTO public.logs (id, sql_text, "time") VALUES (570, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:24:36.963791');
INSERT INTO public.logs (id, sql_text, "time") VALUES (571, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:24:36.964569');
INSERT INTO public.logs (id, sql_text, "time") VALUES (572, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:24:36.965323');
INSERT INTO public.logs (id, sql_text, "time") VALUES (573, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:24:36.965997');
INSERT INTO public.logs (id, sql_text, "time") VALUES (574, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:24:36.966754');
INSERT INTO public.logs (id, sql_text, "time") VALUES (575, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:24:36.967373');
INSERT INTO public.logs (id, sql_text, "time") VALUES (576, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:24:36.967988');
INSERT INTO public.logs (id, sql_text, "time") VALUES (577, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:24:39.916011');
INSERT INTO public.logs (id, sql_text, "time") VALUES (578, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:24:39.924306');
INSERT INTO public.logs (id, sql_text, "time") VALUES (579, 'SELECT * FROM tasks WHERE executor=2 AND status=''finished''  ORDER BY time;', '2023-10-19 16:24:39.925049');
INSERT INTO public.logs (id, sql_text, "time") VALUES (580, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:24:42.93674');
INSERT INTO public.logs (id, sql_text, "time") VALUES (581, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:24:42.944744');
INSERT INTO public.logs (id, sql_text, "time") VALUES (582, 'SELECT * FROM tasks WHERE executor=2 AND status=''not started'' ORDER BY time;', '2023-10-19 16:24:42.94578');
INSERT INTO public.logs (id, sql_text, "time") VALUES (583, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:24:42.946611');
INSERT INTO public.logs (id, sql_text, "time") VALUES (584, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:24:42.947351');
INSERT INTO public.logs (id, sql_text, "time") VALUES (585, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:24:42.948458');
INSERT INTO public.logs (id, sql_text, "time") VALUES (586, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:24:49.007251');
INSERT INTO public.logs (id, sql_text, "time") VALUES (587, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:24:49.015201');
INSERT INTO public.logs (id, sql_text, "time") VALUES (588, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:24:49.033919');
INSERT INTO public.logs (id, sql_text, "time") VALUES (589, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:24:49.034899');
INSERT INTO public.logs (id, sql_text, "time") VALUES (590, 'SELECT * FROM tasks WHERE id=8 ORDER BY time;', '2023-10-19 16:24:49.036008');
INSERT INTO public.logs (id, sql_text, "time") VALUES (591, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:24:49.037631');
INSERT INTO public.logs (id, sql_text, "time") VALUES (592, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:24:49.038339');
INSERT INTO public.logs (id, sql_text, "time") VALUES (593, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:24:49.038978');
INSERT INTO public.logs (id, sql_text, "time") VALUES (594, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:46:03.147399');
INSERT INTO public.logs (id, sql_text, "time") VALUES (595, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:46:03.160745');
INSERT INTO public.logs (id, sql_text, "time") VALUES (596, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:46:03.170931');
INSERT INTO public.logs (id, sql_text, "time") VALUES (597, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:46:03.172031');
INSERT INTO public.logs (id, sql_text, "time") VALUES (598, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:46:03.172792');
INSERT INTO public.logs (id, sql_text, "time") VALUES (599, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:46:03.174956');
INSERT INTO public.logs (id, sql_text, "time") VALUES (600, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:46:03.176737');
INSERT INTO public.logs (id, sql_text, "time") VALUES (601, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:46:03.185042');
INSERT INTO public.logs (id, sql_text, "time") VALUES (602, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:46:03.186671');
INSERT INTO public.logs (id, sql_text, "time") VALUES (603, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:46:03.187507');
INSERT INTO public.logs (id, sql_text, "time") VALUES (604, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:46:07.516584');
INSERT INTO public.logs (id, sql_text, "time") VALUES (605, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:46:07.524846');
INSERT INTO public.logs (id, sql_text, "time") VALUES (606, 'SELECT * FROM tasks WHERE executor=2 AND status=''finished''  ORDER BY time;', '2023-10-19 16:46:07.526074');
INSERT INTO public.logs (id, sql_text, "time") VALUES (607, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:46:09.768203');
INSERT INTO public.logs (id, sql_text, "time") VALUES (608, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:46:09.776186');
INSERT INTO public.logs (id, sql_text, "time") VALUES (609, 'SELECT * FROM tasks WHERE executor=2 AND status=''not started'' ORDER BY time;', '2023-10-19 16:46:09.777173');
INSERT INTO public.logs (id, sql_text, "time") VALUES (610, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:46:09.777987');
INSERT INTO public.logs (id, sql_text, "time") VALUES (611, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:46:09.778775');
INSERT INTO public.logs (id, sql_text, "time") VALUES (612, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:46:09.779744');
INSERT INTO public.logs (id, sql_text, "time") VALUES (613, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:46:30.973478');
INSERT INTO public.logs (id, sql_text, "time") VALUES (614, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:46:30.98177');
INSERT INTO public.logs (id, sql_text, "time") VALUES (615, 'SELECT * FROM tasks WHERE executor=2 AND status=''not started'' ORDER BY time;', '2023-10-19 16:46:30.982489');
INSERT INTO public.logs (id, sql_text, "time") VALUES (616, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:46:30.983152');
INSERT INTO public.logs (id, sql_text, "time") VALUES (617, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:46:30.983928');
INSERT INTO public.logs (id, sql_text, "time") VALUES (618, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:46:30.984603');
INSERT INTO public.logs (id, sql_text, "time") VALUES (619, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:46:32.277934');
INSERT INTO public.logs (id, sql_text, "time") VALUES (620, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:46:32.28581');
INSERT INTO public.logs (id, sql_text, "time") VALUES (703, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:47:26.365819');
INSERT INTO public.logs (id, sql_text, "time") VALUES (621, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:46:32.30166');
INSERT INTO public.logs (id, sql_text, "time") VALUES (622, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:46:32.302873');
INSERT INTO public.logs (id, sql_text, "time") VALUES (623, 'SELECT * FROM tasks WHERE id=8 ORDER BY time;', '2023-10-19 16:46:32.303649');
INSERT INTO public.logs (id, sql_text, "time") VALUES (624, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:46:32.304409');
INSERT INTO public.logs (id, sql_text, "time") VALUES (625, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:46:32.305106');
INSERT INTO public.logs (id, sql_text, "time") VALUES (626, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:46:32.305844');
INSERT INTO public.logs (id, sql_text, "time") VALUES (627, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:46:35.030305');
INSERT INTO public.logs (id, sql_text, "time") VALUES (628, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:46:35.038359');
INSERT INTO public.logs (id, sql_text, "time") VALUES (629, 'SELECT * FROM tasks WHERE id=8 ORDER BY time;', '2023-10-19 16:46:35.039383');
INSERT INTO public.logs (id, sql_text, "time") VALUES (630, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:46:35.040405');
INSERT INTO public.logs (id, sql_text, "time") VALUES (631, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:46:35.041742');
INSERT INTO public.logs (id, sql_text, "time") VALUES (632, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:46:35.042483');
INSERT INTO public.logs (id, sql_text, "time") VALUES (633, 'UPDATE tasks SET status=''in work'', start_time=CURRENT_TIMESTAMP WHERE id=8;', '2023-10-19 16:46:35.043305');
INSERT INTO public.logs (id, sql_text, "time") VALUES (634, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:46:35.05164');
INSERT INTO public.logs (id, sql_text, "time") VALUES (635, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:46:35.052461');
INSERT INTO public.logs (id, sql_text, "time") VALUES (636, 'SELECT * FROM tasks WHERE id=8 ORDER BY time;', '2023-10-19 16:46:35.0531');
INSERT INTO public.logs (id, sql_text, "time") VALUES (637, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:46:35.053808');
INSERT INTO public.logs (id, sql_text, "time") VALUES (638, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:46:35.054441');
INSERT INTO public.logs (id, sql_text, "time") VALUES (639, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:46:35.055046');
INSERT INTO public.logs (id, sql_text, "time") VALUES (640, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:46:37.08028');
INSERT INTO public.logs (id, sql_text, "time") VALUES (641, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:46:37.088529');
INSERT INTO public.logs (id, sql_text, "time") VALUES (642, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:46:37.08929');
INSERT INTO public.logs (id, sql_text, "time") VALUES (643, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:46:37.090131');
INSERT INTO public.logs (id, sql_text, "time") VALUES (644, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:46:37.090805');
INSERT INTO public.logs (id, sql_text, "time") VALUES (645, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:46:37.091427');
INSERT INTO public.logs (id, sql_text, "time") VALUES (646, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:46:37.092114');
INSERT INTO public.logs (id, sql_text, "time") VALUES (647, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:46:37.092698');
INSERT INTO public.logs (id, sql_text, "time") VALUES (648, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:46:37.093283');
INSERT INTO public.logs (id, sql_text, "time") VALUES (649, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:46:37.093807');
INSERT INTO public.logs (id, sql_text, "time") VALUES (650, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:46:37.094277');
INSERT INTO public.logs (id, sql_text, "time") VALUES (651, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:47:05.686993');
INSERT INTO public.logs (id, sql_text, "time") VALUES (652, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:47:05.705654');
INSERT INTO public.logs (id, sql_text, "time") VALUES (653, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:47:05.706564');
INSERT INTO public.logs (id, sql_text, "time") VALUES (654, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:47:05.70867');
INSERT INTO public.logs (id, sql_text, "time") VALUES (655, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:47:05.709408');
INSERT INTO public.logs (id, sql_text, "time") VALUES (656, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:47:05.710121');
INSERT INTO public.logs (id, sql_text, "time") VALUES (657, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:47:05.719787');
INSERT INTO public.logs (id, sql_text, "time") VALUES (658, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:47:05.720624');
INSERT INTO public.logs (id, sql_text, "time") VALUES (659, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:47:05.721514');
INSERT INTO public.logs (id, sql_text, "time") VALUES (660, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:47:05.722225');
INSERT INTO public.logs (id, sql_text, "time") VALUES (661, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:47:05.722932');
INSERT INTO public.logs (id, sql_text, "time") VALUES (662, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:47:09.257467');
INSERT INTO public.logs (id, sql_text, "time") VALUES (663, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:47:09.26578');
INSERT INTO public.logs (id, sql_text, "time") VALUES (664, 'SELECT * FROM tasks WHERE executor=2 AND status=''finished''  ORDER BY time;', '2023-10-19 16:47:09.266503');
INSERT INTO public.logs (id, sql_text, "time") VALUES (665, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:47:12.89739');
INSERT INTO public.logs (id, sql_text, "time") VALUES (666, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:47:12.898228');
INSERT INTO public.logs (id, sql_text, "time") VALUES (667, 'SELECT * FROM tasks WHERE id=8 ORDER BY time;', '2023-10-19 16:47:12.898914');
INSERT INTO public.logs (id, sql_text, "time") VALUES (668, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:47:12.899769');
INSERT INTO public.logs (id, sql_text, "time") VALUES (669, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:47:12.900389');
INSERT INTO public.logs (id, sql_text, "time") VALUES (670, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:47:12.901028');
INSERT INTO public.logs (id, sql_text, "time") VALUES (671, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:47:14.314057');
INSERT INTO public.logs (id, sql_text, "time") VALUES (672, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:47:14.322014');
INSERT INTO public.logs (id, sql_text, "time") VALUES (673, 'SELECT * FROM tasks WHERE id=8 ORDER BY time;', '2023-10-19 16:47:14.322738');
INSERT INTO public.logs (id, sql_text, "time") VALUES (674, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:47:14.323486');
INSERT INTO public.logs (id, sql_text, "time") VALUES (675, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:47:14.324173');
INSERT INTO public.logs (id, sql_text, "time") VALUES (676, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:47:14.324897');
INSERT INTO public.logs (id, sql_text, "time") VALUES (677, 'UPDATE tasks SET status=''finished'', finish_time=CURRENT_TIMESTAMP WHERE id=8;', '2023-10-19 16:47:14.326002');
INSERT INTO public.logs (id, sql_text, "time") VALUES (678, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:47:14.343675');
INSERT INTO public.logs (id, sql_text, "time") VALUES (679, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:47:14.344455');
INSERT INTO public.logs (id, sql_text, "time") VALUES (680, 'SELECT * FROM tasks WHERE id=8 ORDER BY time;', '2023-10-19 16:47:14.345078');
INSERT INTO public.logs (id, sql_text, "time") VALUES (681, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:47:14.345758');
INSERT INTO public.logs (id, sql_text, "time") VALUES (682, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:47:14.346384');
INSERT INTO public.logs (id, sql_text, "time") VALUES (683, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:47:14.346973');
INSERT INTO public.logs (id, sql_text, "time") VALUES (684, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:47:15.63733');
INSERT INTO public.logs (id, sql_text, "time") VALUES (685, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:47:15.645504');
INSERT INTO public.logs (id, sql_text, "time") VALUES (686, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time;', '2023-10-19 16:47:15.64658');
INSERT INTO public.logs (id, sql_text, "time") VALUES (687, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:47:15.648381');
INSERT INTO public.logs (id, sql_text, "time") VALUES (688, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:47:15.650152');
INSERT INTO public.logs (id, sql_text, "time") VALUES (689, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:47:15.651319');
INSERT INTO public.logs (id, sql_text, "time") VALUES (690, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:47:15.652037');
INSERT INTO public.logs (id, sql_text, "time") VALUES (691, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:47:15.652804');
INSERT INTO public.logs (id, sql_text, "time") VALUES (692, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:47:16.663459');
INSERT INTO public.logs (id, sql_text, "time") VALUES (693, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:47:16.67168');
INSERT INTO public.logs (id, sql_text, "time") VALUES (694, 'SELECT * FROM tasks WHERE executor=2 AND status=''finished''  ORDER BY time;', '2023-10-19 16:47:16.672574');
INSERT INTO public.logs (id, sql_text, "time") VALUES (695, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:47:16.673245');
INSERT INTO public.logs (id, sql_text, "time") VALUES (696, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:47:16.67396');
INSERT INTO public.logs (id, sql_text, "time") VALUES (697, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:47:16.674755');
INSERT INTO public.logs (id, sql_text, "time") VALUES (698, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:47:26.344092');
INSERT INTO public.logs (id, sql_text, "time") VALUES (699, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:47:26.352159');
INSERT INTO public.logs (id, sql_text, "time") VALUES (700, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 16:47:26.363361');
INSERT INTO public.logs (id, sql_text, "time") VALUES (701, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 16:47:26.364275');
INSERT INTO public.logs (id, sql_text, "time") VALUES (702, 'SELECT * FROM tasks WHERE id=8 ORDER BY time;', '2023-10-19 16:47:26.365059');
INSERT INTO public.logs (id, sql_text, "time") VALUES (704, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:47:26.366607');
INSERT INTO public.logs (id, sql_text, "time") VALUES (705, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:47:26.367653');
INSERT INTO public.logs (id, sql_text, "time") VALUES (706, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:56:19.979108');
INSERT INTO public.logs (id, sql_text, "time") VALUES (707, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:56:19.990459');
INSERT INTO public.logs (id, sql_text, "time") VALUES (708, 'SELECT * FROM users;', '2023-10-19 16:56:19.991378');
INSERT INTO public.logs (id, sql_text, "time") VALUES (709, 'SELECT * FROM parts;', '2023-10-19 16:56:19.992099');
INSERT INTO public.logs (id, sql_text, "time") VALUES (710, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:56:26.908733');
INSERT INTO public.logs (id, sql_text, "time") VALUES (711, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:56:26.909679');
INSERT INTO public.logs (id, sql_text, "time") VALUES (712, 'SELECT * FROM users;', '2023-10-19 16:56:26.910303');
INSERT INTO public.logs (id, sql_text, "time") VALUES (713, 'INSERT INTO tasks (executor, client, text, target, count, status) VALUES (1, 1, ''ауипвдьэждапиэьпиэ'', 15, 4, ''not started'')', '2023-10-19 16:56:26.911079');
INSERT INTO public.logs (id, sql_text, "time") VALUES (714, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:56:26.924767');
INSERT INTO public.logs (id, sql_text, "time") VALUES (715, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:56:26.925663');
INSERT INTO public.logs (id, sql_text, "time") VALUES (716, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:56:26.926333');
INSERT INTO public.logs (id, sql_text, "time") VALUES (717, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:56:26.927837');
INSERT INTO public.logs (id, sql_text, "time") VALUES (718, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:56:26.928573');
INSERT INTO public.logs (id, sql_text, "time") VALUES (719, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:56:26.929431');
INSERT INTO public.logs (id, sql_text, "time") VALUES (720, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:56:26.93025');
INSERT INTO public.logs (id, sql_text, "time") VALUES (721, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:56:26.930994');
INSERT INTO public.logs (id, sql_text, "time") VALUES (722, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:59:28.070803');
INSERT INTO public.logs (id, sql_text, "time") VALUES (723, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:59:28.089688');
INSERT INTO public.logs (id, sql_text, "time") VALUES (724, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 16:59:28.090585');
INSERT INTO public.logs (id, sql_text, "time") VALUES (725, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 16:59:28.092503');
INSERT INTO public.logs (id, sql_text, "time") VALUES (726, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 16:59:28.094185');
INSERT INTO public.logs (id, sql_text, "time") VALUES (727, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 16:59:28.102636');
INSERT INTO public.logs (id, sql_text, "time") VALUES (728, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 16:59:28.103465');
INSERT INTO public.logs (id, sql_text, "time") VALUES (729, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 16:59:28.104148');
INSERT INTO public.logs (id, sql_text, "time") VALUES (730, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 16:59:29.727462');
INSERT INTO public.logs (id, sql_text, "time") VALUES (731, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 16:59:29.735816');
INSERT INTO public.logs (id, sql_text, "time") VALUES (732, 'SELECT * FROM tasks ORDER BY time', '2023-10-19 16:59:29.736684');
INSERT INTO public.logs (id, sql_text, "time") VALUES (733, 'SELECT * FROM users WHERE id=2', '2023-10-19 16:59:29.737382');
INSERT INTO public.logs (id, sql_text, "time") VALUES (734, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:59:29.738124');
INSERT INTO public.logs (id, sql_text, "time") VALUES (735, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 16:59:29.73892');
INSERT INTO public.logs (id, sql_text, "time") VALUES (736, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:59:29.74099');
INSERT INTO public.logs (id, sql_text, "time") VALUES (737, 'SELECT * FROM users WHERE id=1', '2023-10-19 16:59:29.741796');
INSERT INTO public.logs (id, sql_text, "time") VALUES (738, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 16:59:29.742403');
INSERT INTO public.logs (id, sql_text, "time") VALUES (739, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:01:07.629296');
INSERT INTO public.logs (id, sql_text, "time") VALUES (740, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:01:07.648305');
INSERT INTO public.logs (id, sql_text, "time") VALUES (741, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time;', '2023-10-19 17:01:07.649246');
INSERT INTO public.logs (id, sql_text, "time") VALUES (742, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:01:07.650918');
INSERT INTO public.logs (id, sql_text, "time") VALUES (743, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:01:07.652275');
INSERT INTO public.logs (id, sql_text, "time") VALUES (744, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:01:07.660627');
INSERT INTO public.logs (id, sql_text, "time") VALUES (745, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:01:07.661804');
INSERT INTO public.logs (id, sql_text, "time") VALUES (746, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:01:07.662897');
INSERT INTO public.logs (id, sql_text, "time") VALUES (747, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:01:09.272287');
INSERT INTO public.logs (id, sql_text, "time") VALUES (748, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:01:09.273258');
INSERT INTO public.logs (id, sql_text, "time") VALUES (749, 'SELECT * FROM tasks ORDER BY time', '2023-10-19 17:01:09.273934');
INSERT INTO public.logs (id, sql_text, "time") VALUES (750, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:01:09.274586');
INSERT INTO public.logs (id, sql_text, "time") VALUES (751, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:01:09.275233');
INSERT INTO public.logs (id, sql_text, "time") VALUES (752, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:01:09.275842');
INSERT INTO public.logs (id, sql_text, "time") VALUES (753, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:01:09.280476');
INSERT INTO public.logs (id, sql_text, "time") VALUES (754, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:01:09.281216');
INSERT INTO public.logs (id, sql_text, "time") VALUES (755, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:01:09.281795');
INSERT INTO public.logs (id, sql_text, "time") VALUES (756, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:01:12.625533');
INSERT INTO public.logs (id, sql_text, "time") VALUES (757, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:01:12.633532');
INSERT INTO public.logs (id, sql_text, "time") VALUES (758, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:01:12.651002');
INSERT INTO public.logs (id, sql_text, "time") VALUES (759, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:01:12.651844');
INSERT INTO public.logs (id, sql_text, "time") VALUES (760, 'SELECT * FROM tasks WHERE id=8 ORDER BY time;', '2023-10-19 17:01:12.652476');
INSERT INTO public.logs (id, sql_text, "time") VALUES (761, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:01:12.653115');
INSERT INTO public.logs (id, sql_text, "time") VALUES (762, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:01:12.653785');
INSERT INTO public.logs (id, sql_text, "time") VALUES (763, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:01:12.65488');
INSERT INTO public.logs (id, sql_text, "time") VALUES (764, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:03:27.480581');
INSERT INTO public.logs (id, sql_text, "time") VALUES (765, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:03:27.49141');
INSERT INTO public.logs (id, sql_text, "time") VALUES (766, 'SELECT * FROM tasks ORDER BY time DESC', '2023-10-19 17:03:27.492419');
INSERT INTO public.logs (id, sql_text, "time") VALUES (767, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:03:27.494359');
INSERT INTO public.logs (id, sql_text, "time") VALUES (768, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:03:27.495137');
INSERT INTO public.logs (id, sql_text, "time") VALUES (769, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:03:27.495809');
INSERT INTO public.logs (id, sql_text, "time") VALUES (770, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:03:27.497827');
INSERT INTO public.logs (id, sql_text, "time") VALUES (771, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:03:27.49841');
INSERT INTO public.logs (id, sql_text, "time") VALUES (772, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:03:27.498922');
INSERT INTO public.logs (id, sql_text, "time") VALUES (773, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:03:33.573255');
INSERT INTO public.logs (id, sql_text, "time") VALUES (774, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:03:33.57403');
INSERT INTO public.logs (id, sql_text, "time") VALUES (775, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:03:33.595305');
INSERT INTO public.logs (id, sql_text, "time") VALUES (776, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:03:33.596142');
INSERT INTO public.logs (id, sql_text, "time") VALUES (777, 'SELECT * FROM tasks WHERE id=9 ORDER BY time DESC;', '2023-10-19 17:03:33.596812');
INSERT INTO public.logs (id, sql_text, "time") VALUES (778, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:03:33.597607');
INSERT INTO public.logs (id, sql_text, "time") VALUES (779, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:03:33.598291');
INSERT INTO public.logs (id, sql_text, "time") VALUES (780, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:03:33.598971');
INSERT INTO public.logs (id, sql_text, "time") VALUES (781, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:04:29.672853');
INSERT INTO public.logs (id, sql_text, "time") VALUES (782, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:04:29.691149');
INSERT INTO public.logs (id, sql_text, "time") VALUES (783, 'SELECT * FROM tasks WHERE id=9 ORDER BY time DESC;', '2023-10-19 17:04:29.692342');
INSERT INTO public.logs (id, sql_text, "time") VALUES (784, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:04:29.69452');
INSERT INTO public.logs (id, sql_text, "time") VALUES (785, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:04:29.695325');
INSERT INTO public.logs (id, sql_text, "time") VALUES (786, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:04:29.69602');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1184, 'SELECT * FROM users;', '2023-10-19 18:00:56.451117');
INSERT INTO public.logs (id, sql_text, "time") VALUES (787, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:04:34.607095');
INSERT INTO public.logs (id, sql_text, "time") VALUES (788, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:04:34.615831');
INSERT INTO public.logs (id, sql_text, "time") VALUES (789, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:04:34.616674');
INSERT INTO public.logs (id, sql_text, "time") VALUES (790, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:04:34.617475');
INSERT INTO public.logs (id, sql_text, "time") VALUES (791, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:04:34.618261');
INSERT INTO public.logs (id, sql_text, "time") VALUES (792, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:04:34.626919');
INSERT INTO public.logs (id, sql_text, "time") VALUES (793, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:04:34.627689');
INSERT INTO public.logs (id, sql_text, "time") VALUES (794, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:04:34.628355');
INSERT INTO public.logs (id, sql_text, "time") VALUES (795, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:04:35.806867');
INSERT INTO public.logs (id, sql_text, "time") VALUES (796, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:04:35.814763');
INSERT INTO public.logs (id, sql_text, "time") VALUES (797, 'SELECT * FROM tasks ORDER BY time DESC', '2023-10-19 17:04:35.815534');
INSERT INTO public.logs (id, sql_text, "time") VALUES (798, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:04:35.816302');
INSERT INTO public.logs (id, sql_text, "time") VALUES (799, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:04:35.817043');
INSERT INTO public.logs (id, sql_text, "time") VALUES (800, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:04:35.817706');
INSERT INTO public.logs (id, sql_text, "time") VALUES (801, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:04:35.818894');
INSERT INTO public.logs (id, sql_text, "time") VALUES (802, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:04:35.81983');
INSERT INTO public.logs (id, sql_text, "time") VALUES (803, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:04:35.820489');
INSERT INTO public.logs (id, sql_text, "time") VALUES (804, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:04:37.648527');
INSERT INTO public.logs (id, sql_text, "time") VALUES (805, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:04:37.649385');
INSERT INTO public.logs (id, sql_text, "time") VALUES (806, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:04:37.665899');
INSERT INTO public.logs (id, sql_text, "time") VALUES (807, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:04:37.666662');
INSERT INTO public.logs (id, sql_text, "time") VALUES (808, 'SELECT * FROM tasks WHERE id=9 ORDER BY time DESC;', '2023-10-19 17:04:37.667339');
INSERT INTO public.logs (id, sql_text, "time") VALUES (809, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:04:37.668003');
INSERT INTO public.logs (id, sql_text, "time") VALUES (810, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:04:37.668638');
INSERT INTO public.logs (id, sql_text, "time") VALUES (811, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:04:37.669535');
INSERT INTO public.logs (id, sql_text, "time") VALUES (812, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:05:17.695987');
INSERT INTO public.logs (id, sql_text, "time") VALUES (813, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:05:17.697075');
INSERT INTO public.logs (id, sql_text, "time") VALUES (814, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:05:17.703961');
INSERT INTO public.logs (id, sql_text, "time") VALUES (815, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:05:17.704759');
INSERT INTO public.logs (id, sql_text, "time") VALUES (816, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:05:17.705537');
INSERT INTO public.logs (id, sql_text, "time") VALUES (817, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:05:17.706686');
INSERT INTO public.logs (id, sql_text, "time") VALUES (818, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:05:17.708172');
INSERT INTO public.logs (id, sql_text, "time") VALUES (819, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:05:17.70923');
INSERT INTO public.logs (id, sql_text, "time") VALUES (820, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:05:17.709927');
INSERT INTO public.logs (id, sql_text, "time") VALUES (821, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:05:17.710519');
INSERT INTO public.logs (id, sql_text, "time") VALUES (822, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:05:25.099113');
INSERT INTO public.logs (id, sql_text, "time") VALUES (823, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:05:25.107201');
INSERT INTO public.logs (id, sql_text, "time") VALUES (824, 'SELECT * FROM tasks ORDER BY time DESC', '2023-10-19 17:05:25.108381');
INSERT INTO public.logs (id, sql_text, "time") VALUES (825, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:05:25.109263');
INSERT INTO public.logs (id, sql_text, "time") VALUES (826, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:05:25.109957');
INSERT INTO public.logs (id, sql_text, "time") VALUES (827, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:05:25.110597');
INSERT INTO public.logs (id, sql_text, "time") VALUES (828, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:05:25.111599');
INSERT INTO public.logs (id, sql_text, "time") VALUES (829, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:05:25.112667');
INSERT INTO public.logs (id, sql_text, "time") VALUES (830, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:05:25.113738');
INSERT INTO public.logs (id, sql_text, "time") VALUES (831, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:05:29.619159');
INSERT INTO public.logs (id, sql_text, "time") VALUES (832, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:05:29.627591');
INSERT INTO public.logs (id, sql_text, "time") VALUES (833, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:05:29.628431');
INSERT INTO public.logs (id, sql_text, "time") VALUES (834, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:05:29.629132');
INSERT INTO public.logs (id, sql_text, "time") VALUES (835, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:05:29.629844');
INSERT INTO public.logs (id, sql_text, "time") VALUES (836, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:05:29.630807');
INSERT INTO public.logs (id, sql_text, "time") VALUES (837, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:05:29.632487');
INSERT INTO public.logs (id, sql_text, "time") VALUES (838, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:05:29.633579');
INSERT INTO public.logs (id, sql_text, "time") VALUES (839, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:05:30.74413');
INSERT INTO public.logs (id, sql_text, "time") VALUES (840, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:05:30.745627');
INSERT INTO public.logs (id, sql_text, "time") VALUES (841, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''verapashkova''', '2023-10-19 17:05:30.753054');
INSERT INTO public.logs (id, sql_text, "time") VALUES (842, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:05:49.993183');
INSERT INTO public.logs (id, sql_text, "time") VALUES (843, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:05:50.001684');
INSERT INTO public.logs (id, sql_text, "time") VALUES (844, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''verapashkova''', '2023-10-19 17:05:50.012036');
INSERT INTO public.logs (id, sql_text, "time") VALUES (845, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:06:43.26703');
INSERT INTO public.logs (id, sql_text, "time") VALUES (846, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:06:43.275705');
INSERT INTO public.logs (id, sql_text, "time") VALUES (847, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:06:43.28303');
INSERT INTO public.logs (id, sql_text, "time") VALUES (848, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:06:43.283823');
INSERT INTO public.logs (id, sql_text, "time") VALUES (849, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:06:43.28442');
INSERT INTO public.logs (id, sql_text, "time") VALUES (850, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:06:43.28503');
INSERT INTO public.logs (id, sql_text, "time") VALUES (851, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:06:43.285551');
INSERT INTO public.logs (id, sql_text, "time") VALUES (852, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:06:43.286086');
INSERT INTO public.logs (id, sql_text, "time") VALUES (853, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:06:43.286551');
INSERT INTO public.logs (id, sql_text, "time") VALUES (854, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:06:43.287008');
INSERT INTO public.logs (id, sql_text, "time") VALUES (855, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:06:44.556258');
INSERT INTO public.logs (id, sql_text, "time") VALUES (856, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:06:44.56418');
INSERT INTO public.logs (id, sql_text, "time") VALUES (857, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:06:44.573107');
INSERT INTO public.logs (id, sql_text, "time") VALUES (858, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:06:44.573974');
INSERT INTO public.logs (id, sql_text, "time") VALUES (859, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:06:44.574574');
INSERT INTO public.logs (id, sql_text, "time") VALUES (860, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:06:44.575327');
INSERT INTO public.logs (id, sql_text, "time") VALUES (861, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:06:44.576088');
INSERT INTO public.logs (id, sql_text, "time") VALUES (862, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:06:44.576889');
INSERT INTO public.logs (id, sql_text, "time") VALUES (863, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:06:44.577694');
INSERT INTO public.logs (id, sql_text, "time") VALUES (864, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:06:44.578911');
INSERT INTO public.logs (id, sql_text, "time") VALUES (865, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:06:45.551316');
INSERT INTO public.logs (id, sql_text, "time") VALUES (866, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:06:45.559753');
INSERT INTO public.logs (id, sql_text, "time") VALUES (867, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:06:45.567367');
INSERT INTO public.logs (id, sql_text, "time") VALUES (868, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:06:45.568415');
INSERT INTO public.logs (id, sql_text, "time") VALUES (869, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:06:45.569076');
INSERT INTO public.logs (id, sql_text, "time") VALUES (870, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:06:45.569653');
INSERT INTO public.logs (id, sql_text, "time") VALUES (871, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:06:45.570286');
INSERT INTO public.logs (id, sql_text, "time") VALUES (872, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:06:45.570848');
INSERT INTO public.logs (id, sql_text, "time") VALUES (873, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:06:45.571565');
INSERT INTO public.logs (id, sql_text, "time") VALUES (874, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:06:45.571996');
INSERT INTO public.logs (id, sql_text, "time") VALUES (875, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:06:46.853072');
INSERT INTO public.logs (id, sql_text, "time") VALUES (876, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:06:46.861222');
INSERT INTO public.logs (id, sql_text, "time") VALUES (877, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''verapashkova''', '2023-10-19 17:06:46.870243');
INSERT INTO public.logs (id, sql_text, "time") VALUES (878, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:07:35.853469');
INSERT INTO public.logs (id, sql_text, "time") VALUES (879, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:07:35.87131');
INSERT INTO public.logs (id, sql_text, "time") VALUES (880, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:07:35.885912');
INSERT INTO public.logs (id, sql_text, "time") VALUES (881, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:07:35.886895');
INSERT INTO public.logs (id, sql_text, "time") VALUES (882, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:07:35.887628');
INSERT INTO public.logs (id, sql_text, "time") VALUES (883, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:07:35.889542');
INSERT INTO public.logs (id, sql_text, "time") VALUES (884, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:07:35.891196');
INSERT INTO public.logs (id, sql_text, "time") VALUES (885, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:07:35.900159');
INSERT INTO public.logs (id, sql_text, "time") VALUES (886, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:07:35.900983');
INSERT INTO public.logs (id, sql_text, "time") VALUES (887, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:07:35.901722');
INSERT INTO public.logs (id, sql_text, "time") VALUES (888, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:07:37.26369');
INSERT INTO public.logs (id, sql_text, "time") VALUES (889, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:07:37.271856');
INSERT INTO public.logs (id, sql_text, "time") VALUES (890, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:07:37.281189');
INSERT INTO public.logs (id, sql_text, "time") VALUES (891, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:07:37.281989');
INSERT INTO public.logs (id, sql_text, "time") VALUES (892, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:07:37.28262');
INSERT INTO public.logs (id, sql_text, "time") VALUES (893, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:07:37.283273');
INSERT INTO public.logs (id, sql_text, "time") VALUES (894, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:07:37.283908');
INSERT INTO public.logs (id, sql_text, "time") VALUES (895, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:07:37.28457');
INSERT INTO public.logs (id, sql_text, "time") VALUES (896, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:07:37.285186');
INSERT INTO public.logs (id, sql_text, "time") VALUES (897, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:07:37.285791');
INSERT INTO public.logs (id, sql_text, "time") VALUES (898, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:07:38.635571');
INSERT INTO public.logs (id, sql_text, "time") VALUES (899, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:07:38.643373');
INSERT INTO public.logs (id, sql_text, "time") VALUES (900, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:07:38.650826');
INSERT INTO public.logs (id, sql_text, "time") VALUES (901, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:07:38.651667');
INSERT INTO public.logs (id, sql_text, "time") VALUES (902, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:07:38.652541');
INSERT INTO public.logs (id, sql_text, "time") VALUES (903, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:07:38.653497');
INSERT INTO public.logs (id, sql_text, "time") VALUES (904, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:07:38.654195');
INSERT INTO public.logs (id, sql_text, "time") VALUES (905, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:07:38.655092');
INSERT INTO public.logs (id, sql_text, "time") VALUES (906, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:07:38.655838');
INSERT INTO public.logs (id, sql_text, "time") VALUES (907, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:07:38.65652');
INSERT INTO public.logs (id, sql_text, "time") VALUES (908, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:07:48.772941');
INSERT INTO public.logs (id, sql_text, "time") VALUES (909, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:07:48.781881');
INSERT INTO public.logs (id, sql_text, "time") VALUES (910, 'SELECT * FROM parts;', '2023-10-19 17:07:48.78256');
INSERT INTO public.logs (id, sql_text, "time") VALUES (911, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:08:22.826656');
INSERT INTO public.logs (id, sql_text, "time") VALUES (912, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:08:22.834679');
INSERT INTO public.logs (id, sql_text, "time") VALUES (913, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:08:22.835722');
INSERT INTO public.logs (id, sql_text, "time") VALUES (914, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:08:22.837305');
INSERT INTO public.logs (id, sql_text, "time") VALUES (915, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:08:22.838217');
INSERT INTO public.logs (id, sql_text, "time") VALUES (916, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:08:24.351251');
INSERT INTO public.logs (id, sql_text, "time") VALUES (917, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:08:24.359986');
INSERT INTO public.logs (id, sql_text, "time") VALUES (918, 'SELECT * FROM parts;', '2023-10-19 17:08:24.360676');
INSERT INTO public.logs (id, sql_text, "time") VALUES (919, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:08:24.361511');
INSERT INTO public.logs (id, sql_text, "time") VALUES (920, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:11:33.907679');
INSERT INTO public.logs (id, sql_text, "time") VALUES (921, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:11:33.926726');
INSERT INTO public.logs (id, sql_text, "time") VALUES (922, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:11:33.927629');
INSERT INTO public.logs (id, sql_text, "time") VALUES (923, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:11:33.929645');
INSERT INTO public.logs (id, sql_text, "time") VALUES (924, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:11:33.931309');
INSERT INTO public.logs (id, sql_text, "time") VALUES (925, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:11:33.939985');
INSERT INTO public.logs (id, sql_text, "time") VALUES (926, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:11:33.940811');
INSERT INTO public.logs (id, sql_text, "time") VALUES (927, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:11:33.941473');
INSERT INTO public.logs (id, sql_text, "time") VALUES (928, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:11:35.821877');
INSERT INTO public.logs (id, sql_text, "time") VALUES (929, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:11:35.830847');
INSERT INTO public.logs (id, sql_text, "time") VALUES (930, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:11:35.842805');
INSERT INTO public.logs (id, sql_text, "time") VALUES (931, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:11:35.843541');
INSERT INTO public.logs (id, sql_text, "time") VALUES (932, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:11:35.844183');
INSERT INTO public.logs (id, sql_text, "time") VALUES (933, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:11:35.844792');
INSERT INTO public.logs (id, sql_text, "time") VALUES (934, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:11:35.84542');
INSERT INTO public.logs (id, sql_text, "time") VALUES (935, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:11:35.846093');
INSERT INTO public.logs (id, sql_text, "time") VALUES (936, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:11:35.846684');
INSERT INTO public.logs (id, sql_text, "time") VALUES (937, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:11:35.847268');
INSERT INTO public.logs (id, sql_text, "time") VALUES (938, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:11:39.267072');
INSERT INTO public.logs (id, sql_text, "time") VALUES (939, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:11:39.275119');
INSERT INTO public.logs (id, sql_text, "time") VALUES (940, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:11:39.276229');
INSERT INTO public.logs (id, sql_text, "time") VALUES (941, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:11:39.278438');
INSERT INTO public.logs (id, sql_text, "time") VALUES (942, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:11:39.279374');
INSERT INTO public.logs (id, sql_text, "time") VALUES (943, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:11:39.280549');
INSERT INTO public.logs (id, sql_text, "time") VALUES (944, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:11:39.281204');
INSERT INTO public.logs (id, sql_text, "time") VALUES (945, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:11:39.2818');
INSERT INTO public.logs (id, sql_text, "time") VALUES (946, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:11:40.354979');
INSERT INTO public.logs (id, sql_text, "time") VALUES (947, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:11:40.363134');
INSERT INTO public.logs (id, sql_text, "time") VALUES (948, 'SELECT * FROM tasks ORDER BY time DESC', '2023-10-19 17:11:40.364044');
INSERT INTO public.logs (id, sql_text, "time") VALUES (949, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:11:40.364776');
INSERT INTO public.logs (id, sql_text, "time") VALUES (950, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:11:40.365555');
INSERT INTO public.logs (id, sql_text, "time") VALUES (951, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:11:40.366258');
INSERT INTO public.logs (id, sql_text, "time") VALUES (952, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:11:40.367972');
INSERT INTO public.logs (id, sql_text, "time") VALUES (953, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:11:40.368678');
INSERT INTO public.logs (id, sql_text, "time") VALUES (954, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:11:40.369265');
INSERT INTO public.logs (id, sql_text, "time") VALUES (955, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:11:44.52699');
INSERT INTO public.logs (id, sql_text, "time") VALUES (956, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:11:44.534878');
INSERT INTO public.logs (id, sql_text, "time") VALUES (957, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:11:44.55097');
INSERT INTO public.logs (id, sql_text, "time") VALUES (958, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:11:44.551729');
INSERT INTO public.logs (id, sql_text, "time") VALUES (959, 'SELECT * FROM tasks WHERE id=9 ORDER BY time DESC;', '2023-10-19 17:11:44.552343');
INSERT INTO public.logs (id, sql_text, "time") VALUES (960, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:11:44.552953');
INSERT INTO public.logs (id, sql_text, "time") VALUES (961, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:11:44.553709');
INSERT INTO public.logs (id, sql_text, "time") VALUES (962, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:11:44.554521');
INSERT INTO public.logs (id, sql_text, "time") VALUES (963, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:12:49.248519');
INSERT INTO public.logs (id, sql_text, "time") VALUES (964, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:12:49.260364');
INSERT INTO public.logs (id, sql_text, "time") VALUES (965, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:12:49.269211');
INSERT INTO public.logs (id, sql_text, "time") VALUES (966, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:12:49.270194');
INSERT INTO public.logs (id, sql_text, "time") VALUES (967, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:12:49.270986');
INSERT INTO public.logs (id, sql_text, "time") VALUES (968, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:12:49.272861');
INSERT INTO public.logs (id, sql_text, "time") VALUES (969, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:12:49.274526');
INSERT INTO public.logs (id, sql_text, "time") VALUES (970, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:12:49.28405');
INSERT INTO public.logs (id, sql_text, "time") VALUES (971, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:12:49.284904');
INSERT INTO public.logs (id, sql_text, "time") VALUES (972, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:12:49.285572');
INSERT INTO public.logs (id, sql_text, "time") VALUES (973, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:12:50.880623');
INSERT INTO public.logs (id, sql_text, "time") VALUES (974, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:12:50.888777');
INSERT INTO public.logs (id, sql_text, "time") VALUES (975, 'SELECT * FROM tasks ORDER BY time DESC', '2023-10-19 17:12:50.890134');
INSERT INTO public.logs (id, sql_text, "time") VALUES (976, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:12:50.891597');
INSERT INTO public.logs (id, sql_text, "time") VALUES (977, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:12:50.892497');
INSERT INTO public.logs (id, sql_text, "time") VALUES (978, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:12:50.893696');
INSERT INTO public.logs (id, sql_text, "time") VALUES (979, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:12:50.895031');
INSERT INTO public.logs (id, sql_text, "time") VALUES (980, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:12:50.89569');
INSERT INTO public.logs (id, sql_text, "time") VALUES (981, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:12:50.896335');
INSERT INTO public.logs (id, sql_text, "time") VALUES (982, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:12:52.444073');
INSERT INTO public.logs (id, sql_text, "time") VALUES (983, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:12:52.445015');
INSERT INTO public.logs (id, sql_text, "time") VALUES (984, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:12:52.462946');
INSERT INTO public.logs (id, sql_text, "time") VALUES (985, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:12:52.46372');
INSERT INTO public.logs (id, sql_text, "time") VALUES (986, 'SELECT * FROM tasks WHERE id=9 ORDER BY time DESC;', '2023-10-19 17:12:52.46431');
INSERT INTO public.logs (id, sql_text, "time") VALUES (987, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:12:52.465086');
INSERT INTO public.logs (id, sql_text, "time") VALUES (988, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:12:52.465686');
INSERT INTO public.logs (id, sql_text, "time") VALUES (989, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:12:52.46631');
INSERT INTO public.logs (id, sql_text, "time") VALUES (990, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:16.34639');
INSERT INTO public.logs (id, sql_text, "time") VALUES (991, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:16.364112');
INSERT INTO public.logs (id, sql_text, "time") VALUES (992, 'SELECT * FROM tasks WHERE executor=2 AND status=''not started'' ORDER BY time DESC;', '2023-10-19 17:29:16.365132');
INSERT INTO public.logs (id, sql_text, "time") VALUES (993, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:29:20.392263');
INSERT INTO public.logs (id, sql_text, "time") VALUES (994, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:29:20.400875');
INSERT INTO public.logs (id, sql_text, "time") VALUES (995, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:29:20.401727');
INSERT INTO public.logs (id, sql_text, "time") VALUES (996, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:29:20.402611');
INSERT INTO public.logs (id, sql_text, "time") VALUES (997, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:29:20.405708');
INSERT INTO public.logs (id, sql_text, "time") VALUES (998, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:29:20.415048');
INSERT INTO public.logs (id, sql_text, "time") VALUES (999, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:29:20.41598');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1000, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:29:20.416654');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1001, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:29:21.496406');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1002, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:29:21.50458');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1003, 'SELECT * FROM users;', '2023-10-19 17:29:21.505507');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1004, 'SELECT * FROM parts;', '2023-10-19 17:29:21.506223');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1005, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:29:33.946228');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1006, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:29:33.947318');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1007, 'SELECT * FROM users;', '2023-10-19 17:29:33.947946');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1008, 'INSERT INTO tasks (executor, client, text, target, count, status) VALUES (2, 1, ''efgergffgfnfgn'', 18, 3, ''not started'')', '2023-10-19 17:29:33.948674');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1009, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:29:33.962287');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1010, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:29:33.96314');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1011, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:29:33.963822');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1012, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:29:33.964476');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1013, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:29:33.965126');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1014, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:29:33.965859');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1015, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:29:33.966653');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1016, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:29:33.967322');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1017, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:37.789797');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1018, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:37.797874');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1019, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:37.805763');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1020, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:37.806626');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1021, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:29:37.807394');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1022, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:29:37.808255');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1023, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:29:37.809026');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1024, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:29:37.809678');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1025, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:29:37.810162');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1026, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:29:37.810621');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1027, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:38.960242');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1028, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:38.968262');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1029, 'SELECT * FROM tasks WHERE executor=2 AND status=''not started'' ORDER BY time DESC;', '2023-10-19 17:29:38.969104');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1030, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:29:38.96982');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1031, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:29:38.970485');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1032, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:29:38.971138');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1033, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:41.132003');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1034, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:41.140414');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1035, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:41.157431');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1036, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:41.158295');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1037, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:29:41.158951');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1038, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:29:41.159627');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1039, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:29:41.160345');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1040, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:29:41.161182');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1041, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:42.405008');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1042, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:42.412914');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1043, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:42.424165');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1044, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:42.42493');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1045, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:29:42.425639');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1046, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:29:42.426301');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1047, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:29:42.426953');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1048, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:29:42.427595');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1049, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:46.404228');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1050, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:46.412374');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1051, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:29:46.41313');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1052, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:29:46.413855');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1053, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:29:46.414534');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1054, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:29:46.415539');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1055, 'UPDATE tasks SET status=''in work'', start_time=CURRENT_TIMESTAMP WHERE id=10;', '2023-10-19 17:29:46.416463');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1056, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:46.424961');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1057, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:46.425914');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1058, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:29:46.426564');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1059, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:29:46.42715');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1060, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:29:46.427728');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1061, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:29:46.428222');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1062, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:29:48.469511');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1063, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:29:48.479262');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1064, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:29:48.480117');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1065, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:29:48.480766');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1066, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:29:48.481391');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1067, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:29:48.482037');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1068, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:29:48.482704');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1069, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:29:48.483322');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1070, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:29:48.483968');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1071, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:29:48.484534');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1072, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:29:48.485127');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1073, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:30:15.08041');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1074, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:30:15.088652');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1075, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:30:15.089394');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1076, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:30:15.090108');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1077, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:30:15.090715');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1078, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:30:15.091332');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1079, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:30:16.107126');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1080, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:30:16.115157');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1081, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:30:16.124273');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1082, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:30:16.125083');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1083, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:30:16.125658');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1084, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:30:16.126689');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1085, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:30:16.127572');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1086, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:30:16.128165');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1087, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:30:19.699019');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1088, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:30:19.707134');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1089, 'SELECT * FROM tasks WHERE executor=1 AND status=''finished''  ORDER BY time DESC;', '2023-10-19 17:30:19.707866');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1090, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:30:22.142082');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1091, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:30:22.149987');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1092, 'SELECT * FROM tasks ORDER BY time DESC', '2023-10-19 17:30:22.150758');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1093, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:30:22.151502');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1094, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:30:22.152195');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1095, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:30:22.153188');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1096, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:30:22.154152');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1097, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:30:22.155058');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1098, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 17:30:22.15594');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1099, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:30:22.156535');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1100, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:30:22.157077');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1101, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:30:22.157657');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1102, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:30:27.267352');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1103, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:30:27.275241');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1104, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:30:27.282841');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1105, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:30:27.283748');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1106, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:30:27.284384');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1107, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:30:27.284978');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1108, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:30:27.285654');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1109, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:30:27.286385');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1110, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:30:28.896992');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1111, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:30:28.898409');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1112, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:30:28.907018');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1113, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:30:28.907847');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1114, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:30:28.909032');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1115, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:30:28.909753');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1116, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:30:28.910457');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1117, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:30:28.911106');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1118, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:33:25.677449');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1119, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:33:25.695629');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1120, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:33:25.719734');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1121, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:33:25.720683');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1122, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:33:25.721475');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1123, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:33:25.724024');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1124, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:33:25.724743');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1125, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:33:25.725383');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1126, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:33:27.254862');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1127, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:33:27.262935');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1128, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:33:27.27128');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1129, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:33:27.272109');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1130, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:33:27.272773');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1131, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:33:27.273421');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1132, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:33:27.274231');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1133, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:33:27.275057');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1134, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:33:29.850564');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1135, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:33:29.85873');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1136, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:33:29.859638');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1137, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:33:29.860515');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1138, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:33:29.861283');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1139, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:33:29.861923');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1140, 'DELETE FROM tasks WHERE id=10;', '2023-10-19 17:33:29.862647');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1141, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:33:29.872901');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1142, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:33:29.87376');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1143, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:33:29.874407');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1144, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:33:29.875037');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1145, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:33:29.87567');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1146, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:33:29.876454');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1147, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:33:29.877036');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1148, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:33:29.877808');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1149, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:33:33.108295');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1150, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:33:33.116421');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1151, 'SELECT * FROM tasks WHERE id=10 ORDER BY time DESC;', '2023-10-19 17:33:33.11718');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1152, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:33:36.522725');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1153, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:33:36.530849');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1154, 'SELECT * FROM tasks WHERE executor=2 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:33:36.531565');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1155, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:33:36.53255');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1156, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:33:36.533421');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1157, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:33:36.535232');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1158, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:33:36.536142');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1159, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:33:36.537259');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1160, 'SELECT COUNT(*) FROM users WHERE login=''verapashkova'' AND password=''qwerty123''', '2023-10-19 17:33:40.15321');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1161, 'SELECT * FROM users WHERE login=''verapashkova''', '2023-10-19 17:33:40.161375');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1162, 'SELECT * FROM tasks WHERE executor=2 AND status=''finished''  ORDER BY time DESC;', '2023-10-19 17:33:40.16219');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1163, 'SELECT * FROM users WHERE id=2', '2023-10-19 17:33:40.162898');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1164, 'SELECT * FROM users WHERE id=1', '2023-10-19 17:33:40.16356');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1165, 'SELECT * FROM parts WHERE id=18;', '2023-10-19 17:33:40.164327');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1166, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:33:44.457767');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1167, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:33:44.466004');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1168, 'SELECT * FROM tasks WHERE executor=1 AND status=''finished''  ORDER BY time DESC;', '2023-10-19 17:33:44.46747');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1169, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:55:13.329285');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1170, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:55:13.34378');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1171, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:55:13.354941');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1172, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:55:13.356009');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1173, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 17:55:13.357002');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1174, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 17:55:13.35925');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1175, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 17:55:13.361081');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1176, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 17:55:13.372671');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1177, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 17:55:13.37367');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1178, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 17:55:13.374524');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1179, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 17:55:22.512345');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1180, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 17:55:22.513951');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1181, 'SELECT * FROM parts;', '2023-10-19 17:55:22.514971');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1182, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:00:56.441468');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1183, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:00:56.449931');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1186, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:03.94401');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1187, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:03.945267');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1188, 'SELECT * FROM users;', '2023-10-19 18:01:03.946095');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1189, 'INSERT INTO tasks (executor, client, text, target, count, status) VALUES (1, 1, ''wretyu'', 15, 5, ''not started'')', '2023-10-19 18:01:03.947147');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1190, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:03.957488');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1191, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:03.958484');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1192, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 18:01:03.959266');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1193, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 18:01:03.960002');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1194, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 18:01:03.960773');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1195, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 18:01:03.961632');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1196, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 18:01:03.962396');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1197, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 18:01:03.963132');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1198, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:05.299259');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1199, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:05.30731');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1200, 'SELECT * FROM tasks WHERE executor=1 AND status=''not started'' ORDER BY time DESC;', '2023-10-19 18:01:05.308169');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1201, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:05.309111');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1202, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:05.309858');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1203, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:05.310989');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1204, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:05.313161');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1205, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:05.314075');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1206, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:05.314852');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1207, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:07.767932');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1208, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:07.776066');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1209, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:07.796321');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1210, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:07.797589');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1211, 'SELECT * FROM tasks WHERE id=11 ORDER BY time DESC;', '2023-10-19 18:01:07.798512');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1212, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:07.799311');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1213, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:07.800085');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1214, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:07.800863');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1215, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:08.872528');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1216, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:08.880599');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1217, 'SELECT * FROM tasks WHERE id=11 ORDER BY time DESC;', '2023-10-19 18:01:08.881554');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1218, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:08.882339');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1219, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:08.883114');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1220, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:08.884008');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1221, 'UPDATE tasks SET status=''in work'', start_time=CURRENT_TIMESTAMP WHERE id=11;', '2023-10-19 18:01:08.88537');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1222, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:08.893533');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1223, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:08.894431');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1224, 'SELECT * FROM tasks WHERE id=11 ORDER BY time DESC;', '2023-10-19 18:01:08.895134');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1225, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:08.895864');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1226, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:08.896577');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1227, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:08.897276');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1228, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:14.012556');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1229, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:14.013798');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1230, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:14.023796');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1231, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:14.024715');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1232, 'SELECT * FROM tasks WHERE id=9 ORDER BY time DESC;', '2023-10-19 18:01:14.02546');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1233, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:14.026264');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1234, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:14.02696');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1235, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:14.027708');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1236, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:15.035806');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1237, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:15.044305');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1238, 'SELECT * FROM tasks WHERE id=9 ORDER BY time DESC;', '2023-10-19 18:01:15.046219');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1239, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:15.048811');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1240, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:15.049768');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1241, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:15.05056');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1242, 'UPDATE tasks SET status=''in work'', start_time=CURRENT_TIMESTAMP WHERE id=9;', '2023-10-19 18:01:15.051485');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1243, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:15.059384');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1244, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:15.060328');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1245, 'SELECT * FROM tasks WHERE id=9 ORDER BY time DESC;', '2023-10-19 18:01:15.061018');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1246, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:15.061904');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1247, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:15.062623');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1248, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:15.063359');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1249, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:16.018949');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1250, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:16.027918');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1251, 'SELECT * FROM tasks WHERE executor=1 AND status=''in work'' ORDER BY time DESC;', '2023-10-19 18:01:16.029733');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1252, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:16.031412');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1253, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:16.032314');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1254, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:16.033009');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1255, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:16.033829');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1256, 'SELECT * FROM users WHERE id=1', '2023-10-19 18:01:16.034622');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1257, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:16.03535');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1258, 'SELECT * FROM PARTS WHERE parents IS NULL;', '2023-10-19 18:01:16.036125');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1259, 'SELECT * FROM parts WHERE array_position(parents, 15) IS NOT NULL;', '2023-10-19 18:01:16.036809');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1260, 'SELECT * FROM parts WHERE array_position(parents, 18) IS NOT NULL;', '2023-10-19 18:01:16.037605');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1261, 'SELECT * FROM parts WHERE array_position(parents, 19) IS NOT NULL;', '2023-10-19 18:01:16.038257');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1262, 'SELECT * FROM parts WHERE array_position(parents, 20) IS NOT NULL;', '2023-10-19 18:01:16.038994');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1263, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:45.867177');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1264, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:45.875472');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1265, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:45.876322');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1266, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:45.877118');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1267, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:47.731052');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1268, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:47.74072');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1270, 'SELECT * FROM parts WHERE id=15;', '2023-10-19 18:01:47.743241');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1271, 'SELECT COUNT(*) FROM users WHERE login=''m4dwave'' AND password=''Uhbujhmtdv2''', '2023-10-19 18:01:51.776045');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1272, 'SELECT * FROM users WHERE login=''m4dwave''', '2023-10-19 18:01:51.784389');
INSERT INTO public.logs (id, sql_text, "time") VALUES (1273, 'SELECT * FROM parts;', '2023-10-19 18:01:51.785815');


--
-- TOC entry 3347 (class 0 OID 40987)
-- Dependencies: 217
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.parts (id, description, name, parents, text, count) VALUES (15, 'W_BF', 'Тело флигеля фагота', NULL, 'Тело флигеля фагота

Тело флигеля фагота

Тело флигеля фагота', 3);
INSERT INTO public.parts (id, description, name, parents, text, count) VALUES (18, 'BF(1)', 'Клапанная группа 1 флигеля', '{15}', 'Клапанная группа 1 флигеля

Клапанная группа 1 флигеля

Клапанная группа 1 флигеля', 3);
INSERT INTO public.parts (id, description, name, parents, text, count) VALUES (19, 'BF(2)', 'Клапанная группа 2 флигеля', '{15}', 'Клапанная группа 2 флигеля

Клапанная группа 2 флигеля

Клапанная группа 2 флигеля', 3);
INSERT INTO public.parts (id, description, name, parents, text, count) VALUES (20, 'BF(3)', 'Клапанная группа 3 флигеля', '{15}', 'Udbebdjjedbxh', 5);


--
-- TOC entry 3349 (class 0 OID 41005)
-- Dependencies: 219
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tasks (id, executor, client, text, target, count, status, "time", start_time, finish_time) VALUES (8, 2, 1, 'Выполнить детали в необходимом количестве', 18, 3, 'finished', '2023-10-19 16:24:36.950604', '2023-10-19 16:46:35.043655', '2023-10-19 16:47:14.326641');
INSERT INTO public.tasks (id, executor, client, text, target, count, status, "time", start_time, finish_time) VALUES (11, 1, 1, 'wretyu', 15, 5, 'in work', '2023-10-19 18:01:03.947596', '2023-10-19 18:01:08.885817', NULL);
INSERT INTO public.tasks (id, executor, client, text, target, count, status, "time", start_time, finish_time) VALUES (9, 1, 1, 'ауипвдьэждапиэьпиэ', 15, 4, 'in work', '2023-10-19 16:56:26.911394', '2023-10-19 18:01:15.051838', NULL);


--
-- TOC entry 3345 (class 0 OID 40967)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, login, password, role, name, surname) VALUES (1, 'm4dwave', 'Uhbujhmtdv2', 'admin', 'Матвей', 'Григорьев');
INSERT INTO public.users (id, login, password, role, name, surname) VALUES (2, 'verapashkova', 'qwerty123', 'user', 'Вера', 'Пашкова');


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 220
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_seq', 1273, true);


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 216
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parts_id_seq', 20, true);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 218
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_id_seq', 11, true);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 3201 (class 2606 OID 41023)
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 40994)
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 41012)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 40974)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2023-10-27 09:56:58

--
-- PostgreSQL database dump complete
--

