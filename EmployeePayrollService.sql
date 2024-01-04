-- UC1
create database payroll_service;
show databases;
use payroll_service;

-- UC2
create table employee_payroll(
	id int unsigned not null auto_increment,
    name varchar(30) not null,
    salary double not null,
    start_date date not null,
    primary key (id)
);

desc employee_payroll;

-- UC3
insert into employee_payroll(name, salary, start_date) values
('Anika Shukla', 30000000, '2024-01-08'),
('Larry Harris', 25000000, '2024-04-09'),
('Ronnie Mehta', 40000000, '2015-04-09')
;

-- UC4
select * from employee_payroll;

-- UC5
select salary from employee_payroll where name = 'Anika Shukla';
select * from employee_payroll where start_date between ('2015-01-01') and ('2024-04-01');

-- UC6
alter table employee_payroll add gender char(1) after name;
update employee_payroll set gender = 'F' where name = 'Anika Shukla';
update employee_payroll set gender = 'M' where name = 'Larry Harris';
update employee_payroll set gender = 'M' where name = 'Ronnie Mehta';
select * from employee_payroll;

-- UC7
select gender, count(*) from employee_payroll group by gender;
select gender, sum(salary) from employee_payroll group by gender;
select gender, avg(salary) from employee_payroll group by gender;
select gender, min(salary) from employee_payroll group by gender;
select gender, max(salary) from employee_payroll group by gender;

