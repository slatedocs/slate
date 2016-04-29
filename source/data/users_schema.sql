--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    admin boolean,
    phone_number character varying(255),
    postcode character varying(255),
    join_organisation boolean,
    organisation_id integer NOT NULL,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    opt_out_site_email boolean,
    facebook_id character varying(255),
    external_constituent_id character varying(255),
    member_id integer,
    additional_fields text,
    cached_organisation_slug character varying(255),
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    locale character varying(5) DEFAULT 'en'::character varying,
    new_member boolean,
    failed_attempts integer DEFAULT 0,
    locked_at timestamp without time zone,
    country character varying(3),
    authy_id character varying(255),
    last_sign_in_with_authy timestamp without time zone,
    authy_enabled boolean DEFAULT false
);