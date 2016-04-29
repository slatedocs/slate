--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE locations (
    id integer NOT NULL,
    query character varying(255),
    latitude numeric(13,10),
    longitude numeric(13,10),
    street character varying(255),
    locality character varying(255),
    postal_code character varying(255),
    country character varying(255),
    region character varying(255),
    warning character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    extras text,
    point geometry(Point,4326),
    street_number character varying(200),
    venue character varying(255)
);