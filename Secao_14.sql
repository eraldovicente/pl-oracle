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
VALUES (290, 'Data Science', NULL, NULL);

-----------------------------------------------------------
-- Inserindo linhas com valores nulos - método implícito --
-----------------------------------------------------------

INSERT INTO departments(department_id,
department_name)
VALUES (300, 'Business Inteligence');

--------------------------
-- Efetivando transação --
--------------------------

COMMIT;







