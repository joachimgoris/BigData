/*oef1*/
CREATE OR REPLACE TRIGGER bus_jobs
    BEFORE update OF min_salary,max_salary
    ON jobs
DECLARE
BEGIN
    IF USER IN ('STUDENT','BEZOEKER') THEN
        RAISE_APPLICATION_ERROR(-20000,'Je hebt onvoldoende rechten om deze actie uit te voeren!');
        ELSE
        DBMS_OUTPUT.PUT_LINE('Ben je zeker?');
    END IF;
END bus_jobs;
/

/*oef2*/
CREATE OR REPLACE TRIGGER aiuds_jh
    AFTER insert OR update OR delete
    ON job_history
DECLARE
        v_actie varchar2(10);
BEGIN
        IF inserting THEN
            v_actie := 'INSERT';
        ELSIF updating THEN
            v_actie := 'UPDATE';
        ELSE
            v_actie := 'DELETE';
        END IF;

    INSERT INTO log_history
    VALUES(user,sysdate,systimestamp,v_actie);
END;
/

/*oef3*/
CREATE OR REPLACE TRIGGER aur_emp
    AFTER update OF salary
    ON employees
    FOR EACH ROW
DECLARE
BEGIN
    IF :new.salary > :old.salary*1.05 THEN
        RAISE_APPLICATION_ERROR(-20000,'Een loonsverhoging van meer dan 5% is niet toegelaten!');
    ELSIF :new.salary< :old.salary THEN
        RAISE_APPLICATION_ERROR(-200000, 'Een loonsverhoging kan niet!');
    END IF;
END;
/