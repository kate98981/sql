-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select es.id, e.employee_name, s.monthly_salary from employee_salary es
inner join employees e on es.employee_id = e.id
inner join salary s on es.salary_id = s.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select es.id, e.employee_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
where s.monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но непонятно кто её получает.)
select s.id, s.monthly_salary from salary s
left join employee_salary es on es.salary_id = s.id
where es.id is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.id, s.monthly_salary from salary s
left join employee_salary es on es.salary_id = s.id
where es.id is null and s.monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select e.id, e.employee_name from employees e
left join employee_salary es on es.employee_id = e.id
where es.salary_id is null;

-- 6. Вывести всех работников с названиями их должности.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id;

-- 7. Вывести имена и должность только Java разработчиков.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%Java %';

-- 8. Вывести имена и должность только Python разработчиков.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select re.id, r.role_name, e.employee_name from roles_employee re 
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%Manual%' and r.role_name like '%QA%';

-- 11. Вывести имена и должность автоматизаторов QA
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
where r.role_name like '%QA%' and r.role_name like '%Automation%';

-- 12. Вывести имена и зарплаты Junior специалистов
select re.id, e.employee_name, s.monthly_salary, r.role_name from roles_employee re
inner join employee_salary es on es.employee_id = re.employee_id
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
inner join salary s on s.id = es.salary_id
where r.role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
select re.id, e.employee_name, s.monthly_salary, r.role_name from roles_employee re
inner join employee_salary es on es.employee_id = re.employee_id
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
inner join salary s on s.id = es.salary_id
where r.role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select re.id, e.employee_name, s.monthly_salary, r.role_name from roles_employee re
inner join employee_salary es on es.employee_id = re.employee_id
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
inner join salary s on s.id = es.salary_id
where r.role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
select es.id, r.role_name, s.monthly_salary from employee_salary es
inner join roles_employee re on re.employee_id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Java%';

-- 16. Вывести зарплаты Python разработчиков
select es.id, r.role_name, s.monthly_salary from employee_salary es
inner join roles_employee re on re.employee_id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select es.id, e.employee_name, s.monthly_salary, r.role_name from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Junior%' and r.role_name like '%Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select es.id, e.employee_name, s.monthly_salary, r.role_name from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Middle%' and r.role_name like '%JavaScript%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select es.id, e.employee_name, s.monthly_salary, r.role_name from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Senior%' and r.role_name like '%Java %';

-- 20. Вывести зарплаты Junior QA инженеров
select es.id, r.role_name, s.monthly_salary from employee_salary es
inner join roles_employee re on re.employee_id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Junior%' and r.role_name like '%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(s.monthly_salary), r.role_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employee_salary es on es.employee_id = re.employee_id
inner join salary s on s.id = es.salary_id
where r.role_name like '%Junior%'
group by r.role_name;

-- 22. Вывести сумму зарплат JS разработчиков
select SUM(s.monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров
select min(s.monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%QA%';

-- 25. Вывести количество QA инженеров
select count(r.role_name) from roles_employee re
inner join roles r on r.id = re.role_id
where r.role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.
select count(r.role_name) from roles_employee re
inner join roles r on r.id = re.role_id
where r.role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select count(r.role_name) from roles_employee re
inner join roles r on r.id = re.role_id
where r.role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(s.monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%developer%';

--  29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select e.employee_name, r.role_name, s.monthly_salary from roles_employee re
inner join employees e on e.id = re.employee_id
inner join roles r on r.id = re.role_id
inner join employee_salary es on es.employee_id = re.employee_id
inner join salary s on s.id = es.salary_id
order by abs(s.monthly_salary);

--  30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select es.id, e.employee_name, r.role_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where s.monthly_salary between 1700 and 2300
order by abs(s.monthly_salary);

--  31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select es.id, e.employee_name, r.role_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where s.monthly_salary < 2300
order by abs(s.monthly_salary);

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select es.id, e.employee_name, r.role_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where s.monthly_salary in (1100, 1500, 2000)
order by abs(s.monthly_salary);

