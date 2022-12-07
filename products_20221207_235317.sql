--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15rc2

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
-- Name: products; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA products;


ALTER SCHEMA products OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Customers; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products."Customers" (
    "customerNo" integer NOT NULL,
    name character varying(40),
    surname character varying(40)
);


ALTER TABLE products."Customers" OWNER TO postgres;

--
-- Name: Customers_customerNo_seq; Type: SEQUENCE; Schema: products; Owner: postgres
--

CREATE SEQUENCE products."Customers_customerNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products."Customers_customerNo_seq" OWNER TO postgres;

--
-- Name: Customers_customerNo_seq; Type: SEQUENCE OWNED BY; Schema: products; Owner: postgres
--

ALTER SEQUENCE products."Customers_customerNo_seq" OWNED BY products."Customers"."customerNo";


--
-- Name: admin; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products.admin (
    "userId" integer NOT NULL,
    password text NOT NULL,
    username text NOT NULL,
    authority text NOT NULL
);


ALTER TABLE products.admin OWNER TO postgres;

--
-- Name: adres; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products.adres (
    country text NOT NULL,
    province text NOT NULL,
    city text NOT NULL,
    "neighbourhood
" text NOT NULL,
    street text NOT NULL,
    "adressId" text NOT NULL
);


ALTER TABLE products.adres OWNER TO postgres;

--
-- Name: companies; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products.companies (
    "companyName" text NOT NULL,
    "productId" integer NOT NULL,
    adress text NOT NULL,
    "companyId" integer NOT NULL
);


ALTER TABLE products.companies OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products.customer (
    "userId" integer NOT NULL,
    mail text NOT NULL,
    contact text NOT NULL,
    budget integer NOT NULL
);


ALTER TABLE products.customer OWNER TO postgres;

--
-- Name: manager; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products.manager (
    "userId" integer NOT NULL,
    authority text NOT NULL,
    "storeId" integer NOT NULL
);


ALTER TABLE products.manager OWNER TO postgres;

--
-- Name: order; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products."order" (
    "orderId" integer NOT NULL,
    amount integer NOT NULL,
    "orderName" text NOT NULL,
    brand text NOT NULL
);


ALTER TABLE products."order" OWNER TO postgres;

--
-- Name: orderProductExtend; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products."orderProductExtend" (
    "orderId" integer NOT NULL,
    "productıd" integer NOT NULL
);


ALTER TABLE products."orderProductExtend" OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products.products (
    description character varying,
    brand character varying,
    amount integer NOT NULL,
    qu integer
);


ALTER TABLE products.products OWNER TO postgres;

--
-- Name: productsStoreTransform; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products."productsStoreTransform" (
    "prodcutId" integer NOT NULL,
    "storeId" integer NOT NULL
);


ALTER TABLE products."productsStoreTransform" OWNER TO postgres;

--
-- Name: store; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products.store (
    "storeName" text NOT NULL,
    "productId" integer NOT NULL,
    adress text NOT NULL,
    capacity integer NOT NULL,
    "storeId" integer NOT NULL
);


ALTER TABLE products.store OWNER TO postgres;

--
-- Name: storeCompanieBring; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products."storeCompanieBring" (
    "storeId" integer NOT NULL,
    "companyId" integer NOT NULL
);


ALTER TABLE products."storeCompanieBring" OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: products; Owner: postgres
--

CREATE TABLE products.users (
    name text NOT NULL,
    "surName" text NOT NULL,
    "phoneNumber" integer NOT NULL,
    "eMail" text NOT NULL,
    authority text NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE products.users OWNER TO postgres;

--
-- Name: Customers customerNo; Type: DEFAULT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products."Customers" ALTER COLUMN "customerNo" SET DEFAULT nextval('products."Customers_customerNo_seq"'::regclass);


--
-- Data for Name: Customers; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: admin; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: adres; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: companies; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: customer; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: manager; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: order; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: orderProductExtend; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: products; Type: TABLE DATA; Schema: products; Owner: postgres
--

INSERT INTO products.products VALUES
	('bisküvi', 'torku', 200, 2),
	('icecek', 'cola', 100, 1),
	('cikolata', 'eti', 300, 3);


--
-- Data for Name: productsStoreTransform; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: store; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: storeCompanieBring; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: products; Owner: postgres
--



--
-- Name: Customers_customerNo_seq; Type: SEQUENCE SET; Schema: products; Owner: postgres
--

SELECT pg_catalog.setval('products."Customers_customerNo_seq"', 1, false);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY ("userId");


--
-- Name: adres adres_pkey; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.adres
    ADD CONSTRAINT adres_pkey PRIMARY KEY ("adressId");


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY ("companyId");


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY ("userId");


--
-- Name: Customers custonmerNoPK; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products."Customers"
    ADD CONSTRAINT "custonmerNoPK" PRIMARY KEY ("customerNo");


--
-- Name: manager manager_pkey; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY ("userId");


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY ("orderId");


--
-- Name: store store_pkey; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.store
    ADD CONSTRAINT store_pkey PRIMARY KEY ("storeId");


--
-- Name: admin unique_admin_userId; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.admin
    ADD CONSTRAINT "unique_admin_userId" UNIQUE ("userId");


--
-- Name: companies unique_companies_productId; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.companies
    ADD CONSTRAINT "unique_companies_productId" UNIQUE ("productId");


--
-- Name: manager unique_manager_storeId; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.manager
    ADD CONSTRAINT "unique_manager_storeId" UNIQUE ("storeId");


--
-- Name: manager unique_manager_userId; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.manager
    ADD CONSTRAINT "unique_manager_userId" UNIQUE ("userId");


--
-- Name: orderProductExtend unique_orderProductExtend_orderId; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products."orderProductExtend"
    ADD CONSTRAINT "unique_orderProductExtend_orderId" UNIQUE ("orderId");


--
-- Name: storeCompanieBring unique_storeCompanieBring_companyId; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products."storeCompanieBring"
    ADD CONSTRAINT "unique_storeCompanieBring_companyId" UNIQUE ("companyId");


--
-- Name: storeCompanieBring unique_storeCompanieBring_storeId; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products."storeCompanieBring"
    ADD CONSTRAINT "unique_storeCompanieBring_storeId" UNIQUE ("storeId");


--
-- Name: store unique_store_productsId; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.store
    ADD CONSTRAINT "unique_store_productsId" UNIQUE ("productId");


--
-- Name: store unique_store_storeName; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.store
    ADD CONSTRAINT "unique_store_storeName" UNIQUE ("storeName");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: products; Owner: postgres
--

ALTER TABLE ONLY products.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- PostgreSQL database dump complete
--

