DROP DATABASE IF EXISTS hostprofiles;

CREATE DATABASE hostprofiles;

\c hostprofiles;

CREATE TABLE hosts (
  id SERIAL NOT NULL,
  name VARCHAR NOT NULL,
  description VARCHAR NOT NULL,
  interaction VARCHAR NOT NULL,
  datejoined VARCHAR NOT NULL,
  responserate VARCHAR NOT NULL,
  responsetime VARCHAR NOT NULL,
  hosturl VARCHAR NOT NULL
);

CREATE TABLE languages (
  id SERIAL NOT NULL,
  language VARCHAR
);

CREATE TABLE hostlangs (
  id SERIAL NOT NULL,
  host_id INTEGER NOT NULL,
  lang_id INTEGER NOT NULL
);

CREATE TABLE cohosts (
  id SERIAL NOT NULL,
  host_id INTEGER NOT NULL,
  cohost_id INTEGER NOT NULL
);