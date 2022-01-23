--------------
-- Seçaõ 39 --
--------------

----------------------------------------------
-- Database DML triggers a nível de comando --
----------------------------------------------

CREATE OR REPLACE TRIGGER B_I_EMPLOYEES_S_TRG
BEFORE INSERT
ON employees
BEGIN
  IF  (TO_CHAR(SYSDATE, 'DAY') IN ('SÁBADO', 'DOMINGO') OR
       TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) NOT BETWEEN 8 AND 18) 
  THEN
       RAISE_APPLICATION_ERROR( -20001,'O cadastramento de Empregados só é permitido em dias de semana dentro do horário comercial');
  END IF;
END;

-------------------------------------
-- Testando a validação de trigger --
-------------------------------------

BEGIN
    PCK_EMPREGADOS.PRC_INSERI_EMPREGADO('Fabiana', 'Paes', 'BIANA', '999.999.9999', SYSDATE,'IT_PROG',25000,NULL,103,60);
    COMMIT;
END;

---------------------------------------------------
-- Criando uma trigger combinando vários eventos --
---------------------------------------------------

CREATE OR REPLACE TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG
BEFORE INSERT OR UPDATE OR DELETE
ON employees
BEGIN
  IF  (TO_CHAR(SYSDATE, 'DAY') IN ('SÁBADO', 'DOMINGO') OR
       TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) NOT BETWEEN 8 AND 18) 
  THEN
    CASE
        WHEN INSERTING
        THEN
            RAISE_APPLICATION_ERROR( -20001,'O cadastramento de Empregados só é permitido em dias de semana dentro do horário comercial');
        WHEN DELETING
        THEN
            RAISE_APPLICATION_ERROR( -20002,'O deleção de Empregados só é permitido em dias de semana dentro do horário comercial');
        ELSE
            RAISE_APPLICATION_ERROR( -20003,'O atualização de Empregados só é permitido em dias de semana dentro do horário comercial');
        END CASE;
  END IF;
END;

-------------------------------------
-- Testando a validação de trigger --
-------------------------------------

BEGIN
    PCK_EMPREGADOS.PRC_INSERI_EMPREGADO('Gabriel', 'Santana', 'BIRO', '999.999.9999', SYSDATE,'IT_PROG',25000,NULL,103,60);
    COMMIT;
END;

--------------------------------------------
-- Database DML triggers a nível de linha --
--------------------------------------------

---------------------------------------------------------------------------------------
-- Criando a tabela de log de auditoria para a tabela EMPLOYEES para a coluna SALARY --
---------------------------------------------------------------------------------------

CREATE TABLE employees_log
(employees_log_id NUMBER(11) NOT NULL,
 dt_log DATE DEFAULT SYSDATE NOT NULL,
 usuario VARCHAR2(30),
 evento CHAR(1) NOT NULL,
 employee_id NUMBER(6) NOT NULL,
 salary_old NUMBER(8,2),
 salary_new NUMBER(8,2));

ALTER TABLE employees_log
ADD CONSTRAINT employees_log_pk PRIMARY KEY (employees_log_id);

CREATE SEQUENCE employees_log_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
NOMAXVALUE;

------------------------------------------------------------------------------------------------
-- Criando uma trigger que gera log de auditoria para a tabela EMPLOYEES para a coluna SALARY --
------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER A_IUD_EMPLOYEES_R_TRG
    AFTER INSERT OR UPDATE OF SALARY OR DELETE
    ON EMPLOYEES
    FOR EACH ROW
DECLARE
    vevento employees_log.evento%type;
    vemployee_id employees_log.employee_id%type;
BEGIN
    CASE
        WHEN INSERTING THEN
            vevento := 'I';
            vemployee_id := :new.employee_id;
        WHEN UPDATING THEN
            vevento := 'U';
            vemployee_id := :new.employee_id;
        ELSE
            vevento := 'D';
            vemployee_id := :old.employee_id;
    END CASE;
    INSERT INTO employees_log
        (employees_log_id,
         dt_log,
         usuario,
         evento,
         employee_id,
         salary_old,
         salary_new)
    VALUES
        (employees_log_seq.nextval,
         SYSDATE,
         USER,
         vevento,
         vemployee_id,
         :old.salary,
         :new.salary);
END A_IUD_EMPLOYEES_R_TRG;

-----------------------------------
-- Testando o disparo do trigger --
-----------------------------------

UPDATE employees
SET salary = salary * 1.5;

ALTER TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG disable;

----------------------------------------
-- Consultando a tabela employees_log --
----------------------------------------

SELECT *
FROM employees_log;

COMMIT;

-------------------
-- Cláusula WHEN --
-------------------

DELETE FROM employees_log;

CREATE OR REPLACE TRIGGER A_IUD_EMPLOYEES_R_TRG
    AFTER INSERT OR UPDATE OF SALARY OR DELETE
    ON EMPLOYEES
    FOR EACH ROW
    WHEN (new.job_id <> 'AD_PRES')
DECLARE
    vevento employees_log.evento%type;
    vemployee_id employees_log.employee_id%type;
BEGIN
    CASE
        WHEN INSERTING THEN
            vevento := 'I';
            vemployee_id := :new.employee_id;
        WHEN UPDATING THEN
            vevento := 'U';
            vemployee_id := :new.employee_id;
        ELSE
            vevento := 'D';
            vemployee_id := :old.employee_id;
    END CASE;
    INSERT INTO employees_log
        (employees_log_id,
         dt_log,
         usuario,
         evento,
         employee_id,
         salary_old,
         salary_new)
    VALUES
        (employees_log_seq.nextval,
         SYSDATE,
         USER,
         vevento,
         vemployee_id,
         :old.salary,
         :new.salary);
END A_IUD_EMPLOYEES_R_TRG;

-------------------------------
-- Regras de mutating tables --
-------------------------------

---------------------------------------------------
-- Violação da primeira regra de mutating tables --
---------------------------------------------------

/*
Regra 1º de mutating tables não altere dados de colunas de chaves primarias,
chaves estrangeiras e chaves únicas de tabelas relacionadas aquela na qual 
a trigger dispareda está associada.
*/

CREATE OR REPLACE TRIGGER A_I_EMPLOYEES_R_TRG
AFTER INSERT
ON employees
FOR EACH ROW
BEGIN
    UPDATE employees
    SET email = upper(substr(:new.first_name,1,1) || :new.last_name)
    WHERE employee_id = :new.employee_id;
END;

--------------------------------
-- Testando violação da regra --
--------------------------------

SET VERIFY OFF
BEGIN
    PRC_INSERI_EMPREGADO('Eric', 'Clapton', 'ECLAPTON', '99.99.999',SYSDATE, 'IT_PROG',15000, NULL,103,60);
END;

-------------------------------------------------------
-- Corrigindo a trigger para que não viole a regra 1 --
-------------------------------------------------------

CREATE OR REPLACE TRIGGER A_I_EMPLOYEES_R_TRG
BEFORE INSERT
ON employees
FOR EACH ROW
BEGIN
    :new.email := UPPER(SUBSTR(:new.first_name,1,1) || (:new.last_name));
END;


SET VERIFY OFF
BEGIN
    PRC_INSERI_EMPREGADO('Eric', 'Clapton', 'ECLAPTON', '99.99.999',SYSDATE, 'IT_PROG',15000, NULL,103,60);
    COMMIT;
END;

-------------------------------------------
-- Violação de regra 2 de mutating table --
-------------------------------------------

-----------------------------------------------------------------------------------------------
-- Regra 2 de mutating tables: Não leia informações de tabelas que estejam sendo modificadas --
-----------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER B_U_VALIDATE_SALARY_EMPLOYEES_R_TRG
BEFORE UPDATE OF salary
ON employees
FOR EACH ROW
DECLARE
    vmaxsalary employees.salary%type;
BEGIN
    SELECT MAX(salary)
    INTO vmaxsalary
    FROM employees;
    
    IF :new.salary > vmaxsalary * 1.2
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salário não pode ser superior ao maior salário + 20%');
    END IF;
END;

----------------------------------
-- Testando violação da regra 2 --
----------------------------------

SET VERIFY OFF
UPDATE employees
SET salary = 70000
WHERE employee_id = 100;

DROP TRIGGER A_I_EMPLOYEES_R_TRG;

DROP TRIGGER B_U_VALIDATE_SALARY_EMPLOYEES_R_TRG;

----------------------------------------------
-- Resolvendo o problema de Mutating tables --
----------------------------------------------

CREATE OR REPLACE PACKAGE PCK_EMPLOYEES_DADOS 
AS
  TYPE max_salary_table_type IS TABLE OF NUMBER(10,2)
  INDEX BY BINARY_INTEGER;
  
  gMaxSalary  max_salary_table_type;

END PCK_EMPLOYEES_DADOS;

CREATE OR REPLACE TRIGGER B_IU_VALIDATE_SALARY_EMPLOYEES_S_TRG
BEFORE INSERT OR UPDATE OF salary
ON  employees
DECLARE
  vMaxSalary  employees.salary%TYPE;
BEGIN
  SELECT MAX(salary)
  INTO   PCK_EMPLOYEES_DADOS.gMaxSalary(1)
  FROM   employees;
END;

CREATE OR REPLACE TRIGGER B_IU_VALIDATE_SALARY_EMPLOYEES_R_TRG
BEFORE INSERT OR UPDATE OF salary
ON  employees
FOR EACH ROW
DECLARE
  vMaxSalary  employees.salary%TYPE;
BEGIN
  IF  :new.salary  > PCK_EMPLOYEES_DADOS.gMaxSalary(1) * 1.2
  THEN  
      RAISE_APPLICATION_ERROR(-20001, 'Novo salario não pode ser superior ao maior salario + 20%');
  END IF;
END;

----------------------------------
-- Testando Violação da Regra 2 --
----------------------------------

SET VERIFY OFF
UPDATE employees
SET salary = 30000
WHERE employee_id = 100;

COMMIT;














































