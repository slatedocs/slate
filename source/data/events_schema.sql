--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';

SET search_path = public, pg_catalog;

CREATE TABLE events (
    id integer NOT NULL,
    title character varying(255),
    description text,
    slug character varying(255),
    start timestamp without time zone,
    "end" timestamp without time zone,
    location_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    organisation_id integer,
    calendar_id integer,
    admin_status character varying(255) DEFAULT 'unreviewed'::character varying,
    admin_reason text,
    administered_at timestamp without time zone,
    external_id character varying(255),
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    max_attendees_count integer,
    locale character varying(5) DEFAULT 'en'::character varying,
    target_id integer,
    thank_attendee_email_content text,
    approaching_event_attendee_email_content text,
    bsd_constituent_groups_id text,
    notify_changes_to_attendees boolean DEFAULT true,
    sharing_disabled boolean DEFAULT false,
    host_address character varying(255),
    cancel_reason text,
    cancelled_at timestamp without time zone,
    deleted_at timestamp without time zone,
    type character varying(255),
    local_chapter_id integer,
    launched_at timestamp without time zone,
    hidden_address boolean DEFAULT false,
    promoted_from_waitlist_email_content text,
    petition_id integer,
    extra_location_info text,
    external_action_id character varying(255),
    user_ip character varying(255),
    user_agent text,
    request_referer text,
    group_id integer
);