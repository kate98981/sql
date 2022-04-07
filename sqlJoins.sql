-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select es.id, e.employee_name, s.monthly_salary from employee_salary es
inner join employees e on es.employee_id = e.id
inner join salary s on es.salary_id = s.id;

-- 2. ������� ���� ���������� � ������� �� ������ 2000.
select es.id, e.employee_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
where s.monthly_salary < 2000;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� ��������� ��� � ��������.)
select s.id, s.monthly_salary from salary s
left join employee_salary es on es.salary_id = s.id
where es.id is null;

-- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select s.id, s.monthly_salary from salary s
left join employee_salary es on es.salary_id = s.id
where es.id is null and s.monthly_salary < 2000;

-- 5. ����� ���� ���������� ���� �� ��������� ��.
select e.id, e.employee_name from employees e
left join employee_salary es on es.employee_id = e.id
where es.salary_id is null;

-- 6. ������� ���� ���������� � ���������� �� ���������.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id;

-- 7. ������� ����� � ��������� ������ Java �������������.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%Java %';

-- 8. ������� ����� � ��������� ������ Python �������������.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%Python%';

-- 9. ������� ����� � ��������� ���� QA ���������.
select re.id, r.role_name, e.employee_name from roles_employee re 
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%QA%';

-- 10. ������� ����� � ��������� ������ QA ���������.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%Manual%' and r.role_name like '%QA%';

-- 11. ������� ����� � ��������� ��������������� QA
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
where r.role_name like '%QA%' and r.role_name like '%Automation%';

-- 12. ������� ����� � �������� Junior ������������
select re.id, e.employee_name, s.monthly_salary, r.role_name from roles_employee re
inner join employee_salary es on es.employee_id = re.employee_id
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
inner join salary s on s.id = es.salary_id
where r.role_name like '%Junior%';

-- 13. ������� ����� � �������� Middle ������������
select re.id, e.employee_name, s.monthly_salary, r.role_name from roles_employee re
inner join employee_salary es on es.employee_id = re.employee_id
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
inner join salary s on s.id = es.salary_id
where r.role_name like '%Middle%';

-- 14. ������� ����� � �������� Senior ������������
select re.id, e.employee_name, s.monthly_salary, r.role_name from roles_employee re
inner join employee_salary es on es.employee_id = re.employee_id
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
inner join salary s on s.id = es.salary_id
where r.role_name like '%Senior%';

-- 15. ������� �������� Java �������������
select es.id, r.role_name, s.monthly_salary from employee_salary es
inner join roles_employee re on re.employee_id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Java%';

-- 16. ������� �������� Python �������������
select es.id, r.role_name, s.monthly_salary from employee_salary es
inner join roles_employee re on re.employee_id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Python%';

-- 17. ������� ����� � �������� Junior Python �������������
select es.id, e.employee_name, s.monthly_salary, r.role_name from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Junior%' and r.role_name like '%Python%';

-- 18. ������� ����� � �������� Middle JS �������������
select es.id, e.employee_name, s.monthly_salary, r.role_name from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Middle%' and r.role_name like '%JavaScript%';

-- 19. ������� ����� � �������� Senior Java �������������
select es.id, e.employee_name, s.monthly_salary, r.role_name from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Senior%' and r.role_name like '%Java %';

-- 20. ������� �������� Junior QA ���������
select es.id, r.role_name, s.monthly_salary from employee_salary es
inner join roles_employee re on re.employee_id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Junior%' and r.role_name like '%QA%';

-- 21. ������� ������� �������� ���� Junior ������������
select avg(s.monthly_salary), r.role_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employee_salary es on es.employee_id = re.employee_id
inner join salary s on s.id = es.salary_id
where r.role_name like '%Junior%'
group by r.role_name;

-- 22. ������� ����� ������� JS �������������
select SUM(s.monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%JavaScript%';

-- 23. ������� ����������� �� QA ���������
select min(s.monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%QA%';

-- 24. ������� ������������ �� QA ���������
select max(monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%QA%';

-- 25. ������� ���������� QA ���������
select count(r.role_name) from roles_employee re
inner join roles r on r.id = re.role_id
where r.role_name like '%QA%';

-- 26. ������� ���������� Middle ������������.
select count(r.role_name) from roles_employee re
inner join roles r on r.id = re.role_id
where r.role_name like '%Middle%';

-- 27. ������� ���������� �������������
select count(r.role_name) from roles_employee re
inner join roles r on r.id = re.role_id
where r.role_name like '%developer%';

-- 28. ������� ���� (�����) �������� �������������.
select sum(s.monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%developer%';

--  29. ������� �����, ��������� � �� ���� ������������ �� �����������
select e.employee_name, r.role_name, s.monthly_salary from roles_employee re
inner join employees e on e.id = re.employee_id
inner join roles r on r.id = re.role_id
inner join employee_salary es on es.employee_id = re.employee_id
inner join salary s on s.id = es.salary_id
order by abs(s.monthly_salary);

--  30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select es.id, e.employee_name, r.role_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where s.monthly_salary between 1700 and 2300
order by abs(s.monthly_salary);

--  31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select es.id, e.employee_name, r.role_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where s.monthly_salary < 2300
order by abs(s.monthly_salary);

-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select es.id, e.employee_name, r.role_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where s.monthly_salary in (1100, 1500, 2000)
order by abs(s.monthly_salary);

