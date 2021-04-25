-- Select all the employees who were born between January 1, 1952 and December 31, 1955 and their titles and title date ranges
-- Order the results by emp_no
SELECT Distinct titles.title,titles.emp_no,employees.first_name,employees.last_name,titles.from_date,titles.to_date
FROM employees, titles
WHERE birth_date between '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Select only the current title for each employee
SELECT Distinct titles.title,titles.emp_no,employees.first_name,employees.last_name,titles.from_date,titles.to_date
FROM employees, titles
WHERE to_date = '9999-01-01' 
ORDER BY emp_no;

-- Count the total number of employees about to retire by their current job title
SELECT 
	COUNT (title),title
	FROM titles,employees
	WHERE birth_date between '1952-01-01' AND '1955-12-31'
 GROUP BY title

-- Count the total number of employees per department
SELECT dept_name, COUNT(*)"No of Emp"
FROM departments GROUP BY dept_name;

-- Bonus: Find the highest salary per department and department manager

SELECT departments.dept_name, employees.first_name,employees.last_name, salaries.salary
FROM departments,employees,salaries 
WHERE salary IN
(SELECT MAX(salary)AS Highest
FROM salaries
GROUP BY dept_name)
