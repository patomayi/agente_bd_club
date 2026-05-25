--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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


--
-- Name: domini_departament; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.domini_departament AS text
	CONSTRAINT domini_departament_check CHECK ((VALUE = ANY (ARRAY['administració'::text, 'comercial'::text, 'entrenador'::text])));


ALTER DOMAIN public.domini_departament OWNER TO postgres;

--
-- Name: domini_mail; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.domini_mail AS text
	CONSTRAINT domini_mail_check CHECK ((VALUE ~~ '%_@%_.%__'::text));


ALTER DOMAIN public.domini_mail OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ciutat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciutat (
    ciutat text NOT NULL,
    habitants integer,
    costanera boolean,
    comarca text
);


ALTER TABLE public.ciutat OWNER TO postgres;

--
-- Name: comarca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comarca (
    comarca text NOT NULL
);


ALTER TABLE public.comarca OWNER TO postgres;

--
-- Name: coneix; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coneix (
    coneix text NOT NULL,
    es_coneguda text NOT NULL
);


ALTER TABLE public.coneix OWNER TO postgres;

--
-- Name: esport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.esport (
    esport text NOT NULL,
    preu numeric(5,2) DEFAULT 10.0,
    jugadors integer
);


ALTER TABLE public.esport OWNER TO postgres;

--
-- Name: fa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fa (
    passaport text,
    esport text,
    quota numeric(5,2)
);


ALTER TABLE public.fa OWNER TO postgres;

--
-- Name: mails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mails (
    passaport text NOT NULL,
    mail public.domini_mail NOT NULL
);


ALTER TABLE public.mails OWNER TO postgres;

--
-- Name: nomines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nomines (
    passaport text NOT NULL,
    periode date NOT NULL,
    sou_base numeric(6,2),
    retencio numeric(4,2) DEFAULT 2.0
);


ALTER TABLE public.nomines OWNER TO postgres;

--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    passaport text NOT NULL,
    nom text NOT NULL,
    cognom text NOT NULL,
    ciutat text
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- Name: soci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soci (
    passaport text NOT NULL,
    alta timestamp with time zone
);


ALTER TABLE public.soci OWNER TO postgres;

--
-- Name: treballador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treballador (
    passaport text NOT NULL,
    departament public.domini_departament,
    obeeix text
);


ALTER TABLE public.treballador OWNER TO postgres;

--
-- Data for Name: ciutat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciutat (ciutat, habitants, costanera, comarca) FROM stdin;
Cadaqués	2938	t	Alt Empordà
Badalona	219708	t	Barcelonès
San Francisco	805235	t	\N
Berlín	3499879	f	\N
Rio de Janeiro	6320446	t	\N
Castelldefels	63077	t	Baix Llobregat
París	2249975	f	\N
Lleida	139809	f	Segrià
New York	18897109	t	\N
Sitges	29140	t	Garraf
Tona	8085	f	Osona
Montgat	11	t	Maresme
Tiana	8221	f	Maresme
Esplugues	46667	f	Baix Llobregat
Atenes	664046	t	\N
Tredòs	154	f	Val d'Aran
Barcelona	1611822	t	Barcelonès
Viladecans	65444	t	Baix Llobregat
Roma	2796102	t	\N
Roses	19891	t	Alt Empordà
Amposta	21511	t	Montsià
\.


--
-- Data for Name: comarca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comarca (comarca) FROM stdin;
Barcelonès
Alt Empordà
Baix Llobregat
Val d'Aran
Osona
Garraf
Segrià
Montsià
Maresme
Tarragonès
\.


--
-- Data for Name: coneix; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coneix (coneix, es_coneguda) FROM stdin;
27673812M	X3478937A
X3478937A	27673812M
27673812M	47548338K
27673812M	294394950
294394950	27673812M
294394950	C00001549
45493393Z	32234958K
32234958K	42065765F
X4534332C	27827228B
27827228B	42065765F
\.


--
-- Data for Name: esport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.esport (esport, preu, jugadors) FROM stdin;
natació	18.35	1
tennis	21.50	1
tennis dobles	21.50	2
ping-pong	10.30	1
bàsquet	8.60	5
futbol	15.40	11
handbol	9.50	7
voleibol	14.50	6
golf	24.15	1
vela	22.60	2
\.


--
-- Data for Name: fa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fa (passaport, esport, quota) FROM stdin;
45493393Z	tennis dobles	21.50
42065765F	tennis dobles	21.50
C00001549	bàsquet	8.60
294394950	bàsquet	8.60
187448338	bàsquet	8.60
47548338K	bàsquet	8.60
38474483Z	bàsquet	8.60
27673812M	natació	18.35
X3478937A	natació	18.35
39238229E	natació	18.35
46372382N	natació	18.35
59119283Z	natació	18.35
C01X01TN	natació	18.35
38433548L	natació	18.35
27961020N	natació	18.35
C01X01TN	ping-pong	10.30
38433548L	ping-pong	10.30
32234958K	ping-pong	10.30
27673812M	ping-pong	10.30
X3478937A	ping-pong	10.30
19891898A	ping-pong	10.30
45493393Z	voleibol	14.50
42065765F	voleibol	14.50
27961020N	voleibol	14.50
32234958K	voleibol	14.50
59119283Z	voleibol	14.50
27673812M	futbol	15.40
X3478937A	futbol	15.40
294394950	futbol	15.40
39238229E	futbol	15.40
187448338	futbol	15.40
46372382N	futbol	15.40
47548338K	golf	24.15
38474483Z	vela	22.60
45493393Z	vela	22.60
C00001549	vela	22.60
47548338K	tennis	21.50
38474483Z	tennis	21.50
19891898A	tennis	21.50
42065765F	tennis	21.50
\.


--
-- Data for Name: mails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mails (passaport, mail) FROM stdin;
27673812M	carmep@ionos.cat
27673812M	carmenperalta@gmail.com
05CK02337	jmgodard@ille.fr
05CK02337	jean.marie.godard@ille.up.fr
05CK02337	jmgodard@yahoo.com
C01X01TN	rrrietto@gamil.com
19891898A	robertor@dptia.udr.edu
38223890Y	jparmalat@uab.edu  
38223890Y	jordiparmalat@gmail.com  
38223890Y	jordiparmalat@yahoo.com
Y3439185D	rexstan12@gmail.com
Y4394950D	hepe@esportespot.cat 
37228901C	sefo@esportespot.cat 
29874567M	leso@esportespot.cat 
05CK02337	jema@esportespot.cat 
C00021549	mibr@esportespot.cat 
36940559Y	mapi@esportespot.cat 
51234329N	mima@esportespot.cat 
45847558W	jogo@esportespot.cat 
48377283A	dago@esportespot.cat 
37866969E	cafe@esportespot.cat 
27827228B	soco@esportespot.cat 
X4534332C	gaco@esportespot.cat 
Y3439185D	bosa@esportespot.cat 
\.


--
-- Data for Name: nomines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nomines (passaport, periode, sou_base, retencio) FROM stdin;
37228901C	2015-01-28	1525.67	8.15
37228901C	2014-12-29	1530.80	8.15
37228901C	2014-11-29	1523.42	8.15
37228901C	2014-10-29	1523.42	8.15
37228901C	2014-09-28	1523.42	8.15
37228901C	2014-08-30	1523.42	8.15
37228901C	2014-07-29	1530.80	8.15
29874567M	2015-01-28	1213.93	10.25
29874567M	2014-12-29	1213.93	10.25
29874567M	2014-11-29	1213.93	10.25
29874567M	2014-10-29	1201.46	10.25
29874567M	2014-09-28	1201.46	6.80
29874567M	2014-08-30	1201.46	6.80
29874567M	2014-07-29	1201.46	6.80
29874567M	2014-06-29	1213.93	6.80
29874567M	2014-05-31	1213.93	6.80
29874567M	2014-04-30	1201.46	6.80
29874567M	2014-03-29	1201.46	6.80
29874567M	2014-02-28	1201.46	6.80
05CK02337	2014-01-31	1450.69	2.00
C00021549	2015-01-28	812.30	3.15
C00021549	2014-12-29	812.30	3.15
C00021549	2014-11-29	915.35	3.15
C00021549	2014-10-29	915.35	3.15
C00021549	2014-09-28	915.35	3.15
C00021549	2014-08-30	915.35	3.15
C00021549	2014-07-29	812.30	3.15
C00021549	2014-06-29	812.30	3.15
C00021549	2014-05-31	915.35	3.15
C00021549	2014-04-30	801.46	3.15
36940559Y	2015-01-28	1090.23	5.00
36940559Y	2014-12-29	1090.23	5.00
36940559Y	2014-11-29	1090.23	5.00
38223890Y	2015-01-28	1102.43	9.10
38223890Y	2014-12-29	1102.43	9.10
38223890Y	2014-11-29	1102.43	7.35
38223890Y	2014-10-29	1060.90	7.35
38223890Y	2014-09-28	1060.90	2.00
51234329N	2015-01-28	1232.02	2.00
45847558W	2015-01-28	729.45	3.59
45847558W	2014-12-29	711.34	3.59
45847558W	2014-11-29	708.10	3.59
45847558W	2014-10-29	703.56	3.59
45847558W	2014-09-28	698.32	2.00
45847558W	2014-08-30	690.12	2.00
48377283A	2015-01-28	698.32	11.50
48377283A	2014-12-29	698.32	11.50
37866969E	2015-01-28	1115.45	9.80
37866969E	2014-12-29	1102.76	9.80
37866969E	2014-11-29	1094.07	9.80
27827228B	2015-01-28	1050.30	9.80
27827228B	2014-12-29	1050.30	9.80
X4534332C	2015-01-28	1050.30	9.10
X4534332C	2014-12-29	1050.30	9.10
X4534332C	2014-11-29	1050.30	7.35
X4534332C	2014-10-29	1050.30	7.35
Y3439185D	2015-01-28	3750.12	1.00
Y3439185D	2014-12-29	3753.60	1.00
Y3439185D	2014-11-29	3752.00	1.00
\.


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona (passaport, nom, cognom, ciutat) FROM stdin;
27673812M	Carme	Peralta	Cadaqués
X3478937A	Carles	Sanàbria	Badalona
47548338K	Anna	Sanàbria	Badalona
45493393Z	Jesús	Hortesa	Castelldefels
C00001549	Mick	Brown	San Francisco
294394950	Klauss	Stallman	Berlín
39238229E	Sònia	Aragall	Barcelona
187448338	Rita	Derbeken	Berlín
46372382N	Roser	Puente	Tiana
C01X01TN	Roberto	Rietto	Roma
38433548L	Anna	Margalef	Tiana
32234958K	José	Sanlúcar	Castelldefels
38474483Z	Miquel	Vila	Tredòs
42065765F	Camila	Noriega	Castelldefels
59119283Z	Pere	Camprubí	Barcelona
27961020N	Pere	Garcia	Barcelona
19891898A	Maria	Martín	Barcelona
Y4394950D	Helena	Pérez	Tona
37228901C	Sebastià	Fonollà	Sitges
29874567M	Leonardo	Soler	Lleida
05CK02337	JeanMarie	Godard	París
C00021549	Mick	Brown	New York
36940559Y	Magdalena	Pinós	Sitges
38223890Y	Jordi	Parmalat	Badalona
51234329N	Mireia	Matas	Barcelona
45847558W	José	González	Montgat
48377283A	Daniel	González	Montgat
37866969E	Carme	Ferrer	Amposta
27827228B	Sonia	Colmena	Roses
X4534332C	Gabriel	Cobos	Roses
Y3439185D	Boris	Santos	Viladecans
\.


--
-- Data for Name: soci; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.soci (passaport, alta) FROM stdin;
27673812M	2010-03-21 00:00:00+01
X3478937A	2011-09-12 00:00:00+02
47548338K	2013-04-01 00:00:00+02
38474483Z	2014-03-02 00:00:00+01
45493393Z	2011-05-31 00:00:00+02
C00001549	2009-06-30 00:00:00+02
294394950	2012-06-14 00:00:00+02
39238229E	2011-11-14 00:00:00+01
187448338	2013-07-17 00:00:00+02
46372382N	2009-12-15 00:00:00+01
C01X01TN	2009-01-09 00:00:00+01
38433548L	2012-12-18 00:00:00+01
32234958K	2010-07-16 00:00:00+02
42065765F	2013-04-27 00:00:00+02
59119283Z	2012-10-26 00:00:00+02
27961020N	2014-10-09 00:00:00+02
19891898A	2014-12-09 00:00:00+01
\.


--
-- Data for Name: treballador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treballador (passaport, departament, obeeix) FROM stdin;
Y4394950D	administració	\N
37228901C	administració	Y4394950D
29874567M	administració	Y4394950D
05CK02337	administració	Y4394950D
C00021549	administració	05CK02337
36940559Y	comercial	\N
38223890Y	comercial	36940559Y
51234329N	comercial	36940559Y
45847558W	administració	05CK02337
48377283A	administració	37228901C
37866969E	comercial	36940559Y
27827228B	entrenador	\N
X4534332C	entrenador	\N
Y3439185D	entrenador	\N
\.


--
-- Name: ciutat ciutat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciutat
    ADD CONSTRAINT ciutat_pkey PRIMARY KEY (ciutat);


--
-- Name: comarca comarca_repetida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comarca
    ADD CONSTRAINT comarca_repetida PRIMARY KEY (comarca);


--
-- Name: coneix coneix_coneix_es_coneguda_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coneix
    ADD CONSTRAINT coneix_coneix_es_coneguda_key UNIQUE (coneix, es_coneguda);


--
-- Name: esport esport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.esport
    ADD CONSTRAINT esport_pkey PRIMARY KEY (esport);


--
-- Name: fa fa_passaport_esport_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fa
    ADD CONSTRAINT fa_passaport_esport_key UNIQUE (passaport, esport);


--
-- Name: mails mail_ja_assignat; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mails
    ADD CONSTRAINT mail_ja_assignat UNIQUE (passaport, mail);


--
-- Name: nomines nomines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomines
    ADD CONSTRAINT nomines_pkey PRIMARY KEY (passaport, periode);


--
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (passaport);


--
-- Name: soci soci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soci
    ADD CONSTRAINT soci_pkey PRIMARY KEY (passaport);


--
-- Name: treballador treballador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treballador
    ADD CONSTRAINT treballador_pkey PRIMARY KEY (passaport);


--
-- Name: ciutat ciutat_comarca_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciutat
    ADD CONSTRAINT ciutat_comarca_fkey FOREIGN KEY (comarca) REFERENCES public.comarca(comarca) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: coneix coneix_coneix_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coneix
    ADD CONSTRAINT coneix_coneix_fkey FOREIGN KEY (coneix) REFERENCES public.persona(passaport);


--
-- Name: coneix coneix_es_coneguda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coneix
    ADD CONSTRAINT coneix_es_coneguda_fkey FOREIGN KEY (es_coneguda) REFERENCES public.persona(passaport);


--
-- Name: fa fa_esport_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fa
    ADD CONSTRAINT fa_esport_fkey FOREIGN KEY (esport) REFERENCES public.esport(esport);


--
-- Name: fa fa_passaport_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fa
    ADD CONSTRAINT fa_passaport_fkey FOREIGN KEY (passaport) REFERENCES public.soci(passaport);


--
-- Name: mails mails_passaport_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mails
    ADD CONSTRAINT mails_passaport_fkey FOREIGN KEY (passaport) REFERENCES public.persona(passaport);


--
-- Name: nomines nomines_passaport_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomines
    ADD CONSTRAINT nomines_passaport_fkey FOREIGN KEY (passaport) REFERENCES public.treballador(passaport);


--
-- Name: persona persona_ciutat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_ciutat_fkey FOREIGN KEY (ciutat) REFERENCES public.ciutat(ciutat) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: soci soci_passaport_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soci
    ADD CONSTRAINT soci_passaport_fkey FOREIGN KEY (passaport) REFERENCES public.persona(passaport);


--
-- Name: treballador treballador_obeeix_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treballador
    ADD CONSTRAINT treballador_obeeix_fkey FOREIGN KEY (obeeix) REFERENCES public.treballador(passaport);


--
-- Name: treballador treballador_passaport_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treballador
    ADD CONSTRAINT treballador_passaport_fkey FOREIGN KEY (passaport) REFERENCES public.persona(passaport);


--
-- PostgreSQL database dump complete
--
