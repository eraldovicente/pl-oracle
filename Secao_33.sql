--------------
-- Seção 33 --
--------------

---------------------------------------------
-- Criando uma procedure de Banco de Dados --
---------------------------------------------

CREATE OR REPLACE PROCEDURE prc_inseri_empregado (
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
    -- Nenhuma variável declarada
BEGIN
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

----------------------------------------------
-- Executando a procedure pelo bloco PL/SQL --
----------------------------------------------

BEGIN
    prc_inseri_empregado(
                        'David',
                        'Bowie',
                        'DBOWIE',
                        '999.999.9999',
                        sysdate,
                        'IT_PROG',
                        1500,
                        NULL,
                        103,
                        60
    );

    COMMIT;
END;

--------------------------------------
-- Consultando o empregado inserido --
--------------------------------------

SELECT
    *
FROM
    employees
WHERE
    first_name = 'David'
    AND last_name = 'Bowie';

--------------------------------------------------------------
-- Executando a procedure com o comando EXECUTE do SQL*PLUS --
--------------------------------------------------------------

EXEC prc_inseri_empregado('Greg', 'Lake', 'GLAKE', '99.999.9999', SYSDATE, 'IT_PROG',1500,NULL,103,60);

COMMIT;

--------------------------------------
-- consultando o empregado inserido --
--------------------------------------

SELECT
    *
FROM
    employees
WHERE
    first_name = 'Greg'
    AND last_name = 'Lake';
    
-----------------------------------
-- Utilizando parâmetros tipo IN --
-----------------------------------

CREATE OR REPLACE PROCEDURE prc_aumenta_salario_empregado (
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