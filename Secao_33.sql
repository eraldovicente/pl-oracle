--------------
-- Se��o 33 --
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
    -- Nenhuma vari�vel declarada
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