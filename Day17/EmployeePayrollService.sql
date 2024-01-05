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

-- UC8
alter table employee_payroll add column phone int,  add column address varchar(100) default 'India',  add column department varchar(100) not null;
desc employee_payroll;

-- UC9
alter table employee_payroll add basic_pay double, add deductions double, add taxable_pay double, add income_tax double, add net_pay double;
desc employee_payroll;

-- UC10
insert into employee_payroll (name, gender, salary, start_date, phone, department, basic_pay, deductions, taxable_pay, income_tax, net_pay) value 
('Terissa Yeun', 'F', 20000, '2020-01-09', 91432342, 'Sales', 20000, 2000, 18000, 1800, 16200);
select * from employee_payroll where name = 'Terissa Yeun';

-- UC11
create table department(
department_id int unsigned not null auto_increment,
department_name varchar(100) not null,
primary key (department_id, department_name)
);

insert into department(department_name) values
('Sales'),
('Marketing'),
('Research'),
('HR');

create table employee(
employee_id int unsigned, 
dept_id int unsigned,
primary key (employee_id, dept_id),
foreign key (employee_id) references employee_payroll(id),
foreign key (dept_id) references department(department_id)
);

insert into employee(employee_id, dept_id) values
(1, 1),
(2, 1),
(3, 2),
(4, 1),
(4, 2);

select c.id, c.name, emp.dept_id from employee_payroll as c join employee as emp on c.id = emp.employee_id;
