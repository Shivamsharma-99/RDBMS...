create database mydata;

use mydata;

create table employee (empId int identity unique not null, empName varchar (50) not null);

select * from employee
insert into employee values (1, 'shiva');
insert into employee values (2, 'shi');
insert into employee values (3, 'pius');

drop table employee

create table voter_list(voter_id int primary key, voter_Name varchar(50) not null, voter_age int not null check (voter_age >= 18));

select * from voter_list
insert into voter_list values(1 ,'piush', 21);
insert into voter_list values(2 ,'shiva', 15); --- check condition showes error in this line..---
insert into voter_list values(3 ,'noor', 19);
insert into voter_list values(4 ,'amit', 18);

drop table voter_list

create table voter_list
(voter_id int primary key, voter_Name varchar(50) not null, voter_age int not null default (18));

insert into voter_list values(1 ,'piush', 21);
insert into voter_list values(2 ,'shiva', 15);
insert into voter_list values(3 ,'noor', 19);
insert into voter_list values(4 ,'amit', 18);

delete from voter_list where voter_id =2;
insert into voter_list (voter_id, voter_Name) values (2, 'shiva') --- by default is work there ---

select * from voter_list

--- make two table for RDBMS foreign key and primary key ---
create database business;
use business;

create table customer_tb1
(c_id int primary key, c_name varchar(50), c_address varchar (max), city varchar(50));

select * from customer_tb1; --- in this table c_id is primary key---

insert into customer_tb1 values(1, 'shiva', 'ghaziabad','up');
insert into customer_tb1 values(2, 'ali', 'noida','up');
insert into customer_tb1 values(3, 'noor', 'indrapuram','up');
insert into customer_tb1 values(4, 'piyush', 'delhi','delhi');
insert into customer_tb1 values(5, 'harry', 'pune','maharashtra');
insert into customer_tb1 values(6, 'amit', 'mumbai','maharashtra');

create table customer_order
(ord_id int primary key, Item varchar (50),quantity int, price_of_1 int , c_id int foreign key references customer_tb1 (c_id));

insert into customer_order values(111, 'hardisk',2,500,3);
insert into customer_order values(222, 'usb',3,100,1);
insert into customer_order values(331, 'mouse',1,500,4);
insert into customer_order values(156, 'keyboard',1,500,2);
insert into customer_order values(178, 'moniter',3,4000,5);
insert into customer_order values(245, 'hardisk',1,2500,6);

select * from customer_tb1; --- print customer table ---
select * from customer_order; --- print order table ---

insert into customer_order values(254, 'mouse',2,300,7); --- this line shows the error bcoz C_id 7 is not exist---

delete from customer_tb1 where c_id=3;
alter table customer_order drop constraint FK__customer_o__c_id__4BAC3F29;--- use to delete foreign key---

alter table customer_order add foreign key (c_id) references customer_tb1(c_id);--- use to add foreign key existing table---