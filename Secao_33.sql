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

----------------------------------------------
-- Executando a procedure pelo bloco PL/SQL --
----------------------------------------------

BEGIN
    prc_aumenta_salario_empregado(
                                 109,
                                 10
    );
    COMMIT;
END;

-----------------------------------
-- Utilizando procedure tipo OUT --
-----------------------------------

CREATE OR REPLACE PROCEDURE prc_consulta_empregado (
    pemployee_id    IN NUMBER,
    pfirst_name     OUT VARCHAR2,
    plast_name      OUT VARCHAR2,
    pemail          OUT VARCHAR2,
    pphone_number   OUT VARCHAR2,
    pjob_id         OUT VARCHAR2,
    psalary         OUT NUMBER,
    pcommission_pct OUT NUMBER,
    pmanager_id     OUT NUMBER,
    pdepartment_id  OUT NUMBER
) IS
    -- Nenhuma variável declarada
BEGIN
    SELECT
        first_name,
        last_name,
        email,
        phone_number,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
    INTO
        pfirst_name,
        plast_name,
        pemail,
        pphone_number,
        pjob_id,
        psalary,
        pcommission_pct,
        pmanager_id,
        pdepartment_id
    FROM
        employees
    WHERE
        employee_id = pemployee_id;

EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(
                               -20002,
                               'Empregado não existe: ' || pemployee_id
        );
    WHEN OTHERS THEN
        raise_application_error(
                               -20001,
                               'Erro Oracle: '
                               || sqlcode
                               || ' - '
                               || sqlerrm
        );
END;

---------------------------------------------
-- Executando procedure parâmetro tipo OUT --
---------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    employees_record employees%rowtype;
BEGIN
    prc_consulta_empregado(
                          100,
                          employees_record.first_name,
                          employees_record.last_name,
                          employees_record.email,
                          employees_record.phone_number,
                          employees_record.job_id,
                          employees_record.salary,
                          employees_record.commission_pct,
                          employees_record.manager_id,
                          employees_record.department_id
    );

    dbms_output.put_line(employees_record.first_name
                         || ' '
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

END;

-----------------------------------------------------
-- Utilizando parâmetros tipo OUT com opção NOCOPY --
-----------------------------------------------------

CREATE OR REPLACE PROCEDURE prc_consulta_empregado (
    pemployee_id    IN NUMBER,
    pfirst_name     OUT NOCOPY VARCHAR2,
    plast_name      OUT NOCOPY VARCHAR2,
    pemail          OUT NOCOPY VARCHAR2,
    pphone_number   OUT NOCOPY VARCHAR2,
    phire_date      OUT NOCOPY DATE,
    pjob_id         OUT NOCOPY VARCHAR2,
    psalary         OUT NOCOPY NUMBER,
    pcommission_pct OUT NOCOPY NUMBER,
    pmanager_id     OUT NOCOPY NUMBER,
    pdepartment_id  OUT NOCOPY NUMBER
) IS
BEGIN
    SELECT
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
    INTO
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
    FROM
        employees
    WHERE
        employee_id = pemployee_id;

EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(
                               -20001,
                               'Empregado Não existe: ' || pemployee_id
        );
    WHEN OTHERS THEN
        raise_application_error(
                               -20002,
                               'Erro Oracle '
                               || sqlcode
                               || sqlerrm
        );
END;

----------------------------------------------------
-- Executando procedure parâmetro tipo OUT NOCOPY --
----------------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    employees_record employees%rowtype;
BEGIN
    prc_consulta_empregado(
                          100,
                          employees_record.first_name,
                          employees_record.last_name,
                          employees_record.email,
                          employees_record.phone_number,
                          employees_record.hire_date,
                          employees_record.job_id,
                          employees_record.salary,
                          employees_record.commission_pct,
                          employees_record.manager_id,
                          employees_record.department_id
    );

    dbms_output.put_line(employees_record.first_name
                         || ' '
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

END;

--------------------------------------
-- Métodos de passagem de parâmetro --
--------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    employees_record employees%rowtype;
BEGIN
    prc_consulta_empregado(
                          100,
                          employees_record.first_name,
                          employees_record.last_name,
                          employees_record.email,
                          employees_record.phone_number,
                          employees_record.hire_date,
                          employees_record.job_id,
                          employees_record.salary,
                          employees_record.commission_pct,
                          employees_record.manager_id,
                          employees_record.department_id
    );

    dbms_output.put_line(employees_record.first_name
                         || ' '
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

END;

--------------------
-- Método nomeado --
--------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    vemployee_id    NUMBER := 100;
    vfirst_name     VARCHAR2(200);
    vlast_name      VARCHAR2(200);
    vemail          VARCHAR2(200);
    vphone_number   VARCHAR2(200);
    vhire_date      DATE;
    vjob_id         VARCHAR2(200);
    vsalary         NUMBER;
    vcommission_pct NUMBER;
    vmanager_id     NUMBER;
    vdepartment_id  NUMBER;
BEGIN
    prc_consulta_empregado(
                          pemployee_id    => vemployee_id,
                          pfirst_name     => vfirst_name,
                          plast_name      => vlast_name,
                          pemail          => vemail,
                          pphone_number   => vphone_number,
                          phire_date      => vhire_date,
                          pjob_id         => vjob_id,
                          psalary         => vsalary,
                          pcommission_pct => vcommission_pct,
                          pmanager_id     => vmanager_id,
                          pdepartment_id  => vdepartment_id
    );

    dbms_output.put_line('PFIRST_NAME = ' || vfirst_name);
    dbms_output.put_line('PLAST_NAME = ' || vlast_name);
    dbms_output.put_line('PEMAIL = ' || vemail);
    dbms_output.put_line('PPHONE_NUMBER = ' || vphone_number);
    dbms_output.put_line('PHIRE_DATE = ' || vhire_date);
    dbms_output.put_line('PJOB_ID = ' || vjob_id);
    dbms_output.put_line('PSALARY = ' || vsalary);
    dbms_output.put_line('PCOMMISSION_PCT = ' || vcommission_pct);
    dbms_output.put_line('PMANAGER_ID = ' || vmanager_id);
    dbms_output.put_line('PDEPARTMENT_ID = ' || vdepartment_id);
END;

-----------------------------------------------
-- Recompilando procedures de Bando de dados --
-----------------------------------------------

ALTER PROCEDURE PRC_INSERI_EMPREGADO COMPILE;

-------------------------------------------
-- Removendo procedure de Banco de dados --
-------------------------------------------

DROP PROCEDURE PRC_CONSULTA_EMPREGADO;






