-----------------------
-- Se��o 11 - Aula 1 --
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
-- JOIN com a cl�usula USING --
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
-- Join com cl�usula ON --
--------------------------

SELECT
    e.employee_id,
    e.last_name,
    e.department_id,
    d.department_id,
    d.location_id
FROM
    employees e
    JOIN departments d ON ( e.department_id = d.department_id );

SELECT
    e.employee_id,
    e.last_name,
    e.department_id,
    d.location_id
FROM
    employees e
    JOIN departments d ON ( e.department_id = d.department_id );

-------------------------------------------------------
-- Joins utilizando v�rias tabelas com a cl�usula ON --
-------------------------------------------------------

SELECT
    e.employee_id,
    j.job_title,
    d.department_name,
    l.city,
    l.state_province,
    l.country_id
FROM
    employees e
    JOIN jobs        j ON ( e.job_id = j.job_id )
    JOIN departments d ON ( e.department_id = d.department_id )
    JOIN locations   l ON ( d.location_id = l.location_id )
ORDER BY
    e.employee_id;
    
-------------------------------------------------------------------------
-- Incluindo condi��es adicionais a condi��o de JOIN na cl�usula WHERE --
-------------------------------------------------------------------------

SELECT
    e.employee_id,
    e.last_name,
    e.salary,
    e.department_id,
    d.department_name
FROM
    employees e
    JOIN departments d ON ( e.department_id = d.department_id )
WHERE
    ( e.salary BETWEEN 10000 AND 15000 );
    
----------------------------------------------------------------------
-- Incluindo condi��es adicionais a condi��o de JOIN utilizando AND --
----------------------------------------------------------------------

SELECT
    e.employee_id,
    e.last_name,
    e.salary,
    e.department_id,
    d.department_name
FROM
    employees e
    JOIN departments d ON ( e.department_id = d.department_id )
                          AND ( e.salary BETWEEN 10000 AND 15000 );
                          
----------------------------------------
-- Self JOIN utilizando a cl�usula ON --
----------------------------------------

SELECT
    empregado.employee_id "Id empregado",
    empregado.last_name   "Sobrenome empregado",
    gerente.employee_id   "Id gerente",
    gerente.last_name     "Sobrenome gerente"
FROM
    employees empregado
    JOIN employees gerente ON ( empregado.manager_id = gerente.employee_id )
ORDER BY
    empregado.employee_id;
    
-----------------------
-- Se��o 11 - Aula 2 -- 
-----------------------
DROP TABLE job_grades;

CREATE TABLE job_grades (
    grade_level VARCHAR(2) NOT NULL,
    lowest_ssl  NUMBER(11, 2),
    highest_ssl NUMBER(11, 2),
    CONSTRAINT job_grades_pk PRIMARY KEY ( grade_level )
);

-------------------------------------------
-- Inserindo linhas na tabela JOB_GRADES --
-------------------------------------------

INSERT INTO job_grades VALUES (
    'A',
    1000,
    2999
);

INSERT INTO job_grades VALUES (
    'B',
    3000,
    5999
);

INSERT INTO job_grades VALUES (
    'C',
    6000,
    9999
);

INSERT INTO job_grades VALUES (
    'D',
    10000,
    14999
);

INSERT INTO job_grades VALUES (
    'E',
    15000,
    24999
);

INSERT INTO job_grades VALUES (
    'F',
    25000,
    40000
);

---------------------------
-- Efetuando a transa��o --
---------------------------

COMMIT;

SELECT
    *
FROM
    job_grades;
    
------------------
-- Nonequijoins --
------------------

SELECT
    e.employee_id,
    e.salary,
    j.grade_level,
    j.lowest_ssl,
    j.highest_ssl
FROM
    employees e
    JOIN job_grades j ON nvl(
        e.salary, 0
    ) BETWEEN j.lowest_ssl AND highest_ssl
ORDER BY
    e.salary;

SELECT
    e.employee_id,
    e.salary,
    j.grade_level,
    j.lowest_ssl,
    j.highest_ssl
FROM
    employees e
    JOIN job_grades j ON nvl(
        e.salary, 0
    ) >= j.lowest_ssl
                         AND nvl(
        e.salary, 0
    ) <= j.highest_ssl
ORDER BY
    e.salary;