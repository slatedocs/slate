--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE comments (
    id integer NOT NULL,
    text text,
    up_count integer DEFAULT 0,
    approved boolean,
    flagged_at timestamp without time zone,
    flagged_by_id integer,
    signature_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    featured boolean DEFAULT false,
    user_agent text,
    user_ip character varying(255),
    flag_reason character varying(255)
);