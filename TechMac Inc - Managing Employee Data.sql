
-- TASK-1 _ create database

create database techmac_db;
-------------------------------------------------------------------

-- TASK-2 _ create tables

use techmac_db;

create table techhyve_employees (employee_id varchar(15) primary key,
								first_name varchar(50) not null,
                                last_name varchar(50) not null,
                                gender varchar(30) not null,
                                age int check (age>21 and age<55));
                                
describe techhyve_employees;

select * from techhyve_employees;

create table techcloude_employees (employee_id varchar(15) primary key,
								first_name varchar(50) not null,
                                last_name varchar(50) not null,
                                gender varchar(30) not null,
                                age int check (age>21 and age<55));

describe techcloude_employees;

select * from techcloude_employees;

create table techsoft_employees(employee_id varchar(15) primary key,
								first_name varchar(50) not null,
                                last_name varchar(50) not null,
                                gender varchar(30) not null,
                                age int check (age>21 and age<55));
                                
describe techsoft_employees;

select * from techsoft_employees;

----------------------------------------------------------------------------------

-- TASK-3 _ add communication_proficiency coloumn

alter table techhyve_employees add communication_proficiency varchar(10) check(communication_proficiency between 1 and 5 ) default(1);

select * from techhyve_employees;

alter table techcloude_employees add communication_proficiency varchar(10) check(communication_proficiency between 1 and 5 ) default(1);

select * from techcloude_employees;

alter table techsoft_employees add communication_proficiency varchar(10) check(communication_proficiency between 1 and 5 ) default(1);

select * from techsoft_employees;

--------------------------------------------------------------------------------------

-- TASK-4 _Insurt data into tables
use techmac_db;
                               
describe techhyve_employees;

select * from techhyve_employees;

-- add data to table
insert into techhyve_employees(employee_id,first_name,last_name,gender,age,communication_proficiency)values
('TH0001','Eli','Evans','male','26','1'),
('TH0002','Carlos','Simmons','Male','32','2'),
('TH0003','Kathie','Bryant','Female','25','1'),
('TH0004','Joey','Hughes','Male','41','4'),
('TH0005','Alice','Matthews','Female','52','4');

describe techcloude_employees;

select * from techcloude_employees;

-- add data to table
insert into techcloude_employees(employee_id,first_name,last_name,gender,age,communication_proficiency)values
('TC0001','Teresa','Bryant','Female','39','2'),
('TC0002','Alexis','Patterson','Male','48','5'),
('TC0003','Rose','Bell','Female','42','3'),
('TC0004','Gemma','Watkins','Female','42','3'),
('TC0005','Kingston', 'Martinez','Male','29','2');

describe techsoft_employees;

select * from techsoft_employees;

-- add data to table
insert intO techsoft_employees(employee_id,first_name,last_name,gender,age,communication_proficiency)values
('TS0001','Peter','Burtler','Male','44','4'),
('TS0002','Harold','Simmons','Male','54','4'),
('TS0003','Juliana','Sanders','Female','36','2'),
('TS0004','Paul','Ward','Mlae','29','2'),
('TS0005','Nicole','Bryant','Female','30','2');

----------------------------------------------------------------------------------------------------------------

-- TASK-5 _ create backup tables

-- backup three tables

create database backup_techmac_db;
use backup_techmac_db;

create table backup_techmac_db.techhyve_employees_bkp select * from techmac_db.techhyve_employees;
create table backup_techmac_db.techcloude_employees_bkp select * from techmac_db.techcloude_employees;
create table backup_techmac_db.techsoft_employees_bkp select * from techmac_db.techsoft_employees;

---------------------------------------------------------------------------------------------------------------------

-- TASK-6 delete data 

use techmac_db;
delete from techhyve_employees where employee_id = 'TH0003';
delete from techhyve_employees where employee_id = 'TH0005';
delete from techcloude_employees where employee_id = 'TC0001';
delete from techcloude_employees where employee_id = 'TC0004';

select * from techhyve_employees;
select * from techcloude_employees;

-----------------------------------------------------------------------------------------------------------------------

-- TASK-7 create new table techhyvecloude_employees and delete table techhyve_employees, techcloude_employees

select * from techhyve_employees;
create table techhyvecloude_employees (employee_id varchar(10) primary key not null,
                                       first_name varchar(50) not null,
                                       last_name varchar(50) not null,
									   gender varchar (20) not null,
                                       age int check (age>21 and age<55),
                                       communication_proficiency int not null);
								
insert into techhyvecloude_employees select * from techhyve_employees union select * from techcloude_employees;
select * from techhyvecloude_employees;

set sql_safe_updates = 0;
delete from techhyve_employees;

select * from techhyve_employees;

set sql_safe_updates = 0;
delete from techcloude_employees;

select * from techcloude_employees;
                               
---------------------------------------------------------------------------------------------------------------------------
