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

--------------------------------------------------------------
-- Utilizando operador NOT IN em sub-consultas multiple-row --
--------------------------------------------------------------

SELECT employee_id, first_name, last_name
FROM employees
WHERE salary NOT IN
                (SELECT AVG(NVL(salary,0))
                 FROM employees
                 GROUP BY department_id);

-----------------------------------------------------------
-- Utilizando operador ANY em sub-consultas multiple-row --
-----------------------------------------------------------

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY 
                (SELECT salary
                 FROM employees
                 WHERE job_id = 'IT_PROG');
                
-----------------------------------------------------------
-- Utilizando operador ALL em sub-consultas multiple-row --
-----------------------------------------------------------

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL 
                (SELECT salary
                 FROM   employees
                 WHERE  job_id = 'IT_PROG');
                 
--------------------------------------------------------------------
-- Cuidados com valores nulos em uma sub-consulta com operador IN --
--------------------------------------------------------------------

SELECT emp.employee_id, emp.last_name
FROM employees emp
WHERE emp.employee_id IN (SELECT mgr.manager_id
                          FROM employees mgr);
                 



