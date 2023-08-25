--! Previous: -
--! Hash: sha1:b7c354b1948c5b83af2e9d53ab730d94b39353d6

-- Enter migration here
SET client_min_messages TO WARNING;

DROP SCHEMA IF EXISTS public CASCADE;
DROP SCHEMA IF EXISTS main CASCADE;

CREATE SCHEMA IF NOT EXISTS utils;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA utils;

CREATE SCHEMA IF NOT EXISTS main;

CREATE TABLE main.contacts (
    id       UUID PRIMARY KEY DEFAULT utils.uuid_generate_v4(),
    name     VARCHAR NOT NULL
);
