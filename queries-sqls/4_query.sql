-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
LEFT JOIN departments AS d
ON de.dept_no = d.dept_no
LEFT JOIN employees As e
ON de.emp_no = e.emp_no;