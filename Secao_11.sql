-----------------------
-- Seção 11 - Aula 1 --
-----------------------

--------------------------------------------------
-- Exibindo dados a partir de multiplas tabelas --
--------------------------------------------------

--------------------------------------------------------
-- Utilizando prefixos - Colunas com nomes de tabelas --
--------------------------------------------------------

SELECT
    employees.employee_id,
    employees.last_name,
    employees.department_id,
    departments.department_name
FROM
    employees
    JOIN departments ON ( employees.department_id = departments.department_id );

--------------------------------
-- Utilizando Alias de tabela --
--------------------------------

SELECT
    e.employee_id,
    e.last_name,
    e.department_id,
    d.department_name
FROM
    employees e
    JOIN departments d ON ( e.department_id = d.department_id );
    
-----------------------------
-- Utilizando NATURAL JOIN --
-----------------------------

SELECT
    department_id,
    department_name,
    location_id,
    city
FROM
    departments
    NATURAL JOIN locations;

-------------------------------
-- JOIN com a cláusula USING --
-------------------------------

SELECT
    e.employee_id,
    e.last_name,
    d.location_id,
    department_id,
    d.department_name
FROM
    employees e
    JOIN departments d USING ( department_id );
    
--------------------------
-- Join com cláusula ON --
--------------------------

SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

SELECT e.employee_id, e.last_name, e.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);



