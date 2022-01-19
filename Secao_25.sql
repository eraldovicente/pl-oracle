----------------------------------------------------
-- Seção 25 - Declarando uma variável tipo NUMBER --
----------------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vNumero NUMBER(11,2) := 1200.50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Número = ' || vNumero);
END;

-----------------------------------------------
-- Declarando variáveis tipo CHAR e VARCHAR2 --
-----------------------------------------------

DECLARE 
    vCaracterTamFixo CHAR(2) := 'RS';
    vCaracterTamVariavel VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
    DBMS_OUTPUT.PUT_LINE('String caracteres tamanho fixo = ' || vCaracterTamFixo);
    DBMS_OUTPUT.PUT_LINE('String caracteres tamanho variável = ' || vCaracterTamVariavel);
END;
















































