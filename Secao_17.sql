-----------------------
-- Se��o 17 - aula 1 --
-----------------------

----------------------------------
-- Criando e gerenciando vis�es --
----------------------------------

-----------------------
-- Criando uma vis�o --
-----------------------

CREATE OR REPLACE VIEW vemployeesdept60
AS SELECT employee_id, first_name, last_name, department_id, salary, commission_pct
FROM employees
WHERE department_id = 60;

DESC vemployeesdept60;

--------------------------------------------
-- Recuperando dados utilizando uma vis�o --
--------------------------------------------

SELECT *
FROM vemployeesdept60;

------------------------------
-- Criando vis�es complexas --
------------------------------

CREATE OR REPLACE VIEW vdepartments_total
(department_id, department_name, minsal, maxsal, avgsal)
AS SELECT e.department_id, d.department_name, MIN(e.salary),
    MAX(e.salary), AVG(e.salary)
FROM employees e
    JOIN departments d
ON (e.department_id = d.department_id)
GROUP BY e.department_id, department_name;
    
    SELECT *
    FROM vdepartments_total;
    
----------------------------------------
-- Utilizando a cl�usula CHECK OPTION --
----------------------------------------

CREATE OR REPLACE VIEW vemployeesdept100
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 100
WITH CHECK OPTION CONSTRAINT vemployeesdept100_ck;

-------------------------------------
-- Utilizando a cl�usula READ ONLY --
-------------------------------------

CREATE OR REPLACE VIEW vemployeesdept20
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 20
WITH READ ONLY;

-------------------------
-- Removendo uma vis�o --
-------------------------

DROP VIEW vemployeesdept20;






































