/*oef1*/
CREATE OR REPLACE PROCEDURE toon_laatste_emp
IS
    v_emp_id employees.employee_id%type;
    v_naam employees.last_name%type;
    v_hire_Date employees.hire_date%type;
BEGIN
        SELECT employee_id, last_name, hire_date
        INTO v_emp_id, v_naam, v_hire_Date
        FROM employees
        WHERE hire_date = (SELECT max(hire_date)FROM employees);
        DBMS_OUTPUT.PUT_LINE('De laatst aangeworven medewerker is '||v_emp_id||' '||v_naam||' werd aangeworven op '||v_hire_Date);
END;

/*oef2*/
CREATE OR REPLACE PROCEDURE grootste_dept
IS
    