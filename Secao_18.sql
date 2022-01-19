-----------------------
-- Seção 18 - aula 1 --
-----------------------

--------------------------------------
-- Criando e gerenciando sequências --
--------------------------------------

---------------------------
-- Criando uma sequência --
---------------------------

SELECT MAX(employee_id)
FROM employees;

DROP SEQUENCE employees_seq;

CREATE SEQUENCE employees_seq
 START WITH 208
 INCREMENT BY 1
 NOMAXVALUE
 NOCACHE
 NOCYCLE;
 
 -----------------------------------------------------
 -- Consultando sequências pelo dicionário de dados --
 -----------------------------------------------------
 
 SELECT *
 FROM user_sequences;
 
 --------------------------------------------
 -- Recuperando próximo valor da sequência --
---------------------------------------------

SELECT employees_seq.NEXTVAL
FROM dual;

----------------------------------------------
-- Recuperando o valor corrente da sequence --
----------------------------------------------

SELECT employees_seq.CURRVAL
FROM dual;

------------------------------------
-- Removendo lacunas na sequência --
------------------------------------

-----------------------------
-- Removendo uma sequência --
-----------------------------

DROP SEQUENCE employees_seq;

-----------------------------
-- Recriando uma sequência --
-----------------------------

CREATE SEQUENCE employees_seq
 START WITH 208
 INCREMENT BY 1
 NOMAXVALUE
 NOCACHE
 NOCYCLE;
 
 ------------------------------
 -- Utilizando uma sequência --
 ------------------------------
 
 INSERT INTO employees
            (employee_id, first_name, last_name, email,
             phone_number, hire_date, job_id, salary,
             commission_pct, manager_id, department_id)
        VALUES (employees_seq.nextval, 'Paul', 'Simon', 'PSIMO',
                '999.999.999', TO_DATE('12/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 15000,
                NULL, 103, 60);
 
SELECT *
FROM employees
ORDER BY employee_id DESC;

COMMIT;
 
---------------------------------------------
-- Colocando valores da sequência em cache --
---------------------------------------------

-------------------------------
-- Modificando uma sequência --
-------------------------------

ALTER SEQUENCE employees_seq
MAXVALUE 999999
CACHE 20;







 





























