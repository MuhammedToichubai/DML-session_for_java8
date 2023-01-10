-- select

select * from developers;

-- filter


-- Задача. Выберите из таблицы developers записи с id равным 3, 5, 6, 10.
select *
from developers
where
        id = 3
   or id = 5
   or id = 6
   or id = 10;

select *
from developers
where id in (5, 6, 3, 10);

select  * from developers;
-- Задача. Выберите из таблицы developers записи с id равным 3, 5, 6, 34 и логином, равным 'eshillumn@aol.com', 'msarfatix@ifeng.com' или 'ggg'.

select *
from developers
where id in (3, 5, 6, 34)
  and email in ('eshillumn@aol.com', 'msarfatix@ifeng.com');

-- Задача. Выберите из таблицы developers записи c зарплатой от 500 до 1500.
select * from developers
where salary between  500 and 1500;


-- Задача. Выберите из таблицы developers все записи так,
-- чтобы вместо id было developersId, вместо login – developersLogin,
-- вместо salary - developersSalary.

select
    id as developers_id ,
    email as developers_email,
    salary as developers_salary
from developers;

-- Найдите в таблице developers минимальный возраст.

select round(min(age)) from developers;

-- Задача. Найдите в таблице developers суммарный возраст.

select round(sum(age)) from developers;

-- Задача. Вставьте в таблицу developers запись
-- с полем date с текущим моментом времени в формате 'год-месяц-день часы:минуты:секунды'.

SELECT (now()::date,now()::time) as corrent_date_and_time FROM developers;

alter table developers add column working_year timestamp;
select *
from developers;

insert into developers (first_name, last_name, email, gender, phone_number, salary, country, age, working_year)
values ('Aiperi', 'Ibrayimova', 'aiperi@gmail.com','FEMALE', '0777777777', 20000, 'Kyrgyzstan', 18, now());

select working_year from developers where  id = 52;

select
    extract(year from working_year) as year,
    extract(month from working_year) as month,
    extract(day from working_year) as day,
    extract(hour from working_year) as hour,
    extract(minute from working_year) as minute,
    extract(second from working_year) as second
from developers
where id = 51;

alter table developers drop column working_year;

-- Задача. Вставьте в таблицу developers запись с полем date с текущей датой в формате 'год-месяц-день'.
SELECT *, (now()::date) as "current_date" FROM developers;

insert into developers (first_name, last_name, email, gender, phone_number, salary, country, age, working_year)
values ('Orazali', 'Alimbekov', 'orozali@gmail.com','MALE', '0555555555', 21000, 'Prague', 18, current_date);

-- Задача. При выборке из таблицы developers запишите день, месяц и год в отдельные поля.
select
    extract(year from working_year) as year,
    extract(month from working_year) as month,
    extract(day from working_year) as day
from developers where id = 53;

-- На BETWEEN
-- Выберите из таблицы developers записи c зарплатой от 1000 до 3000.
select * from developers where salary between 1000 and 3000;

-- Выберите из таблицы developers записи c id от 3 до 10 и зарплатой от 300 до 500.
select id as developer_id, first_name, salary from developers where id >= 3 and id <= 10 and salary > 1500  and salary < 25000;

select * from developers ;

-- На DISTINCT
-- Выберите из таблицы developers все записи так, чтобы туда попали только записи с разной зарплатой
select distinct salary from developers;

select *
from developers;

-- Получите SQL запросом все возрасты без дублирования.
select distinct age from developers where age >= 25;

-- На MIN и MAX
-- Найдите в таблице developers минимальную зарплату.
select  min(salary) as min_salary from developers;

-- Найдите в таблице developers максимальную зарплату.
select  max(salary) as min_salary from developers;

select  min(salary) as min_salary , max(salary) max_salary from developers;


-- На SUM
--  Найдите в таблице developers суммарную зарплату.
select sum(salary) from developers;


--  Найдите в таблице developers суммарную зарплату для людей в возрасте от 21 до 25.
select sum(salary) from developers where age between  21 and 25;

--  Найдите в таблице developers суммарную зарплату для id, равного 1, 2, 3 и 5.
select sum(salary) from developers where id in (1, 2, 3 , 5);

--  На AVG
--  Найдите в таблице developers среднюю зарплату.
select round(avg(salary)) from developers;
--  Найдите в таблице developers средний возраст.

select round(avg(age)) from developers;

select round(age), count(*) as all_developers from developers group by age;

select  (select round(avg(age)) from developers) - round(age) as deferantce_age from  developers where id = 11;
select  * from developers;

-- sorted
-- asc   = default      == osuu tartibinde sorttop beret.
-- desc                 == kemuu tartibinde sorttop bert.
select * from developers order by age;
select * from developers order by age desc;

select *
from developers order by first_name;

select *
from developers order by first_name desc ;

-- update
select * from developers where id = 53;

update developers
set first_name = 'Aiperi',
    last_name = 'Ibrayimova',
    age = 18
where id = 51;

select * from developers;

delete  from
    developers where id not in (1, 3, 5, 6);

select * from developers offset 4 limit  8;

select  * from developers offset 4 fetch first 10 rows only;

select * from developers order by salary desc offset 20 limit  15;

-- search

select first_name, country, phone_number from developers
where  developers.phone_number ilike  '%02__';

select * from
    developers
where first_name ilike ('_a%')
   or last_name ilike '%a_';

select country from developers;

select
    case
        when count(*) > 0
            then true
        else false
        end
from developers where  age = 18;
