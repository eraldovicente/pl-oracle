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

-------------------------------------------------
-- Associative Array of Records - Bulk Collect --
-------------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    TYPE employees_table_type IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    employees_table employees_table_type;
BEGIN
    SELECT
        *
    BULK COLLECT
    INTO employees_table
    FROM
        employees;

    FOR i IN employees_table.first..employees_table.last LOOP
        dbms_output.put_line(employees_table(i).employee_id
                             || ' - '
                             || employees_table(i).first_name
                             || ' - '
                             || employees_table(i).last_name
                             || ' - '
                             || employees_table(i).phone_number
                             || ' - '
                             || employees_table(i).job_id
                             || ' - '
                             || to_char(
                                       employees_table(i).salary,
                                       '99G999G999D99'
                                ));
    END LOOP;

END;


------------------
-- Nested Table --
------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    TYPE numero_table_type IS TABLE OF NUMBER(2);
    numero_table numero_table_type := numero_table_type();
BEGIN
    -- Armazena números de 1 a 10 em um Associative Array
    FOR i IN 1..10 LOOP
        numero_table.extend;
        numero_table(i) := i;
    END LOOP;

    FOR i IN 1..10 LOOP
        dbms_output.put_line('Associative Array: Indice = '
                             || to_char(i)
                             || ', valor = '
                             || to_char(numero_table(i)));
    END LOOP;

END;

--------------------------------------------
-- Nested Table of Records - Bulk Collect --
--------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    TYPE employees_table_type IS TABLE OF employees%rowtype;
    employees_table employees_table_type := employees_table_type();
BEGIN
    SELECT
        *
    BULK COLLECT
    INTO employees_table
    FROM
        employees;

    FOR i IN employees_table.first..employees_table.last LOOP
        dbms_output.put_line(employees_table(i).employee_id
                             || ' - '
                             || employees_table(i).first_name
                             || ' - '
                             || employees_table(i).last_name
                             || ' - '
                             || employees_table(i).phone_number
                             || ' - '
                             || employees_table(i).job_id
                             || ' - '
                             || to_char(
                                       employees_table(i).salary,
                                       '99G999G999D99'
                                ));
    END LOOP;

END;
