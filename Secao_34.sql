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
    vemployee_id employees.employee_id%type := &pemployee_id;
    vsalary employees.salary%type;
BEGIN
    vsalary := FNC_CONSULTA_SALARIO_EMPREGADO(vemployee_id);
    DBMS_OUTPUT.PUT_LINE('Salário: ' || vsalary);
END;
