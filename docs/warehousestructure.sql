--
-- PostgreSQL database dump
--

\restrict GOmrGZU6TcdSyif8k2ed0RFzA2KMcZR3rvZKd38HIsT6Ro8EitGvvIYiidDZ6KY

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-09-03 13:36:13

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

--
-- TOC entry 6 (class 2615 OID 24577)
-- Name: bronze; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bronze;


ALTER SCHEMA bronze OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 24579)
-- Name: gold; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA gold;


ALTER SCHEMA gold OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 24578)
-- Name: silver; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA silver;


ALTER SCHEMA silver OWNER TO postgres;

-- Completed on 2026-09-03 13:36:14

--
-- PostgreSQL database dump complete
--

\unrestrict GOmrGZU6TcdSyif8k2ed0RFzA2KMcZR3rvZKd38HIsT6Ro8EitGvvIYiidDZ6KY

