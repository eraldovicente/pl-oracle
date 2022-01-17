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






