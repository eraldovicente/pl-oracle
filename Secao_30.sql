--------------
-- Seção 30 --
--------------

-------------------------------------
-- Collections - Associative array --
-------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    TYPE numero_table_type IS
        TABLE OF NUMBER(2) INDEX BY BINARY_INTEGER;
    numero_table numero_table_type;
BEGIN
    -- Armazena números de 1 a 10 em um Associative Array
    FOR i IN 1..10 LOOP
        numero_table(i) := i;
    END LOOP;
    FOR i IN 1..10 LOOP
        dbms_output.put_line('Associative Array: Indice = '
                             || to_char(i)
                             || ', valor = '
                             || to_char(numero_table(i)));
    END LOOP;
END;