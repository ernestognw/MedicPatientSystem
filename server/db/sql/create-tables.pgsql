-- Drop at starting
DROP TYPE IF EXISTS specialties_t CASCADE;
DROP TYPE IF EXISTS gender_t CASCADE;
DROP TYPE IF EXISTS plan_t CASCADE;
DROP TABLE IF EXISTS Person CASCADE;
DROP TABLE IF EXISTS Doctor CASCADE;
DROP TABLE IF EXISTS Patient CASCADE;
DROP TABLE IF EXISTS Treatment CASCADE;
DROP TABLE IF EXISTS Area CASCADE;

-- Create our own types
CREATE TYPE specialties_t AS ENUM('General Medicine', 'Traumatology', 'Allergology', 'Radiology', 'Cardiology', 'Gerontology', 'Obstetrics', 'Pediatrics');
CREATE TYPE gender_t AS ENUM('Male', 'Female');
CREATE TYPE plan_t AS ENUM('Unlimited', 'Premium', 'Basic');

-- Create tables
CREATE TABLE Person (
  pId int not NULL,
  firstName varchar(30),
  lastName varchar(30),
  dob date,
  gender gender_t,
  PRIMARY KEY(pId)
);

CREATE TABLE Doctor (
  pId int PRIMARY KEY,
  speciality specialties_t,
  salary int,
  yearsExperience int
) INHERITS (Person);

CREATE TABLE Patient (
  pId int PRIMARY KEY,
  insurancePlan plan_t
) INHERITS (Person);

CREATE TABLE Area(
  name specialties_t,
  location varchar(20),
  ledBy int REFERENCES Doctor(pId),
  PRIMARY KEY(name)
);

alter table Doctor
add column worksAt specialties_t REFERENCES Area(name);

CREATE TABLE Treatment (
  duration date,
  medicaments text[],
  description varchar(100),
  receivedBy int REFERENCES Patient(pId),
  prescribedBy int REFERENCES Doctor(pId)
);

-- Error message function
create or replace function r(error_message text) returns void as $$
begin
    raise notice '%', error_message;
end;
$$ language plpgsql;

-- Restrict acces to person table
create or replace rule no_person as
on insert to person
do instead select r('Trabajar solo con tablas paciente y doctor.');