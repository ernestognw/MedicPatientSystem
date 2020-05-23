delete from person;
delete from patient;
delete from doctor;
delete from treatment;
delete from area;

-- Doctor leads area,

insert into person values (1, 'Jesus', 'Lozano', '1998-11-02', 'Male');
insert into person values (2, 'Esteban', 'Torres', '1997-10-15', 'Male');
insert into person values (3, 'Ernesto', 'Garcia', '1998-12-12', 'Male');
insert into person values (4, 'Jaime', 'Garza', '1997-10-18', 'Male');
insert into person values (5, 'Manuel', 'De la O', '1975-11-06', 'Male');
insert into person values (6, 'Roberto', 'Leal', '1980-15-12', 'Male');
insert into person values (7, 'Catalina', 'Elizondo', '1955-13-08', 'Female');
insert into person values (8, 'Roberta', 'Martinez', '1989-03-11', 'Female');
insert into person values (9, 'Karina', 'Guzman', '1985-05-04', 'Female');
insert into person values (10, 'Mariana', 'Fernandez', '1990-06-12', 'Female');
insert into person values (11, 'Javier', 'Martinez', '1970-05-12', 'Male');
insert into person values (12, 'Luis', 'Alvarez', '1969-04-20', 'Male');
insert into person values (13, 'Carolina', 'Gutierrez', '1989-12-13', 'Female');
insert into person values (14, 'Balbina', 'Elizondo', '1978-11-23', 'Female');
insert into person values (15, 'Lupe', 'Gonzalez', '1976-01-24', 'Female');

insert into doctor values ('Allergist', '20 years', (select ref(a) from area a where a.name = 'Otorhinolaryngology'), (select ref(p) from person p where p.pid = 5));
insert into doctor values ('Allergist', '10 years', (select ref(a) from area a where a.name = 'Otorhinolaryngology'),(select ref(p) from person p where p.pid = 13));

insert into doctor values ('Oncologist', '7 years', (select ref(a) from area a where a.name = 'Oncology'), (select ref(p) from person p where p.pid = 6));
insert into doctor values ('Oncologist', '11 years', (select ref(a) from area a where a.name = 'Oncology'), (select ref(p) from person p where p.pid = 11));

insert into doctor values ('Ortopedist', '5 years', (select ref(a) from area a where a.name = 'Orthopedagogy'), (select ref(p) from person p where p.pid = 9));
insert into doctor values ('Ortopedist', '8 years', (select ref(a) from area a where a.name = 'Orthopedagogy'), (select ref(p) from person p where p.pid = 12));

insert into doctor values ('Ophthalmologist', '15 years', (select ref(a) from area a where a.pid = 'Ophtalmology'), (select ref(p) from person p where p.pid = 14));
insert into doctor values ('Ophthalmologist', '12 years', (select ref(a) from area a where a.pid = 'Ophtalmology'), (select ref(p) from person p where p.pid = 15));

insert into area values('Otorhinolaryngology', 'Hospital 5', (select ref(d) from doctor d where d.pid = 5));
insert into area values('Oncology', 'Hospital 5', (select ref(d) from doctor d where d.pid = 6));
insert into area values('Orthopedagogy', 'Hospital 5', (select ref(d) from doctor d where d.pid = 9));
insert into area values('Ophthalmologist', 'Hospital 5', (select ref(d) from doctor d where d.pid = 15));

insert into treatment values('3 months', 'Allegra', 'Take one each day', 5, 1);
insert into treatment values('6 months', 'Acalabrutinib', '100 mg orally every 12 hours', (select ref(p) from patient p where p.pid = 2), (select ref(d) from doctor.d where d.pid = 6));
insert into treatment values('1 month', 'Ibuprofen', '200 mg orally every 8 hours', (select ref(p) from patient p where p.pid = 3), (select ref(d) from doctor.d where d.pid = 9));

insert into patient values('Student', (select ref(p) from person p where p.pid = 1));
insert into patient values('Student', (select ref(p) from person p where p.pid = 2));
insert into patient values('Student', (select ref(p) from person p where p.pid = 3));
insert into patient values('Student', (select ref(p) from person p where p.pid = 4));

insert into patient values('Elderly', (select ref(p) from person p where p.pid = 7));

insert into patient values('Worker', (select ref(p) from person p where p.pid = 8));
insert into patient values('Worker', (select ref(p) from person p where p.pid = 10));



--insert into buy_order values (1, NULL, (select ref(c) from customer c where c.pid = 2));
--insert into buy_order values (2, NULL, (select ref(c) from customer c where c.pid = 2));

insert into item values (1, 1000, 'Kindle Fire', 10, categoryUdtArr((select ref(c) from category c where c .pid = 1), 
                                                                    (select ref(c) from category c where c .pid = 4)));

insert into item values (2, 12000, 'Iphone 4s', 95, categoryUdtArr((select ref(c) from category c where c .pid = 1), 
                                                                    (select ref(c) from category c where c .pid = 2)));

insert into item values (3, 7999, 'Ipad 2', 5, categoryUdtArr((select ref(c) from category c where c .pid = 1), 
                                                                    (select ref(c) from category c where c .pid = 2),
                                                                    (select ref(c) from category c where c .pid = 3),
                                                                    (select ref(c) from category c where c .pid = 4)));

insert into item values (4, 5000, 'Motorola Jewel', 230, categoryUdtArr((select ref(c) from category c where c .pid = 1), 
                                                                    (select ref(c) from category c where c .pid = 2)));
insert into item values (5, 4500, 'Blackberry - Nextel', 55, categoryUdtArr((select ref(c) from category c where c .pid = 2)));

insert into item values (6, 3999.99, 'Ipod Touch', 320, categoryUdtArr((select ref(c) from category c where c .pid = 1)));        

insert into item values (7, 999, 'Amazon Gift Card', 200, NULL);

insert into item values (8, 8500, 'Samsung Galaxy 2', 20, categoryUdtArr((select ref(c) from category c where c .pid = 1), 
                                                                    (select ref(c) from category c where c .pid = 2),
                                                                    (select ref(c) from category c where c .pid = 3),
                                                                    (select ref(c) from category c where c .pid = 4)));

insert into item values (9, 333, 'Nokia Sencishi', 33, categoryUdtArr((select ref(c) from category c where c .pid = 2)));  

insert into item values (10, 15000, 'Dell Vostro 2300', 44, categoryUdtArr((select ref(c) from category c where c .pid = 2), 
                                                                    (select ref(c) from category c where c .pid = 3),
                                                                    (select ref(c) from category c where c .pid = 4)));  

insert into order_item values (1, 1000, 2, (select ref(i) from item i where i.pid = 1), (select ref(bo) from buy_order bo where bo.pid = 1));

insert into order_item values (2, 7999, 1, (select ref(i) from item i where i.pid = 3), (select ref(bo) from buy_order bo where bo.pid = 1));

insert into order_item values (3, 999, 1, (select ref(i) from item i where i.pid = 7), (select ref(bo) from buy_order bo where bo.pid = 1));

insert into order_item values (4, 15000, 1, (select ref(i) from item i where i.pid = 10), (select ref(bo) from buy_order bo where bo.pid = 1));

update buy_order set total = 25998 where pid = 1;

insert into order_item values (5, 8500, 1, (select ref(i) from item i where i.pid = 8), (select ref(bo) from buy_order bo where bo.pid = 2));

insert into order_item values (6, 333, 1, (select ref(i) from item i where i.pid = 9), (select ref(bo) from buy_order bo where bo.pid = 2));

update buy_order set total = 8833 where pid = 2;

insert into order_item values (7, 1000, 3, (select ref(i) from item i where i.pid = 1), (select ref(bo) from buy_order bo where bo.pid = 3));

insert into order_item values (8, 5000, 4, (select ref(i) from item i where i.pid = 4), (select ref(bo) from buy_order bo where bo.pid = 3));

insert into order_item values (9, 7999, 5, (select ref(i) from item i where i.pid = 3), (select ref(bo) from buy_order bo where bo.pid = 3));

update buy_order set total = 62995 where pid = 3;

insert into order_item values (10, 1000, 1, (select ref(i) from item i where i.pid = 1), (select ref(bo) from buy_order bo where bo.pid = 4));

update buy_order set total = 1000 where pid = 4;

insert into order_item values (11, 15000, 2, (select ref(i) from item i where i.pid = 10), (select ref(bo) from buy_order bo where bo.pid = 5));

update buy_order set total = 30000 where pid = 5;

insert into order_item values (12, 12000, 1, (select ref(i) from item i where i.pid = 2), (select ref(bo) from buy_order bo where bo.pid = 6));

insert into order_item values (13, 3999.99, 2, (select ref(i) from item i where i.pid = 6), (select ref(bo) from buy_order bo where bo.pid = 6));

insert into order_item values (14, 1000, 3, (select ref(i) from item i where i.pid = 1), (select ref(bo) from buy_order bo where bo.pid = 6));

update buy_order set total = 22999.98 where pid = 6;

insert into order_item values (15, 333, 1, (select ref(i) from item i where i.pid = 9), (select ref(bo) from buy_order bo where bo.pid = 7));
insert into order_item values (16, 12000, 1, (select ref(i) from item i where i.pid = 2), (select ref(bo) from buy_order bo where bo.pid = 7));

update buy_order set total = 15333 where pid = 7;

insert into order_item values (17, 12000, 2, (select ref(i) from item i where i.pid = 2), (select ref(bo) from buy_order bo where bo.pid = 8));
insert into order_item values (18, 999, 2, (select ref(i) from item i where i.pid = 7), (select ref(bo) from buy_order bo where bo.pid = 8));
insert into order_item values (19, 8500, 2, (select ref(i) from item i where i.pid = 8), (select ref(bo) from buy_order bo where bo.pid = 8));
insert into order_item values (20, 15000, 2, (select ref(i) from item i where i.pid = 10), (select ref(bo) from buy_order bo where bo.pid = 8));
insert into order_item values (21, 333, 2, (select ref(i) from item i where i.pid = 9), (select ref(bo) from buy_order bo where bo.pid = 8));

update buy_order set total = 73664 where pid = 8;

insert into order_item values (22, 1000, 1, (select ref(i) from item i where i.pid = 1), (select ref(bo) from buy_order bo where bo.pid = 9));

update buy_order set total = 1000 where pid = 9;

insert into order_item values (23, 5000, 1, (select ref(i) from item i where i.pid = 4), (select ref(bo) from buy_order bo where bo.pid = 10));
insert into order_item values (24, 333, 1, (select ref(i) from item i where i.pid = 9), (select ref(bo) from buy_order bo where bo.pid = 10));

update buy_order set total = 5333 where pid = 10;
