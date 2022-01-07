----------------------
-- Se��o 7 - Aula 1 --
------------------------------------
-- Restringindo e ordenando dados --
------------------------------------

--------------------------------
-- Utilizando a cl�usula WHERE--
--------------------------------

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

------------------------------------------------------
-- Utilizando Strings de caractere na cl�usula WHERE--
------------------------------------------------------

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';


