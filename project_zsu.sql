--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO root;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO root;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- Name: myapp_country; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.myapp_country (
    cname character varying(50) NOT NULL,
    population bigint NOT NULL
);


ALTER TABLE public.myapp_country OWNER TO root;

--
-- Name: myapp_discover; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.myapp_discover (
    id bigint NOT NULL,
    first_enc_date date NOT NULL,
    cname_id character varying(50) NOT NULL,
    disease_code_id character varying(20) NOT NULL
);


ALTER TABLE public.myapp_discover OWNER TO root;

--
-- Name: myapp_discover_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.myapp_discover_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.myapp_discover_id_seq OWNER TO root;

--
-- Name: myapp_discover_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.myapp_discover_id_seq OWNED BY public.myapp_discover.id;


--
-- Name: myapp_disease; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.myapp_disease (
    disease_code character varying(20) NOT NULL,
    pathogen character varying(20) NOT NULL,
    description character varying(140) NOT NULL,
    disease_type_id_id bigint NOT NULL
);


ALTER TABLE public.myapp_disease OWNER TO root;

--
-- Name: myapp_diseasetype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.myapp_diseasetype (
    id bigint NOT NULL,
    description character varying(140) NOT NULL
);


ALTER TABLE public.myapp_diseasetype OWNER TO root;

--
-- Name: myapp_diseasetype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.myapp_diseasetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.myapp_diseasetype_id_seq OWNER TO root;

--
-- Name: myapp_diseasetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.myapp_diseasetype_id_seq OWNED BY public.myapp_diseasetype.id;


--
-- Name: myapp_doctor; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.myapp_doctor (
    email_id character varying(60) NOT NULL,
    degree character varying(20) NOT NULL
);


ALTER TABLE public.myapp_doctor OWNER TO root;

--
-- Name: myapp_publicservant; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.myapp_publicservant (
    email_id character varying(60) NOT NULL,
    department character varying(50) NOT NULL
);


ALTER TABLE public.myapp_publicservant OWNER TO root;

--
-- Name: myapp_record; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.myapp_record (
    id bigint NOT NULL,
    total_deaths integer NOT NULL,
    total_patients integer NOT NULL,
    cname_id character varying(50) NOT NULL,
    disease_code_id character varying(20) NOT NULL,
    email_id character varying(60) NOT NULL
);


ALTER TABLE public.myapp_record OWNER TO root;

--
-- Name: myapp_record_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.myapp_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.myapp_record_id_seq OWNER TO root;

--
-- Name: myapp_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.myapp_record_id_seq OWNED BY public.myapp_record.id;


--
-- Name: myapp_specialize; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.myapp_specialize (
    id bigint NOT NULL,
    disease_type_id_id bigint NOT NULL,
    email_id character varying(60) NOT NULL
);


ALTER TABLE public.myapp_specialize OWNER TO root;

--
-- Name: myapp_specialize_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.myapp_specialize_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.myapp_specialize_id_seq OWNER TO root;

--
-- Name: myapp_specialize_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.myapp_specialize_id_seq OWNED BY public.myapp_specialize.id;


--
-- Name: myapp_users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.myapp_users (
    email character varying(60) NOT NULL,
    name character varying(30) NOT NULL,
    surname character varying(40) NOT NULL,
    salary integer NOT NULL,
    phone character varying(20) NOT NULL,
    cname_id character varying(50) NOT NULL
);


ALTER TABLE public.myapp_users OWNER TO root;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: myapp_discover id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_discover ALTER COLUMN id SET DEFAULT nextval('public.myapp_discover_id_seq'::regclass);


--
-- Name: myapp_diseasetype id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_diseasetype ALTER COLUMN id SET DEFAULT nextval('public.myapp_diseasetype_id_seq'::regclass);


--
-- Name: myapp_record id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_record ALTER COLUMN id SET DEFAULT nextval('public.myapp_record_id_seq'::regclass);


--
-- Name: myapp_specialize id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_specialize ALTER COLUMN id SET DEFAULT nextval('public.myapp_specialize_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add users	7	add_users
26	Can change users	7	change_users
27	Can delete users	7	delete_users
28	Can view users	7	view_users
29	Can add discover	8	add_discover
30	Can change discover	8	change_discover
31	Can delete discover	8	delete_discover
32	Can view discover	8	view_discover
33	Can add country	9	add_country
34	Can change country	9	change_country
35	Can delete country	9	delete_country
36	Can view country	9	view_country
37	Can add disease type	10	add_diseasetype
38	Can change disease type	10	change_diseasetype
39	Can delete disease type	10	delete_diseasetype
40	Can view disease type	10	view_diseasetype
41	Can add record	11	add_record
42	Can change record	11	change_record
43	Can delete record	11	delete_record
44	Can view record	11	view_record
45	Can add public servant	12	add_publicservant
46	Can change public servant	12	change_publicservant
47	Can delete public servant	12	delete_publicservant
48	Can view public servant	12	view_publicservant
49	Can add disease	13	add_disease
50	Can change disease	13	change_disease
51	Can delete disease	13	delete_disease
52	Can view disease	13	view_disease
53	Can add doctor	14	add_doctor
54	Can change doctor	14	change_doctor
55	Can delete doctor	14	delete_doctor
56	Can view doctor	14	view_doctor
57	Can add specialize	15	add_specialize
58	Can change specialize	15	change_specialize
59	Can delete specialize	15	delete_specialize
60	Can view specialize	15	view_specialize
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$jim4IjrzWUTg3vyo7hO62X$hvwsL17KEHVGucO419bc7J8m09ca0JXQV0lARv33u/c=	2022-06-15 00:28:44.863729+03	t	zeynepsukesim				t	t	2022-06-15 00:27:30.143462+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-06-15 18:13:52.197465+03	e229234@metu.edu.tr	Users object (e229234@metu.edu.tr)	1	[{"added": {}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	myapp	users
8	myapp	discover
9	myapp	country
10	myapp	diseasetype
11	myapp	record
12	myapp	publicservant
13	myapp	disease
14	myapp	doctor
15	myapp	specialize
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-06-14 23:11:41.464993+03
2	auth	0001_initial	2022-06-14 23:11:41.536946+03
3	admin	0001_initial	2022-06-14 23:11:41.553401+03
4	admin	0002_logentry_remove_auto_add	2022-06-14 23:11:41.565071+03
5	admin	0003_logentry_add_action_flag_choices	2022-06-14 23:11:41.573755+03
6	contenttypes	0002_remove_content_type_name	2022-06-14 23:11:41.593101+03
7	auth	0002_alter_permission_name_max_length	2022-06-14 23:11:41.603663+03
8	auth	0003_alter_user_email_max_length	2022-06-14 23:11:41.615703+03
9	auth	0004_alter_user_username_opts	2022-06-14 23:11:41.625717+03
10	auth	0005_alter_user_last_login_null	2022-06-14 23:11:41.63592+03
11	auth	0006_require_contenttypes_0002	2022-06-14 23:11:41.637747+03
12	auth	0007_alter_validators_add_error_messages	2022-06-14 23:11:41.649779+03
13	auth	0008_alter_user_username_max_length	2022-06-14 23:11:41.669994+03
14	auth	0009_alter_user_last_name_max_length	2022-06-14 23:11:41.679675+03
15	auth	0010_alter_group_name_max_length	2022-06-14 23:11:41.693509+03
16	auth	0011_update_proxy_permissions	2022-06-14 23:11:41.701958+03
17	auth	0012_alter_user_first_name_max_length	2022-06-14 23:11:41.717051+03
18	sessions	0001_initial	2022-06-14 23:11:41.727871+03
26	myapp	0001_initial	2022-06-15 21:41:02.538045+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
swkrclrue3457nbq60m2wzuwp7oaev4a	.eJxVjMsOwiAUBf-FtSG8CtSle7-B3AeVqoGktCvjv2uTLnR7Zua8RIJtLWnreUkzi7PQ4vS7IdAj1x3wHeqtSWp1XWaUuyIP2uW1cX5eDvfvoEAv31qNQVE0ZDLgFBmjsxpIhcgKHXrnaNDa5qyAfQiOzKgd2EFPbCwAefH-AOOeN-M:1o1E5c:tOyTDjjs8qBIT4YvanNTiuULXpLyJCsFp5oOmZb85Lg	2022-06-29 00:28:44.866067+03
\.


--
-- Data for Name: myapp_country; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.myapp_country (cname, population) FROM stdin;
Turkey	1200000
Germany	970000
France	110000
Sweden	100000
Switzerland	300000
Norway	670000
Hungary	200000
Poland	590000
Italy	990000
Spain	1050000
\.


--
-- Data for Name: myapp_discover; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.myapp_discover (id, first_enc_date, cname_id, disease_code_id) FROM stdin;
1	1970-10-03	Turkey	A30
2	1950-12-13	Germany	Covid-19
3	1990-09-04	France	ICD-10
4	1998-01-02	Sweden	F33
5	2000-08-22	Switzerland	G26
6	2001-07-18	Norway	D80
7	2008-06-03	Hungary	ICD-D3
8	1956-02-15	Poland	F30
9	2019-01-01	Italy	K73
10	1963-06-18	Spain	T55
\.


--
-- Data for Name: myapp_disease; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.myapp_disease (disease_code, pathogen, description, disease_type_id_id) FROM stdin;
A30	bacteria	infectious diseases	1
Covid-19	virus	virology	2
ICD-10	virus	genetic diseases	3
F33	bacteria	pyschological diseases	4
G26	virus	neurological diseases	5
D80	virus	deficiency diseases	6
ICD-D3	virus	non-genetic hereditary diseases	7
F30	bacteria	cerebrovascular diseases	8
K73	bacteria	chronic diseases	9
T55	bacteria	terminal diseases	10
\.


--
-- Data for Name: myapp_diseasetype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.myapp_diseasetype (id, description) FROM stdin;
1	infectious diseases
2	virology
3	genetic diseases
4	pyschological diseases
5	neurological diseases
6	deficiency diseases
7	non-genetic hereditary diseases
8	cerebrovascular diseases
9	chronic diseases
10	terminal diseases
\.


--
-- Data for Name: myapp_doctor; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.myapp_doctor (email_id, degree) FROM stdin;
dr1@posgresql.com	bachelor
dr2@posgresql.com	master
dr3@posgresql.com	doctoral
dr4@posgresql.com	bachelor
dr5@posgresql.com	bachelor
dr6@posgresql.com	master
dr7@posgresql.com	bachelor
dr8@posgresql.com	doctoral
dr9@posgresql.com	doctoral
dr10@posgresql.com	master
dr11@posgresql.com	master
dr12@posgresql.com	doctoral
dr13@posgresql.com	bachelor
dr14@posgresql.com	master
dr15@posgresql.com	master
dr16@posgresql.com	master
dr17@posgresql.com	doctoral
dr18@posgresql.com	doctoral
dr19@posgresql.com	doctoral
dr20@posgresql.com	bachelor
dr21@posgresql.com	master
\.


--
-- Data for Name: myapp_publicservant; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.myapp_publicservant (email_id, department) FROM stdin;
ps1@posgresql.com	Dept1
ps2@posgresql.com	Dept2
ps3@posgresql.com	Dept3
ps4@posgresql.com	Dept4
ps5@posgresql.com	Dept5
ps6@posgresql.com	Dept6
ps7@posgresql.com	Dept7
ps8@posgresql.com	Dept8
ps9@posgresql.com	Dept9
ps10@posgresql.com	Dept10
ps11@posgresql.com	Dept1
ps12@posgresql.com	Dept2
ps13@posgresql.com	Dept2
\.


--
-- Data for Name: myapp_record; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.myapp_record (id, total_deaths, total_patients, cname_id, disease_code_id, email_id) FROM stdin;
1	40	100001	Turkey	A30	ps1@posgresql.com
2	400	200300	Germany	Covid-19	ps2@posgresql.com
3	561	51001	France	ICD-10	ps3@posgresql.com
4	120	340000	Sweden	F33	ps4@posgresql.com
5	20	90001	Switzerland	G26	ps5@posgresql.com
6	330	700001	Norway	D80	ps6@posgresql.com
7	23	80001	Hungary	ICD-D3	ps7@posgresql.com
8	198	60700	Poland	F30	ps8@posgresql.com
9	79	456000	Italy	K73	ps9@posgresql.com
10	174	67000	Spain	T55	ps10@posgresql.com
11	8900	990300	Italy	Covid-19	ps1@posgresql.com
12	30	70300	Norway	Covid-19	ps3@posgresql.com
13	2000	999000	Switzerland	Covid-19	ps3@posgresql.com
14	29	889000	Sweden	ICD-D3	ps5@posgresql.com
15	60	3000	Poland	F33	ps5@posgresql.com
16	245	77551	France	D80	ps5@posgresql.com
17	4500	767000	Switzerland	Covid-19	ps2@posgresql.com
18	345	2349000	France	Covid-19	ps2@posgresql.com
19	678	98777	Germany	Covid-19	ps1@posgresql.com
20	645	7851	France	Covid-19	ps5@posgresql.com
21	7655	12345	Norway	Covid-19	ps2@posgresql.com
\.


--
-- Data for Name: myapp_specialize; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.myapp_specialize (id, disease_type_id_id, email_id) FROM stdin;
1	1	dr1@posgresql.com
2	2	dr1@posgresql.com
3	3	dr3@posgresql.com
4	4	dr4@posgresql.com
5	5	dr4@posgresql.com
6	6	dr4@posgresql.com
7	7	dr5@posgresql.com
8	8	dr6@posgresql.com
9	9	dr7@posgresql.com
10	10	dr7@posgresql.com
11	1	dr8@posgresql.com
12	1	dr9@posgresql.com
13	6	dr1@posgresql.com
14	2	dr11@posgresql.com
15	2	dr12@posgresql.com
16	2	dr13@posgresql.com
17	2	dr14@posgresql.com
18	2	dr15@posgresql.com
19	2	dr16@posgresql.com
20	2	dr17@posgresql.com
21	2	dr18@posgresql.com
22	2	dr19@posgresql.com
23	2	dr20@posgresql.com
24	2	dr5@posgresql.com
25	2	dr6@posgresql.com
26	2	dr7@posgresql.com
27	2	dr10@posgresql.com
28	2	dr3@posgresql.com
29	2	dr21@posgresql.com
\.


--
-- Data for Name: myapp_users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.myapp_users (email, name, surname, salary, phone, cname_id) FROM stdin;
dr1@posgresql.com	John	Salph	120000	11111	Turkey
dr2@posgresql.com	Stevan	Alpin	510000	22222	Germany
dr3@posgresql.com	Leiri	Clan	200000	33333	France
dr4@posgresql.com	Charlotte	Sagel	670000	44444	Sweden
dr5@posgresql.com	Antoine	Bour	32000	55555	Switzerland
dr6@posgresql.com	François	White	880000	66666	Norway
dr7@posgresql.com	Bridgette	Alpter	540000	77777	Hungary
dr8@posgresql.com	Madzia	Pao	280000	88888	Poland
dr9@posgresql.com	Guedelina	Farco	42000	99999	Italy
dr10@posgresql.com	Adriana	Maralp	20000	12345	Spain
dr11@posgresql.com	Sail	Boat	130000	23234	Spain
dr12@posgresql.com	Kail	Talp	150000	98789	Italy
dr13@posgresql.com	Letti	Coat	78999	14564	Poland
dr14@posgresql.com	Fanni	Adam	66578	12345	Hungary
dr15@posgresql.com	Leo	Saw	455666	12637	Norway
dr16@posgresql.com	Flaubert	Kor	39000	56563	Turkey
dr17@posgresql.com	Clementine	Bourse	676666	76794	Germany
dr18@posgresql.com	Valentina	Seiss	345555	23456	France
dr19@posgresql.com	Thea	Falper	200091	90000	Switzerland
dr20@posgresql.com	Otti	Kallen	872999	87789	Sweden
dr21@posgresql.com	Thomas	Pour	200934	123123	France
ps1@posgresql.com	Jannie	Kalps	230020	121212	Turkey
ps2@posgresql.com	Sofar	Alpkon	410000	232323	Germany
ps3@posgresql.com	Rick	Novak	111000	434343	France
ps4@posgresql.com	Margaret	Adelman	623000	545454	Sweden
ps5@posgresql.com	Ronald	Barr	37653	656565	Switzerland
ps6@posgresql.com	Roger	Malp	981000	767676	Norway
ps7@posgresql.com	Marlene	Donahue	78000	878787	Hungary
ps8@posgresql.com	Jeff	Johnson	76500	989898	Poland
ps9@posgresql.com	Margaret	Alpman	47800	353535	Italy
ps10@posgresql.com	Susan	Connor	320000	060606	Spain
ps11@posgresql.com	Dennis	Four	303534	12232423	France
ps12@posgresql.com	Sarah	Yak	236466	2342343	Germany
ps13@posgresql.com	Lena	Weis	734575	234555	Poland
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: myapp_discover_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.myapp_discover_id_seq', 1, false);


--
-- Name: myapp_diseasetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.myapp_diseasetype_id_seq', 1, false);


--
-- Name: myapp_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.myapp_record_id_seq', 1, false);


--
-- Name: myapp_specialize_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.myapp_specialize_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: myapp_country myapp_country_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_country
    ADD CONSTRAINT myapp_country_pkey PRIMARY KEY (cname);


--
-- Name: myapp_discover myapp_discover_cname_id_disease_code_id_6288db2c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_discover
    ADD CONSTRAINT myapp_discover_cname_id_disease_code_id_6288db2c_uniq UNIQUE (cname_id, disease_code_id);


--
-- Name: myapp_discover myapp_discover_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_discover
    ADD CONSTRAINT myapp_discover_pkey PRIMARY KEY (id);


--
-- Name: myapp_disease myapp_disease_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_disease
    ADD CONSTRAINT myapp_disease_pkey PRIMARY KEY (disease_code);


--
-- Name: myapp_diseasetype myapp_diseasetype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_diseasetype
    ADD CONSTRAINT myapp_diseasetype_pkey PRIMARY KEY (id);


--
-- Name: myapp_doctor myapp_doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_doctor
    ADD CONSTRAINT myapp_doctor_pkey PRIMARY KEY (email_id);


--
-- Name: myapp_publicservant myapp_publicservant_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_publicservant
    ADD CONSTRAINT myapp_publicservant_pkey PRIMARY KEY (email_id);


--
-- Name: myapp_record myapp_record_email_id_cname_id_disease_code_id_13910d11_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_record
    ADD CONSTRAINT myapp_record_email_id_cname_id_disease_code_id_13910d11_uniq UNIQUE (email_id, cname_id, disease_code_id);


--
-- Name: myapp_record myapp_record_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_record
    ADD CONSTRAINT myapp_record_pkey PRIMARY KEY (id);


--
-- Name: myapp_specialize myapp_specialize_disease_type_id_id_email_id_4865ae18_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_specialize
    ADD CONSTRAINT myapp_specialize_disease_type_id_id_email_id_4865ae18_uniq UNIQUE (disease_type_id_id, email_id);


--
-- Name: myapp_specialize myapp_specialize_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_specialize
    ADD CONSTRAINT myapp_specialize_pkey PRIMARY KEY (id);


--
-- Name: myapp_users myapp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_users
    ADD CONSTRAINT myapp_users_pkey PRIMARY KEY (email);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: idx_pathogen; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_pathogen ON public.myapp_disease USING btree (pathogen);


--
-- Name: myapp_country_cname_073c8d17_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_country_cname_073c8d17_like ON public.myapp_country USING btree (cname varchar_pattern_ops);


--
-- Name: myapp_discover_cname_id_b265c04d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_discover_cname_id_b265c04d ON public.myapp_discover USING btree (cname_id);


--
-- Name: myapp_discover_cname_id_b265c04d_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_discover_cname_id_b265c04d_like ON public.myapp_discover USING btree (cname_id varchar_pattern_ops);


--
-- Name: myapp_discover_disease_code_id_e5886d74; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_discover_disease_code_id_e5886d74 ON public.myapp_discover USING btree (disease_code_id);


--
-- Name: myapp_discover_disease_code_id_e5886d74_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_discover_disease_code_id_e5886d74_like ON public.myapp_discover USING btree (disease_code_id varchar_pattern_ops);


--
-- Name: myapp_disease_disease_code_a10d91b6_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_disease_disease_code_a10d91b6_like ON public.myapp_disease USING btree (disease_code varchar_pattern_ops);


--
-- Name: myapp_disease_disease_type_id_id_8b689bbd; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_disease_disease_type_id_id_8b689bbd ON public.myapp_disease USING btree (disease_type_id_id);


--
-- Name: myapp_doctor_email_id_0eca2128_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_doctor_email_id_0eca2128_like ON public.myapp_doctor USING btree (email_id varchar_pattern_ops);


--
-- Name: myapp_publicservant_email_id_be74c7c8_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_publicservant_email_id_be74c7c8_like ON public.myapp_publicservant USING btree (email_id varchar_pattern_ops);


--
-- Name: myapp_record_cname_id_e20b9f4e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_record_cname_id_e20b9f4e ON public.myapp_record USING btree (cname_id);


--
-- Name: myapp_record_cname_id_e20b9f4e_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_record_cname_id_e20b9f4e_like ON public.myapp_record USING btree (cname_id varchar_pattern_ops);


--
-- Name: myapp_record_disease_code_id_b24dadd4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_record_disease_code_id_b24dadd4 ON public.myapp_record USING btree (disease_code_id);


--
-- Name: myapp_record_disease_code_id_b24dadd4_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_record_disease_code_id_b24dadd4_like ON public.myapp_record USING btree (disease_code_id varchar_pattern_ops);


--
-- Name: myapp_record_email_id_8de2a512; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_record_email_id_8de2a512 ON public.myapp_record USING btree (email_id);


--
-- Name: myapp_record_email_id_8de2a512_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_record_email_id_8de2a512_like ON public.myapp_record USING btree (email_id varchar_pattern_ops);


--
-- Name: myapp_specialize_disease_type_id_id_1d98e376; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_specialize_disease_type_id_id_1d98e376 ON public.myapp_specialize USING btree (disease_type_id_id);


--
-- Name: myapp_specialize_email_id_88a204e2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_specialize_email_id_88a204e2 ON public.myapp_specialize USING btree (email_id);


--
-- Name: myapp_specialize_email_id_88a204e2_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_specialize_email_id_88a204e2_like ON public.myapp_specialize USING btree (email_id varchar_pattern_ops);


--
-- Name: myapp_users_cname_id_c4ee5cc5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_users_cname_id_c4ee5cc5 ON public.myapp_users USING btree (cname_id);


--
-- Name: myapp_users_cname_id_c4ee5cc5_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_users_cname_id_c4ee5cc5_like ON public.myapp_users USING btree (cname_id varchar_pattern_ops);


--
-- Name: myapp_users_email_e25dc8b1_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX myapp_users_email_e25dc8b1_like ON public.myapp_users USING btree (email varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_discover myapp_discover_cname_id_b265c04d_fk_myapp_country_cname; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_discover
    ADD CONSTRAINT myapp_discover_cname_id_b265c04d_fk_myapp_country_cname FOREIGN KEY (cname_id) REFERENCES public.myapp_country(cname) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_discover myapp_discover_disease_code_id_e5886d74_fk_myapp_dis; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_discover
    ADD CONSTRAINT myapp_discover_disease_code_id_e5886d74_fk_myapp_dis FOREIGN KEY (disease_code_id) REFERENCES public.myapp_disease(disease_code) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_disease myapp_disease_disease_type_id_id_8b689bbd_fk_myapp_dis; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_disease
    ADD CONSTRAINT myapp_disease_disease_type_id_id_8b689bbd_fk_myapp_dis FOREIGN KEY (disease_type_id_id) REFERENCES public.myapp_diseasetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_doctor myapp_doctor_email_id_0eca2128_fk_myapp_users_email; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_doctor
    ADD CONSTRAINT myapp_doctor_email_id_0eca2128_fk_myapp_users_email FOREIGN KEY (email_id) REFERENCES public.myapp_users(email) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_publicservant myapp_publicservant_email_id_be74c7c8_fk_myapp_users_email; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_publicservant
    ADD CONSTRAINT myapp_publicservant_email_id_be74c7c8_fk_myapp_users_email FOREIGN KEY (email_id) REFERENCES public.myapp_users(email) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_record myapp_record_cname_id_e20b9f4e_fk_myapp_country_cname; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_record
    ADD CONSTRAINT myapp_record_cname_id_e20b9f4e_fk_myapp_country_cname FOREIGN KEY (cname_id) REFERENCES public.myapp_country(cname) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_record myapp_record_disease_code_id_b24dadd4_fk_myapp_dis; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_record
    ADD CONSTRAINT myapp_record_disease_code_id_b24dadd4_fk_myapp_dis FOREIGN KEY (disease_code_id) REFERENCES public.myapp_disease(disease_code) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_record myapp_record_email_id_8de2a512_fk_myapp_publicservant_email_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_record
    ADD CONSTRAINT myapp_record_email_id_8de2a512_fk_myapp_publicservant_email_id FOREIGN KEY (email_id) REFERENCES public.myapp_publicservant(email_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_specialize myapp_specialize_disease_type_id_id_1d98e376_fk_myapp_dis; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_specialize
    ADD CONSTRAINT myapp_specialize_disease_type_id_id_1d98e376_fk_myapp_dis FOREIGN KEY (disease_type_id_id) REFERENCES public.myapp_diseasetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_specialize myapp_specialize_email_id_88a204e2_fk_myapp_doctor_email_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_specialize
    ADD CONSTRAINT myapp_specialize_email_id_88a204e2_fk_myapp_doctor_email_id FOREIGN KEY (email_id) REFERENCES public.myapp_doctor(email_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: myapp_users myapp_users_cname_id_c4ee5cc5_fk_myapp_country_cname; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.myapp_users
    ADD CONSTRAINT myapp_users_cname_id_c4ee5cc5_fk_myapp_country_cname FOREIGN KEY (cname_id) REFERENCES public.myapp_country(cname) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

