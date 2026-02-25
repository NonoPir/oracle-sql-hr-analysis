/* This query ranks departments by total salary expense.
   It helps identify where compensation spending is highest
   and supports analysis of company expenses for planning and budgeting. */
   
SELECT
    d.department_name,
    SUM(e.salary) AS total_salary_cost
    FROM departments d
    INNER JOIN employees e
    ON e.department_id = d.department_id
    GROUP BY d.department_name
    ORDER BY total_salary_cost DESC
    
