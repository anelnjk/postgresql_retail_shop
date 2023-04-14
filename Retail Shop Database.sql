//DDL_STATEMENTS
//CREATING_DATABASE
create table address
(
	address_id int not null,
	region varchar(32) not null,
	city varchar(32),
	address_line varchar(32),
	postcode int,
	primary key (address_id)
);
create table suppliers
(
	supplier_id int not null,
	supplier_email varchar(64),
	supplier_phone varchar(32),
	supplier_firstname varchar(32) not null,
	supplier_surname varchar(32) not null,
	address_id int not null,
	sup_start_date date not null,
	sup_end_date date,
	primary key (supplier_id),
	foreign key (address_id) references address(address_id)
);
create table  customers
(
	customer_id int not null,
	customer_firstname varchar(32) not null,
	customer_surname varchar(32) not null,
	address_id int not null,
	cust_start_date date not null,
	last_purchase date,
	primary key (customer_id),
	foreign key (address_id) references address(address_id)
);
create table staff
(
	worker_id int not null,
	worker_firstname varchar(32) not null,
	worker_surname varchar(32) not null,
	address_id int not null,
	primary key (worker_id),
	foreign key (address_id) references address(address_id)
);
create table brands
(
	brand_id int not null,
	brand_name varchar not null,
	primary key (brand_id)
);
create table category
(
	category_id int not null,
	category_name varchar not null,
	category_description text,
	primary key (category_id)
);
create table sale
(
	sale_id int not null, 
	sale_percentage int not null,
	primary key (sale_id)
);
create table inventory
(
	item_id int not null,
	brand_id int not null,
	item_description varchar(255),
	category_id int not null,
	item_price decimal not null,
	avr_salesability int,
	item_amount int not null,
	stock_date date,
	sale_id int,
	primary key (item_id),
	foreign key (brand_id) references brands(brand_id),
	foreign key (category_id) references category(category_id),
	foreign key (sale_id) references sale(sale_id)
);
create table supplier_orders
(
	sup_order_id int not null,
	supplier_id int not null,
	item_id int not null,
	supplier_amount int not null,
	primary key (sup_order_id),
	foreign key (supplier_id) references suppliers (supplier_id),
	foreign key (item_id) references inventory (item_id)
);
create table customer_orders
(
	cust_order_id int not null,
	customer_id int not null,
	item_id int not null,
	customer_amount int not null,
	customer_check int not null,
	primary key (cust_order_id),
	foreign key (customer_id) references customers (customer_id),
	foreign key (item_id) references inventory (item_id)
);

//ALTER_TABLE
alter table brands add column brand_description text;
alter table suppliers drop column if exists supplier_birthday; 
alter table inventory alter column item_description type text;
alter table sale rename to sales;
alter table customer_orders alter column item_id set not null;

//DML_STATEMENTS
//INSERT_INTO
insert into address
values
(111, 'Central Kazakhstan', 'Karagandy', 'Ermekova street', 100001),
(112,'Central Kazakhstan','Temirtay','Abay street',110009),
(113,'Central Kazakhstan','Balkhash','Lenina street', 130090),
(114,'Central Kazakhstan','Karagandy', null, 100006),
(115,'North Kazakhstan','Nur-Sultan','Zhanazhol street',010009),
(116,'Central Kazakhstan','Karagandy', 'Alikhanova street', 100021),
(117,'Southern Kazakhstan','Almaty','Auezov street',050057 ),
(118,'Southern Kazakhstan','Almaty', 'Baikonur street',050015),
(119,'Southern Kazakhstan','Shymkent','Guldala street',160908),
(120,'Southern Kazakhstan','Shymkent','Aksunkar street',null),
(121,'North Kazakhstan','Nur-Sultan','Kenesary street',010215),
(122,'Southern Kazakhstan','Turkistan', null, 161200),
(123,'North Kazakhstan','Nur-Sultan','Kenesary street',010015), 
(124,'North Kazakhstan','Nur-Sultan','Okzhetpes street',010007),
(125,'North Kazakhstan','Nur-Sultan','Syganak street',010011),
(126,'North Kazakhstan','Kostanai', null,111109),       //Zhambyl street
(127,'North Kazakhstan','Kostanai','Gogolya street',111112),
(128,'North Kazakhstan','Nur-Sultan','Kaldayakov street',null),
(129,'North Kazakhstan','Nur-Sultan','Kaldayakov street',010010),
(130,'Western Kazakhstan','Aktobe','Kunaeva street',null),
(131,'Western Kazakhstan','Aktobe','Aktanova street',090504),
(132,'Western Kazakhstan','Aktobe','Alaman street',090503),
(133,'Western Kazakhstan','Atyrau',null,090508),
(134,'Western Kazakhstan','Atyrau',null,090588),
(135,'North Kazakhstan','Nur-Sultan','Zhanazhol street',010006),
(136,'Eastern Kazakhstan','Ust Kamenogorsk','Zhibek-Zholy street',070401),
(137,'Eastern Kazakhstan','Ust Kamenogorsk','Astana street',null),
(138,'Eastern Kazakhstan','Semey','Lugovaya street',071400),
(139,'Eastern Kazakhstan','Semey','Baytursynova street',071400),
(140,'Eastern Kazakhstan','Semey','Momyshuly street',071400);

insert into staff
values
(211,'Chloe','Decker',123),
(212,'Daniel','Espinoza',124),
(213,'Lucifer','Morningstar',115),
(214,'Maze','Smith',125),
(215,'Linda','Martin',121),
(216,'Charlotte','Richards',128),
(217,'Ella','Lopez',129),
(218,'Penelope','Decker',135),
(219,'Lily','Rose',112),
(220,'Marcus','Pierce',113),
(221,'John', 'Edward', 114);

insert into suppliers
values
(311,'gmohame@ncpine.com','476-576','Rue','Bennett',111,'03-02-2006', null),
(312,'denanov@yahoo.c','123-567',' Jules','Vaughn',116,'05-12-2005','06-06-2010'),
(313,null,'589-693',' Katherine','Hernandez ',131,'09-11-2010',null),
(314,'richard@yahoo.ca','695-963','Madeleine','Perez',132,'28-12-2012',null),
(315,'lridener@mac.com','565-565','Cassie','Howard',114,'14-05-2018',null),
(316,null,'999-666','Lexi','Howard',117,'20-02-2015',null),
(317,'pakaste@optonline.net','852-321','Nate','Jacobs',118,'09-09-2009','07-07-2017'),
(318,'bmcmahon@aol.com','321-333','Christopher',' McKay ',119,'31-10-2016',null),
(319,'eimear@optonline.net',null,'Leslie','Bennett ',120,'19-08-2013',null),
(320,'tamas@yahoo.com',null,'Gia','Bennett',130,'03-06-2007',null),
(321, 'email@mail.ru',null,'Nelya','Georgine', 130, '11-11-2011','30-12-2019');

insert into customers
values
(411,'Scott','McCall',122,'22-10-2010','21-11-2020'),
(412,'Allison','Argent',126,'17-11-2014','20-11-2020'),
(413,'Stiles','Stilinski',127,'17-11-2020','10-10-2020'),
(414,'Derek','Hale',133,'10-10-2017','13-11-2020'),
(415,'Lydia','Martin',134,'09-12-2019','23-09-2020'),
(416,'Malia','Tate',136,'14-06-2018','31-10-2020'),
(417,'Kira','Yukimura',140,'02-02-2013','15-11-2020'),
(418,'Liam','Dunbar',139,'11-11-2013','11-11-2020'),
(419,'Noah','Stilinski',138,'01-10-2018','01-11-2020'),
(420,'Chris','Argent',137,'19-11-2012','29-09-2020'),
(421, 'Johnny','Kalinsky', 133, '25-11-2019','22-11-2020');

insert into brands 
values
(1, 'Gucci','House of Gucci'),
(2, 'H&M',null),
(3, 'Calvin Klein',null),
(4, 'Tommy Hilfiger',null),
(5, 'Levis','Levi Strauss & Co.'),
(6, 'Nike','Just Do It'),
(7, 'Adidas',null),
(8, 'Reebok',null),
(9, 'Dolce & Gabbana','Italy'),
(10,'Versace','Gianni Versace S.p.A.'),
(11, 'New Wave', 'Unknown new brand');

insert into category 
values
(1, 'TOPS & T-SHIRTS', null),
(2, 'JACKETS & SWEATSHIRTS', null),
(3, 'PANTS & SHORTS', null),
(4, 'SHOES', null),
(5, 'BAGS & BACKPACKS', 'only high quality'),
(6, 'HATS', null),
(7, 'SOCKS', 'all sizes and different patterns'),
(8, 'GLOVES', null),
(9, 'BELTS', null),
(10, 'SCARVES', null),
(11, 'WALLETS', null);

insert into sales values
(1, 20),
(2, 10),
(3, 10),
(4, 15),
(5, 20),
(6, 5),
(7, 5),
(8, 10),
(9, 25),
(10, 30),
(11, 50);

insert into inventory 
values
(1, 5, '1950s Sportswear T-Shirt White', 1, 25000, 3, 15, '01/11/2020', null),
(2, 5, 'Vintage Fit Trucker Jacket Blue', 2, 36000, 1, 10, '04/11/2020', 1),
(3, 3, 'Monogram Logo Drawstring Fleece Shorts Black', 3, 34000, 0, 10, '05/11/2020', 2),
(4, 3, 'Bowyer Saffiano Leather Trim Sneaker White', 4, 25000, 5, 20, '06/11/2020', null),
(5, 1, 'Ophidia mini bag', 5, 427000, 5, 10, '10/11/2020', null),
(6, 1, 'Felt hat with bow', 6, 360000, 2, 15, '14/11/2020', null),
(7, 2, 'Avocado Socks', 7, 2000, 25, 50, '18/11/2020', null),
(8, 2, 'Premium leather gloves', 8, 10000, 5, 25, '20/11/2020', null),
(9, 4, 'Stitched H Buckle Belt Brown', 9, 12000, 5, 5, '22/11/2020', 3),
(10, 4, 'Lewis Hamilton Monogram Neck Warmer', 10, 10000, 5, 5, '24/11/2020', 4),
(11, 6, 'Golden State Warriors Classic Edition Logo', 1, 13000, 10, 5, '27/11/2020', null),
(12, 6, 'Jordan Winter Utility GORE-TEX', 2, 36000, 3, 10, '29/11/2020', null),
(13, 8, 'Reebok Crossfit Austin II Taped Print Shorts', 3, 16000, 1, 10, '30/11/2020', 5),
(14, 8, 'Classic Leather Shoes', 4, 25000, 1, 10, '01/12/2020', 6),
(15, 7, 'Prime V Backpack', 5, 16000, 3, 15, '02/12/2020', 7),
(16, 7, '3D Trefoil Strap-Back Hat', 6, 12000, 1, 10, '05/12/2020', 8),
(17, 9, 'Nylon socks with embroidered logo', 7, 36000, 3, 10, '10/12/2020', null),
(18, 9, 'Short lambskin gloves', 8, 120000, 1, 5, '12/12/2020', 9),
(19, 10, 'Palazzo Belt With Medusa Buckle', 9, 250000, 0, 10, '15/12/2020', 10),
(20, 10, 'Greca Scarf', 10, 260000, 3, 5, '20/12/2020', null),
(21, 10, 'LEATHER AND SHEARLING JACKET', 2, 2250000, 0, 1, '25/12/2020', null);

insert into supplier_orders 
values
(1, 311, 10, 15),
(2, 312, 11, 20),
(3, 313, 14, 5),
(4, 314, 16, 10),
(5, 315, 5, 5),
(6, 316, 7, 50),
(7, 317, 8, 25),
(8, 318, 4, 15),
(9, 319, 20, 15),
(10, 320, 18, 5);

insert into customer_orders
values
(1, 411, 1, 1, 1001),
(2, 411, 2, 2, 1001),
(3, 412, 12, 1, 1002),
(4, 413, 3, 2, 1003),
(5, 413, 5, 1, 1003),
(6, 413, 7, 1, 1003),
(7, 414, 18, 1, 1004),
(8, 416, 2, 3, 1005),
(9, 416, 14, 1, 1005),
(10, 417, 10, 1, 1006),
(11, 417, 5, 1, 1006),
(12, 418, 9, 1, 1007),
(13, 419, 10, 1, 1008),
(14, 420, 17, 2, 1009),
(15, 420, 3, 1, 1009),
(16, 421, 7, 10, 1010),
(17, 414, 7, 2, 1011),
(18, 416, 6, 1, 1012),
(19, 411, 10, 1, 1013),
(20, 419, 20, 2, 1008),
(21, 419, 15, 6, 1008);