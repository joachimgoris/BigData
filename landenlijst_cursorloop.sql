CREATE OR REPLACE PROCEDURE landenlijst_cursorloop
IS
   v_aantal       number(5) :=0;
BEGIN
   FOR lijn IN (SELECT country_name FROM countries)
    LOOP
       DBMS_OUTPUT.PUT_LINE(lijn.country_name);
       v_aantal := v_aantal+1;
    END LOOP;
	DBMS_OUTPUT.PUT_LINE('We hebben connecties in '||v_aantal||' landen.');
END landenlijst_cursorloop;
/
