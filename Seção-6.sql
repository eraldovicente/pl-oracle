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

-----------------------------
-- Utilizando alias de coluna
-----------------------------

SELECT first_name AS nome, last_name sobrenome, salary sal�rio
FROM employees;

SELECT first_name "Nome", last_name "Sobrenome", salary "Sal�rio ($)", commission_pct "Percentual de comiss�o"
FROM employees;

--------------------------------------
-- Utilizando operador de concatena��o
--------------------------------------

SELECT first_name || ' ' || last_name || ', data de admiss�o: ' || hire_date "Funcion�rio"
FROM employees;

--------------------------------------------------------------
-- Utilizando operador de concatena��o e strings de caracteres
--------------------------------------------------------------

SELECT first_name || ' ' || last_name || ', sal�rio: ' || salary "Funcion�rio"
FROM employees;

---------------------------------------------
-- Utilizando operador alternativo para aspas
---------------------------------------------

SELECT department_name || q'[ Department's Manager Id: ]'
|| manager_id "Departamento e Gerente"
FROM departments;














