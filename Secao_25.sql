----------------------------------------------------
-- Se��o 25 - Declarando uma vari�vel tipo NUMBER --
----------------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vNumero NUMBER(11,2) := 1200.50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('N�mero = ' || vNumero);
END;


















































