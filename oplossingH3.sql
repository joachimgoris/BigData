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

/*oef5*/
CREATE OR REPLACE PROCEDURE asterisk_sal (p_emp_id IN employees.employee_id%type)
IS
    v_sal employees.salary%type;
    v_asterisk varchar2(50);
BEGIN
    SELECT salary
    INTO v_sal
    FROM employees
    WHERE employee_id=p_emp_id;
    FOR i_teller IN 1..trunc(v_sal/1000)
    LOOP
        v_asterisk:=v_asterisk||'*';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_asterisk);
END asterisk_sal;