-----------------------
-- Se��o 12 - Aula 1 --
-----------------------

------------------------------
-- Sub-consultas single-row -- 
------------------------------

--------------------------------------------------------------------------
-- Quais empregados possuem o sal�rio maior do que a m�dia de sal�rios? -- 
--------------------------------------------------------------------------

SELECT first_name, last_name, job_id, salary
FROM employees
WHERE salary >
                (SELECT AVG(NVL(salary,0))
                FROM employees);
    












