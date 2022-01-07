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

-----------------------------------------
-- Entendendo o valor nulo (NULL)
-----------------------------------------

SELECT first_name, last_name, job_id, salary, commission_pct
FROM employees;

-----------------------------------------------------
-- Utilizando valores nulos em expressões aritméticas
-----------------------------------------------------

SELECT first_name, last_name, job_id, commission_pct, 200000 * commission_pct
FROM employees
WHERE commission_pct IS NULL;

-----------------------------
-- Utilizando alias de coluna
-----------------------------

SELECT first_name AS nome, last_name sobrenome, salary salário
FROM employees;

SELECT first_name "Nome", last_name "Sobrenome", salary "Salário ($)", commission_pct "Percentual de comissão"
FROM employees;

--------------------------------------
-- Utilizando operador de concatenação
--------------------------------------

SELECT first_name || ' ' || last_name || ', data de admissão: ' || hire_date "Funcionário"
FROM employees;

--------------------------------------------------------------
-- Utilizando operador de concatenação e strings de caracteres
--------------------------------------------------------------

SELECT first_name || ' ' || last_name || ', salário: ' || salary "Funcionário"
FROM employees;

---------------------------------------------
-- Utilizando operador alternativo para aspas
---------------------------------------------

SELECT department_name || q'[ Department's Manager Id: ]'
|| manager_id "Departamento e Gerente"
FROM departments;














