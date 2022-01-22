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



































