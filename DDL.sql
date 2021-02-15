drop database if exists thenewshoestore;
create database thenewshoestore;
use thenewshoestore;

create table if not exists categories
(
		id int not null auto_increment primary key,
        category varchar(50) not null
);

insert into categories (category)
		   values ('Sneakers'),
				  ('Street Shoes'),
				  ('Track Shoes'),
                  ('Boots'),
                  ('Sandals'),
                  ('Flip Flops');


create table if not exists brand
(
		id int not null auto_increment primary key,
        brandName varchar(30) not null
);

insert into brand (brandName)
			values ('Adidas');
insert into brand (brandName)
			values ('Nike');
insert into brand (brandName)
			values ('Ecco');           
insert into brand (brandName)
			values ('Converse');           
insert into brand (brandName)
			values ('Reebok');

            

create table if not exists shoes
(
		id int not null auto_increment primary key,
        size int not null,
        color varchar(50) not null,
        price int not null
);

insert into shoes (size, color, price)
			values (39, 'White', 700);
insert into shoes (size, color, price)
			values (44, 'Brown', 1200);
insert into shoes (size, color, price)
			values (38, 'Black', 1280);
insert into shoes (size, color, price)
			values (36, 'Red', 500);
insert into shoes (size, color, price)
			values (53, 'Pink', 1350);
insert into shoes (size, color, price)
			values (42, 'Grey', 800);
insert into shoes (size, color, price)
			values (39, 'Black', 1200);
insert into shoes (size, color, price)
			values (45, 'White', 1100);
            
            
            
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
        date_of_order date,
        foreign key (kundId)
			references kunder (kundId)
);

insert into product_order (kundId, date_of_order)
	values (1, '2021-03-24');
insert into product_order (kundId, date_of_order)
	values (2, '2021-03-25');
insert into product_order (kundId, date_of_order)
	values (3, '2021-12-27');
insert into product_order (kundId, date_of_order)
	values (4, '2021-03-13');
insert into product_order (kundId, date_of_order)
	values (5, '2021-01-15');
insert into product_order (kundId, date_of_order)
	values (6, '2021-04-17');
insert into product_order (kundId, date_of_order)
	values (5,  '2021-06-17');
insert into product_order (kundId, date_of_order)
	values (5, '2021-06-22');
insert into product_order (kundId, date_of_order)
	values (2, '2021-12-30');
insert into product_order (kundId, date_of_order)
	values (2, '2021-11-01');
insert into product_order (kundId, date_of_order)
	values (6, '2021-01-02');   
insert into product_order (kundId, date_of_order)
	values (1, '2021-01-22');
insert into product_order (kundId, date_of_order)
	values (1, '2021-03-24');
    
    


            
-- mappningstabell
-- mappar ihop skor med ordrar från kunder


create table if not exists orderInfo
(			
			id int not null auto_increment primary key,
            shoeId int not null,
            orderId int not null,
            foreign key (shoeId) references shoes(id),
            foreign key (orderId) references product_order(id)
);


insert into orderInfo (shoeId, orderId)
			values 		 (1, 1);
insert into orderInfo (shoeId, orderId)
			values 		 (2, 2); 
insert into orderInfo (shoeId, orderId)
			values 		 (2, 2);            
insert into orderInfo (shoeId, orderId)
			values 		 (3, 5);            
insert into orderInfo (shoeId, orderId)
			values 		 (5, 6);            
insert into orderInfo (shoeId, orderId)
			values 		 (4, 3);           
insert into orderInfo (shoeId, orderId)
			values 		 (6, 4);           
insert into orderInfo (shoeId, orderId)
			values 		 (6, 5);
            
            
-- mappningstabell
-- mappar ihop skor med olika katergorier

create table if not exists belongsTo
(
			id int not null auto_increment primary key,
            shoeId int not null,
            categoryId int not null,
            foreign key (shoeId) references shoes(id),
            foreign key (categoryId) references categories(id)
            
);

insert into belongsTo (shoeId, categoryId)
			values 	  (1,1);
insert into belongsTo (shoeId, categoryId)
			values 	  (2,3);
insert into belongsTo (shoeId, categoryId)
			values 	  (3,1);
insert into belongsTo (shoeId, categoryId)
			values 	  (4,2);
insert into belongsTo (shoeId, categoryId)
			values 	  (5,5);
insert into belongsTo (shoeId, categoryId)
			values 	  (6,3);            
insert into belongsTo (shoeId, categoryId)
			values 	  (7,5);
insert into belongsTo (shoeId, categoryId)
			values 	  (8,4);
            
            
-- mappningstabell
-- mappar ihop skor med märke


create table if not exists madeBy
(
		id int not null auto_increment primary key,
        shoeId int not null,
        brandId int not null,
        foreign key (shoeId) references shoes(id),
        foreign key (brandId) references brand(id)
);


insert into madeBy (shoeId, brandId)
			values    (1, 1);
insert into madeBy (shoeId, brandId)
			values    (2, 3);
insert into madeBy (shoeId, brandId)
			values    (3, 1);
insert into madeBy (shoeId, brandId)
			values    (4, 2);
insert into madeBy (shoeId, brandId)
			values    (5, 5);
insert into madeBy (shoeId, brandId)
			values    (6, 3);
insert into madeBy (shoeId, brandId)
			values    (7, 5);
insert into madeBy (shoeId, brandId)
			values    (8, 4);

            
            
            
            
            
            
            