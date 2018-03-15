/*manager met meeste werknemers in hun departement*/
CREATE OR REPLACE FUNCTION hoofd_meeste_wn
RETURN VARCHAR2
AS
   v_dep_id         employees.department_id%type;
   v_aantal       NUMBER;
   v_manager_id   employees.manager_id%type;
   v_first      employees.first_name%type;
   v_last    employees.last_name%type;
BEGIN
   SELECT department_id, count(employee_id)
   INTO v_dep_id, v_aantal
   FROM employees
   GROUP BY department_id
   HAVING count(employee_id) = (SELECT max(count(employee_id))
   				FROM employees
   				GROUP BY department_id);
   SELECT manager_id
   INTO v_manager_id
   FROM departments
   WHERE department_id = v_dep_id;
   select first_name , last_name
   INTO v_first, v_last
   FROM employees 
   WHERE employee_id = v_manager_id;
   RETURN v_first || ' ' || v_last;
