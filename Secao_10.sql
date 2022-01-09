-----------------------
-- Se��o 10 - Aula 1 --
-----------------------

-------------------------------------------------
-- Agregando dados utilizando fun��es de grupo --
-------------------------------------------------

-------------------------------------
-- Utilizando as fun��es AVG e SUM --
-------------------------------------

SELECT AVG(salary), SUM(salary)
FROM employees;

-------------------------------------
-- Utilizando as fun��es MIN e MAX --
-------------------------------------

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(salary), MAX(salary)
FROM employees;

-------------------------------
-- Utilizando a fun��o COUNT --
-------------------------------

SELECT COUNT(*)
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT COUNT(NVL(commission_pct,0))
FROM employees;

--------------------------------------------
-- Utilizando a fun��o COUNT com DISTINCT --
--------------------------------------------

SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT COUNT(department_id)
FROM employees;



















