--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE blast_emails (
    id integer NOT NULL,
    petition_id integer,
    from_name character varying(255) NOT NULL,
    from_address character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    recipient_count integer,
    admin_status character varying(255) DEFAULT 'pending'::character varying,
    delivery_status character varying(255) DEFAULT 'pending'::character varying,
    administered_at timestamp without time zone,
    admin_reason text,
    type character varying(255),
    group_id integer,
    organisation_id integer,
    target_recipients character varying(255),
    reviewer_user_id integer,
    event_id integer
);