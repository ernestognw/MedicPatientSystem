insert into patient values (1, 'Esteban', 'Torres', '1997-10-15', 'Male', 'Basic'::plan_t);
insert into patient values (2, 'Jesus', 'Lozano', '1998-11-02', 'Male', 'Premium'::plan_t);
insert into patient values (3, 'Ernesto', 'Garcia', '1998-12-12', 'Male', 'Unlimited'::plan_t);
insert into patient values (4, 'Jaime', 'Garza', '1997-10-18', 'Male', 'Basic'::plan_t);

insert into area values ('General Medicine'::specialties_t, 'Building A Floor 4');
insert into area values ('Traumatology'::specialties_t, 'Building B Floor 1');
insert into area values ('Allergology'::specialties_t, 'Building A Floor 2');
insert into area values ('Radiology'::specialties_t, 'Building C');
insert into area values ('Cardiology'::specialties_t, 'Building A Floor 3');
insert into area values ('Gerontology'::specialties_t, 'Building B Floor 2');
insert into area values ('Obstetrics'::specialties_t, 'Building A Floor 1');
insert into area values ('Pediatrics'::specialties_t, 'Building B Floor 3');

insert into doctor values(5, 'Manuel', 'De la O', '1975-11-06', 'Male'::gender_t,'Pediatrics'::specialties_t, 10000, 5);
insert into doctor values(6, 'Roberto', 'Leal', '1980-15-12', 'Male'::gender_t, 'General Medicine'::specialties_t,15000, 10);
insert into doctor values(7, 'Catalina', 'Elizondo', '1955-13-08', 'Female'::gender_t, 'Allergology'::specialties_t,10000, 8);
insert into doctor values(8, 'Roberta', 'Martinez', '1989-03-11', 'Female'::gender_t, 'Obstetrics'::specialties_t,10000, 5);
insert into doctor values(9, 'Karina', 'Guzman', '1985-05-04', 'Female'::gender_t, 'Gerontology'::specialties_t,10000, 10);
insert into doctor values(10, 'Mariana', 'Fernandez', '1990-06-12', 'Female'::gender_t, 'Cardiology'::specialties_t,10000, 8);
insert into doctor values(11, 'Javier', 'Martinez', '1970-05-12', 'Male'::gender_t, 'Radiology'::specialties_t,10000, 5);
insert into doctor values(12, 'Luis', 'Alvarez', '1969-04-20', 'Male'::gender_t, 'Traumatology'::specialties_t,10000, 10);
insert into doctor values(13, 'Carolina', 'Gutierrez', '1989-12-13', 'Female'::gender_t, 'Allergology'::specialties_t, 20000, 3);
insert into doctor values(14, 'Robertina', 'Ilegal', '1981-15-12', 'Male'::gender_t, 'General Medicine'::specialties_t,15000, 10);
insert into doctor values(15, 'Robert', 'Hills', '1985-12-11', 'Male'::gender_t, 'Pediatrics'::specialties_t,170000, 3);
insert into doctor values(16, 'William', 'Ham', '1979-06-21', 'Male'::gender_t, 'Pediatrics'::specialties_t,17800, 6);
insert into doctor values(17, 'Henry', 'Hampton', '1969-11-01', 'Male'::gender_t, 'Obstetrics'::specialties_t,17800, 6);

update area set ledBy = 6 where name = 'General Medicine';
update area set ledBy = 12 where name = 'Traumatology';
update area set ledBy = 7 where name = 'Allergology';
update area set ledBy = 11 where name = 'Radiology';
update area set ledBy = 10 where name = 'Cardiology';
update area set ledBy = 9 where name = 'Gerontology';
update area set ledBy = 8 where name = 'Obstetrics';
update area set ledBy = 5 where name = 'Pediatrics';

insert into treatment values('2020-07-23', array['Allegra'], 'Take one each day', 1, 7);
insert into treatment values('2020-09-14', array['Zantac', 'Midol'], '100 mg orally every 12 hours & 200 mg orally every 8 hours', 2, 11);
insert into treatment values('2020-05-27', array['Peptobismol', 'Antifludes'], '50 ml orally every 12 hours & 50 ml orally every 8 hours', 3, 6);
insert into treatment values('2020-08-03', array['Dulcolax', 'Claritin'], '50 mg orally every 12 hours & 50 mg orally every 8 hours', 4, 12);
