--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees as e
RIGHT JOIN salaries as s
ON (s.emp_no = e.emp_no);

--2.List employees who were hired in 1986.
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

--3.List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
SELECT  dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager as dm
 INNER JOIN employees as e
 ON (dm.emp_no = e.emp_no)
 INNER JOIN departments as d
 on (dm.dept_no = d.dept_no)

--4.List the department of each employee with the following information: employee number, last name, first name, 
--and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
 RIGHT JOIN dept_emp as de
 ON (e.emp_no = de.emp_no)
 RIGHT JOIN departments as d
 ON (de.dept_no = d.dept_no);

--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, 
--and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
 INNER JOIN dept_emp as de
 ON (e.emp_no = de.emp_no)
 INNER JOIN departments as d
 ON (de.dept_no = d.dept_no)
 WHERE d.dept_name = 'Sales';

--7.List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
 INNER JOIN dept_emp as de
 ON (e.emp_no = de.emp_no)
 INNER JOIN departments as d
 ON (de.dept_no = d.dept_no)
 WHERE d.dept_name = 'Sales' OR d.dept_name= 'Development';

--8.In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(emp_no)
FROM employees 
GROUP BY last_name 
ORDER BY COUNT(emp_no) DESC;

