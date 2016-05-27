--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE local_chapters (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    organisation_id integer,
    geography_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text,
    local_chapter_collection_id integer,
    creation_survey_responses text,
    location_id integer,
    welcome_email_content text,
    last_activity_notification_sent_at timestamp without time zone
);