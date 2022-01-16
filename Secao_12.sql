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
    












