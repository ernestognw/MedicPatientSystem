insert into patient
values('P1', 'Juan', 'Perez', '1997-05-09', 'M', 'Basic');
insert into patient
values('P2', 'Maria', 'Rodriguez', '1985-03-12', 'F', 'Premium');
insert into patient
values('P3', 'Pedro', 'Gonzalez', '1954-02-01', 'M', 'Unlimited');

insert into area
values('General Medicine', 'first floor');
insert into area
values('Traumatology', 'second floor');
insert into area
values('Allergology', 'second floor');
insert into area
values('Radiology', 'third floor');
insert into area
values('Cardiology', 'third floor floor');
insert into area
values('Gerontology', 'fourth floor');
insert into area
values('Obstetrics', 'fifth floor');
insert into area
values('Pediatrics', 'fifth floor');

insert into doctor
values('D1', 'Alfonso', 'Garcia', '1990-07-04', 'M', array['Pediatrics'::specialties_t], 10000, 5, 'Pediatrics'::specialties_t);
insert into doctor
values('D2', 'Patricia', 'Zamarripa', '1987-03-05', 'F', array['General Medicine'::specialties_t, 'Pediatrics'::specialties_t],1000, 10, 'General Medicine'::specialties_t);
insert into doctor
values('D3', 'Ruperto', 'Martinez', '1965-07-03', 'M', array['Allergology'::specialties_t, 'Pediatrics'::specialties_t],1000, 8, 'Allergology'::specialties_t);
insert into doctor
values('D4', 'Martha', 'Garcia', '1990-07-04', 'F', array['Obstetrics'::specialties_t],1000, 5, 'Obstetrics'::specialties_t);
insert into doctor
values('D5', 'Marcela', 'Zamarripa', '1987-03-05', 'F', array['Gerontology'::specialties_t],1000, 10, 'Gerontology'::specialties_t);
insert into doctor
values('D6', 'Daniel', 'Martinez', '1965-07-03', 'M', array['Cardiology'::specialties_t],1000, 8, 'Cardiology'::specialties_t);
insert into doctor
values('D7', 'Joaquin', 'Garcia', '1990-07-04', 'M', array['Radiology'::specialties_t],1000, 5, 'Radiology'::specialties_t);
insert into doctor
values('D8', 'Arnulfo', 'Zamarripa', '1987-03-05', 'M', array['Traumatology'::specialties_t],1000, 10, 'Traumatology'::specialties_t);
insert into doctor
values('D9', 'Aaron', 'Garcia', '1997-12-12', 'M', array['Allergology'::specialties_t], 2000, 3, 'Allergology'::specialties_t);


update area set leadBy = 'D2' where name = 'General Medicine';
update area set leadBy = 'D8' where name = 'Traumatology';
update area set leadBy = 'D3' where name = 'Allergology';
update area set leadBy = 'D7' where name = 'Radiology';
update area set leadBy = 'D6' where name = 'Cardiology';
update area set leadBy = 'D5' where name = 'Gerontology';
update area set leadBy = 'D4' where name = 'Obstetrics';
update area set leadBy = 'D1' where name = 'Pediatrics';

insert into treatment (prescribedBy, givenTo, duration, medicines)
values('D2', 'P3', 5, array['aspirine', 'ibuprofen']);

insert into treatment (prescribedBy, givenTo, duration, medicines)
values('D4', 'P2', 5, array['cataflam', 'antifludes']);