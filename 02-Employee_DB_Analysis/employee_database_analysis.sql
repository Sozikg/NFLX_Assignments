-- 1. Create a view that holds the retirement eligibile employees.

CREATE VIEW retirement_info AS
SELECT emp_no, first_name, last_name, Extract (YEAR FROM birth_date) birth_date, Extract (YEAR FROM hire_date) hire_date
FROM employees
WHERE Extract (YEAR FROM birth_date) BETWEEN 1952 AND 1955 
AND Extract (YEAR FROM hire_date) BETWEEN 1985 and 1988;



-- 2. Create a view that holds a list of all the current employees, include the employee number, first and last name. 

CREATE VIEW current_employees AS
SELECT r.emp_no, r.first_name, r.last_name, to_date FROM retirement_info r 
JOIN dept_emp de
ON r.emp_no = de.emp_no 
WHERE to_char(to_date, 'yyyy-mm-dd') = '9999-01-01';


-- 3. Get the average salary by title for the current employees. 

SELECT title, ROUND(AVG(salary),2) Avg_salary FROM current_employees c
JOIN titles t ON c.emp_no = t.emp_no
JOIN salaries s ON c.emp_no = s.emp_no
Group by 1
order by Avg_salary


-- 4. Get the average salary by department for the current employees. 

SELECT dept_name, ROUND(AVG(salary),2) Avg_salary FROM current_employees c
LEFT JOIN dept_emp de ON c.emp_no = de.emp_no
LEFT JOIN salaries s ON c.emp_no = s.emp_no
JOIN departments d ON d.dept_no = de.dept_no
Group by 1
order by Avg_salary;

-- 5. Compare the average salary by title for each department for the current employees.

SELECT dept_name, title, ROUND(AVG(salary),2) Avg_salary FROM current_employees c
JOIN titles t ON c.emp_no = t.emp_no
JOIN dept_emp de ON c.emp_no = de.emp_no
JOIN salaries s ON c.emp_no = s.emp_no
JOIN departments d ON d.dept_no = de.dept_no
Group by 1,2
order by title, Avg_salary;

-- 6. Determine the number of current employees by title and grouped within departments. 
-- And, rank the results by title within each department. 

SELECT title, dept_name, count(de.emp_no) curnt_emp_count, dense_rank() over (partition by dept_name order by count(de.emp_no) desc) rnk 
FROM current_employees c
JOIN titles t ON c.emp_no = t.emp_no
JOIN dept_emp de ON c.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no
Group by 1,2;
