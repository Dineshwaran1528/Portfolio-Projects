create database projects;

delete from hr;

alter table hr
change column ï»¿id emp_id varchar(20) null;

select birthdate from hr;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

alter table hr
modify column birthdate date;

update hr
set hire_date = case
	when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;

select hire_date from hr;

alter table hr
modify column hire_date date;

select termdate from hr;

update hr
set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate != ' ';

alter table hr
modify column termdate date;

alter table hr
add column age int;

select birthdate, age from hr;

update hr
set age = timestampdiff(year, birthdate, curdate());

select min(age) as youngest, max(age) as oldest
from hr;

select count(*) from hr
where age<18;