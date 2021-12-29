How to Create new table in database

CREATE DATABASE demo;
USE demo;

CREATE TABLE emp(
    EmpId int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

How to Add new record in database table

insert into emp values (1, 'Patil','Nilesh','Chinchwad','Pune')

How to view all records in one table 

select * from emp

insert into emp values (2, 'Joshi','Mangesh','Wakad','Pune')
