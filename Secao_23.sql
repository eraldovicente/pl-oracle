---------------------------------------------
-- Se��o 23 - Vis�o geral do Oracle PL/SQL --
---------------------------------------------

------------------------------
-- Bloco an�nimo  - exemplo --
------------------------------

SET SERVEROUTPUT  ON
DECLARE 
    vTexto VARCHAR2(100) := 'Seja bem vindo ao PL/SQL';
BEGIN
    DBMS_OUTPUT.PUT_LINE(vTexto);
EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM);
END;
































