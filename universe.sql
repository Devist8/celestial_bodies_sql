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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    population integer,
    galaxy_type text,
    age_in_million_of_years numeric(5,1)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    population integer,
    age_in_million_of_years numeric(4,2),
    moon_type text,
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
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    population integer,
    planet_type text,
    star_id integer,
    age_in_million_of_years numeric(5,1)
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    population integer,
    star_type text,
    galaxy_id integer,
    age_in_million_of_years numeric(5,1)
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
-- Name: types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.types (
    name character varying(30) NOT NULL,
    types_id integer NOT NULL,
    description text
);


ALTER TABLE public.types OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_type_id_seq OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.types.types_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Name: types types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types ALTER COLUMN types_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', true, false, NULL, NULL, 4500.3);
INSERT INTO public.galaxy VALUES (2, 'Bear Paw', true, false, NULL, NULL, 5000.0);
INSERT INTO public.galaxy VALUES (3, 'Cartwheel', true, false, NULL, NULL, 2200.0);
INSERT INTO public.galaxy VALUES (4, 'Eye of God', true, false, NULL, NULL, 9999.0);
INSERT INTO public.galaxy VALUES (5, 'Milky Way', true, false, NULL, NULL, 4000.0);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', true, false, NULL, NULL, 8500.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', false, true, NULL, 33.20, NULL, 5);
INSERT INTO public.moon VALUES (2, 'Callisto', false, true, NULL, 35.60, NULL, 1);
INSERT INTO public.moon VALUES (3, 'Ganymede', false, true, NULL, 30.10, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Io', false, true, NULL, 35.50, NULL, 3);
INSERT INTO public.moon VALUES (5, 'Titan', false, true, NULL, 61.20, NULL, 2);
INSERT INTO public.moon VALUES (6, 'TPandora', false, true, NULL, 62.60, NULL, 10);
INSERT INTO public.moon VALUES (7, 'Janus', false, true, NULL, 59.70, NULL, 6);
INSERT INTO public.moon VALUES (8, 'Epimetheus', false, true, NULL, 58.90, NULL, 8);
INSERT INTO public.moon VALUES (9, 'Mimas', false, true, NULL, 59.90, NULL, 11);
INSERT INTO public.moon VALUES (10, 'Telesto', false, true, NULL, 68.70, NULL, 11);
INSERT INTO public.moon VALUES (12, 'Iapetus', false, true, NULL, 66.20, NULL, 2);
INSERT INTO public.moon VALUES (13, 'Tethys', false, true, NULL, 66.30, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Phoebe', false, true, NULL, 67.20, NULL, 5);
INSERT INTO public.moon VALUES (14, 'Hyperion', false, true, NULL, 65.80, NULL, 11);
INSERT INTO public.moon VALUES (15, 'Helene', false, true, NULL, 87.20, NULL, 12);
INSERT INTO public.moon VALUES (16, 'Pan', false, true, NULL, 92.40, NULL, 2);
INSERT INTO public.moon VALUES (17, 'Ymir', false, true, NULL, 74.40, NULL, 1);
INSERT INTO public.moon VALUES (18, 'Tarvos', false, true, NULL, 41.70, NULL, 6);
INSERT INTO public.moon VALUES (19, 'Skathi', false, true, NULL, 50.50, NULL, 10);
INSERT INTO public.moon VALUES (20, 'Erriapus', false, true, NULL, 20.20, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, NULL, NULL, 1, 88.6);
INSERT INTO public.planet VALUES (2, 'Zumar', false, true, 0, NULL, 1, 47.8);
INSERT INTO public.planet VALUES (3, 'Bruv', true, false, NULL, NULL, 2, 155.4);
INSERT INTO public.planet VALUES (4, 'AEX-7067', false, true, 0, NULL, 2, 3.2);
INSERT INTO public.planet VALUES (5, 'Plutonous', false, true, 0, NULL, 3, 13.6);
INSERT INTO public.planet VALUES (6, 'Mars', false, true, 0, NULL, 4, 44.4);
INSERT INTO public.planet VALUES (7, 'Jupiter', false, true, 0, NULL, 5, 96.8);
INSERT INTO public.planet VALUES (8, 'Venus', false, true, 0, NULL, 6, 69.4);
INSERT INTO public.planet VALUES (9, 'Mercury', false, true, 0, NULL, 6, 32.7);
INSERT INTO public.planet VALUES (10, 'Saturn', false, true, 0, NULL, 3, 72.2);
INSERT INTO public.planet VALUES (11, 'Uranus', false, true, 0, NULL, 4, 89.1);
INSERT INTO public.planet VALUES (12, 'Neptune', false, true, 0, NULL, 5, 101.3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Gliese 555', false, true, NULL, NULL, 1, 256.8);
INSERT INTO public.star VALUES (2, 'EQ Pegasi', false, true, NULL, NULL, 2, 198.4);
INSERT INTO public.star VALUES (3, 'GL Virginis', false, true, NULL, NULL, 3, 303.8);
INSERT INTO public.star VALUES (4, 'Xi Bootis', false, true, NULL, NULL, 4, 322.0);
INSERT INTO public.star VALUES (5, 'Beta Hydri$', false, true, NULL, NULL, 5, 785.5);
INSERT INTO public.star VALUES (6, 'Alpha Piscis Austrini', false, true, NULL, NULL, 6, 874.2);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.types VALUES ('Lava', 1, 'Enviroment consisting of firey molting laval like a volcano');
INSERT INTO public.types VALUES ('Gas', 2, 'Enviroment consisting of various gases. No solid ground.');
INSERT INTO public.types VALUES ('Water', 3, 'Enviroment full of water with little to no land.');
INSERT INTO public.types VALUES ('Acidic', 5, 'Air, land and water has an acidic nature toxic to most forms of life.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.types_type_id_seq', 5, true);


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
-- Name: types types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (types_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

