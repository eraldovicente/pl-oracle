------------------------------------
-- Utilizando operadores aritm�ticos
------------------------------------

SELECT first_name, last_name, salary, salary * 1.15
FROM employees;

--------------------------------------
-- Regras de preced�ncia de operadores
--------------------------------------

SELECT first_name, last_name, salary, salary + 100 * 1.15
FROM employees;

-----------------------------------------
-- Alterando a preced�ncia com par�nteses
-----------------------------------------

SELECT first_name, last_name, salary, (salary + 100) * 1.15
FROM employees;

-----------------------------------------
-- Entendendo o valor nulo (NULL)
-----------------------------------------

SELECT first_name, last_name, job_id, salary, commission_pct
FROM employees;

-----------------------------------------------------
-- Utilizando valores nulos em express�es aritm�ticas
-----------------------------------------------------

SELECT first_name, last_name, job_id, commission_pct, 200000 * commission_pct
FROM employees
WHERE commission_pct IS NULL;



