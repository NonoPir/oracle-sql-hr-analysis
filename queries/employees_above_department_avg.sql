    /* This query identifies employees whose salary exceeds the average within their department. 
    It can be used to evaluate compensation distribution and detect potential salary outliers. */
    
SELECT 
    e.employee_id,
    e.first_name || ' ' || e.last_name AS full_name,
    e.salary,
    e.department_id
    FROM employees e
    WHERE e.salary > (
        SELECT AVG(salary) 
        FROM employees b
        WHERE e.department_id = b.department_id
    )
