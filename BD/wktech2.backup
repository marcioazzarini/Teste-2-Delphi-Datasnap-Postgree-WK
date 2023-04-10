--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

-- Started on 2023-04-10 11:14:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2132 (class 1262 OID 22005)
-- Name: wktech; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE wktech WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE wktech OWNER TO postgres;

\connect wktech

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2135 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 22016)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco (
    idendereco bigint NOT NULL,
    idpessoa bigint NOT NULL,
    dscep character varying(15)
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 22014)
-- Name: endereco_idendereco_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.endereco_idendereco_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_idendereco_seq OWNER TO postgres;

--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 183
-- Name: endereco_idendereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.endereco_idendereco_seq OWNED BY public.endereco.idendereco;


--
-- TOC entry 185 (class 1259 OID 22028)
-- Name: endereco_integracao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco_integracao (
    idendereco bigint NOT NULL,
    dsuf character varying(50),
    nmcidade character varying(100),
    nmbairro character varying(50),
    nmlogradouro character varying(100),
    dscomplemento character varying(100),
    dsnumero character varying(20)
);


ALTER TABLE public.endereco_integracao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 22008)
-- Name: pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa (
    idpessoa bigint NOT NULL,
    finatureza smallint NOT NULL,
    dsdocumento character varying(20) NOT NULL,
    nmprimeiro character varying(108) NOT NULL,
    nmsegundo character varying(100) NOT NULL,
    dtregistro date
);


ALTER TABLE public.pessoa OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 22006)
-- Name: pessoa_idpessoa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pessoa_idpessoa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pessoa_idpessoa_seq OWNER TO postgres;

--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 181
-- Name: pessoa_idpessoa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pessoa_idpessoa_seq OWNED BY public.pessoa.idpessoa;


--
-- TOC entry 187 (class 1259 OID 22040)
-- Name: seq_endereco; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_endereco
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_endereco OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 22038)
-- Name: seq_pessoa; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_pessoa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_pessoa OWNER TO postgres;

--
-- TOC entry 1996 (class 2604 OID 22019)
-- Name: idendereco; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco ALTER COLUMN idendereco SET DEFAULT nextval('public.endereco_idendereco_seq'::regclass);


--
-- TOC entry 1995 (class 2604 OID 22011)
-- Name: idpessoa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa ALTER COLUMN idpessoa SET DEFAULT nextval('public.pessoa_idpessoa_seq'::regclass);


--
-- TOC entry 2123 (class 0 OID 22016)
-- Dependencies: 184
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.endereco (idendereco, idpessoa, dscep) VALUES (1, 5, '18040-040');
INSERT INTO public.endereco (idendereco, idpessoa, dscep) VALUES (3, 5, '18035-210');
INSERT INTO public.endereco (idendereco, idpessoa, dscep) VALUES (9, 9, '18040-040');
INSERT INTO public.endereco (idendereco, idpessoa, dscep) VALUES (10, 10, '18040-040');
INSERT INTO public.endereco (idendereco, idpessoa, dscep) VALUES (11, 11, '18190-000');
INSERT INTO public.endereco (idendereco, idpessoa, dscep) VALUES (12, 12, '18035-200');


--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 183
-- Name: endereco_idendereco_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.endereco_idendereco_seq', 1, false);


--
-- TOC entry 2124 (class 0 OID 22028)
-- Dependencies: 185
-- Data for Name: endereco_integracao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.endereco_integracao (idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento, dsnumero) VALUES (1, 'SP', 'Sorocaba', '', 'Rua Ana Augusto', '1', NULL);
INSERT INTO public.endereco_integracao (idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento, dsnumero) VALUES (3, 'SP', 'Sorocaba', '', 'Rua Coronel José Loureiro', '32', NULL);
INSERT INTO public.endereco_integracao (idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento, dsnumero) VALUES (9, 'SP', 'Sorocaba', '', 'Rua Ana Augusto', '2132', NULL);
INSERT INTO public.endereco_integracao (idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento, dsnumero) VALUES (10, 'SP', 'SOROCABA', '', 'RUA ANA AUGUSTO', '415', NULL);
INSERT INTO public.endereco_integracao (idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento, dsnumero) VALUES (11, 'SP', 'ARACOIABA DA SERRA', '', 'PCA CEL ALMEIDA', '67', NULL);
INSERT INTO public.endereco_integracao (idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento, dsnumero) VALUES (12, 'SP', 'SOROCABA', '', 'RUA CESARIO MOTA', '463', NULL);


--
-- TOC entry 2121 (class 0 OID 22008)
-- Dependencies: 182
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoa (idpessoa, finatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) VALUES (5, 1, '432432', 'Silvia', 'Azzarini', '2023-04-08');
INSERT INTO public.pessoa (idpessoa, finatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) VALUES (9, 1, '21321312', 'Marcio', 'Azzarini', '2023-04-10');
INSERT INTO public.pessoa (idpessoa, finatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) VALUES (10, 1, '1234', 'TESTE', 'IMPORTACAO', '2023-04-10');
INSERT INTO public.pessoa (idpessoa, finatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) VALUES (11, 2, '4321', 'TESTE 2', 'IMP2', '2023-04-10');
INSERT INTO public.pessoa (idpessoa, finatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) VALUES (12, 1, '3728738', 'JULIANO', 'SILVA', '2023-04-10');


--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 181
-- Name: pessoa_idpessoa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pessoa_idpessoa_seq', 1, false);


--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 187
-- Name: seq_endereco; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_endereco', 12, true);


--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 186
-- Name: seq_pessoa; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_pessoa', 12, true);


--
-- TOC entry 2001 (class 2606 OID 22021)
-- Name: endereco_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pk PRIMARY KEY (idendereco);


--
-- TOC entry 2003 (class 2606 OID 22032)
-- Name: enderecointegracao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco_integracao
    ADD CONSTRAINT enderecointegracao_pk PRIMARY KEY (idendereco);


--
-- TOC entry 1998 (class 2606 OID 22013)
-- Name: pessoa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pk PRIMARY KEY (idpessoa);


--
-- TOC entry 1999 (class 1259 OID 22027)
-- Name: endereco_idpessoa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX endereco_idpessoa ON public.endereco USING btree (idpessoa);


--
-- TOC entry 2004 (class 2606 OID 22022)
-- Name: endereco_fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_fk_pessoa FOREIGN KEY (idpessoa) REFERENCES public.pessoa(idpessoa) ON DELETE CASCADE;


--
-- TOC entry 2005 (class 2606 OID 22033)
-- Name: enderecointegracao_fk_endereco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco_integracao
    ADD CONSTRAINT enderecointegracao_fk_endereco FOREIGN KEY (idendereco) REFERENCES public.endereco(idendereco) ON DELETE CASCADE;


--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-04-10 11:14:21

--
-- PostgreSQL database dump complete
--

