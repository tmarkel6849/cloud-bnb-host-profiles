--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hosts; Type: TABLE; Schema: public; Owner: rpropri
--

CREATE TABLE public.hosts (
    id integer NOT NULL,
    name character varying(60),
    description character varying(1000),
    interaction character varying(1000),
    "coHosts" json,
    "dateJoined" character varying(16),
    "responseRate" character varying(4),
    "responseTime" character varying(40),
    "hostUrl" character varying(255)
);


ALTER TABLE public.hosts OWNER TO rpropri;

--
-- Name: hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: rpropri
--

CREATE SEQUENCE public.hosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hosts_id_seq OWNER TO rpropri;

--
-- Name: hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpropri
--

ALTER SEQUENCE public.hosts_id_seq OWNED BY public.hosts.id;


--
-- Name: hosts_languages; Type: TABLE; Schema: public; Owner: rpropri
--

CREATE TABLE public.hosts_languages (
    id integer NOT NULL,
    host_id integer,
    language_id integer
);


ALTER TABLE public.hosts_languages OWNER TO rpropri;

--
-- Name: hosts_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: rpropri
--

CREATE SEQUENCE public.hosts_languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hosts_languages_id_seq OWNER TO rpropri;

--
-- Name: hosts_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpropri
--

ALTER SEQUENCE public.hosts_languages_id_seq OWNED BY public.hosts_languages.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: rpropri
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO rpropri;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rpropri
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO rpropri;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpropri
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: rpropri
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO rpropri;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: rpropri
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO rpropri;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpropri
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: rpropri
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    language character varying(255)
);


ALTER TABLE public.languages OWNER TO rpropri;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: rpropri
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO rpropri;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpropri
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: listings; Type: TABLE; Schema: public; Owner: rpropri
--

CREATE TABLE public.listings (
    id integer NOT NULL,
    title character varying(255),
    description character varying(1000),
    type character varying(255),
    cost character varying(255),
    capacity integer,
    bedrooms integer,
    beds integer,
    baths character varying(255),
    "photoUrl" character varying(255),
    city character varying(255),
    state character varying(255),
    country character varying(255),
    host_id integer
);


ALTER TABLE public.listings OWNER TO rpropri;

--
-- Name: listings_id_seq; Type: SEQUENCE; Schema: public; Owner: rpropri
--

CREATE SEQUENCE public.listings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.listings_id_seq OWNER TO rpropri;

--
-- Name: listings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpropri
--

ALTER SEQUENCE public.listings_id_seq OWNED BY public.listings.id;


--
-- Name: hosts id; Type: DEFAULT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.hosts ALTER COLUMN id SET DEFAULT nextval('public.hosts_id_seq'::regclass);


--
-- Name: hosts_languages id; Type: DEFAULT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.hosts_languages ALTER COLUMN id SET DEFAULT nextval('public.hosts_languages_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: listings id; Type: DEFAULT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.listings ALTER COLUMN id SET DEFAULT nextval('public.listings_id_seq'::regclass);


--
-- Data for Name: hosts; Type: TABLE DATA; Schema: public; Owner: rpropri
--

COPY public.hosts (id, name, description, interaction, "coHosts", "dateJoined", "responseRate", "responseTime", "hostUrl") FROM stdin;
1	Pickett	I love the outdoors and especially mountain climbing, camping, snowboarding, mountain biking, bungee jumping, rock climbing and most of all, traveling! I enjoy a savory dinner out on the town with my honey, so I can recommend loads of delicious venues. I also am a big fan of exploring pubs/breweries, coffee shops and trendy stores as much as I can so whatever your cup of tea is, I can point you in the right direction.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	April 2016	99%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host11.jpg
3	Debora	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	April 2013	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host27.jpg
2	Rosa	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.		{}	November 2015	100%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host17.jpg
4	Gibbs	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	December 2017	97%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host29.jpg
5	Blackwell	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.		{"coHost1":{"coHostName":"Wade","coHostDateJoined":"December 2017","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost09.jpg"},"coHost2":{"coHostName":"Glass","coHostDateJoined":"February 2013","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost05.jpg"}}	May 2013	98%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host10.jpg
6	Brianna	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.	Your host will be on the property and available for anything you need during your stay.	{}	November 2013	96%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host04.jpg
7	Lenore	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food		{}	September 2018	99%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host07.jpg
8	Kathy	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.		{}	April 2016	100%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host16.jpg
9	Robles	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food		{}	October 2016	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host08.jpg
10	Conrad	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.		{}	March 2018	96%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host04.jpg
11	Hattie	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	July 2016	100%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host14.jpg
12	Francis	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host will be on the property and available for anything you need during your stay.	{}	May 2016	99%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host04.jpg
13	Melton	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.	Your host will be on the property and available for anything you need during your stay.	{}	December 2013	100%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host25.jpg
14	Paul	I love the outdoors and especially mountain climbing, camping, snowboarding, mountain biking, bungee jumping, rock climbing and most of all, traveling! I enjoy a savory dinner out on the town with my honey, so I can recommend loads of delicious venues. I also am a big fan of exploring pubs/breweries, coffee shops and trendy stores as much as I can so whatever your cup of tea is, I can point you in the right direction.		{"coHost1":{"coHostName":"Sosa","coHostDateJoined":"June 2013","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost04.jpg"}}	September 2015	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host03.jpg
15	Roxie	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	December 2015	96%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host06.jpg
16	Waters	I love the outdoors and especially mountain climbing, camping, snowboarding, mountain biking, bungee jumping, rock climbing and most of all, traveling! I enjoy a savory dinner out on the town with my honey, so I can recommend loads of delicious venues. I also am a big fan of exploring pubs/breweries, coffee shops and trendy stores as much as I can so whatever your cup of tea is, I can point you in the right direction.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	May 2016	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host29.jpg
23	Sheryl	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host will be on the property and available for anything you need during your stay.	{}	October 2014	97%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host10.jpg
31	Rich	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	August 2018	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host10.jpg
40	Pena	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food		{}	May 2018	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host13.jpg
45	William	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{"coHost1":{"coHostName":"Evans","coHostDateJoined":"November 2013","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost02.jpg"}}	February 2013	96%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host28.jpg
59	Holcomb	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.		{}	February 2013	99%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host14.jpg
69	Cornelia	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!		{}	September 2013	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host10.jpg
79	Heath	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.	Your host will be on the property and available for anything you need during your stay.	{}	September 2018	98%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host27.jpg
91	Stevenson	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.	Your host will be on the property and available for anything you need during your stay.	{"coHost1":{"coHostName":"Matthews","coHostDateJoined":"April 2013","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost05.jpg"},"coHost2":{"coHostName":"Irene","coHostDateJoined":"January 2018","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost02.jpg"}}	December 2014	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host04.jpg
100	Koch	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.		{}	January 2014	100%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host26.jpg
21	Lucinda	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.		{}	November 2015	97%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host10.jpg
25	Diann	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.		{}	January 2014	100%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host23.jpg
33	Mcbride	I love the outdoors and especially mountain climbing, camping, snowboarding, mountain biking, bungee jumping, rock climbing and most of all, traveling! I enjoy a savory dinner out on the town with my honey, so I can recommend loads of delicious venues. I also am a big fan of exploring pubs/breweries, coffee shops and trendy stores as much as I can so whatever your cup of tea is, I can point you in the right direction.		{"coHost1":{"coHostName":"Gina","coHostDateJoined":"January 2018","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost02.jpg"}}	January 2014	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host21.jpg
42	Blackburn	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host will be on the property and available for anything you need during your stay.	{}	November 2018	99%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host18.jpg
52	Shaffer	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.		{}	November 2017	96%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host19.jpg
63	Imelda	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	February 2015	97%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host29.jpg
73	Castillo	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food		{}	May 2015	100%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host19.jpg
82	Schultz	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host will be on the property and available for anything you need during your stay.	{}	March 2013	96%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host15.jpg
87	Marissa	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	March 2017	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host20.jpg
97	Claudette	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host will be on the property and available for anything you need during your stay.	{}	March 2015	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host16.jpg
19	Alvarado	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	October 2014	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host30.jpg
30	Savage	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!		{}	July 2016	97%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host11.jpg
39	Chambers	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	March 2015	96%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host08.jpg
50	Lisa	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{"coHost1":{"coHostName":"Aguilar","coHostDateJoined":"December 2015","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost06.jpg"}}	August 2015	98%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host10.jpg
58	Oneill	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.	Your host will be on the property and available for anything you need during your stay.	{}	March 2013	99%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host27.jpg
64	Polly	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host will be on the property and available for anything you need during your stay.	{}	March 2015	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host16.jpg
74	Reilly	I love the outdoors and especially mountain climbing, camping, snowboarding, mountain biking, bungee jumping, rock climbing and most of all, traveling! I enjoy a savory dinner out on the town with my honey, so I can recommend loads of delicious venues. I also am a big fan of exploring pubs/breweries, coffee shops and trendy stores as much as I can so whatever your cup of tea is, I can point you in the right direction.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{"coHost1":{"coHostName":"Blake","coHostDateJoined":"November 2018","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost02.jpg"},"coHost2":{"coHostName":"Summer","coHostDateJoined":"November 2018","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost10.jpg"},"coHost3":{"coHostName":"Brennan","coHostDateJoined":"January 2018","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost04.jpg"}}	September 2016	97%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host15.jpg
84	Hill	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	February 2015	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host10.jpg
94	Cote	I love the outdoors and especially mountain climbing, camping, snowboarding, mountain biking, bungee jumping, rock climbing and most of all, traveling! I enjoy a savory dinner out on the town with my honey, so I can recommend loads of delicious venues. I also am a big fan of exploring pubs/breweries, coffee shops and trendy stores as much as I can so whatever your cup of tea is, I can point you in the right direction.		{}	December 2013	96%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host17.jpg
20	Katelyn	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!		{}	June 2018	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host06.jpg
28	Levine	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!		{}	July 2017	100%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host14.jpg
37	Vincent	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.		{}	August 2016	98%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host13.jpg
47	Humphrey	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!		{"coHost1":{"coHostName":"Chase","coHostDateJoined":"February 2016","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost06.jpg"}}	October 2016	100%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host23.jpg
56	Hester	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	October 2013	100%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host04.jpg
66	Trujillo	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	August 2018	97%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host13.jpg
76	Karina	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	October 2017	96%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host23.jpg
88	Kristine	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host will be on the property and available for anything you need during your stay.	{}	May 2014	97%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host02.jpg
98	Bette	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	August 2017	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host04.jpg
17	Bonita	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	August 2017	96%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host19.jpg
27	Lilia	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host will be on the property and available for anything you need during your stay.	{"coHost1":{"coHostName":"Myers","coHostDateJoined":"February 2013","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost02.jpg"}}	January 2018	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host28.jpg
36	Greer	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	August 2016	99%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host12.jpg
46	Stefanie	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{"coHost1":{"coHostName":"Doyle","coHostDateJoined":"November 2017","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost09.jpg"},"coHost2":{"coHostName":"Danny","coHostDateJoined":"April 2017","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost01.jpg"},"coHost3":{"coHostName":"Newton","coHostDateJoined":"May 2016","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost05.jpg"}}	October 2015	99%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host11.jpg
55	Houston	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.		{}	December 2017	99%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host28.jpg
65	Bernice	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	May 2017	96%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host08.jpg
75	Denise	I love the outdoors and especially mountain climbing, camping, snowboarding, mountain biking, bungee jumping, rock climbing and most of all, traveling! I enjoy a savory dinner out on the town with my honey, so I can recommend loads of delicious venues. I also am a big fan of exploring pubs/breweries, coffee shops and trendy stores as much as I can so whatever your cup of tea is, I can point you in the right direction.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	September 2014	100%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host24.jpg
86	Brenda	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	October 2013	96%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host12.jpg
96	Macias	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host will be on the property and available for anything you need during your stay.	{"coHost1":{"coHostName":"Thompson","coHostDateJoined":"September 2017","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost02.jpg"},"coHost2":{"coHostName":"Elizabeth","coHostDateJoined":"October 2015","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost09.jpg"}}	August 2015	99%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host04.jpg
18	Reba	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	April 2016	99%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host19.jpg
26	Hyde	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	March 2017	96%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host04.jpg
38	Mack	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.		{}	May 2015	96%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host27.jpg
49	Myra	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.	Your host will be on the property and available for anything you need during your stay.	{}	June 2016	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host09.jpg
57	Patel	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	April 2017	96%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host23.jpg
68	Ida	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!		{"coHost1":{"coHostName":"Tanisha","coHostDateJoined":"April 2016","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost07.jpg"}}	January 2014	97%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host03.jpg
78	Christian	I love the outdoors and especially mountain climbing, camping, snowboarding, mountain biking, bungee jumping, rock climbing and most of all, traveling! I enjoy a savory dinner out on the town with my honey, so I can recommend loads of delicious venues. I also am a big fan of exploring pubs/breweries, coffee shops and trendy stores as much as I can so whatever your cup of tea is, I can point you in the right direction.		{"coHost1":{"coHostName":"Molina","coHostDateJoined":"September 2018","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost09.jpg"},"coHost2":{"coHostName":"Porter","coHostDateJoined":"August 2013","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost06.jpg"}}	February 2015	98%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host28.jpg
90	Haley	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	January 2015	99%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host19.jpg
24	Maryann	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!		{"coHost1":{"coHostName":"Irwin","coHostDateJoined":"August 2015","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost06.jpg"}}	June 2016	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host14.jpg
32	Rochelle	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host will be on the property and available for anything you need during your stay.	{"coHost1":{"coHostName":"Cooper","coHostDateJoined":"February 2017","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost07.jpg"},"coHost2":{"coHostName":"Frost","coHostDateJoined":"June 2016","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost08.jpg"}}	November 2017	99%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host04.jpg
41	Cunningham	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	July 2017	99%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host05.jpg
51	Potter	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{"coHost1":{"coHostName":"Rodgers","coHostDateJoined":"August 2018","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost04.jpg"}}	June 2013	96%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host11.jpg
60	Frederick	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	September 2013	100%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host11.jpg
70	Aurelia	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!		{}	July 2016	98%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host28.jpg
80	Hahn	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.		{}	June 2018	97%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host05.jpg
92	Romero	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	March 2018	99%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host01.jpg
34	Haley	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	June 2013	97%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host17.jpg
43	Walter	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	October 2018	98%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host27.jpg
53	Clarissa	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.		{}	March 2017	97%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host17.jpg
62	Reid	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	May 2016	98%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host07.jpg
72	Patrica	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{"coHost1":{"coHostName":"Kim","coHostDateJoined":"December 2013","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost08.jpg"}}	November 2014	96%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host14.jpg
83	Barbra	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.	Your host will be on the property and available for anything you need during your stay.	{}	June 2017	99%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host21.jpg
85	Shannon	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host will be on the property and available for anything you need during your stay.	{"coHost1":{"coHostName":"Jordan","coHostDateJoined":"April 2017","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost05.jpg"}}	October 2014	96%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host27.jpg
95	Shana	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!		{}	October 2014	96%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host22.jpg
44	Tasha	Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.		{"coHost1":{"coHostName":"Stout","coHostDateJoined":"January 2014","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost02.jpg"}}	July 2016	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host01.jpg
61	Debra	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.		{}	November 2016	97%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host08.jpg
71	Flossie	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{"coHost1":{"coHostName":"Marcie","coHostDateJoined":"June 2017","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost04.jpg"}}	March 2017	99%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host02.jpg
81	Warner	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	August 2016	97%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host23.jpg
93	Rodriguez	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.		{}	May 2018	99%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host23.jpg
22	Ball	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{"coHost1":{"coHostName":"Aimee","coHostDateJoined":"April 2014","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost02.jpg"}}	April 2017	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host29.jpg
29	Miriam	 I enjoy restoring old houses and gardening. We have two dogs, Gunner is the old dog and we got Louie as a puppy in February of 2017. I also coach Crossfit classes at the gym on-site every Mon-Wed-Fri.	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	January 2014	100%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host28.jpg
35	Krista	I love the outdoors and especially mountain climbing, camping, snowboarding, mountain biking, bungee jumping, rock climbing and most of all, traveling! I enjoy a savory dinner out on the town with my honey, so I can recommend loads of delicious venues. I also am a big fan of exploring pubs/breweries, coffee shops and trendy stores as much as I can so whatever your cup of tea is, I can point you in the right direction.		{}	October 2015	99%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host28.jpg
48	Brandi	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.		{"coHost1":{"coHostName":"Francesca","coHostDateJoined":"May 2015","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost06.jpg"},"coHost2":{"coHostName":"Katherine","coHostDateJoined":"October 2015","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost06.jpg"}}	January 2017	100%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host30.jpg
54	Giles	When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.	Your host will be on the property and available for anything you need during your stay.	{"coHost1":{"coHostName":"Park","coHostDateJoined":"May 2013","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost01.jpg"},"coHost2":{"coHostName":"Kirk","coHostDateJoined":"April 2014","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost03.jpg"}}	July 2018	96%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host11.jpg
67	Pauline	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!		{"coHost1":{"coHostName":"Hunter","coHostDateJoined":"April 2013","coHostUrl":"https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost08.jpg"}}	May 2017	99%	within a few hours	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host16.jpg
77	Shelby	First of all I love Airbnb! I travel and work regularly in the Yucatan and am a frequent Airbnb traveler. I am an herbalist and ethnobotanist. I work out of my home in the unit next door. You’ll see me walking my little dog Tomasa that I brought back from Mexico. You can find me in my garden or teaching people about medicinal plants. I would love to have you stay here!	Your host will be on the property and available for anything you need during your stay.	{}	August 2016	99%	within a day	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host04.jpg
89	West	Travel | Geography | History | Politics | Finance | Business | Architecture | Cities | Skyscrapers | Beaches | Football | Great Food	Your host will be on the property and available for anything you need during your stay.	{}	December 2017	98%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host13.jpg
99	Mayra	My place is charming and cozy. I spent quite a lot of time renovating it completely, but keeping the old modernist elements, which are very unique and valuable. This is not an apartment designed for tourists but a real home and I think this makes a difference!	Your host won’t be on the property but they’ll be available for anything you need during your stay.	{}	March 2014	97%	within an hour	https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host16.jpg
\.


--
-- Data for Name: hosts_languages; Type: TABLE DATA; Schema: public; Owner: rpropri
--

COPY public.hosts_languages (id, host_id, language_id) FROM stdin;
1	1	1
5	3	1
6	3	8
4	2	3
2	2	1
3	2	2
7	4	1
8	5	1
9	5	3
10	6	1
11	6	2
12	6	4
13	7	1
14	8	1
15	9	1
16	10	1
17	10	5
18	11	1
19	12	1
20	12	5
21	13	1
22	14	1
23	14	5
24	15	1
25	15	3
26	16	1
27	17	1
28	17	3
29	17	4
30	18	1
31	19	1
32	20	1
33	21	1
34	22	1
35	22	7
36	23	1
37	24	1
38	24	2
39	25	1
40	26	1
41	27	1
42	28	1
43	28	2
44	28	4
45	29	1
46	29	8
47	30	1
48	31	1
49	31	2
50	32	1
51	32	5
52	33	1
53	34	1
54	34	2
55	35	1
56	36	1
57	36	4
58	37	1
59	37	2
60	37	4
61	38	1
62	38	5
63	38	7
64	39	1
65	39	3
66	40	1
67	40	2
68	41	1
69	41	2
70	42	1
71	43	1
72	44	1
73	45	1
74	45	2
75	46	1
76	46	8
77	47	1
78	48	1
79	48	2
80	49	1
81	50	1
82	51	1
83	52	1
84	52	5
85	53	1
86	54	1
87	54	6
88	55	1
89	56	1
90	56	2
91	56	6
92	57	1
93	57	2
94	58	1
95	59	1
96	60	1
97	61	1
98	61	2
99	61	3
100	62	1
101	63	1
102	64	1
103	64	2
104	65	1
105	66	1
106	66	3
107	67	1
108	68	1
109	68	4
110	68	6
111	69	1
112	70	1
113	71	1
114	71	6
115	72	1
116	72	4
117	72	6
118	73	1
119	73	3
120	74	1
121	75	1
122	75	5
123	76	1
124	77	1
125	78	1
126	78	6
127	79	1
128	80	1
129	81	1
130	81	2
131	81	3
132	82	1
133	83	1
134	83	7
135	84	1
136	85	1
137	86	1
138	87	1
139	87	3
140	88	1
141	88	5
142	89	1
143	89	2
144	90	1
145	90	2
146	91	1
147	92	1
148	92	2
149	93	1
150	94	1
151	94	5
152	95	1
153	95	2
154	96	1
155	96	3
156	96	4
157	97	1
158	97	3
159	97	4
160	98	1
161	98	2
162	99	1
163	99	2
164	100	1
165	100	3
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: rpropri
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20190518173436_seed_tables.js	1	2019-05-30 14:31:47.219-06
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: rpropri
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: rpropri
--

COPY public.languages (id, language) FROM stdin;
1	English
2	Español
4	Italiano
3	Français
5	Deutsch
6	العربية
7	Русский
8	한국어
\.


--
-- Data for Name: listings; Type: TABLE DATA; Schema: public; Owner: rpropri
--

COPY public.listings (id, title, description, type, cost, capacity, bedrooms, beds, baths, "photoUrl", city, state, country, host_id) FROM stdin;
1	Explore the City Center Just a Short Walk from this Idylic Villa	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$96.87	16	2	4	1	http://placeholder.com	Bend	Pennsylvania	United States	1
4	Unwind at this Idylic Townhouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Penthouse	$41.26	8	1	14	3	http://placeholder.com	Corinne	Palau	United States	4
2	Explore the City Center Just a Short Walk from a Chic Loft	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Penthouse	$178.47	7	1	9	2	http://placeholder.com	Elliston	Hawaii	United States	2
3	Explore the City Center Just a Short Walk from a Chic Townhouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Room	$234.60	2	1	7	5	http://placeholder.com	Chloride	Kansas	United States	3
5	Walk to the Beach from a Posh Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Apartment	$208.03	2	7	11	2	http://placeholder.com	Marbury	Idaho	United States	5
6	Explore the City Center Just a Short Walk from this Idylic Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Penthouse	$83.91	18	4	8	4	http://placeholder.com	Lemoyne	Ohio	United States	6
7	Relax in Luxury in a Chic Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Airship	$100.49	11	8	3	4.5	http://placeholder.com	Websterville	Texas	United States	7
8	Walk to the Shops from this Elegant Townhouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Villa	$153.20	20	5	12	5	http://placeholder.com	National	Georgia	United States	8
9	Explore the City Center Just a Short Walk from a Chic Bungalo	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Townhouse	$192.92	18	3	6	2.5	http://placeholder.com	Sussex	California	United States	9
10	Walk to the Shops from this Quiet Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Bungalo	$13.55	12	4	12	4.5	http://placeholder.com	Chical	North Carolina	United States	10
11	Unwind at a Contemporary Villa	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$92.20	5	2	13	4.5	http://placeholder.com	Kieler	Arkansas	United States	11
12	Walk to the Shops from this Picturesque Airship	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Apartment	$81.92	12	3	5	1.5	http://placeholder.com	Shaft	Kentucky	United States	12
13	Walk to the Shops from a Posh Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Airship	$127.07	6	4	1	5	http://placeholder.com	Dexter	Missouri	United States	13
14	Walk to the Shops from a Chic Townhouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Loft	$123.67	5	7	9	4	http://placeholder.com	Ypsilanti	Rhode Island	United States	14
17	Walk to the Beach from this Idylic Penthouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Townhouse	$45.86	19	4	3	0.5	http://placeholder.com	Cresaptown	Massachusetts	United States	17
22	Walk to the Shops from this Picturesque Villa	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Room	$81.48	20	6	7	5	http://placeholder.com	Springdale	New Jersey	United States	22
26	Kick Back and Relax at this Quiet Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Airship	$213.19	12	7	5	4.5	http://placeholder.com	Richford	Nevada	United States	26
36	Explore the City Center Just a Short Walk from a Posh Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Townhouse	$102.46	5	6	1	4	http://placeholder.com	Drytown	Alabama	United States	36
42	Walk to the Beach from a Modern Villa	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Villa	$249.75	6	8	9	3	http://placeholder.com	Wacissa	Louisiana	United States	42
54	Explore the City Center Just a Short Walk from this Idylic Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Airship	$28.97	3	7	3	5	http://placeholder.com	Moscow	Northern Mariana Islands	United States	54
62	Relax in Luxury in this Elegant Bungalo	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Villa	$176.85	13	3	15	5	http://placeholder.com	Rockingham	Palau	United States	62
73	Walk to the Beach from a Modern Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Airship	$18.10	4	8	7	5	http://placeholder.com	Coral	Virgin Islands	United States	73
81	Walk to the Beach from this Picturesque Apartment	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Villa	$182.18	16	5	13	2	http://placeholder.com	Cleary	Wyoming	United States	81
92	Walk to the Shops from a Modern Villa	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Villa	$212.25	19	5	5	4	http://placeholder.com	Muse	Nebraska	United States	92
21	Relax in Luxury in this Elegant Loft	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Villa	$108.80	2	8	11	4.5	http://placeholder.com	Caroline	New Hampshire	United States	21
28	Relax in Luxury in this Quiet Airship	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Penthouse	$242.76	14	7	7	5	http://placeholder.com	Emison	West Virginia	United States	28
38	Walk to the Shops from this Idylic Penthouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Penthouse	$57.40	11	6	3	1.5	http://placeholder.com	Denio	Vermont	United States	38
49	Kick Back and Relax at a Modern Townhouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Villa	$249.16	3	4	2	3.5	http://placeholder.com	Rivereno	Puerto Rico	United States	49
57	Kick Back and Relax at this Quiet Townhouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Villa	$177.80	7	2	11	3.5	http://placeholder.com	Lorraine	Mississippi	United States	57
67	Walk to the Shops from a Contemporary Apartment	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Townhouse	$73.65	15	6	4	1.5	http://placeholder.com	Kenmar	California	United States	67
78	Relax in Luxury in a Contemporary Townhouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Airship	$122.10	20	1	6	2	http://placeholder.com	Dowling	Virginia	United States	78
87	Explore the City Center Just a Short Walk from a Modern Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Penthouse	$138.52	10	4	11	3	http://placeholder.com	Sheatown	Colorado	United States	87
97	Relax in Luxury in this Quiet Airship	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Room	$180.85	8	6	1	0.5	http://placeholder.com	Coinjock	American Samoa	United States	97
16	Relax in Luxury in a Contemporary Villa	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Penthouse	$87.61	18	7	2	2	http://placeholder.com	Otranto	North Dakota	United States	16
31	Unwind at a Contemporary Loft	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Loft	$248.60	11	6	1	3.5	http://placeholder.com	Vaughn	Indiana	United States	31
44	Kick Back and Relax at this Quiet Airship	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Airship	$230.78	8	5	2	3	http://placeholder.com	Babb	South Dakota	United States	44
56	Walk to the Beach from a Modern Airship	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Townhouse	$180.43	13	7	14	2.5	http://placeholder.com	Benson	Minnesota	United States	56
64	Explore the City Center Just a Short Walk from a Chic Apartment	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Penthouse	$19.19	2	3	7	1.5	http://placeholder.com	Catherine	Ohio	United States	64
72	Relax in Luxury in this Quiet Villa	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Villa	$146.41	16	4	1	3	http://placeholder.com	Ilchester	Rhode Island	United States	72
85	Relax in Luxury in this Idylic Bungalo	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Apartment	$99.33	12	2	15	0.5	http://placeholder.com	Grapeview	Washington	United States	85
93	Relax in Luxury in a Chic Villa	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Loft	$56.00	13	7	12	1.5	http://placeholder.com	Leroy	Connecticut	United States	93
20	Walk to the Beach from this Picturesque Villa	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Loft	$113.21	5	2	2	0.5	http://placeholder.com	Osage	Virginia	United States	20
34	Unwind at a Chic Airship	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$20.85	9	3	13	5	http://placeholder.com	Williams	Nebraska	United States	34
46	Walk to the Beach from this Elegant Loft	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Apartment	$121.96	9	3	15	1	http://placeholder.com	Ronco	New Mexico	United States	46
53	Relax in Luxury in a Modern Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Penthouse	$112.89	20	7	12	2	http://placeholder.com	Emerald	Maine	United States	53
66	Unwind at this Idylic Townhouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Apartment	$117.57	15	8	15	2	http://placeholder.com	Tyhee	Georgia	United States	66
76	Explore the City Center Just a Short Walk from this Quiet Townhouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$219.79	12	8	9	3.5	http://placeholder.com	Garfield	Florida	United States	76
84	Unwind at this Idylic Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Bungalo	$17.25	9	5	10	2	http://placeholder.com	Cetronia	Nevada	United States	84
96	Relax in Luxury in a Modern Townhouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Townhouse	$48.79	6	1	12	4.5	http://placeholder.com	Harrison	Vermont	United States	96
18	Walk to the Shops from a Contemporary Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Villa	$147.47	6	3	11	1	http://placeholder.com	Gwynn	Florida	United States	18
33	Relax in Luxury in this Quiet Bungalo	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Loft	$211.60	18	8	4	5	http://placeholder.com	Castleton	Iowa	United States	33
41	Walk to the Shops from a Chic Townhouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Airship	$236.38	10	7	13	1.5	http://placeholder.com	Bison	Oklahoma	United States	41
52	Walk to the Shops from a Modern Loft	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Loft	$239.89	7	3	5	1.5	http://placeholder.com	Bangor	Federated States Of Micronesia	United States	52
65	Relax in Luxury in a Posh Villa	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Townhouse	$93.75	6	3	6	1.5	http://placeholder.com	Chase	Texas	United States	65
75	Walk to the Beach from a Posh Townhouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Room	$201.92	19	8	3	5	http://placeholder.com	Joppa	Massachusetts	United States	75
83	Relax in Luxury in a Modern Bungalo	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Bungalo	$225.07	9	8	11	0.5	http://placeholder.com	Fannett	Illinois	United States	83
95	Walk to the Beach from a Chic Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Apartment	$136.43	16	2	12	3	http://placeholder.com	Robbins	Maryland	United States	95
19	Kick Back and Relax at a Modern Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Loft	$69.29	14	6	1	3	http://placeholder.com	Dola	Utah	United States	19
27	Walk to the Beach from a Modern Airship	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Townhouse	$81.97	16	5	12	1.5	http://placeholder.com	Libertytown	Washington	United States	27
40	Relax in Luxury in this Picturesque Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Penthouse	$63.95	20	7	15	4.5	http://placeholder.com	Jackpot	Marshall Islands	United States	40
48	Kick Back and Relax at this Picturesque Townhouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Bungalo	$97.00	17	6	15	3	http://placeholder.com	Dundee	New York	United States	48
60	Relax in Luxury in a Modern Apartment	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Room	$216.83	20	6	13	3	http://placeholder.com	Blackgum	Hawaii	United States	60
70	Walk to the Beach from a Posh Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$183.45	9	8	8	1.5	http://placeholder.com	Downsville	Kentucky	United States	70
77	Walk to the Beach from a Posh Villa	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Bungalo	$60.39	17	6	7	1.5	http://placeholder.com	Bonanza	Utah	United States	77
90	Explore the City Center Just a Short Walk from a Chic Apartment	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Apartment	$122.21	6	8	12	3.5	http://placeholder.com	Nanafalia	Montana	United States	90
99	Relax in Luxury in a Modern Penthouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$122.86	5	7	8	2	http://placeholder.com	Rew	Oklahoma	United States	99
23	Relax in Luxury in a Chic Townhouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$191.92	12	5	12	2.5	http://placeholder.com	Outlook	Wyoming	United States	23
29	Walk to the Beach from a Chic Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Airship	$182.68	11	1	1	2	http://placeholder.com	Coloma	Colorado	United States	29
37	Walk to the Beach from a Modern Penthouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Townhouse	$42.57	12	2	15	5	http://placeholder.com	Belva	Maryland	United States	37
50	Walk to the Beach from a Contemporary Bungalo	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Airship	$208.18	9	6	12	3.5	http://placeholder.com	Bergoo	Tennessee	United States	50
58	Walk to the Beach from this Quiet Loft	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Townhouse	$226.43	10	5	1	2.5	http://placeholder.com	Darbydale	Guam	United States	58
68	Explore the City Center Just a Short Walk from this Elegant Villa	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Loft	$78.57	9	6	10	0.5	http://placeholder.com	Conestoga	North Carolina	United States	68
79	Explore the City Center Just a Short Walk from this Picturesque Apartment	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Penthouse	$75.71	3	2	3	3.5	http://placeholder.com	Grayhawk	New Hampshire	United States	79
88	Kick Back and Relax at this Idylic Airship	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Townhouse	$76.35	20	3	8	2	http://placeholder.com	Greenbackville	Arizona	United States	88
100	Explore the City Center Just a Short Walk from this Quiet Townhouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$234.95	16	5	15	5	http://placeholder.com	Jenkinsville	Louisiana	United States	100
24	Explore the City Center Just a Short Walk from this Elegant Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Penthouse	$139.42	12	8	10	5	http://placeholder.com	Riverton	Oregon	United States	24
35	Walk to the Shops from this Picturesque Bungalo	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Townhouse	$12.84	15	2	12	3.5	http://placeholder.com	Thornport	Connecticut	United States	35
43	Kick Back and Relax at a Modern Airship	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Airship	$240.55	5	1	10	1.5	http://placeholder.com	Blanford	Wisconsin	United States	43
55	Explore the City Center Just a Short Walk from this Quiet Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Villa	$189.76	4	8	14	3.5	http://placeholder.com	Bennett	Alaska	United States	55
63	Unwind at this Idylic Airship	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Room	$188.62	8	5	4	4	http://placeholder.com	Alafaya	Idaho	United States	63
71	Walk to the Shops from a Chic Penthouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$80.35	16	4	9	1.5	http://placeholder.com	Lowell	Missouri	United States	71
82	Unwind at a Chic Airship	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Airship	$137.42	20	5	1	1	http://placeholder.com	Coaldale	Oregon	United States	82
91	Kick Back and Relax at this Idylic Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Airship	$240.43	5	5	10	5	http://placeholder.com	Fillmore	Iowa	United States	91
25	Kick Back and Relax at this Quiet Apartment	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Penthouse	$110.39	8	3	5	0.5	http://placeholder.com	Makena	Illinois	United States	25
32	Unwind at a Contemporary Townhouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Loft	$146.01	10	8	9	1.5	http://placeholder.com	Clarksburg	Montana	United States	32
45	Kick Back and Relax at a Chic Villa	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Bungalo	$86.88	2	1	4	4	http://placeholder.com	Saddlebrooke	Michigan	United States	45
51	Kick Back and Relax at this Idylic Airship	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Bungalo	$69.79	16	1	15	2.5	http://placeholder.com	Barstow	South Carolina	United States	51
61	Walk to the Beach from a Contemporary Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Townhouse	$181.24	4	3	11	3	http://placeholder.com	Canterwood	Kansas	United States	61
74	Walk to the Shops from this Quiet Townhouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Airship	$48.04	8	1	8	2.5	http://placeholder.com	Smeltertown	North Dakota	United States	74
86	Kick Back and Relax at a Modern Bungalo	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Loft	$215.08	18	6	10	2.5	http://placeholder.com	Sehili	West Virginia	United States	86
94	Relax in Luxury in this Quiet Airship	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$193.92	5	6	8	2	http://placeholder.com	Delwood	Alabama	United States	94
15	Walk to the Shops from a Modern Airship	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Penthouse	$55.20	4	5	9	1.5	http://placeholder.com	Ellerslie	Virgin Islands	United States	15
30	Kick Back and Relax at a Modern Penthouse	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Apartment	$97.98	4	8	4	0.5	http://placeholder.com	Wadsworth	Arizona	United States	30
39	Walk to the Shops from a Contemporary Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Room	$133.14	3	4	2	4	http://placeholder.com	Berlin	American Samoa	United States	39
47	Walk to the Shops from this Picturesque Penthouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Loft	$56.75	11	5	8	0.5	http://placeholder.com	Cutter	Delaware	United States	47
59	Kick Back and Relax at this Quiet Airship	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Bungalo	$149.60	8	6	2	2.5	http://placeholder.com	Brooktrails	Pennsylvania	United States	59
69	Unwind at a Posh Bungalo	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Bungalo	$153.30	4	5	10	3.5	http://placeholder.com	Dellview	Arkansas	United States	69
80	Walk to the Shops from this Picturesque Villa	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Bungalo	$169.42	5	4	13	1.5	http://placeholder.com	Warren	New Jersey	United States	80
89	Unwind at this Quiet Loft	Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminium pod designed by Roderick James with views of the Sound of Mull from dragonfly windows.	Townhouse	$165.92	10	6	1	2.5	http://placeholder.com	Catharine	Indiana	United States	89
98	Explore the City Center Just a Short Walk from a Contemporary Townhouse	Relaxing refuge set on a lush hillside in the quiet seaside town of Stinson Beach. Feel transported by the authentic Japanese design aesthetic of handmade shoji screens and the tranquilizing outdoor shower and soaking tub. Forest Bath in the Bay Laurels that surround you. Indulge in treetop ocean views from the comfort of a queen bed, and watch the sun set from the privacy of a wooden deck. When it’s time to hit the beach, it’s only a minutes’ walk away from the bottom of the stairs.	Bungalo	$129.58	13	4	13	1.5	http://placeholder.com	Gerber	Marshall Islands	United States	98
\.


--
-- Name: hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpropri
--

SELECT pg_catalog.setval('public.hosts_id_seq', 100, true);


--
-- Name: hosts_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpropri
--

SELECT pg_catalog.setval('public.hosts_languages_id_seq', 165, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpropri
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 1, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: rpropri
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpropri
--

SELECT pg_catalog.setval('public.languages_id_seq', 8, true);


--
-- Name: listings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpropri
--

SELECT pg_catalog.setval('public.listings_id_seq', 100, true);


--
-- Name: hosts_languages hosts_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.hosts_languages
    ADD CONSTRAINT hosts_languages_pkey PRIMARY KEY (id);


--
-- Name: hosts hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: listings listings_pkey; Type: CONSTRAINT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.listings
    ADD CONSTRAINT listings_pkey PRIMARY KEY (id);


--
-- Name: hosts_languages hosts_languages_host_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.hosts_languages
    ADD CONSTRAINT hosts_languages_host_id_foreign FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- Name: hosts_languages hosts_languages_language_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.hosts_languages
    ADD CONSTRAINT hosts_languages_language_id_foreign FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: listings listings_host_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rpropri
--

ALTER TABLE ONLY public.listings
    ADD CONSTRAINT listings_host_id_foreign FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- PostgreSQL database dump complete
--

