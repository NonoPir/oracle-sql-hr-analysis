/* 
Procedure: increase_salary

Description:
Increases an employee's salary by a given percentage (1–100%).

Parameters:
p_employee_id - ID of the employee whose salary will be updated.
p_percent     - Percentage increase (must be between 1 and 100).

Behavior:
- Validates percentage input.
- Updates salary if employee exists.
- Prints confirmation message.
- Does not commit; transaction control is left to the caller.
*/

CREATE OR REPLACE PROCEDURE increase_salary (
    p_employee_id employees.employee_id%TYPE,
    p_percent NUMBER
)
IS 
    v_current_salary employees.salary%TYPE;
    v_new_salary employees.salary%TYPE;
BEGIN
IF p_percent < 1 OR p_percent > 100 THEN
    DBMS_OUTPUT.PUT_LINE('Invalid percent value. Must be between 1 and 100.');
    RETURN;
    END IF;
    SELECT salary
    INTO v_current_salary
    FROM employees
    WHERE employee_id = p_employee_id;
    v_new_salary := v_current_salary * (1 + p_percent / 100);
    UPDATE employees
    SET salary = v_new_salary
    WHERE employee_id = p_employee_id;
    DBMS_OUTPUT.PUT_LINE('Employee ' || p_employee_id || ' salary increased from ' || v_current_salary || ' to ' || v_new_salary );
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found. No salary update performed.'); 
END;
/

