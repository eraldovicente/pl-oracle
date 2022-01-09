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

--------------------------------------
-- Fun��es de grupo e valores nulos --
--------------------------------------

SELECT AVG(commission_pct)
FROM employees;

---------------------------------------------
-- Tratamento de nulos em fun��es de grupo --
---------------------------------------------

SELECT AVG(NVL(commission_pct,0))
FROM employees;

------------
-- Aula 2 -- 
------------

---------------------------------------------------
-- Criando grupos utilizando a cl�usula GROUP BY --
---------------------------------------------------

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;



















