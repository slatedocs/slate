--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE unsubscribes (
    id integer NOT NULL,
    organisation_id integer,
    member_id integer,
    blast_email_id integer,
    email character varying(255),
    unsubscribe_object boolean,
    unsubscribe_organisation boolean,
    unsubscribable_id integer,
    unsubscribable_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_id character varying(255),
    externally_unsubscribed_at timestamp without time zone
);