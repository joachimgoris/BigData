CREATE OR REPLACE PROCEDURE landenlijst
IS
   v_aantal       number(5);
   v_landnaam        varchar2(50);
   v_kleinste     varchar2(4);
BEGIN
   SELECT COUNT(*) INTO v_aantal FROM COUNTRIES;
   SELECT MIN(country_id) INTO v_kleinste FROM countries;
   FOR i IN 1 .. v_aantal LOOP
       select country_name into v_landnaam from countries
       where country_id = v_kleinste;
       DBMS_OUTPUT.PUT_LINE(v_landnaam);
       SELECT MIN(country_id) INTO v_kleinste FROM countries
       WHERE country_id > v_kleinste;
    END LOOP;
	DBMS_OUTPUT.PUT_LINE('We hebben connecties in '||v_aantal||' landen.');
END landenlijst;
/
