--------------
-- Seção 34 --
--------------

-------------
-- Funções --
-------------

---------------------------------------
-- Criando funções de Banco de dados --
---------------------------------------

CREATE OR REPLACE FUNCTION fnc_cunsulta_salario_empregado (
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