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

insert into doctor values(5, 'Manuel', 'De la O', '1975-11-06', 'Male'::gender_t,'Pediatrics'::specialties_t, 10000, 5, 'Pediatrics'::specialties_t);
insert into doctor values(6, 'Roberto', 'Leal', '1980-12-15', 'Male'::gender_t, 'General Medicine'::specialties_t,15000, 10, 'General Medicine'::specialties_t);
insert into doctor values(7, 'Catalina', 'Elizondo', '1955-08-01', 'Female'::gender_t, 'Allergology'::specialties_t,10000, 8, 'Allergology'::specialties_t);
insert into doctor values(8, 'Roberta', 'Martinez', '1989-11-03', 'Female'::gender_t, 'Obstetrics'::specialties_t,10000, 5, 'Obstetrics'::specialties_t);
insert into doctor values(9, 'Karina', 'Guzman', '1985-04-05', 'Female'::gender_t, 'Gerontology'::specialties_t,10000, 10, 'Gerontology'::specialties_t);
insert into doctor values(10, 'Mariana', 'Fernandez', '1990-12-06', 'Female'::gender_t, 'Cardiology'::specialties_t,10000, 8, 'Cardiology'::specialties_t);
insert into doctor values(11, 'Javier', 'Martinez', '1970-12-05', 'Male'::gender_t, 'Radiology'::specialties_t,10000, 5, 'Radiology'::specialties_t);
insert into doctor values(12, 'Luis', 'Alvarez', '1969-09-04', 'Male'::gender_t, 'Traumatology'::specialties_t,10000, 10, 'Traumatology'::specialties_t);
insert into doctor values(13, 'Carolina', 'Gutierrez', '1989-12-12', 'Female'::gender_t, 'Allergology'::specialties_t, 20000, 3, 'Allergology'::specialties_t);
insert into doctor values(14, 'Robertina', 'Ilegal', '1981-12-15', 'Male'::gender_t, 'General Medicine'::specialties_t,15000, 10, 'General Medicine'::specialties_t);
insert into doctor values(15, 'Robert', 'Hills', '1985-11-12', 'Male'::gender_t, 'Pediatrics'::specialties_t,170000, 3, 'Pediatrics'::specialties_t);
insert into doctor values(16, 'William', 'Ham', '1979-11-06', 'Male'::gender_t, 'Pediatrics'::specialties_t,17800, 6, 'Pediatrics'::specialties_t);
insert into doctor values(17, 'Henry', 'Hampton', '1969-01-11', 'Male'::gender_t, 'Obstetrics'::specialties_t,17800, 6, 'Obstetrics'::specialties_t);
insert into doctor values(18, 'Paulina', 'Lozano', '1978-11-01', 'Female'::gender_t, 'Gerontology'::specialties_t,16860, 9, 'Gerontology'::specialties_t);
insert into doctor values(19, 'Maria', 'Menendez', '1983-10-11', 'Female'::gender_t, 'Cardiology'::specialties_t,15490, 3, 'Cardiology'::specialties_t);
insert into doctor values(20, 'Isabella', 'Hernandez', '1984-04-03', 'Female'::gender_t, 'Radiology'::specialties_t,17890, 5, 'Radiology'::specialties_t);
insert into doctor values(21, 'Obi-Wan', 'Kesibi', '1976-02-03', 'Male'::gender_t, 'Traumatology'::specialties_t,20030, 8, 'Traumatology'::specialties_t);

update area set ledBy = 6 where name = 'General Medicine';
update area set ledBy = 12 where name = 'Traumatology';
update area set ledBy = 7 where name = 'Allergology';
update area set ledBy = 11 where name = 'Radiology';
update area set ledBy = 10 where name = 'Cardiology';
update area set ledBy = 9 where name = 'Gerontology';
update area set ledBy = 8 where name = 'Obstetrics';
update area set ledBy = 5 where name = 'Pediatrics';

insert into treatment values('2020-07-23', array['Allegra'], 'Take one each day', 1, 5);
insert into treatment values('2020-09-14', array['Zantac', 'Midol'], '100 mg orally every 12 hours & 200 mg orally every 8 hours', 1, 8);
insert into treatment values('2020-05-27', array['Peptobismol', 'Antifludes'], '50 ml orally every 12 hours & 50 ml orally every 8 hours', 3, 6);
insert into treatment values('2020-08-03', array['Dulcolax', 'Claritin'], '50 mg orally every 12 hours & 50 mg orally every 8 hours', 3, 12);