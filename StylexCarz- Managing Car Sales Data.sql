-- TASK-1 Create database

create database stylexcarz_db;
use stylexcarz_db;

--------------------------------------------------------------------------------------------------------------------

-- TASK-2 Create table

create table salespersons (salespersonid int primary key,
                           salesperson_name varchar(50) not null,
                           salesperson_city varchar(50) not null,
                           commission_rate int not null);
                           
describe salespersons;

create table customers (customerid int primary key,
                        C_firstname varchar(50) not null,
                        C_lastname varchar(50) not null,
                        C_city varchar(50) not null,
                        C_rating int );
                        
describe customers;

create table orders (orderid int primary key,
					 amount int not null,
                     orderdate date not null,
                     salespersonid int,
                     customerid int);
                     
describe orders;

-------------------------------------------------------------------------------------------------------------------

-- TASK-3 Insert data into tables

insert into salespersons(salespersonid,salesperson_name,salesperson_city,commission_rate)values
('1001','William','New York','12'),
('1002','Liam','New Jersey','13'),
('1003','Axelrod','San Jose','10'),
('1004','James','San Diego','11'),
('1005','Fran','Austin','26'),
('1007','Oliver','New York','15'),
('1008','John','Atlanta','2'),
('1009','Chharles','New Jersey','2');

select * from salespersons;

insert into customers(customerid,C_firstname,C_lastname,C_city,C_rating)values
('2001','Hoffman','Anny','New York','1'),
('2002','Giovanni','Jenny','New Jersey','2'),
('2003','Liu','Williams','San Jose','3'),
('2004','Grass','Harry','San Diego','3'),
('2005','Clemens','John','Austin','4'),
('2006','Cisneros','Fanny','New York','4'),
('2007','Pereira','Jonathan','Atlanta','3');

select * from customers;

insert into orders(orderid,amount,orderdate,salespersonid,customerid)values
('3001','23','2020-02-01','1009','2007'),
('3002','20','2021-02-23','1007','2007'),
('3003','89','2021-03-06','1002','2002'),
('3004','67','2021-04-02','1004','2002'),
('3005','30','2021-07-30','1001','2007'),
('3006','35','2021-09-18','1001','2004'),
('3007','19','2021-10-02','1001','2001'),
('3008','21','2021-10-09','1003','2003'),
('3009','45','2021-10-10','1009','2005');

select * from orders;

--------------------------------------------------------------------------------------------------------------------------

-- TASK-4  Increase commission

select * from salespersons;

update salespersons set commission_rate = 15 where commission_rate <15;

----------------------------------------------------------------------------------------------------------------------------

-- TASK-5 Create backup table and database for orders

create database stylexcarz_db_bkp;
use stylexcarz_db_bkp;

create table stylexcarz_db_bkp.orders_bkp select * from orders;

-----------------------------------------------------------------------------------------------------------------------------

-- TASK-6 Increase rating 

select * from orders;
select * from customers;

update customers set C_rating = 2+3 where customerid = 2002;
update customers set C_rating = 3+3 where customerid = 2007;

-------------------------------------------------------------------------------------------------------------------------------
                    