create database HR;
use hr;
select * from hr_comma_sep;
rename table hr_comma_sep to hr_data;
-- Total number of employees
SELECT count(*) as total_employees from hr_data;
-- Numbers of employee who left vs who stayed
SELECT `left`, count(*) as count
from hr_data group by `left`;
-- Attrition rate
SELECT ROUND(100.0 * sum(CASE WHEN `left` = 1 THEN 1 ELSE 0 END)/ COUNT(*),2) as attrition_rate_percent 
from hr_data;
-- Number of employee per department
SELECT Department, count(*) as employee_count from hr_data
group by Department
order by employee_count DESC;
-- Attrition by department
SELECT Department , round(100.0 * sum(case when `left`=1 then 1 else 0 end)/ count(*),2) as attrition_by_department
from hr_data
group by Department
order by attrition_by_department desc;
-- Average satisfaction by department
SELECT Department, round(avg(satisfaction_level), 2) as avg_satisfaction
from hr_data
group by Department
order by avg_satisfaction asc;
-- Employee distribution by salary level
SELECT salary, count(*) as count
from hr_data
group by salary
order by count desc;
-- Average satisfaction by salary
SELECT salary, round(avg(satisfaction_level),2) as avg_salary_satisfaction
from hr_data
group by salary;
-- Average working hours by department
SELECT Department, round(avg(average_montly_hours),2) as avg_hours
from hr_data
group by Department
order by avg_hours desc;
-- Average evaluation score vs attrition
SELECT `left`, round(avg(last_evaluation), 2) as avg_evatuation
from hr_data
group by `left`;
-- promotion history
SELECT promotion_last_5years, count(*) as count
from hr_data
group by promotion_last_5years;
-- Average satisfaction by years spent in company
SELECT time_spend_company, round(avg(satisfaction_level),2) as avg_satisfaction
from hr_data
group by time_spend_company
order by time_spend_company;
-- overworked employees
SELECT count(*) as risky_employees
from hr_data
where average_montly_hours > 250 and satisfaction_level < 0.4 and `left` = 1;
-- Department with highest average evaluation
SELECT Department,round(avg(last_evaluation), 2) as dept_avg_evaluation
from hr_data
group by Department
order by dept_avg_evaluation;
-- employees eligible for promotion
SELECT * from hr_data
where last_evaluation > 0.85
and satisfaction_level > 0.6
and time_spend_company > 3
and promotion_last_5years = 0
and `left` = 0;
-- attrition rate for employees who experience a work accident
select Work_accident, round(100.0 * sum(case when `left` = 1 then 1 else 0 end) / count(*), 2) as accident_attrition_rate
from hr_data
group by Work_accident;
-- average time spent at the company
SELECT salary, round(avg(satisfaction_level), 2) as avg_tenure
from hr_data
group by salary;
-- number of project by employee
SELECT number_project, count(*) as total
from hr_data
group by number_project
order by number_project;