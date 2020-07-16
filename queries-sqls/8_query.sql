--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as "Employee Count"
FROM employees
GROUP BY last_name
ORDER BY "Employee Count" DESC;