-- Questions
select * from hr;
-- 1. What is the gender breakdown of the employees in the company.
select gender, count(*) as count
from hr
where termdate is null
group by gender;

-- 2. What is the race/ethinicity breakdown of the employees in the company.
select race, count(*) as count
from hr
where termdate is null
group by race
order by count desc;

-- 3. what is the age distribution of employees in the company.
select
	min(age) as young,
    max(age) as oldest
from hr;

select 
case
	when age >= '18' and age <= '24' then '18-24'
    when age >= '25' and age <= '34' then '25-34'
    when age >= '35' and age <= '44' then '35-44'
    when age >= '45' and age <= '54' then '45-54'
    when age >= '55' and age <= '64' then '55-64'
    else '65+'
end as age_group,
count(*) as count
from hr
group by age_group
order by age_group;

select 
case
	when age >= '18' and age <= '24' then '18-24'
    when age >= '25' and age <= '34' then '25-34'
    when age >= '35' and age <= '44' then '35-44'
    when age >= '45' and age <= '54' then '45-54'
    when age >= '55' and age <= '64' then '55-64'
    else '65+'
end as age_group,gender,
count(*) as count
from hr
group by age_group,gender
order by age_group,gender;

-- 4. How many employees work at headquarters versus remote location
select location, count(*) as count
from hr
group by location;

-- 5. What is the average length of employement for employees who have been terminated.
select
	round(avg(datediff(termdate, hire_date))/365,1) as avg_length_employement
from hr
where termdate is not null and termdate <= curdate();

-- 6. How does the gender distribution vary across departments.
select department, gender , count(*) as count
from hr
group by department, gender
order by department;

-- 7. What is the distribution of job titles across the company
select jobtitle, count(*) as count
from hr
group by jobtitle
order by jobtitle desc;

-- 8. which department has highest turn over rate (termination rate).
select department,
	total_count,
    terminated_count,
    terminated_count/total_count as termination_rate
from (
	select department,
    count(*) as total_count,
    sum(case when termdate is not null and termdate <= curdate() then 1 else 0 end) as terminated_count
    from hr
    group by department
    ) as subquery
order by termination_rate desc;

-- 9. What is the distribution of employees across loaction by state.
select location_state, count(*) as count
from hr
group by location_state
order by count desc;

-- 10. How has the companies employee count changed over time based on hire and term dates.
select year,
	hires,
    terminations,
    hires - terminations as net_change,
    round((hires - terminations)/hires * 100,2) as net_change_percent
    from ( 
    select
    year(hire_date) as year,
    count(*) as hires,
    sum(case when termdate is not null and termdate <= curdate() then 1 else 0 end) as terminations
    from hr
    group by year
    ) as subquery
order by year desc;

-- 11. What is the tenure(timeline) distribution for employees in each department.
select department, round(avg(datediff(termdate, hire_date))/365,0) as avg_tenure
from hr
where termdate <= curdate() and termdate is not null
group by department;
