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

------------------------------------
-- Declarando vari�veis tipo DATE --
------------------------------------

DECLARE
    vData1 DATE := '19/01/2022';
    vData2 DATE := '19/01/22';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data1 = ' || vData1);
    DBMS_OUTPUT.PUT_LINE('Data2 = ' || vData2);
END;

--------------------------
-- Declarando constante --
--------------------------

------------------------------------------
-- Declarando uma constante tipo NUMBER --
------------------------------------------

DECLARE
    vPi CONSTANT NUMBER(30,15) := 3.141592653589793;
BEGIN
    DBMS_OUTPUT.PUT_LINE('vPi = ' || vPi);
END;



































































