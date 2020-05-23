delete from person;
delete from patient;
delete from doctor;
delete from treatment;
delete from area;

insert into category values (1, 'Fun', NULL);
insert into category values (2, 'Business', NULL);  
insert into category values (3, 'School', NULL);
insert into category values (4, 'Learning', NULL);

insert into customer values (1, 'Joshua', 'josh@gmail.com', addressUdt('Hacienda Catalunia', 123, '12345'));          
insert into customer values (2, 'Mateo', 'matt@gmail.com', addressUdt('Cedrones', 100, 'AS345'));
insert into customer values (3, 'Irene', 'ire@gmail.com', addressUdt('Lima', 420, 'LIMA1'));
insert into customer values (4, 'Juan', 'john@gmail.com', addressUdt('Tess Av.', 5505, '64898'));
insert into customer values (5, 'Andrea', 'andrea@gmail.com', addressUdt('Robles', 2305, '12009'));

insert into buy_order values (1, NULL, (select ref(c) from customer c where c.pid = 2));
insert into buy_order values (2, NULL, (select ref(c) from customer c where c.pid = 2));
insert into buy_order values (3, NULL, (select ref(c) from customer c where c.pid = 4));
insert into buy_order values (4, NULL, (select ref(c) from customer c where c.pid = 5));
insert into buy_order values (5, NULL, (select ref(c) from customer c where c.pid = 2));
insert into buy_order values (6, NULL, (select ref(c) from customer c where c.pid = 3));
insert into buy_order values (7, NULL, (select ref(c) from customer c where c.pid = 3));
insert into buy_order values (8, NULL, (select ref(c) from customer c where c.pid = 5));
insert into buy_order values (9, NULL, (select ref(c) from customer c where c.pid = 4));
insert into buy_order values (10, NULL, (select ref(c) from customer c where c.pid = 2));

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
