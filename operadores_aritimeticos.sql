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



