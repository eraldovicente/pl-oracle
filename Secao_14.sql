-----------------------
-- Se��o 14 - aula 1 --
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
-- Inserindo linhas com valores nulos - m�todo expl�cito --
-----------------------------------------------------------

desc departments

INSERT INTO departments
VALUES (301, 'Inovation', NULL, NULL);

-----------------------------------------------------------
-- Inserindo linhas com valores nulos - m�todo impl�cito --
-----------------------------------------------------------

INSERT INTO departments(department_id,
department_name)
VALUES (302, 'IOT');

--------------------------
-- Efetivando transa��o --
--------------------------

COMMIT;

-------------------------------------------------------
-- Inserindo valores especiais retornados de fun��es --
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
-- Utilizando vari�veis de substitui��o --
------------------------------------------

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name', &location);

SELECT *
FROM departments
ORDER BY department_id DESC;

COMMIT;



