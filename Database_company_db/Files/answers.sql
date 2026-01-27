-------------------------------------------------------------
---------Part 1: Basic Retrieval & Filtering (1-60)----------
-------------------------------------------------------------


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
select * from Projects where DATENAME(YEAR, start_date) = 2024
--23. Find employees hired on a Monday.
select * from Employees where DATENAME(WEEKDAY, hire_date) = 'Monday'
--24. List unique `manager_id`s from the `Employees` table.
Select distinct manager_id, * from Employees
--25. Find employees with salaries that are multiples of 5000.
select * from Employees where salary%5000 = 0
--26. Get all details for employees hired between 2016 and 2019.
select * from Employees where DATENAME(YEAR, hire_date) between 2016 AND 2019
--27. Find projects where the name includes the word 'Alpha'.
Select * from Projects where project_name like '%Alpha%'
--28. List employees whose email does NOT contain 'johnson'.
select * from Employees where email not like '%johnson%'
--29. Sort departments by location in descending order.
select * from Departments order by location desc
--30. Find projects with a budget greater than 400,000.
select * from Projects where budget > 400000
--31. Select the top 10% of highest-paid employees.
select top 50 PERCENT * from Employees order by salary desc
--32. Find employees whose first name and last name start with the same letter.
select * from Employees 
where SUBSTRING(first_name, 1,1) = SUBSTRING(last_name, 1,1)
--33. List projects starting in June.
select * from Projects where DATENAME(MONTH, start_date) = 'JUNE'
--34.Find employees with a null `email`.
select * from Employees where email is null
---35. Find employees hired in the last 1000 days.
select * from Employees where hire_date >= DATEADD(DAY, - 1000, GETDATE());
---36. Show the first 3 employees skipping the first 1.
select * from Employees 
order by emp_id 
offset 1 rows 
fetch next 3 rows only
--37. Find projects that last longer than 6 months.
select * from Projects 
where DATEDIFF(MONTH, start_date , ISNULL(end_date, getdate())) > 6
--38. List employees in `dept_id` 2 with a salary over 70,000.
select * from Employees where dept_id = 2 and salary >= 70000
--39. Find the `dept_id` of the 'Sales' department.
select dept_id from Departments where dept_name = 'Sales'
--40. List all projects sorted by their budget.
select * from Projects order by budget
--41. Find employees with 'er' in their last name.
select * from Employees where last_name like '%er%'
--42. Select all employees who report to manager 101.
select * from Employees where manager_id = 101
--43. Find projects starting after '2024-01-01'.
select * from Projects where start_date > '2024-01-01'
--44. List employees with salary between 60,000 and 90,000.
select * from Employees where salary between 60000 and 90000
--45. Find the total number of days 'Alpha App Redesign' is active.

--46. List employees with `emp_id` between 105 and 110.
select * from Employees where emp_id between 105 and 110
--47. Find projects with budgets exactly equal to 500,000.
select * from Projects where budget = 500000
--48. Retrieve names of employees who report to `manager_id` 102.
select * from Employees where manager_id = 102
--49. Find employees hired in the year 2024.
select * from Employees where DATENAME(YEAR, hire_date) = 2024
--50. List all departments except 'Executive'.
select * from Departments where dept_name != 'Executive'
--51. Find employees whose hire_date is after 2022-01-01.
select * from Employees where hire_date > '2022-01-01'
--52. List projects with budgets greater than 100,000.
select * from Projects where budget > 100000
--53. Select all employees whose `emp_id` is an even number.
select * from Employees where emp_id%2 = 0
--54. Find projects ending in the month of December.
select * from Projects where DATENAME(MONTH , end_date) = 'December'
--55. List employees with last names starting with 'P'.
select * from Employees where SUBSTRING(last_name, 1,1) = 'P'
--56. Find employees whose salary is not 150,000.
select * from Employees where salary != 150000
--57. List projects that start on the first day of the year.
select * from Projects where DATENAME(DAY, start_date) = 1 and DATENAME(MONTH , start_date) = 'January'
--58. Find employees whose email length is less than 15.
select * from Employees where LEN(email)<15
--59. List employees whose first name contains the letter 'a'.
select * from Employees where first_name like '%a%'
--60. Find projects with 'HR' in the title.
select * from Projects where project_name like '%HR%'
