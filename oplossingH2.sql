/* oef3a: netto salaris */
CREATE OR REPLACE FUNCTION netto 
(p_sal employees.salary%type)
RETURN VARCHAR2
AS
v_netto employees.salary%type;
BEGIN
v_netto := p_sal*0.6;
RETURN to_char(v_netto, '9,999.00')||'euro';
END;

/* oef3b: netto salaris */
CREATE OR REPLACE FUNCTION netto
(p_sal employees.salary%type)
RETURN VARCHAR2
AS
v_netto employees.salary%type;
BEGIN
IF p_sal <= 10000 THEN
    v_netto := p_sal * 0.6;
    ELSIF p_sal <= 16000 THEN
    v_netto := 10000*0.6 + (p_sal-10000)*0.5;
    ELSE
    v_netto := 10000 * 0.6 + 6000 * 0.5 + (p_sal-16000)*0.4;
return to_char(v_netto, '9,999.00')||'euro';
END IF;
END;

/*oef4*/
CREATE OR REPLACE FUNCTION schrikkeljaar
return varchar2
AS
    v_datum date;
BEGIN
    v_datum := to_date('01-02-' || to_char(sysdate, 'yyyy'), 'dd-mm-yyyy');
    v_datum := last_day(v_datum);
    if to_char(v_datum, 'dd')='29' THEN
        return 'het jaar' || to_char(sysdate, 'yyyy')||' is een schrikkeljaar';
    ELSE
        return 'het jaar' ||to_char(sysdate, 'yyyy')|| ' is geen schrikkeljaar';
    end IF;
END;

/*oef5*/
CREATE OR REPLACE FUNCTION volgende_vergadering
    RETURN DATE
AS
    v_datum DATE;
BEGIN
    v_datum := last_day(sysdate)+1;
    IF to_char(v_datum, 'fmday') !='monday' THEN
        v_datum := next_day(v_datum, 'mon');
    END IF;
    IF to_char(v_datum, 'dd-mm') = '01-01' OR to_char(v_datum, 'dd-mm') = '01-05' THEN
        v_datum := v_datum+1;
    END IF;
    RETURN v_datum;
END;