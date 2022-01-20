--------------
-- Seção 29 --
--------------

---------------------------------
-- Variável tipo PL/SQL Record --
---------------------------------

------------------------------
-- Criando um PL/SQL Record --
------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o id do empregado: ';

DECLARE
    TYPE employee_record_type IS RECORD (
        employee_id  employees.employee_id%TYPE,
        first_name   employees.first_name%TYPE,
        last_name    employees.last_name%TYPE,
        email        employees.email%TYPE,
        phone_number employees.phone_number%TYPE
    );
    employee_record employee_record_type;
BEGIN
    SELECT
        employee_id,
        first_name,
        last_name,
        email,
        phone_number
    INTO employee_record
    FROM
        employees
    WHERE
        employee_id = &pemployee_id;

    dbms_output.put_line(employee_record.employee_id
                         || ' - '
                         || employee_record.first_name
                         || ' - '
                         || employee_record.last_name
                         || ' - '
                         || employee_record.phone_number);

END;