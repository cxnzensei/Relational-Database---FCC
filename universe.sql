--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    age_in_billions_of_years numeric,
    distance_from_earth numeric,
    description text,
    name character varying(60) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: misc; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.misc (
    misc_id integer NOT NULL,
    name character varying(50) NOT NULL,
    visibility_per_year integer
);


ALTER TABLE public.misc OWNER TO freecodecamp;

--
-- Name: misc_misc_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.misc_misc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.misc_misc_id_seq OWNER TO freecodecamp;

--
-- Name: misc_misc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.misc_misc_id_seq OWNED BY public.misc.misc_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth numeric,
    diameter integer,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    age_in_billions_of_years numeric,
    distance_from_earth numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: misc misc_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.misc ALTER COLUMN misc_id SET DEFAULT nextval('public.misc_misc_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 10, 2537000, 'barred spiral galaxy', 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (3, 0.24, 25000, 'irregular galaxy', 'Canis Major Dwarf Galaxy');
INSERT INTO public.galaxy VALUES (4, 0.3, 600000000, 'radio galaxy', 'Cygnus A');
INSERT INTO public.galaxy VALUES (5, 13.61, 27000, 'includes our solar system', 'Milky Way');
INSERT INTO public.galaxy VALUES (6, 13.24, 53490000, 'first imaged black hole', 'Messier 87');
INSERT INTO public.galaxy VALUES (7, 1.101, 158200, 'Satellite galaxy of the milky way', 'Large Magellanic Cloud');


--
-- Data for Name: misc; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.misc VALUES (1, 'meteor', NULL);
INSERT INTO public.misc VALUES (2, 'meteorite', NULL);
INSERT INTO public.misc VALUES (3, 'asteroid', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'columbus', 233.67, 6788, 1);
INSERT INTO public.moon VALUES (2, 'dalton', 256.78, 5677, 2);
INSERT INTO public.moon VALUES (3, 'rhuem', 456.22, 445, 3);
INSERT INTO public.moon VALUES (4, 'titan', 567.99, 234.67, 4);
INSERT INTO public.moon VALUES (5, 'pzhong craton', 456.77, 67889, 5);
INSERT INTO public.moon VALUES (6, 'vladChad', 666.66, 6666.6666, 6);
INSERT INTO public.moon VALUES (7, 'sickgora', 567.89, 444.67, 9);
INSERT INTO public.moon VALUES (8, 'Europa', 567, 456.22, 8);
INSERT INTO public.moon VALUES (9, 'Grogu', 874.55, 345.88, 10);
INSERT INTO public.moon VALUES (10, 'Mando', 234, 678.980, 11);
INSERT INTO public.moon VALUES (11, 'Leiana', 666.77, 50085, 12);
INSERT INTO public.moon VALUES (12, 'Rothezan', 888.67, 444.56, 13);
INSERT INTO public.moon VALUES (13, 'Beltran', 129.56, 5555, 10);
INSERT INTO public.moon VALUES (14, 'limpBiz', 111.11, 666.89, 3);
INSERT INTO public.moon VALUES (15, 'Chester', 555.789, 5674.78, 6);
INSERT INTO public.moon VALUES (16, 'Mikkelang', 678.45, 3543, 1);
INSERT INTO public.moon VALUES (17, 'chewbaz', 345.66, 678.98, 5);
INSERT INTO public.moon VALUES (18, 'kwitzHauf', 345.678, 653, 12);
INSERT INTO public.moon VALUES (20, 'garantula', 998.76, 445.789, 9);
INSERT INTO public.moon VALUES (19, 'chicorita', 456.78, 12312, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'Xenatoad-A', 567.88, 6778, 233000, false, true, 3);
INSERT INTO public.planet VALUES (9, 'Sporan-A', 444, 444.44, 444444, true, true, 6);
INSERT INTO public.planet VALUES (10, 'Kashyyk', 888, 888.99, 444444, false, false, 7);
INSERT INTO public.planet VALUES (11, 'Garganzul', 555, 2345.789, 222356, true, true, 5);
INSERT INTO public.planet VALUES (12, 'Varmir', 789.88, 1123, 4453, false, false, 3);
INSERT INTO public.planet VALUES (13, 'Rigbozir', 566.87, 2245.78, 100243, false, true, 2);
INSERT INTO public.planet VALUES (1, 'Cleopatra', 436, 22500, 234000, true, false, 1);
INSERT INTO public.planet VALUES (2, 'Ramses', 12, 500, 4300, false, false, 7);
INSERT INTO public.planet VALUES (3, 'Khonshu', 678, 1256, 456000, false, true, 6);
INSERT INTO public.planet VALUES (4, 'Branma-Xeno', 455, 67.567, 3465, true, true, 5);
INSERT INTO public.planet VALUES (5, 'Balthazar', 1000, 455.6, 349, false, true, 3);
INSERT INTO public.planet VALUES (6, 'Gabriel', 777, 777.77, 7777, true, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'R71', 7, NULL, 2489.80);
INSERT INTO public.star VALUES (2, 'Alpheratz', 1, 0.6, 96.87);
INSERT INTO public.star VALUES (6, 'Spica', 6, 0.0125, 260.9);
INSERT INTO public.star VALUES (5, 'Sirius', 3, 0.023, 8.611);
INSERT INTO public.star VALUES (1, 'Sagittarius A*', 5, 0.486, 25640);
INSERT INTO public.star VALUES (3, 'Beta Cygni', 4, 0.486, 433.8);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: misc_misc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.misc_misc_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: misc misc_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.misc
    ADD CONSTRAINT misc_name_key UNIQUE (name);


--
-- Name: misc misc_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.misc
    ADD CONSTRAINT misc_pkey PRIMARY KEY (misc_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

