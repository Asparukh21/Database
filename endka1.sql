create table customer
(
    id               serial primary key,
    first_name       varchar(20) not null,
    last_name        varchar(20) not null,
    phone_number     numeric,
    city             varchar(20) not null,
    street           varchar(20) not null,
    apartment_number varchar(20) not null,
    email_address    varchar(20) not null,
    payment_id integer,
    foreign key(payment_id) references payment(id)

);
create table payment
(
    id                      serial primary key,
    order_date              date,
    payment_status          varchar(20) not null,
    payment_date            date,
    total_amount_of_payment numeric

);
create table order(
    id serial primary key,
    order_date date,
    payment_status varchar,
    number_of_orders numeric
);
create table placesan(
    customer_id integer references customer(id),
    order_id integer references order(id)
);
create table product(
    id serial primary key,
    price numeric,
    color varchar(20) not null,
    type varchar(20) not null,
    upc_code varchar(20) not null,
    availability boolean,
    size varchar(20) not null,
    warranty_period date,
    brand varchar(20) not null
);
create table hasa(
    order_id integer references order(id),
    product_id integer references product(id)
);
create table executive(
    id serial primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    working_hours numeric
);
create table monitors(
    executive_id integer references executive(id),
    payment_id integer references payment(id)
);
create table delivery(
    id serial primary key,
    delivery_number varchar(20) not null,
    delivery_status varchar(20) not null,
    city varchar(20) not null,
    street varchar(20) not null,
    apartment_number numeric
);
create table needsa(
    delivery_id integer references delivery(id),
    order_id integer references order(id)
);
create table delivery_company(
    id serial primary key,
    email varchar(20) not null,
    company_phone_number numeric,
    city varchar(20) not null,
    street varchar(20) not null,
    apartment_number numeric
);
create table makes(
    delivery_company_id integer references delivery_company(id),
    delivery_id integer references delivery(id)
);
create table warehouse(
    id serial primary key,
    city varchar(20) not null,
    street varchar(20) not null,
    building_number numeric,
    size varchar(20) not null,
    phone_number varchar(20) not null
);
create table store(
    product_id integer references product(id),
    warehouse_id integer references warehouse(id)
);
create table stores(
    id serial primary key,
    city varchar(20) not null,
    street varchar(20) not null,
    building_number varchar(20) not null
);
create table staff(
    id serial primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    working_hours numeric
);
create table workin(
    stores_id integer references stores(id),
    staff_id integer references staff(id)
);
create table Cocacola(
    id serial primary key,
    price numeric,
    type varchar(20) not null,
    upc_code varchar(20) not null,
    warranty_period date
);
create table includes(
    product_id integer references product(id),
    Cocacola_id integer references Cocacola(id)
);
create table Pills(
    id serial primary key,
    price numeric,
    type varchar(20) not null,
    upc_code varchar(20) not null,
    warranty_period date
);
create table includes1(
    pills_id integer references pills(id),
    product_id integer references product(id)
);
create table Cocacolacompany(
    id serial primary key,
    city varchar(20) not null,
    street varchar(20) not null,
    building_number numeric,
    phone_number varchar(20) not null
);
create table reorder(
    staff_id integer references staff(id),
    Cocacolacompany_id integer references Cocacolacompany(id)
);
create table cvscompany(
    id serial primary key,
    city varchar(20) not null,
    street varchar(20) not null,
    building_number numeric,
    phone_number varchar(20) not null
);
create table reorder1(
    staff_id integer references staff(id),
    cvscompany_id integer references cvscompany(id)
);
--customer
insert into customer(id,first_name,last_name,phone_number,city,street,apartment_number,email_address,payment_id) values ('Asparukh','Sultan-Murat',87472103002,'Aktau','13-12','132','asparuh661@gmail.com',1);
insert into customer(id,first_name,last_name,phone_number,city,street,apartment_number,email_address,payment_id) values ('Alen','Abeshov',87474533212,'Karaganda','423','daia','alen@gmail.com',2);
insert into customer(id,first_name,last_name,phone_number,city,street,apartment_number,email_address,payment_id) values ('Albert','Adarad',8701231123,'Almaty','Rozybakieva 181a','121','albert@gmail.cmo',3);
insert into customer(id,first_name,last_name,phone_number,city,street,apartment_number,email_address,payment_id) values ('Dias','Aibadullin',8701233234,'Almaty','234-12','12','dias661@gmail.com',4);
insert into customer(id,first_name,last_name,phone_number,city,street,apartment_number,email_address,payment_id) values ('Aibat','Akhanov',87017497232,'Almaty','14-12','132','aibat661@gmail.com',5);
--payment
insert into payment (id,order_date,payment_status,payment_date,total_amount_of_payment) values ('2021-31-03','approved','2021-24-01',10000);
insert into payment (id,order_date,payment_status,payment_date,total_amount_of_payment) values ('2021-23-01','approved','2021-20-02',11000);
insert into payment (id,order_date,payment_status,payment_date,total_amount_of_payment) values ('2021-25-06','not approved','2021-18-07',12000);
insert into payment (id,order_date,payment_status,payment_date,total_amount_of_payment) values ('2021-13-04','approved','2021-24-01',13000);
insert into payment (id,order_date,payment_status,payment_date,total_amount_of_payment) values ('2020-13-09','not approved','2021-24-01',10000);
--order
insert into order(id,order_date,payment_status,number_of_orders) values ('2021-31-03','approved',5);
insert into order(id,order_date,payment_status,number_of_orders) values ('2021-29-12','not approved',4);
insert into order(id,order_date,payment_status,number_of_orders) values ('2021-13-03','approved',3);
insert into order(id,order_date,payment_status,number_of_orders) values ('2021-08-01','not approved',2);
insert into order(id,order_date,payment_status,number_of_orders) values ('2021-25-07','approved',1);
--placesan
insert into placesan(customer_id,order_id) values(1,1);
insert into placesan(customer_id,order_id) values(2,2);
insert into placesan(customer_id,order_id) values(3,3);
insert into placesan(customer_id,order_id) values(4,4);
insert into placesan(customer_id,order_id) values(5,5);
--product
insert into product(id,price,color,type,upc_code,availability,size,warranty_period,brand) values(3000,'red','food','10213',1,'300g','2021-03-04','Cocacola');
insert into product(id,price,color,type,upc_code,availability,size,warranty_period,brand) values(3000,'blue','food','10213',0,'500g','2021-13-02','Gorilla');
insert into product(id,price,color,type,upc_code,availability,size,warranty_period,brand) values(3000,'green','food','10213',0,'500g','2021-03-04','Lays');
insert into product(id,price,color,type,upc_code,availability,size,warranty_period,brand) values(3000,'black','food','10213',1,'400g','2020-03-08','Beer');
insert into product(id,price,color,type,upc_code,availability,size,warranty_period,brand) values(3000,'white','food','10213',1,'200g','2020-30-12','Milk');
--hasa
insert into hasa(order_id,product_id) values(1,1);
insert into hasa(order_id,product_id) values(2,2);
insert into hasa(order_id,product_id) values(3,3);
insert into hasa(order_id,product_id) values(4,4);
insert into hasa(order_id,product_id) values(5,5);
--executive
insert into executive(first_name,last_name,working_hours) values ('Askar','Aimanov',8);
insert into executive(first_name,last_name,working_hours) values('Ilyas','Ilianov',7);
insert into executive(first_name,last_name,working_hours) values('Zhandos','Aibassov',10);
insert into executive(first_name,last_name,working_hours) values('Aslan','Karabasov',8);
insert into executive(first_name,last_name,working_hours) values('Aldiyar','Baltabaev',5);
--monitors
insert into monitors(executive_id, payment_id) values(1,1);
insert into monitors(executive_id, payment_id) values(2,2);
insert into monitors(executive_id, payment_id) values(3,3);
insert into monitors(executive_id, payment_id) values(4,4);
insert into monitors(executive_id, payment_id) values(5,5);
--delivery
insert into delivery(delivery_number, delivery_status, city, street, apartment_number) values ('1','delivered','Aktau','Tolkyn2',132);
insert into delivery(delivery_number, delivery_status, city, street, apartment_number) values ('2','not delivered','Aktau','Tolkyn2',120);
insert into delivery(delivery_number, delivery_status, city, street, apartment_number) values ('3','in process','Almaty','13 mcd',152);
insert into delivery(delivery_number, delivery_status, city, street, apartment_number) values ('4','delivered','Aktau','Atameken',80);
insert into delivery(delivery_number, delivery_status, city, street, apartment_number) values ('5','delivered','Almaty','6-23',75);
--needsa
insert into needsa(delivery_id,order_id)values (1,1);
insert into needsa(delivery_id,order_id)values (2,2);
insert into needsa(delivery_id,order_id)values (3,3);
insert into needsa(delivery_id,order_id)values (4,4);
insert into needsa(delivery_id,order_id)values (5,5);
--delivery_company
insert into delivery_company(email, company_phone_number, city, street, apartment_number) values('asparuh661@gmail.com',87472103002,'Aktau','Tolkyn2',37);
insert into delivery_company(email, company_phone_number, city, street, apartment_number) values('dias@gmail.com',87017397233,'Almaty','5-42',43);
insert into delivery_company(email, company_phone_number, city, street, apartment_number) values('alan@gmail.com',87783242332,'Astana','Tolkyn2',120);
insert into delivery_company(email, company_phone_number, city, street, apartment_number) values('daniyar342@gmail.com',87017566464,'Almaty','6-30',90);
insert into delivery_company(email, company_phone_number, city, street, apartment_number) values('kazlfas@gmail.com',87479089089,'Almaty','12-32',88);
--makes
insert into makes(delivery_company_id, delivery_id) values(1,1);
insert into makes(delivery_company_id, delivery_id) values(2,2);
insert into makes(delivery_company_id, delivery_id) values(3,3);
insert into makes(delivery_company_id, delivery_id) values(4,4);
insert into makes(delivery_company_id, delivery_id) values(5,5);
--warehouse
insert into warehouse(city, street, building_number, "size", phone_number) values('Aktau','Tolkyn2',66,'1km','8701739623');
insert into warehouse(city, street, building_number, "size", phone_number) values('Almaty','8 mcd',580,'2km','8747450293');
insert into warehouse(city, street, building_number, "size", phone_number) values('Astana','12 mcd',42,'3km','8778293123');
insert into warehouse(city, street, building_number, "size", phone_number) values('Uralsk','6 mcd',199,'2,5km','87017397243');
insert into warehouse(city, street, building_number, "size", phone_number) values('Aktobe','5-42',10,'4,5km','87017302342');
--store
insert into store(product_id, warehouse_id) values(1,1);
insert into store(product_id, warehouse_id) values(2,2);
insert into store(product_id, warehouse_id) values(3,3);
insert into store(product_id, warehouse_id) values(4,4);
insert into store(product_id, warehouse_id) values(5,5);
--stores
insert into stores(city, street, building_number) values('Aktau','Tolkyn2','142');
insert into stores(city, street, building_number) values('Almaty','Tolkyn2','67');
insert into stores(city, street, building_number) values('Nursultan','Tolkyn2','24');
insert into stores(city, street, building_number) values('Uralsk','Tolkyn2','54');
insert into stores(city, street, building_number) values('Karaganda','Tolkyn2','32');
--staff
insert into staff(first_name, last_name, working_hours) values ('Anel','Utegenova',8);
insert into staff(first_name, last_name, working_hours) values ('Dinara','Serlikkali',9);
insert into staff(first_name, last_name, working_hours) values ('Nursbolsyn','Smet',8);
insert into staff(first_name, last_name, working_hours) values ('Alisher','Utemurat',10);
insert into staff(first_name, last_name, working_hours) values ('Tazhimurat','Zhumagaliev',12);
--workin
insert into workin(stores_id, staff_id) values(1,1);
insert into workin(stores_id, staff_id) values(2,2);
insert into workin(stores_id, staff_id) values(3,3);
insert into workin(stores_id, staff_id) values(4,4);
insert into workin(stores_id, staff_id) values(5,5);
--Cocacola
insert into Cocacola(price, type, upc_code, warranty_period) values(32,'classic','883040132','2021-30-13');
insert into Cocacola(price, type, upc_code, warranty_period) values(40,'classic','883039294','2022-08-01');
insert into Cocacola(price, type, upc_code, warranty_period) values(40,'classic','881039403','2020-24-08');
insert into Cocacola(price, type, upc_code, warranty_period) values(35,'classic','880100394','2021-25-03');
insert into Cocacola(price, type, upc_code, warranty_period) values(38,'classic','885030200','2023-02-07');
--includes
insert into includes(product_id, Cocacola_id) values(1,1);
insert into includes(product_id, Cocacola_id) values(2,2);
insert into includes(product_id, Cocacola_id) values(3,3);
insert into includes(product_id, Cocacola_id) values(4,4);
insert into includes(product_id, Cocacola_id) values(5,5);
--Pills
insert into Pills(price, type, upc_code, warranty_period) values(500,'allergic','4859382492','2021-05-01');
insert into Pills(price, type, upc_code, warranty_period) values(500,'allergic','4859304950','2021-12-08');
insert into Pills(price, type, upc_code, warranty_period) values(500,'allergic','4859385032','2021-30-07');
insert into Pills(price, type, upc_code, warranty_period) values(500,'allergic','4859340202','2021-15-05');
insert into Pills(price, type, upc_code, warranty_period) values(500,'allergic','4859340430','2021-09-10');
--includes1
insert into includes1(pills_id, product_id) values(1,1);
insert into includes1(pills_id, product_id) values(2,2);
insert into includes1(pills_id, product_id) values(3,3);
insert into includes1(pills_id, product_id) values(4,4);
insert into includes1(pills_id, product_id) values(5,5);
--Cocacolacompany
insert into Cocacolacompany(city, street, building_number, phone_number) values('Aktau','5 mcd',380,'87023413134');
insert into Cocacolacompany(city, street, building_number, phone_number) values('Nursultan','5 mcd',400,'87014374312');
insert into Cocacolacompany(city, street, building_number, phone_number) values('Almaty','12 mcd',450,'87783041232');
insert into Cocacolacompany(city, street, building_number, phone_number) values('Aktobe','8 mcd',520,'87083842342');
insert into Cocacolacompany(city, street, building_number, phone_number) values('Kokshetau','2 mcd',310,'87472103002');
--reorder
insert into reorder(staff_id, Cocacolacompany_id) values(1,1);
insert into reorder(staff_id, Cocacolacompany_id) values(2,2);
insert into reorder(staff_id, Cocacolacompany_id) values(3,3);
insert into reorder(staff_id, Cocacolacompany_id) values(4,4);
insert into reorder(staff_id, Cocacolacompany_id) values(5,5);
--cvscompany
insert into cvscompany(city, street, building_number, phone_number) values('Aktau','5 mcd',138,'8701738284');
insert into cvscompany(city, street, building_number, phone_number) values('Almaty','5 mcd',140,'8747340214');
insert into cvscompany(city, street, building_number, phone_number) values('Astana','8 mcd',157,'87781213003');
insert into cvscompany(city, street, building_number, phone_number) values('Ust-Kamenogorsk','10 mcd',121,'87085949293');
insert into cvscompany(city, street, building_number, phone_number) values('Uralsk','12 mcd',82,'87012038402');
--reorder1
insert into reorder1(staff_id, cvscompany_id) values(1,1);
insert into reorder1(staff_id, cvscompany_id) values(2,2);
insert into reorder1(staff_id, cvscompany_id) values(3,3);
insert into reorder1(staff_id, cvscompany_id) values(4,4);
insert into reorder1(staff_id, cvscompany_id) values(5,5);