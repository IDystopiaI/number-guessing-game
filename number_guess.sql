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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_records; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_records (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    best_game integer,
    games_played integer DEFAULT 0
);


ALTER TABLE public.game_records OWNER TO freecodecamp;

--
-- Name: games_played_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_played_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_played_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_played_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_played_game_id_seq OWNED BY public.game_records.game_id;


--
-- Name: user_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_table (
    username character varying(30) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_table OWNER TO freecodecamp;

--
-- Name: user_table_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_table_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_table_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_table_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_table_user_id_seq OWNED BY public.user_table.user_id;


--
-- Name: game_records game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_records ALTER COLUMN game_id SET DEFAULT nextval('public.games_played_game_id_seq'::regclass);


--
-- Name: user_table user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_table ALTER COLUMN user_id SET DEFAULT nextval('public.user_table_user_id_seq'::regclass);


--
-- Data for Name: game_records; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Name: games_played_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_played_game_id_seq', 1, false);


--
-- Name: user_table_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_table_user_id_seq', 1, false);


--
-- Name: game_records games_played_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_records
    ADD CONSTRAINT games_played_pkey PRIMARY KEY (game_id);


--
-- Name: user_table user_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (user_id);


--
-- Name: user_table user_table_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_username_key UNIQUE (username);


--
-- Name: game_records games_played_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_records
    ADD CONSTRAINT games_played_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

