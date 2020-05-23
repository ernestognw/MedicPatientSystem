drop type status CASCADE;
drop type rank CASCADE;
drop type location CASCADE;
drop table Persona CASCADE;
drop table Student CASCADE;
drop table newStudent CASCADE;
drop table Faculty CASCADE;
drop table CampusClub CASCADE;
drop table Clubs CASCADE;
drop table Department CASCADE;

create type status as ENUM ('freshman','sophomore','junior','senior');
create type rank as ENUM ('Asistente', 'Asociado', 'Instructor',  'Titular');
create type location as(
    street varchar(30),
    bldg varchar(5),
    room varchar(5)
);

create table Persona(
    pid int,
    firstName varchar(20),
    lastName varchar(20),
    dob date,
    primary key (pid)
);

create table newStudent(
    status status
) INHERITS(Persona);

create table Student(
    pid int PRIMARY KEY REFERENCES Persona(pid),
    status status
);

create table newFaculty(
    rank rank,
    salario numeric
)INHERITS(Persona);

create table Faculty(
    pid int PRIMARY KEY REFERENCES Persona(pid),
    rank rank,
    salario numeric
);

create table CampusClub(
    cid int PRIMARY KEY,
    name text,
    location location,
    phone varchar(10)
);

create Table Clubs(
    id int,
    pid int references Student(pid),
    cid int references CampusClub(cid),
    PRIMARY KEY(id)
);

create table Department(
    code text PRIMARY KEY UNIQUE,
    name text
);

alter table Faculty
add column deptFaculty text REFERENCES Department(code);

alter table Faculty
add column chairOf text REFERENCES Department(code);

alter table Student
add column major text REFERENCES Department(code);

alter table CampusClub
add column advisor int REFERENCES Faculty(pid);


-- RULES
CREATE RULE newStudent AS
ON INSERT TO newStudent
DO INSTEAD (
  INSERT INTO Persona VALUES(NEW.pid, NEW.firstName, NEW.lastName, NEW.dob);
  INSERT INTO Student VALUES(NEW.pid, NEW.status);
);

CREATE RULE newFaculty AS
ON INSERT TO newFaculty
DO INSTEAD (
  INSERT INTO Persona VALUES(NEW.pid, NEW.firstName, NEW.lastName, NEW.dob);
  INSERT INTO Faculty VALUES(NEW.pid, NEW.rank, NEW.salario);
);


-- Errors
-- Funcion de mensajes de error
create or replace function error(error_message text) returns void as $$
begin
    raise notice '%', error_message;
end;
$$ language plpgsql;

-- 3
create or replace rule faculty_must_be_same_department as
on update to Faculty where new.chairOf <> (
    select deptFaculty
    from faculty
    where pId = OLD.pid
)
do instead select error('El jefe de un departamento debe trabajar para ese departamento.');

-- 4
create or replace function changeSalary() returns trigger as $$
begin
    if NEW.rank = 'Asociado' and OLD.rank = 'Asistente' then
        NEW.salario = NEW.salario * 1.1;
    end if;
    return NEW;
end;
$$ language plpgsql;

create trigger faculty_salary
before update of rank on faculty
for each row
execute procedure changeSalary();

-- 5
create or replace rule noDirector as
on update to Faculty
do update Factulty 
    set chairof = null
    where Faculty.chairof = new.chairof;

create or replace function noDirector() returns trigger as $$
begin
    if OLD.rank = 'Asistente' then
        OLD.rank = NULL;
    end if;
    return OLD;
end;
$$ language plpgsql;

create trigger null_Director
before update of chairof on faculty
for each row
execute procedure noDirector();

-- 7
create or replace rule deleteAssociateStudent as
    on delete to Student
    do delete from Clubs where Clubs.pid = old.pid;

-- 8
create or replace rule noSameDirecction as  
    on insert to CampusClub where(new.location in (select location from CampusClub))
    do instead select r('La ubicacion del club ya existe');

-- update department set deptchair = 2 where code='INT';


-- Queries

-- 1
Select *
From Student s
Where s.pid IN (
    Select pid 
    From Clubs
    Group by pid
    Having count(*) > 1
);



-- 2
Select *
From Student s
Where s.pid NOT IN (
    Select Distinct pid 
    From Clubs
);

-- 3 
Select firstName, dob
from Persona
where pid in (
    Select pid 
    From Clubs
    Where cid = 100
);

--4
Select p.firstName, p.lastName, f.rank, p.dob
From Persona p, Faculty f
Where p.pid = f.pid AND p.pid IN(
    Select advisor
    From CampusClub c
    Where c.cid = 102
);

create or replace rule noDirector as
on update to Faculty
do update Faculty 
    set chairof = null
    where Faculty.chairOf = new.chairof;