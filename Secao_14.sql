-----------------------
-- Seção 14 - aula 1 --
-----------------------

--------------------------------------
-- Comandos DML - Manipulando dados --
--------------------------------------

---------------------------------
-- Utilizando o comando INSERT --
---------------------------------

INSERT INTO departments(department_id,
department_name, manager_id, location_id)
VALUES (280, 'Project Management', 103, 1400);

-----------------------------------------------------------
-- Inserindo linhas com valores nulos - método explícito --
-----------------------------------------------------------

desc departments

INSERT INTO departments
VALUES (301, 'Inovation', NULL, NULL);

-----------------------------------------------------------
-- Inserindo linhas com valores nulos - método implícito --
-----------------------------------------------------------

INSERT INTO departments(department_id,
department_name)
VALUES (302, 'IOT');

--------------------------
-- Efetivando transação --
--------------------------

COMMIT;

-------------------------------------------------------
-- Inserindo valores especiais retornados de funções --
-------------------------------------------------------

INSERT INTO employees 
            (employee_id, first_name, last_name, email,
             phone_number, hire_date, job_id, salary,
             commission_pct, manager_id, department_id)
       VALUES (207, 'Rock', 'Balboa', 'DROCK',
              '525.342.237', SYSDATE, 'IT_PROG',7000,
              NULL, 103, 60);

-----------------------------------------------
-- Insert utilizando data e hora especificas --
-----------------------------------------------

INSERT INTO employees
            (employee_id, first_name, last_name, email,
             phone_number, hire_date, job_id, salary,
             commission_pct, manager_id, department_id)
       VALUES (208, 'Vito', 'Corleone', 'VCORL',
               '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 20000,
               NULL, 103, 60);

SELECT *
FROM employees
ORDER BY employee_id DESC;

COMMIT;

------------------------------------------
-- Utilizando variáveis de substituição --
------------------------------------------

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name', &location);

SELECT *
FROM departments
ORDER BY department_id DESC;

COMMIT;

---------------------------------------------------
-- Inserindo linhas a partir de uma sub-consulta --
---------------------------------------------------

DROP TABLE sales_reps;

CREATE TABLE sales_reps
(id NUMBER(6,0),
 name VARCHAR(20),
 salary NUMBER(8,2),
 commission_pct NUMBER(2,2));

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id = 'SA_REP';

COMMIT;

SELECT *
FROM sales_reps;

---------------------------------
-- Utilizando o comando UPDATE --
---------------------------------

UPDATE employees
SET salary = salary * 1.2;

ROLLBACK;

UPDATE employees
SET salary = salary * 1.2
WHERE last_name = 'King';

COMMIT;

SELECT *
FROM employees
WHERE last_name = 'King';

---------------------------------------------------
-- Utilizando o comando UPDATE com sub-consultas --
---------------------------------------------------

UPDATE employees
SET job_id = (SELECT job_id
                        FROM employees
                        WHERE employee_id = 141),
    salary = (SELECT salary
                        FROM employees
                        WHERE employee_id = 141)
WHERE employee_id = 139;

COMMIT;

