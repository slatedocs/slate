--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE local_chapter_members (
    id integer NOT NULL,
    local_chapter_id integer,
    member_id integer,
    introduction text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    postcode character varying(255),
    country character varying(255),
    locale character varying(5) DEFAULT 'en'::character varying,
    notification_level character varying(20),
    type character varying(255) NOT NULL,
    local_chapter_organiser_request_id integer,
    user_id integer,
    deleted_at timestamp without time zone
);