-----------------------
-- Seção 17 - aula 1 --
-----------------------

----------------------------------
-- Criando e gerenciando visões --
----------------------------------

-----------------------
-- Criando uma visão --
-----------------------

CREATE OR REPLACE VIEW vemployeesdept60
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 60;

DESC vemployeesdept60;

--------------------------------------------
-- Recuperando dados utilizando uma visão --
--------------------------------------------

SELECT *
FROM vemployeesdept60;






























