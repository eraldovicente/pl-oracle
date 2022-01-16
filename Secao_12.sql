-----------------------
-- Seção 12 - Aula 1 --
-----------------------

------------------------------
-- Sub-consultas single-row -- 
------------------------------

--------------------------------------------------------------------------
-- Quais empregados possuem o salário maior do que a média de salários? -- 
--------------------------------------------------------------------------

SELECT first_name, last_name, job_id, salary
FROM employees
WHERE salary >
                (SELECT AVG(NVL(salary,0))
                FROM employees);

-------------------------------------------------
-- Utilizando sub-consultas na cláusula HAVING --
-------------------------------------------------

SELECT e1.department_id, MAX(e1.salary)
FROM employees e1
GROUP BY e1.department_id
HAVING MAX(salary) < (SELECT AVG(e2.salary)
                     FROM employees e2);
    












