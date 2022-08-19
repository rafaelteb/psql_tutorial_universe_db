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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    asteroids_id integer NOT NULL,
    age_in_millions_of_years integer,
    is_still_existant boolean NOT NULL,
    is_dangerous boolean NOT NULL,
    name character varying(40)
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroids.asteroids_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(40),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types character varying(30),
    galaxy_types character varying(30),
    distance_from_earth numeric,
    number_of_neighbours integer,
    has_been_visited boolean NOT NULL,
    has_been_colonized boolean NOT NULL,
    amount_of_stars integer,
    amount_of_blackholes integer,
    galaxy_id integer NOT NULL
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
    name character varying(40),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    host_plaet_types character varying(30),
    atmosphere_types character varying(30),
    distance_from_earth numeric,
    number_of_neighbours integer,
    has_been_visited boolean NOT NULL,
    has_been_colonized boolean NOT NULL,
    moon_id integer NOT NULL,
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
    name character varying(40),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types character varying(30),
    atmosphere_types character varying(30),
    distance_from_earth numeric,
    number_of_neighbours integer,
    has_been_visited boolean NOT NULL,
    has_been_colonized boolean NOT NULL,
    star_id integer,
    planet_id integer NOT NULL,
    moon_id integer
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
    name character varying(40),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types character varying(30),
    star_types character varying(30),
    distance_from_earth numeric,
    number_of_neighbours integer,
    has_been_visited boolean NOT NULL,
    has_been_colonized boolean NOT NULL,
    galaxy_id integer,
    amount_of_helium integer,
    amount_of_blackspots integer,
    star_id integer NOT NULL
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
-- Name: asteroids asteroids_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids ALTER COLUMN asteroids_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES (1, NULL, true, true, 'Asteroid 1');
INSERT INTO public.asteroids VALUES (2, NULL, true, true, 'Asteroid 2');
INSERT INTO public.asteroids VALUES (3, NULL, true, true, 'Asteroid 3');
INSERT INTO public.asteroids VALUES (4, NULL, true, true, 'Asteroid 4');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'The Earths Galaxy', true, true, 13600000, 'mixed', 'Sb', 25, 10, true, true, 10, 1, 1);
INSERT INTO public.galaxy VALUES ('Galaxy 1', 'Unknown Galaxy', true, true, NULL, 'mixed', 'undefined', NULL, NULL, true, true, NULL, NULL, 2);
INSERT INTO public.galaxy VALUES ('Galaxy 3', 'Unknown Galaxy', true, true, NULL, 'mixed', 'undefined', NULL, NULL, true, true, NULL, NULL, 3);
INSERT INTO public.galaxy VALUES ('Galaxy 4', 'Unknown Galaxy', true, true, NULL, 'mixed', 'undefined', NULL, NULL, true, true, NULL, NULL, 4);
INSERT INTO public.galaxy VALUES ('Galaxy 5', 'Unknown Galaxy', true, true, NULL, 'mixed', 'undefined', NULL, NULL, true, true, NULL, NULL, 5);
INSERT INTO public.galaxy VALUES ('Galaxy 6', 'Unknown Galaxy', true, true, NULL, 'mixed', 'undefined', NULL, NULL, true, true, NULL, NULL, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('The Moon Luna', 'The Earths moon', false, false, 45, 'superhabitable', 'none', 400000, 1, true, false, 1, NULL);
INSERT INTO public.moon VALUES ('Moon 4', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 2, NULL);
INSERT INTO public.moon VALUES ('Moon 5', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 3, NULL);
INSERT INTO public.moon VALUES ('Moon 6', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 4, NULL);
INSERT INTO public.moon VALUES ('Moon 7', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 5, NULL);
INSERT INTO public.moon VALUES ('Moon 8', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 6, NULL);
INSERT INTO public.moon VALUES ('Moon 9', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 7, NULL);
INSERT INTO public.moon VALUES ('Moon 10', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 8, NULL);
INSERT INTO public.moon VALUES ('Moon 11', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 9, NULL);
INSERT INTO public.moon VALUES ('Moon 12', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 10, NULL);
INSERT INTO public.moon VALUES ('Moon 13', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 11, NULL);
INSERT INTO public.moon VALUES ('Moon 14', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 12, NULL);
INSERT INTO public.moon VALUES ('Moon 15', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 13, NULL);
INSERT INTO public.moon VALUES ('Moon 16', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 14, NULL);
INSERT INTO public.moon VALUES ('Moon 17', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 17, NULL);
INSERT INTO public.moon VALUES ('Moon 18', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 18, NULL);
INSERT INTO public.moon VALUES ('Moon 19', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 19, NULL);
INSERT INTO public.moon VALUES ('Moon 20', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 20, NULL);
INSERT INTO public.moon VALUES ('Moon 25', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 23, NULL);
INSERT INTO public.moon VALUES ('Moon 21', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 24, NULL);
INSERT INTO public.moon VALUES ('Moon 22', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 25, NULL);
INSERT INTO public.moon VALUES ('Moon 23', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 26, NULL);
INSERT INTO public.moon VALUES ('Moon 24', 'A strange moon', false, false, NULL, 'undefined', 'none', NULL, 1, false, false, 27, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 'Human Homeplanet', true, false, 454000, 'Superhabitable', 'Oxygen', NULL, 10, true, true, 2, 1, NULL);
INSERT INTO public.planet VALUES ('Planet 1', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 2, NULL);
INSERT INTO public.planet VALUES ('Planet 3', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 3, NULL);
INSERT INTO public.planet VALUES ('Planet 4', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 4, NULL);
INSERT INTO public.planet VALUES ('Planet 5', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 5, NULL);
INSERT INTO public.planet VALUES ('Planet 6', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 6, NULL);
INSERT INTO public.planet VALUES ('Planet 7', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 7, NULL);
INSERT INTO public.planet VALUES ('Planet 8', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 8, NULL);
INSERT INTO public.planet VALUES ('Planet 9', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 9, NULL);
INSERT INTO public.planet VALUES ('Planet 10', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 10, NULL);
INSERT INTO public.planet VALUES ('Planet 11', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 11, NULL);
INSERT INTO public.planet VALUES ('Planet 12', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 12, NULL);
INSERT INTO public.planet VALUES ('Planet 13', 'Udnefined planet', false, false, 0, 'Undefined', 'Undefined', 0, NULL, false, false, 2, 13, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Milky Way', 'The Earths Galaxy', false, false, 4500000, NULL, 'G2V', 25, 10, false, false, 1, 93, 1500, 2);
INSERT INTO public.star VALUES ('Star 1', 'Undefined Galaxy', false, false, NULL, NULL, 'Undefined', NULL, NULL, false, false, 2, NULL, NULL, 3);
INSERT INTO public.star VALUES ('Star 8', 'Undefined Galaxy', false, false, NULL, NULL, 'Undefined', NULL, NULL, false, false, 3, NULL, NULL, 18);
INSERT INTO public.star VALUES ('Star 9', 'Undefined Galaxy', false, false, NULL, NULL, 'Undefined', NULL, NULL, false, false, 4, NULL, NULL, 19);
INSERT INTO public.star VALUES ('Star 3', 'Undefined Galaxy', false, false, NULL, NULL, 'Undefined', NULL, NULL, false, false, 5, NULL, NULL, 20);
INSERT INTO public.star VALUES ('Star 4', 'Undefined Galaxy', false, false, NULL, NULL, 'Undefined', NULL, NULL, false, false, 5, NULL, NULL, 21);
INSERT INTO public.star VALUES ('Star 5', 'Undefined Galaxy', false, false, NULL, NULL, 'Undefined', NULL, NULL, false, false, 6, NULL, NULL, 22);
INSERT INTO public.star VALUES ('Star 6', 'Undefined Galaxy', false, false, NULL, NULL, 'Undefined', NULL, NULL, false, false, 6, NULL, NULL, 23);


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 23, true);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

