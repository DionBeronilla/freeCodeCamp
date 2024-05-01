--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(80) NOT NULL,
    description text,
    age_in_billions_of_years integer,
    size_in_light_years integer,
    size_in_dark_years numeric(4,2),
    visited_by_humans boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    age_in_billions_of_years integer,
    size_in_light_years integer,
    size_in_dark_years numeric(4,2),
    visited_by_humans boolean,
    planet_id integer NOT NULL
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
    name character varying(80) NOT NULL,
    description text,
    age_in_billions_of_years integer,
    size_in_light_years integer,
    size_in_dark_years numeric(4,2),
    visited_by_humans boolean,
    star_id integer NOT NULL
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
-- Name: sat; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sat (
    sat_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    age_in_billions_of_years integer,
    size_in_light_years integer,
    size_in_dark_years numeric(4,2),
    visited_by_humans boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.sat OWNER TO freecodecamp;

--
-- Name: sat_sat_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sat_sat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sat_sat_id_seq OWNER TO freecodecamp;

--
-- Name: sat_sat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sat_sat_id_seq OWNED BY public.sat.sat_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    age_in_billions_of_years integer,
    size_in_light_years integer,
    size_in_dark_years numeric(4,2),
    visited_by_humans boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: sat sat_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sat ALTER COLUMN sat_id SET DEFAULT nextval('public.sat_sat_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', NULL, NULL, NULL, NULL, true);
INSERT INTO public.galaxy VALUES (2, 'snicker', NULL, NULL, NULL, NULL, true);
INSERT INTO public.galaxy VALUES (3, 'kit kat', NULL, NULL, NULL, NULL, false);
INSERT INTO public.galaxy VALUES (4, 'butterfinger', NULL, NULL, NULL, NULL, false);
INSERT INTO public.galaxy VALUES (5, '3 musketeer', NULL, NULL, NULL, NULL, true);
INSERT INTO public.galaxy VALUES (6, 'babe ruth', NULL, NULL, NULL, NULL, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (13, 'moon', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (14, 'moon1', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (15, 'moon2', NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (16, 'moon3', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (17, 'moon4', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (18, 'moon5', NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (19, 'moon6', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (20, 'moon7', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (21, 'moon8', NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (22, 'moon9', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (23, 'moon10', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (24, 'moon11', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (25, 'moon12', NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (26, 'moon13', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (27, 'moon14', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (28, 'moon15', NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (29, 'moon16', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (30, 'moon17', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (31, 'moon18', NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (32, 'moon19', NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (33, 'moon20', NULL, NULL, NULL, NULL, NULL, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'venus', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'earth', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'mars', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'jupiter', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'saturn', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'neptune', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'pluto', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'uranus', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'jaba', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'azeroth', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'kalimdor', NULL, NULL, NULL, NULL, NULL, 3);


--
-- Data for Name: sat; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sat VALUES (1, 'sat1', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.sat VALUES (2, 'sat2', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.sat VALUES (3, 'sat3', NULL, NULL, NULL, NULL, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'solaris', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'saga', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'spearus', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (5, 'spot', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'solaris-a', NULL, NULL, NULL, NULL, NULL, 3);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 33, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: sat_sat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sat_sat_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: sat sat_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sat
    ADD CONSTRAINT sat_name_key UNIQUE (name);


--
-- Name: sat sat_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sat
    ADD CONSTRAINT sat_pkey PRIMARY KEY (sat_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: sat sat_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sat
    ADD CONSTRAINT sat_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

