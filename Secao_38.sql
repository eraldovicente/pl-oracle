--------------
-- Seção 38 --
--------------

-------------------------------------
-- Criando o package specification --
-------------------------------------

CREATE OR REPLACE PACKAGE pck_empregados IS
    gminsalary employees.salary%TYPE;
    PROCEDURE prc_inseri_empregado (
        pfirst_name     IN VARCHAR2,
        plast_name      IN VARCHAR2,
        pemail          IN VARCHAR2,
        pphone_number   IN VARCHAR2,
        phire_date      IN DATE DEFAULT sysdate,
        pjob_id         IN VARCHAR2,
        psalary         IN NUMBER,
        pcommission_pct IN NUMBER,
        pmanager_id     IN NUMBER,
        pdepartment_id  IN NUMBER
    );

    PROCEDURE prc_aumenta_salario_empregado (
        pemployee_id IN NUMBER,
        ppercentual  IN NUMBER
    );

    FUNCTION fnc_consulta_salario_empregado (
        pemployee_id IN NUMBER
    ) RETURN NUMBER;

END pck_empregados;

----------------------------
-- Criando o package body --
----------------------------

CREATE OR REPLACE PACKAGE BODY pck_empregados IS

    PROCEDURE prc_inseri_empregado (
        pfirst_name     IN VARCHAR2,
        plast_name      IN VARCHAR2,
        pemail          IN VARCHAR2,
        pphone_number   IN VARCHAR2,
        phire_date      IN DATE DEFAULT sysdate,
        pjob_id         IN VARCHAR2,
        psalary         IN NUMBER,
        pcommission_pct IN NUMBER,
        pmanager_id     IN NUMBER,
        pdepartment_id  IN NUMBER
    ) IS
    BEGIN
        IF psalary < pck_empregados.gminsalary THEN
            raise_application_error(
                                   -20002,
                                   'Salário não pode ser inferior ao menor salário dos empregados!'
            );
        END IF;
        
        INSERT INTO employees (
            employee_id,
            first_name,
            last_name,
            email,
            phone_number,
            hire_date,
            job_id,
            salary,
            commission_pct,
            manager_id,
            department_id
        ) VALUES (
            employees_seq.NEXTVAL,
            pfirst_name,
            plast_name,
            pemail,
            pphone_number,
            phire_date,
            pjob_id,
            psalary,
            pcommission_pct,
            pmanager_id,
            pdepartment_id
        );

    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(
                                   -20001,
                                   'Erro Oracle '
                                   || sqlcode
                                   || sqlerrm
            );
    END;

    PROCEDURE prc_aumenta_salario_empregado (
        pemployee_id IN NUMBER,
        ppercentual  IN NUMBER
    ) IS
            -- Nenhuma variável declarada
    BEGIN
        UPDATE employees
        SET
            salary = salary * ( 1 + ppercentual / 100 )
        WHERE
            employee_id = pemployee_id;

    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(
                                   -20001,
                                   'Erro Oracle: '
                                   || sqlcode
                                   || ' - '
                                   || sqlerrm
            );
    END;

    FUNCTION fnc_consulta_salario_empregado (
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

END pck_empregados;

----------------------------------------------
-- Referenciando componentes de uma package --
----------------------------------------------

BEGIN
    pck_empregados.prc_inseri_empregado(
                                       'Eraldo',
                                       'Vicente',
                                       'EVICENTE',
                                       '999.999.9999',
                                       sysdate,
                                       'IT_PROG',
                                       20000,
                                       NULL,
                                       103,
                                       60
    );

    COMMIT;
END;

---------------------------------------------------------
-- Recompilado package specification de Banco de dados --
---------------------------------------------------------

ALTER PACKAGE PCK_EMPREGADOS COMPILE SPECIFICATION;














