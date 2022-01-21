--------------
-- Se��o 31 --
--------------

-------------------------------------
-- Controlando um cursor expl�cito --
-------------------------------------

-----------------------------------------------------
-- Controlando um cursor expl�cito com LOOP b�sico --
-----------------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    CURSOR employees_cursor IS --
    SELECT
        *                   ------ Declara��o do Cursor  
    FROM
        employees;            --

    employees_record employees_cursor%rowtype;
BEGIN
    /* Inicializa */

    OPEN employees_cursor; -- Abrindo o cursor
    
    /* LOOP */

    LOOP -- LOOP b�sico
        FETCH employees_cursor INTO employees_record; --Fetch do cursor

        EXIT WHEN employees_cursor%notfound;
        dbms_output.put_line(employees_record.employee_id
                             || ' - '
                             || employees_record.first_name
                             || ' - '
                             || employees_record.last_name
                             || ' - '
                             || employees_record.department_id
                             || ' - '
                             || employees_record.job_id
                             || ' - '
                             || employees_record.phone_number
                             || ' - '
                             || ltrim(to_char(
                                             employees_record.salary,
                                             'L99G999G999D99'
                                      )));

    END LOOP;

    CLOSE employees_cursor; -- Fecha o cursor
END;

----------------------------------------------------
-- Controlando um cursor expl�cito com WHILE LOOP --
----------------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    CURSOR employees_cursor IS --
    SELECT
        *                   ------ Declara��o do Cursor  
    FROM
        employees;            --

    employees_record employees_cursor%rowtype;
BEGIN
    /* Inicializa */

    OPEN employees_cursor; -- Abrindo o cursor

    FETCH employees_cursor INTO employees_record; --Fetch do cursor
    
    /* LOOP */

    WHILE employees_cursor%found LOOP
        dbms_output.put_line(employees_record.employee_id
                             || ' - '
                             || employees_record.first_name
                             || ' - '
                             || employees_record.last_name
                             || ' - '
                             || employees_record.department_id
                             || ' - '
                             || employees_record.job_id
                             || ' - '
                             || employees_record.phone_number
                             || ' - '
                             || ltrim(to_char(
                                             employees_record.salary,
                                             'L99G999G999D99'
                                      )));

        FETCH employees_cursor INTO employees_record; --Fetch do cursor

    END LOOP;

    CLOSE employees_cursor; -- Fecha o cursor
END;

----------------------------------------------------------------
-- Controlando um Cursor expl�cito utilizando CURSOR FOR LOOP --
----------------------------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    CURSOR employees_cursor IS 
    SELECT
        *                     
    FROM
        employees;

BEGIN
    FOR employees_record IN employees_cursor LOOP
        dbms_output.put_line(employees_record.employee_id
                             || ' - '
                             || employees_record.first_name
                             || ' - '
                             || employees_record.last_name
                             || ' - '
                             || employees_record.department_id
                             || ' - '
                             || employees_record.job_id
                             || ' - '
                             || employees_record.phone_number
                             || ' - '
                             || ltrim(to_char(
                                             employees_record.salary,
                                             'L99G999G999D99'
                                      )));
    END LOOP;
END;