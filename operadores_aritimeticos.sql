------------------------------------
-- Utilizando operadores aritméticos
------------------------------------

SELECT first_name, last_name, salary, salary * 1.15
FROM employees;

--------------------------------------
-- Regras de precedência de operadores
--------------------------------------

SELECT first_name, last_name, salary, salary + 100 * 1.15
FROM employees;

-----------------------------------------
-- Alterando a precedência com parênteses
-----------------------------------------

SELECT first_name, last_name, salary, (salary + 100) * 1.15
FROM employees;



