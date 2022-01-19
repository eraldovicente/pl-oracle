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
AS SELECT employee_id, first_name, last_name, department_id, salary, commission_pct
FROM employees
WHERE department_id = 60;

DESC vemployeesdept60;

--------------------------------------------
-- Recuperando dados utilizando uma visão --
--------------------------------------------

SELECT *
FROM vemployeesdept60;

------------------------------
-- Criando visões complexas --
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






































