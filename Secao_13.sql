-----------------------
-- Seção 13 - aula 1 --
-----------------------

--------------------
-- Operadores SET --
--------------------

---------------------------------
-- Utilizando o operador UNION --
---------------------------------

SELECT employee_id, job_id, hire_date, salary
FROM employees
WHERE department_id IN (60, 90, 100)
UNION 
SELECT employee_id, job_id, hire_date, salary
FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY employee_id;
















