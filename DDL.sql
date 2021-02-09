drop database if exists thenewshoestore;
create database thenewshoestore;
use thenewshoestore;

create table if not exists categories
(
		id int not null auto_increment primary key,
        category varchar(50) not null
);

insert into categories (category)
			values ('Sneakers'), ('Street Shoes'), ('Track Shoes'), ('Boots'), ('Sandals'),('Flip Flops');


create table if not exists shoes
(
		id int not null auto_increment primary key,
        size int not null,
        color varchar(50) not null,
        brand varchar(50) not null,
        shoecategory int not null,
        price int not null,
        foreign key (shoecategory) references categories (id)
);

insert into shoes (size, color, brand, shoecategory, price)
			values (39, 'White', 'Nike', 1, 700);
insert into shoes (size, color, brand, shoecategory, price)
			values (44, 'Brown', 'Adidas', 2, 1200);
insert into shoes (size, color, brand, shoecategory, price)
			values (42, 'Grey', 'Reebook', 1, 1280);
insert into shoes (size, color, brand, shoecategory, price)
			values (36, 'Red', 'Nike', 3, 500);
insert into shoes (size, color, brand, shoecategory, price)
			values (53, 'Pink', 'Salomon', 3, 1350);
insert into shoes (size, color, brand, shoecategory, price)
			values (38, 'Black', 'Ecco', 5, 800);
insert into shoes (size, color, brand, shoecategory, price)
			values (39, 'Black', 'Reebook', 4, 1200);
insert into shoes (size, color, brand, shoecategory, price)
			values (45, 'White', 'Nike', 6, 1100);
            
            
create table if not exists kunder
(
		kundId int not null auto_increment primary key,
        kundNamn varchar(50) not null,
        kundEfternamn varchar(50) not null,
        kundOrt varchar(50) not null
);

insert into kunder (kundNamn, kundEfternamn, kundOrt)
			values ('Jesper', 'Andersson', 'Alvik');
insert into kunder (kundNamn, kundEfternamn, kundOrt)
			values ('Hanna', 'Svensson','Arninge');          
insert into kunder (kundNamn, kundEfternamn, kundOrt)
			values ('Markus', 'Danielsson',  'Bro');            
insert into kunder (kundNamn, kundEfternamn, kundOrt)
			values ('Johan', 'Olsson', 'Kallhäll');
insert into kunder (kundNamn, kundEfternamn, kundOrt)
			values ('Anna', 'Oskarsson', 'Kungsängen');
insert into kunder (kundNamn, kundEfternamn, kundOrt)
			values ('Gabriel', 'Davidsson', 'Kungsängen');   
            
            
            
create table if not exists product_order
(	
		id int not null auto_increment primary key,
        kundId int not null,
        shoeId int not null,
        date_of_order date,
        foreign key (kundId)
			references kunder (kundId),
		foreign key (shoeId)
			references shoes (id)
);

insert into product_order (kundId, shoeId, date_of_order)
	values (1, 3, '2021-01-24');
insert into product_order (kundId, shoeId, date_of_order)
	values (2, 1, '2021-01-25');
insert into product_order (kundId, shoeId, date_of_order)
	values (3, 4, '2021-12-27');
insert into product_order (kundId, shoeId, date_of_order)
	values (4, 5, '2021-01-13');
insert into product_order (kundId, shoeId, date_of_order)
	values (5, 7, '2021-01-15');
insert into product_order (kundId, shoeId, date_of_order)
	values (6, 8, '2021-04-17');
insert into product_order (kundId, shoeId, date_of_order)
	values (5, 1,  '2021-06-17');
insert into product_order (kundId, shoeId, date_of_order)
	values (5, 6, '2021-06-22');
insert into product_order (kundId, shoeId, date_of_order)
	values (2, 6, '2021-12-30');
insert into product_order (kundId, shoeId, date_of_order)
	values (2, 5, '2021-11-01');
insert into product_order (kundId, shoeId, date_of_order)
	values (6, 3, '2021-01-02');   
insert into product_order (kundId, shoeId, date_of_order)
	values (1, 4, '2021-01-22');
insert into product_order (kundId, shoeId, date_of_order)
	values (1, 6, '2021-03-24');