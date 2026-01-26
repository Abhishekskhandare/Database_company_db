--1. Select all columns from the `Employees` table.
select * from dbo.Employees;
--2. List all unique department names.
select distinct dept_name from dbo.Departments;
--3. Find employees with a salary greater than 100,000.
select * from dbo.Employees where salary > 100000;
--4. List all employees hired after 2020-01-01.
select * from dbo.Employees where hire_date > '2018-03-10'
--5. Find projects with a budget exceeding 200,000.
select * from dbo.Projects where budget > '200000'
--6. List employees whose last name starts with 'S'.
select * from Employees where last_name like 'S%'
--7. Find departments located in 'New York'.
select * from Departments where location = 'New York'
--8. Retrieve the first name and email of the 5 most recently hired employees.
select top 5 first_name, email from Employees order by hire_date desc
--9. List all projects that do not have an `end_date` (ongoing projects).
select * from Projects where end_date is null
--10. Find employees who earn exactly 85,000 or 95,000.
select * from Employees where salary in ('85000','95000')
--11. List employees whose email contains the domain '@company.com'.
select * from Employees where email like '%@company.com'
--12. Find projects that started before 2023.
select * from Projects where year(start_date) < '2023' 
--13. Sort employees by `last_name` alphabetically.
select * from Employees order by last_name asc
--14. Find employees who do not have a `manager_id`.
select * from Employees where manager_id is null
--15. List the top 3 highest-paid employees.
select top 3 * from Employees order by salary desc
--16. Find employees hired in the month of May.
select * from Employees where MONTH(hire_date) = 5
--17. Get the name of the project with the lowest budget.
select top 1 * from Projects order by budget
--18. List employees whose first name is exactly 5 characters long.
select * from Employees where LEN(first_name) = 5
--19. Find all employees who are in `dept_id` 2 or 3.
select * from Employees where dept_id in (2,3)
--20. Retrieve all columns for the project named 'Cloud Migration'.
select * from Projects where project_name = 'Cloud Migration'
--21. Find employees whose `last_name` has 'n' as the last letter.
select * from Employees where last_name like '%n'
--22. List projects starting in the year 2024.
select * from Projects where YEAR(start_date) = '2024'
--OR
select * from Projects where YEAR(start_date) = 2024
--23. Find employees hired on a Monday.
