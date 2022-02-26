-- ������� ������� employees
-- 	id. serial,  primary key,
-- 	employee_name. Varchar(50), not null
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

--������� ������� salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
create table salary(
	id serial primary key,
	monthly_salary int not null
);

-- ��������� ������� salary 15 ��������
insert into salary(monthly_salary)
values	('1000'),
		('1100'),
		('1200'),
		('1300'),
		('1400'),
		('1500'),
		('1600'),
		('1700'),
		('1800'),
		('1900'),
		('2000'),
		('2100'),
		('2200'),
		('2300'),
		('2400'),
		('2500');

-- ������� ������� employee_salary
-- 	id. Serial  primary key,
-- 	employee_id. Int, not null, unique
-- 	salary_id. Int, not null

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

-- ������� ������� roles
-- 	id. Serial  primary key,
-- 	role_name. int, not null, unique
create table roles(
	id serial primary key,
	role_name int not null unique
);

-- �������� ��� ������ role_name � int �� varchar(30)
ALTER TABLE roles ALTER COLUMN role_name TYPE varchar (30);

-- ��������� ������� roles 20 ��������
insert into roles(role_name)
	values	('Junior Python developer'),
			('Middle Python developer'),
			('Senior Python developer'),
			('Junior Java developer'),
			('Middle Java developer'),
			('Senior Java developer'),
			('Junior JavaScript developer'),
			('Middle JavaScript developer'),
			('Senior JavaScript developer'),
			('Junior Manual QA engineer'),
			('Middle Manual QA engineer'),
			('Senior Manual QA engineer'),
			('Project Manager'),
			('Designer'),
			('HR'),
			('CEO'),
			('Sales manager'),
			('Junior Automation QA engineer'),
			('Middle Automation QA engineer'),
			('Senior Automation QA engineer');

-- ������� ������� roles_employee
-- 	id. Serial  primary key,
-- 	employee_id. Int, not null, unique (������� ���� ��� ������� employees, ���� id)
-- 	role_id. Int, not null (������� ���� ��� ������� roles, ���� id)
create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id) references employees(id),
	foreign key (role_id) references roles(id)
);
