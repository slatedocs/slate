--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE signatures (
    id integer NOT NULL,
    petition_id integer,
    email character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    postcode character varying(255),
    created_at timestamp without time zone,
    join_organisation boolean,
    deleted_at timestamp without time zone,
    unsubscribe_at timestamp without time zone,
    external_constituent_id character varying(255),
    member_id integer,
    additional_fields text,
    cached_organisation_slug character varying(255),
    source character varying(255) DEFAULT ''::character varying,
    join_group boolean,
    external_id character varying(255),
    new_member boolean,
    external_action_id character varying(255),
    locale character varying(5) DEFAULT 'en'::character varying,
    obfuscated_bsd_cons_id character varying(255),
    bucket character varying(255),
    country character varying(255),
    updated_at timestamp without time zone,
    user_ip character varying(39),
    join_list_suppressed boolean,
    daisy_chain_used character varying(50),
    bsd_ab_test_cons_group_id character varying(255),
    from_embed boolean,
    user_agent character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    last_signed_at timestamp without time zone
);