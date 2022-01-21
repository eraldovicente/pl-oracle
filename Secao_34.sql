--------------
-- Seção 34 --
--------------

-------------
-- Funções --
-------------

---------------------------------------
-- Criando funções de Banco de dados --
---------------------------------------

CREATE OR REPLACE FUNCTION fnc_consulta_salario_empregado (
    pemployee_id IN NUMBER
) RETURN NUMBER IS
    vsalary employees.salary%TYPE;
BEGIN
    SELECT
        salary
    INTO vsalary
    FROM
        employees
    WHERE
        employee_id = pemployee_id;

    RETURN ( vsalary );
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(
                               -20001,
                               'Empregado inexistente!'
        );
    WHEN OTHERS THEN
        raise_application_error(
                               -20002,
                               'Erro Oracle '
                               || sqlcode
                               || sqlerrm
        );
END;

-------------------------------------------
-- Executando a função pelo bloco PL/SQL --
-------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o id do empregado: '

DECLARE
    vemployee_id employees.employee_id%TYPE := &pemployee_id;
    vsalary      employees.salary%TYPE;
BEGIN
    vsalary := fnc_consulta_salario_empregado(vemployee_id);
    dbms_output.put_line('Salário: ' || vsalary);
END;

----------------------------------------
-- Utilizando funções em comandos SQL --
----------------------------------------

CREATE OR REPLACE FUNCTION fnc_consulta_titulo_cargo_empregado (
    pjob_id IN jobs.job_id%TYPE
) RETURN VARCHAR2 IS
    vjob_title jobs.job_title%TYPE;
BEGIN
    SELECT
        job_title
    INTO vjob_title
    FROM
        jobs
    WHERE
        job_id = pjob_id;

    RETURN ( vjob_title );
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(
                               -20001,
                               'Jobs inexistente'
        );
    WHEN OTHERS THEN
        raise_application_error(
                               -20002,
                               'Erro Oracle '
                               || sqlcode
                               || ' - '
                               || sqlerrm
        );
END;

----------------------------------------
-- Utilizando funções em comandos SQL -- Melhor performace é um JOIN
----------------------------------------

SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    fnc_consulta_titulo_cargo_empregado(job_id) "JOB TITLE"
FROM
    employees;
    
---------------------------------------------
-- Executando a função pelo comando SELECT --
---------------------------------------------

SELECT
    fnc_consulta_titulo_cargo_empregado(
        'IT_PROG'
    )
FROM
    dual;

---------------------------------------------
-- Executando a função pelo comando SELECT --
---------------------------------------------

SELECT
    fnc_consulta_salario_empregado(
        130
    )
FROM
    dual;