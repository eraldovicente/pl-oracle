--------------
-- Seção 32 --
--------------

----------------------------
-- Tratamento de Exceções --
----------------------------

-------------------------------------------------
-- Tratamento de exceções pré-definidas Oracle --
-------------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pEmployee_id PROMPT 'Digite o id do empregado: '

DECLARE
    vfirst_name  employees.first_name%TYPE;
    vlast_name   employees.last_name%TYPE;
    vemployee_id employees.employee_id%TYPE := &pemployee_id;
BEGIN
    SELECT
        first_name,
        last_name
    INTO
        vfirst_name,
        vlast_name
    FROM
        employees
    WHERE
        employee_id = vemployee_id;

    dbms_output.put_line('Empregado: '
                         || vfirst_name
                         || ' '
                         || vlast_name);
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(
                               -20001,
                               'Empregado não encontrado, id = ' || to_char(vemployee_id)
        );
    WHEN OTHERS THEN
        raise_application_error(
                               -20002,
                               'Erro Oracle - '
                               || sqlcode
                               || sqlerrm
        );
END;


-------------------------------------------
-- Exceções definidas pelo desenvolvedor --
-------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pEmployee_id PROMPT 'Digite o id do empregado: '

DECLARE
    vfirst_name  employees.first_name%TYPE;
    vlast_name   employees.last_name%TYPE;
    vjob_id      employees.job_id%TYPE;
    vemployee_id employees.employee_id%TYPE := &pemployee_id;
    epresident EXCEPTION;
BEGIN
    SELECT
        first_name,
        last_name,
        job_id
    INTO
        vfirst_name,
        vlast_name,
        vjob_id
    FROM
        employees
    WHERE
        employee_id = vemployee_id;

    IF vjob_id = 'AD_PRES' THEN
        RAISE epresident;
    END IF;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(
                               -20001,
                               'Empregado não encontrado, id = ' || to_char(vemployee_id)
        );
    WHEN epresident THEN
        UPDATE employees
        SET
            salary = salary * 1.5
        WHERE
            employee_id = vemployee_id;

        COMMIT;
    WHEN OTHERS THEN
        raise_application_error(
                               -20002,
                               'Erro Oracle - '
                               || sqlcode
                               || sqlerrm
        );
END;


---------------------------
-- PRAGMA EXCEPTION INIT --
---------------------------

DECLARE
    vfirst_name   employees.first_name%TYPE := 'Robert';
    vlast_name    employees.last_name%TYPE := 'Ford';
    vjob_id       employees.job_id%TYPE := 'XX_YYYY';
    vphone_number employees.phone_number%TYPE := '999.999.9999';
    vemail        employees.email%TYPE := 'RFORD';
    efk_inexistente EXCEPTION;
    PRAGMA exception_init ( efk_inexistente, -2291 );
BEGIN
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        phone_number,
        email,
        hire_date,
        job_id
    ) VALUES (
        employees_seq.NEXTVAL,
        vfirst_name,
        vlast_name,
        vphone_number,
        vemail,
        sysdate,
        vjob_id
    );

    COMMIT;
EXCEPTION
    WHEN efk_inexistente THEN
        raise_application_error(
                               -20003,
                               'Job inexistente'
        );
    WHEN OTHERS THEN
        raise_application_error(
                               -20002,
                               'Erro Oracle - '
                               || sqlcode
                               || sqlerrm
        );
END;