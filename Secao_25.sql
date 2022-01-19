----------------------------------------------------
-- Seção 25 - Declarando uma variável tipo NUMBER --
----------------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vNumero NUMBER(11,2) := 1200.50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Número = ' || vNumero);
END;


















































