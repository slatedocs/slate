--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE attendees (
    id integer NOT NULL,
    event_id integer,
    member_id integer,
    email character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    postcode character varying(255),
    created_at timestamp without time zone,
    country character varying(3),
    external_constituent_id character varying(255),
    new_member boolean,
    user_ip character varying(39),
    attending_status character varying(50),
    generated_local_chapter_member_id integer,
    cached_organisation_slug character varying(255),
    additional_fields text,
    external_action_id character varying(255),
    external_id character varying(255),
    join_organisation boolean,
    join_group boolean,
    join_list_suppressed boolean
);
