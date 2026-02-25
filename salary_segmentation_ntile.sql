/* This query divides employees into 5 salary segments using the NTILE window function.
   Salaries are ordered from highest to lowest, where Segment 1 represents the highest-paid employees.
   This helps analyze compensation distribution across the organization. */
   
   SELECT
        e.employee_id,
        e.first_name || ' ' || e.last_name AS full_name,
        e.salary,
        NTILE(5) OVER (
            ORDER BY e.salary DESC
        ) AS salary_segment
        FROM employees e