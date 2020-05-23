DROP TYPE IF EXISTS gender_t CASCADE;
DROP TYPE IF EXISTS plan_t CASCADE;
DROP TABLE IF EXISTS Person CASCADE;
DROP TABLE IF EXISTS Doctor CASCADE;
DROP TABLE IF EXISTS Patient CASCADE;
DROP TABLE IF EXISTS Treatment CASCADE;
DROP TABLE IF EXISTS Area CASCADE;

CREATE TYPE gender_t AS ENUM('Male', 'Female');
CREATE TYPE plan_t AS ENUM('Student', 'Elderly', 'Worker');

CREATE TABLE Person (
  pId int,
  firstName varchar(30),
  lastName varchar(30),
  dob date,
  gender gender_t,
  PRIMARY KEY(pId)
);

CREATE TABLE Doctor (
  pId int PRIMARY KEY REFERENCES Person(pId),
  specialty varchar(30),
  yearsExperience int
) INHERITS (Person);

CREATE TABLE Patient (
  pId int PRIMARY KEY REFERENCES Person(pId),
  insurancePlan plan_t
) INHERITS (Person);

CREATE TABLE Treatment (
  duration time,
  medicaments text[],
  description varchar(50),
  receivedBy int REFERENCES Patient(pId),
  prescribedBy int REFERENCES Doctor(pId)
);

CREATE TABLE Area(
  name varchar(20),
  location varchar(20),
  ledBy int REFERENCES Doctor(pId),
  PRIMARY KEY(name)
);

alter table Doctor
add column worksAt varchar(20) REFERENCES Area(name);