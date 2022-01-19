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






























