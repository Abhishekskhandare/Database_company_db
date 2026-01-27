-------------------------------------------------------------
---------Part 2: Joins & Aggregations (61-150)----------
-------------------------------------------------------------


--61. Show each employee's first name and their department name.
select e.first_name, d.dept_name from Employees e
inner join Departments d 
on d.dept_id = e.dept_id;
GO
--62. Find the total number of employees in each department.
select distinct d.dept_id, d.dept_name, count(d.dept_name)over(partition by d.dept_name) as total_emp from Employees e
inner join Departments d
on d.dept_id = e.dept_id;
GO
--63. List all projects and the count of employees assigned to each.
select distinct p.project_id, p.project_name,
count(ep.emp_id) as emp_count 
from Employee_Projects ep
inner join Projects p on p.project_id = ep.project_id
inner join Employees e on e.emp_id = ep.emp_id
group by  p.project_id, p.project_name;
GO
--64. Find the average salary per department.
select  distinct d.dept_id, d.dept_name, 
Cast(AVG(e.salary) over (partition by d.dept_id) as decimal(10,2)) as avg_salary 
from Departments d
inner join Employees e on e.dept_id = d.dept_id;
GO
--65. Show all employees and the name of their manager.
select e.emp_id, e.first_name, e.manager_id as manager_id, m.first_name as manager_name from Employees m
inner join Employees e
on e.manager_id = m.emp_id;
GO

--66. List departments with more than 2 employees.
select * from (
select distinct d.dept_name, count(d.dept_name)over(partition by d.dept_name) as emp_count from Departments d
inner join Employees e
on e.dept_id = d.dept_id
) as emp_info
where emp_info.emp_count>2
GO
--or
select distinct d.dept_name, count(d.dept_name) as emp_no from Departments d
inner join Employees e on e.dept_id = d.dept_id
group by d.dept_name 
having COUNT(d.dept_name)>2
GO
--67. Find the total hours worked on each project.
select distinct project_name, p.project_id, sum(ep.hours_worked) as total_hr from Employee_Projects ep
inner join Projects p on ep.project_id = p.project_id
group by p.project_name , p.project_id
GO
--68. Find the highest salary in the 'Engineering' department.
select top 1 * from Departments d
inner join Employees e
on e.dept_id = d.dept_id
where d.dept_name = 'Engineering' 
order by e.salary desc
GO
--69. List employees who are not assigned to any project.
select e.* from Employee_Projects ep
right join Employees e on ep.emp_id = e.emp_id
where ep.emp_id is null
GO
--70. Find the department with the highest average salary.
select top 1 avg(e.salary) as avg_sal from Employees e
inner join Departments d
on d.dept_id = e.dept_id
group by dept_name
order by avg(e.salary) desc
GO

--71. Show the total budget of projects per year.
select p.project_name ,cast(budget/(DATEDIFF(YEAR, start_date, isnull(convert(date, end_date),Getdate()))+1) as decimal(10,2)) as budget_per_year from Projects p 
GO
--72. List employees working on more than 1 project.
select ep.emp_id,e.first_name,COUNT(ep.emp_id) as project_count from Employee_Projects ep
inner join Employees e on e.emp_id = ep.emp_id
group by ep.emp_id, e.first_name
having count(ep.emp_id)>1
GO
--73. Find the department located in 'San Francisco'.
select * from Departments d
where location = 'San Francisco'
GO
--74. Show the total salary paid by each department.
select dept_id, sum(salary) as total_salary from Employees e
group by dept_id
GO
--75. Find employees working on the 'Cloud Migration' project.
select e.* from Employees e
inner join Employee_Projects ep on e.emp_id = ep.emp_id
inner join Projects p on p.project_id = ep.project_id
where p.project_name = 'Cloud Migration'
GO