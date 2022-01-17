-----------------------
-- Seção 12 - Aula 1 --
-----------------------

------------------------------
-- Sub-consultas single-row -- 
------------------------------

--------------------------------------------------------------------------
-- Quais empregados possuem o salário maior do que a média de salários? -- 
--------------------------------------------------------------------------

SELECT
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT
            AVG(nvl(
                salary, 0
            ))
        FROM
            employees
    );

-------------------------------------------------
-- Utilizando sub-consultas na cláusula HAVING --
-------------------------------------------------

SELECT
    e1.department_id,
    MAX(e1.salary)
FROM
    employees e1
GROUP BY
    e1.department_id
HAVING
    MAX(salary) < (
        SELECT
            AVG(e2.salary)
        FROM
            employees e2
    );
                     
-----------------------------------------------
-- Erros utilizando sub-consultas single-row --
-----------------------------------------------

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    salary = (
        SELECT
            AVG(nvl(
                salary, 0
            ))
        FROM
            employees
        GROUP BY
            department_id
    );

---------------------------------------------------------------
-- O que ocorre quando a sub-consulta retorna nenhuma linha? --
---------------------------------------------------------------

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    last_name = (
        SELECT
            last_name
        FROM
            employees
        WHERE
            last_name = 'Suzuki'
    );

------------
-- Aula 2 --
------------

--------------------------------
-- Sub-consultas multiple-row --
--------------------------------

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    salary IN (
        SELECT
            AVG(nvl(
                salary, 0
            ))
        FROM
            employees
        GROUP BY
            department_id
    );