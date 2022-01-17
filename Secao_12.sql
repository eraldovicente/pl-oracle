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
                          
------------------------------------------------------------------------
-- Cuidados com valores nulos em uma sub-consulta com operador NOT IN --
------------------------------------------------------------------------

SELECT emp.employee_id, emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN (SELECT mgr.manager_id
                              FROM employees mgr);
                              
------------
-- Aula 3 --
------------

---------------------------------------------
-- Utilizando operador EXISTS e NOT EXISTS --
---------------------------------------------

----------------------------
-- Utilizando operador IN --
----------------------------

SELECT d.department_id, d.department_name
FROM departments d
WHERE d.department_id IN (SELECT e.department_id
                          FROM employees e);

--------------------------------
-- Utilizando operador NOT IN --
--------------------------------

SELECT d.department_id, d.department_name
FROM departments d
WHERE d.department_id NOT IN (SELECT NVL(e.department_id,0)
                              FROM employees e);

-----------------------------------------
-- Idem utilizando EXISTS e NOT EXISTS --
-----------------------------------------

--------------------------------
-- Utilizando operador EXISTS --
--------------------------------

SELECT d.department_id, d.department_name
FROM departments d
WHERE EXISTS (SELECT e.department_id
              FROM employees e
              WHERE d.department_id = e.department_id);

------------------------------------
-- Utilizando operador NOT EXISTS --
------------------------------------

SELECT d.department_id, d.department_name
FROM departments d
WHERE NOT EXISTS (SELECT e.department_id
              FROM employees e
              WHERE d.department_id = e.department_id);
              
-----------------------
-- Seção 12 - aula 4 --
-----------------------

------------------------------
-- Utilizando sub-consultas --
------------------------------

----------------------------------------------
-- Utilizando sub-consultas correlacionadas --
----------------------------------------------

SELECT e1.employee_id, e1.first_name, e1.last_name, e1.department_id, e1.salary
FROM employees e1
WHERE e1.salary >= (SELECT TRUNC(AVG(NVL(SALARY,0)),0)
                    FROM employees e2
                    WHERE e1.department_id = e2.department_id);
                    
SELECT TRUNC(AVG(NVL(salary,0)),0)
FROM employees e2
WHERE e2.department_id = 60;

-----------------------
-- Seção 12 - aula 5 -- 
-----------------------

----------------------------------------------
-- Utilizando sub-consultas multiple-column --
----------------------------------------------

----------------------------------------------
-- Utilizando sub-consultas multiple-column --
----------------------------------------------

SELECT e1.employee_id, e1.first_name, e1.job_id, e1.salary
FROM employees e1
WHERE (e1.job_id, e1.salary) IN (SELECT e2.job_id, MAX(e2.salary)
                                 FROM employees e2
                                 GROUP BY e2.job_id);
                                 
-----------------------
-- Seção 12 - aula 6 --
-----------------------

-----------------------------------------------
-- Utilizando sub-consultas na cláusula FROM --
-----------------------------------------------

SELECT empregados.employee_id, empregados.first_name, empregados.last_name, empregados.job_id,
       empregados.salary, ROUND(max_salary_job.max_salary,2) MAX_SALARY, empregados.salary - ROUND(max_salary_job.max_salary,2) DIFERENÇA
FROM employees empregados
    LEFT JOIN (SELECT e2.job_id, MAX(e2.salary) max_salary
               FROM employees e2
               GROUP BY e2.job_id) max_salary_job
         ON empregados.job_id = max_salary_job.job_id;






