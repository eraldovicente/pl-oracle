-----------------------
-- Se��o 18 - aula 1 --
-----------------------

--------------------------------------
-- Criando e gerenciando sequ�ncias --
--------------------------------------

---------------------------
-- Criando uma sequ�ncia --
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
 -- Consultando sequ�ncias pelo dicion�rio de dados --
 -----------------------------------------------------
 
 SELECT *
 FROM user_sequences;
 
 --------------------------------------------
 -- Recuperando pr�ximo valor da sequ�ncia --
---------------------------------------------

SELECT employees_seq.NEXTVAL
FROM dual;

----------------------------------------------
-- Recuperando o valor corrente da sequence --
----------------------------------------------

SELECT employees_seq.CURRVAL
FROM dual;






























