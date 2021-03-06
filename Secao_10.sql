-----------------------
-- Se??o 10 - Aula 1 --
-----------------------

-------------------------------------------------
-- Agregando dados utilizando fun??es de grupo --
-------------------------------------------------

-------------------------------------
-- Utilizando as fun??es AVG e SUM --
-------------------------------------

SELECT AVG(salary), SUM(salary)
FROM employees;

-------------------------------------
-- Utilizando as fun??es MIN e MAX --
-------------------------------------

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(salary), MAX(salary)
FROM employees;

-------------------------------
-- Utilizando a fun??o COUNT --
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
-- Utilizando a fun??o COUNT com DISTINCT --
--------------------------------------------

SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT COUNT(department_id)
FROM employees;

--------------------------------------
-- Fun??es de grupo e valores nulos --
--------------------------------------

SELECT AVG(commission_pct)
FROM employees;

---------------------------------------------
-- Tratamento de nulos em fun??es de grupo --
---------------------------------------------

SELECT AVG(NVL(commission_pct,0))
FROM employees;

------------
-- Aula 2 -- 
------------

---------------------------------------------------
-- Criando grupos utilizando a cl?usula GROUP BY --
---------------------------------------------------

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

------------------------------------------------------------------------
-- Utilizando a cl?usula GROUP BY com mais de uma coluna ou express?o --
------------------------------------------------------------------------

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

-------------------------------------
-- Se o comando SELECT utiliza grupos,  --
-- ent?o todas as colunas ou express?es --
-- na lista da cl?usula SELECT que n?o  --
-- est?o em uma fun??o de grupo devem   --
-- estar na cl?usula GROUP BY.          --
------------------------------------------

------------------------------------------------------
-- Consultas incorretas utilizando fun??es de grupo --
------------------------------------------------------

--SELECT department_id, first_name, job_id, SUM(salary)
--FROM employees
--GROUP BY department_id, job_id
--ORDER BY department_id;
--
--SELECT department_id, AVG(salary)
--FROM employees;

--SELECT department_id, MAX(salary)
--FROM employees
--WHERE MAX(salary) > 10000
--GROUP BY department_id; 

-----------------------------------------------------------------
-- Corrigindo consultas incorretas utilizando fun??es de grupo --
-----------------------------------------------------------------

------------------------------------------------------
-- Restringindo grupos utilizando a cl?usula HAVING --
------------------------------------------------------

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary)>10000;

SELECT job_id, SUM(salary) TOTAL
FROM employees
WHERE job_id <> 'SA_REP'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY SUM(salary);

--------------------------------
-- Aninhando fun??es de grupo --
--------------------------------

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;



















