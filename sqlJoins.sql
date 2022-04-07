-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select es.id, e.employee_name, s.monthly_salary from employee_salary es
inner join employees e on es.employee_id = e.id
inner join salary s on es.salary_id = s.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select es.id, e.employee_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
where s.monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.id, s.monthly_salary from salary s
left join employee_salary es on es.salary_id = s.id
where es.id is null;

--  4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.id, s.monthly_salary from salary s
left join employee_salary es on es.salary_id = s.id
where es.id is null and s.monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select e.id, e.employee_name from employees e
left join employee_salary es on es.employee_id = e.id
where es.salary_id is null;

--  6. Вывести всех работников с названиями их должности.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id;

--  7. Вывести имена и должность только Java разработчиков.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%Java %';

-- 8. Вывести имена и должность только Python разработчиков.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%Python%';

-- 9. Âûâåñòè èìåíà è äîëæíîñòü âñåõ QA èíæåíåðîâ.
select re.id, r.role_name, e.employee_name from roles_employee re 
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%QA%';

-- 10. Âûâåñòè èìåíà è äîëæíîñòü ðó÷íûõ QA èíæåíåðîâ.
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employees e on e.id = re.employee_id
where r.role_name like '%Manual%' and r.role_name like '%QA%';

-- 11. Âûâåñòè èìåíà è äîëæíîñòü àâòîìàòèçàòîðîâ QA
select re.id, r.role_name, e.employee_name from roles_employee re
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
where r.role_name like '%QA%' and r.role_name like '%Automation%';

-- 12. Âûâåñòè èìåíà è çàðïëàòû Junior ñïåöèàëèñòîâ
select re.id, e.employee_name, s.monthly_salary, r.role_name from roles_employee re
inner join employee_salary es on es.employee_id = re.employee_id
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
inner join salary s on s.id = es.salary_id
where r.role_name like '%Junior%';

-- 13. Âûâåñòè èìåíà è çàðïëàòû Middle ñïåöèàëèñòîâ
select re.id, e.employee_name, s.monthly_salary, r.role_name from roles_employee re
inner join employee_salary es on es.employee_id = re.employee_id
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
inner join salary s on s.id = es.salary_id
where r.role_name like '%Middle%';

-- 14. Âûâåñòè èìåíà è çàðïëàòû Senior ñïåöèàëèñòîâ
select re.id, e.employee_name, s.monthly_salary, r.role_name from roles_employee re
inner join employee_salary es on es.employee_id = re.employee_id
inner join roles r on r.id = re.role_id 
inner join employees e on e.id = re.employee_id 
inner join salary s on s.id = es.salary_id
where r.role_name like '%Senior%';

-- 15. Âûâåñòè çàðïëàòû Java ðàçðàáîò÷èêîâ
select es.id, r.role_name, s.monthly_salary from employee_salary es
inner join roles_employee re on re.employee_id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Java%';

-- 16. Âûâåñòè çàðïëàòû Python ðàçðàáîò÷èêîâ
select es.id, r.role_name, s.monthly_salary from employee_salary es
inner join roles_employee re on re.employee_id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Python%';

-- 17. Âûâåñòè èìåíà è çàðïëàòû Junior Python ðàçðàáîò÷èêîâ
select es.id, e.employee_name, s.monthly_salary, r.role_name from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Junior%' and r.role_name like '%Python%';

-- 18. Âûâåñòè èìåíà è çàðïëàòû Middle JS ðàçðàáîò÷èêîâ
select es.id, e.employee_name, s.monthly_salary, r.role_name from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Middle%' and r.role_name like '%JavaScript%';

-- 19. Âûâåñòè èìåíà è çàðïëàòû Senior Java ðàçðàáîò÷èêîâ
select es.id, e.employee_name, s.monthly_salary, r.role_name from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Senior%' and r.role_name like '%Java %';

-- 20. Âûâåñòè çàðïëàòû Junior QA èíæåíåðîâ
select es.id, r.role_name, s.monthly_salary from employee_salary es
inner join roles_employee re on re.employee_id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles r on r.id = re.role_id
where r.role_name like '%Junior%' and r.role_name like '%QA%';

-- 21. Âûâåñòè ñðåäíþþ çàðïëàòó âñåõ Junior ñïåöèàëèñòîâ
select avg(s.monthly_salary), r.role_name from roles_employee re
inner join roles r on r.id = re.role_id
inner join employee_salary es on es.employee_id = re.employee_id
inner join salary s on s.id = es.salary_id
where r.role_name like '%Junior%'
group by r.role_name;

-- 22. Âûâåñòè ñóììó çàðïëàò JS ðàçðàáîò÷èêîâ
select SUM(s.monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%JavaScript%';

-- 23. Âûâåñòè ìèíèìàëüíóþ ÇÏ QA èíæåíåðîâ
select min(s.monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%QA%';

-- 24. Âûâåñòè ìàêñèìàëüíóþ ÇÏ QA èíæåíåðîâ
select max(monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%QA%';

-- 25. Âûâåñòè êîëè÷åñòâî QA èíæåíåðîâ
select count(r.role_name) from roles_employee re
inner join roles r on r.id = re.role_id
where r.role_name like '%QA%';

-- 26. Âûâåñòè êîëè÷åñòâî Middle ñïåöèàëèñòîâ.
select count(r.role_name) from roles_employee re
inner join roles r on r.id = re.role_id
where r.role_name like '%Middle%';

-- 27. Âûâåñòè êîëè÷åñòâî ðàçðàáîò÷èêîâ
select count(r.role_name) from roles_employee re
inner join roles r on r.id = re.role_id
where r.role_name like '%developer%';

-- 28. Âûâåñòè ôîíä (ñóììó) çàðïëàòû ðàçðàáîò÷èêîâ.
select sum(s.monthly_salary) from employee_salary es
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where r.role_name like '%developer%';

--  29. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ
select e.employee_name, r.role_name, s.monthly_salary from roles_employee re
inner join employees e on e.id = re.employee_id
inner join roles r on r.id = re.role_id
inner join employee_salary es on es.employee_id = re.employee_id
inner join salary s on s.id = es.salary_id
order by abs(s.monthly_salary);

--  30. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ ó êîòîðûõ ÇÏ îò 1700 äî 2300
select es.id, e.employee_name, r.role_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where s.monthly_salary between 1700 and 2300
order by abs(s.monthly_salary);

--  31. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ ó êîòîðûõ ÇÏ ìåíüøå 2300
select es.id, e.employee_name, r.role_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where s.monthly_salary < 2300
order by abs(s.monthly_salary);

-- 32. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ ó êîòîðûõ ÇÏ ðàâíà 1100, 1500, 2000
select es.id, e.employee_name, r.role_name, s.monthly_salary from employee_salary es
inner join employees e on e.id = es.employee_id
inner join salary s on s.id = es.salary_id
inner join roles_employee re on re.employee_id = es.employee_id
inner join roles r on r.id = re.role_id
where s.monthly_salary in (1100, 1500, 2000)
order by abs(s.monthly_salary);

