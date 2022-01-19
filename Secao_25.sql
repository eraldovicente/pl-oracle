----------------------------------------------------
-- Se��o 25 - Declarando uma vari�vel tipo NUMBER --
----------------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vNumero NUMBER(11,2) := 1200.50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('N�mero = ' || vNumero);
END;

-----------------------------------------------
-- Declarando vari�veis tipo CHAR e VARCHAR2 --
-----------------------------------------------

DECLARE 
    vCaracterTamFixo CHAR(2) := 'RS';
    vCaracterTamVariavel VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
    DBMS_OUTPUT.PUT_LINE('String caracteres tamanho fixo = ' || vCaracterTamFixo);
    DBMS_OUTPUT.PUT_LINE('String caracteres tamanho vari�vel = ' || vCaracterTamVariavel);
END;
















































