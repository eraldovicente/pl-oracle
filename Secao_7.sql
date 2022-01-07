----------------------
-- Se��o 7 - Aula 1 --
------------------------------------
-- Restringindo e ordenando dados --
------------------------------------

---------------------------------
-- Utilizando a cl�usula WHERE --
---------------------------------

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

-------------------------------------------------------
-- Utilizando Strings de caractere na cl�usula WHERE --
-------------------------------------------------------

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';

-----------------------------------------------------------
-- Utilizando operadores de compara��o na cl�usula WHERE --
-----------------------------------------------------------

SELECT last_name, salary
FROM employees
WHERE salary >= 10000;

------------------------------------------------------------------
-- Selecionando faixas de valores utilizando o operador BETWEEN --
------------------------------------------------------------------

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 15000;

-----------------------------------------------------------------------
-- Selecionando valores dentro de uma lista utilizando o operador IN --
-----------------------------------------------------------------------

SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');















