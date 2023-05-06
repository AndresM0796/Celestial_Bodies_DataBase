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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    number_of_stars integer,
    brightest_star character varying(50),
    discovery_year integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constelation character varying(50),
    is_spiral boolean,
    diameter_in_light_years integer,
    distance_from_earth_ly integer,
    alternate_name character varying(50),
    fun_fact text
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
    name character varying(50) NOT NULL,
    diameter_in_km integer,
    discovery_year integer,
    distance_to_parent_planet_km integer,
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
    name character varying(50) NOT NULL,
    diameter_in_km integer,
    number_of_moons integer,
    has_confirmed_life boolean,
    distance_from_earth_in_ly numeric(13,9),
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
    name character varying(50) NOT NULL,
    absolute_magnitude numeric(5,2),
    number_of_confirmed_planets integer,
    diameter_in_km integer,
    constellation character varying(50),
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Cancer', 121, 'Tarf', NULL);
INSERT INTO public.constellation VALUES (2, 'Canis Major', 172, 'Sirius', NULL);
INSERT INTO public.constellation VALUES (3, 'Saggitarius', 231, 'Kaus Australis', NULL);
INSERT INTO public.constellation VALUES (4, 'Scorpius', 275, 'Antares', NULL);
INSERT INTO public.constellation VALUES (5, 'Virgo', 207, 'Spica', NULL);
INSERT INTO public.constellation VALUES (6, 'Ursa Major', 245, 'Alioth', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Saggitarius', true, 105700, 0, NULL, 'The galaxy we live in');
INSERT INTO public.galaxy VALUES (2, 'Messier 31', 'Andromeda', true, 220000, 2537000, 'Andromeda', 'Is going to collide with the Milky Way un 6 billion years');
INSERT INTO public.galaxy VALUES (3, 'Messier 104', 'Virgo', false, 50000, 29350000, 'Sombrero galaxy', 'Looks like a hat');
INSERT INTO public.galaxy VALUES (4, 'IC 1101', 'Virgo', false, 3913900, 1045000000, NULL, 'Biggest known galaxy in the observable universe');
INSERT INTO public.galaxy VALUES (5, 'Messier 82', 'Circinus', false, 37000, 11420000, 'Cigar galaxy', NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 101', 'Ursa Major', true, 170000, 20870000, 'Pinwheel galaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3478, NULL, 384400, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 1877, 23460, 6);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 1877, 6000, 6);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268, 1610, 1070400, 4);
INSERT INTO public.moon VALUES (5, 'Titan', 5149, 1655, 1200000, 7);
INSERT INTO public.moon VALUES (6, 'Europa', 3121, 1610, 670900, 4);
INSERT INTO public.moon VALUES (7, 'Io', 3642, 1610, 421700, 4);
INSERT INTO public.moon VALUES (8, 'Callisto', 4820, 1610, 1883000, 4);
INSERT INTO public.moon VALUES (9, 'Triton', 2706, 1846, 354800, 9);
INSERT INTO public.moon VALUES (10, 'Titania', 1578, 1787, 435840, 8);
INSERT INTO public.moon VALUES (11, 'Rhea', 1527, 1672, 527000, 7);
INSERT INTO public.moon VALUES (12, 'Mimas', 396, 1789, 118600, 7);
INSERT INTO public.moon VALUES (13, 'Oberon', 210, 1787, 582600, 8);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1200, 1851, 266000, 8);
INSERT INTO public.moon VALUES (15, 'Miranda', 470, 1948, 129800, 8);
INSERT INTO public.moon VALUES (16, 'Proteus', 420, 1989, 117647, 9);
INSERT INTO public.moon VALUES (17, 'Iapetus', 1469, 1671, 3561000, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 1157, 1851, 190900, 8);
INSERT INTO public.moon VALUES (19, 'Tethys', 1062, 1684, 295000, 7);
INSERT INTO public.moon VALUES (20, 'Encedalus', 504, 1789, 238000, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima b', NULL, 0, false, 4.240000000, 2);
INSERT INTO public.planet VALUES (2, 'Gliese 667 cc', 19623, 0, false, 22.180000000, 5);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 1, true, 0.000000000, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 139820, 95, false, 0.000093325, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 12104, 0, false, 0.000014848, 1);
INSERT INTO public.planet VALUES (6, 'Mars', 6779, 2, false, 0.000028412, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 116460, 83, false, 0.000159570, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 50724, 27, false, 0.000326650, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 49244, 14, false, 0.000483140, 1);
INSERT INTO public.planet VALUES (10, 'Kepler 62 c', 6880, 0, false, 981.000000000, 6);
INSERT INTO public.planet VALUES (11, 'Kepler 62 e', 20515, 0, false, 1200.000000000, 6);
INSERT INTO public.planet VALUES (12, 'Kepler 23 b', 24209, 0, false, 1150.000000000, 7);
INSERT INTO public.planet VALUES (13, 'Kepler 23 c', 39755, 0, false, 2724.000000000, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.83, 8, 1392700, NULL, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 11.05, 2, 214550, 'Centaurus', 1);
INSERT INTO public.star VALUES (3, 'Sirius A', -1.33, 0, 2380700, 'Canis Major', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 0.58, 0, 1234171800, 'Orion', 1);
INSERT INTO public.star VALUES (5, 'Gliese 667 C', 11.03, 2, 473518, 'Scorpius', 1);
INSERT INTO public.star VALUES (6, 'Kepler 62', 13.75, 5, 890500, 'Lyra', 1);
INSERT INTO public.star VALUES (7, 'Kepler 23', 4.30, 3, 2114900, 'Cygnus', 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
