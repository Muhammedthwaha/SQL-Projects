drop database HR_data_analysis;

create database HR_data_analysis;

 use HR_data_analysis;
 
 select * from hr;
 
 alter table hr
 change column ï»¿id emp_id varchar(20);
 
 describe hr;
 
 select birthdate from hr;
 
 set sql_safe_update = 0;
 
 update hr
 set birthdate = case
	when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'), '%Y/%m/%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'), '%Y/%m/%d')
    else null
end;
select birthdate from hr;

alter table hr
change column birthdate birthdate DATE;
describe hr;
 
 update hr
 set hire_date = case
	when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'), '%Y/%m/%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'), '%Y/%m/%d')
    else null
end;
select hire_date from hr;

alter table hr
change column hire_date hire_date DATE;
describe hr;

select termdate from hr;

update hr
set termdate = date(str_to_date(termdate, '%Y-%m-%d'))
where termdate is not null and termdate !='';

UPDATE hr
SET termdate = NULL
WHERE termdate = '' OR termdate = ' ';

alter table hr
change column termdate termdate DATE;
 
select termdate from hr;

alter table hr
add column age int;
select * from hr;

update hr
set age = timestampdiff(year, birthdate, curdate());
select birthdate, age from hr;

select 
	min(age) as youngest,
    max(age) as oldest
from hr;