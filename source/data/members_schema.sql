--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE members (
    id integer NOT NULL,
    email character varying(255),
    organisation_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_id character varying(255),
    forum_premoderation_required boolean
);