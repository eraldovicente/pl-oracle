-----------------------
-- Seção 20 - aula 1 --
-----------------------

--------------------------------
-- Criando sinônimos privados --
--------------------------------

CREATE SYNONYM departamentos
FOR departments;
 
CREATE SYNONYM dept
FOR departments;

--------------------------
-- Utilizando sinônimos --
--------------------------

SELECT *
FROM departamentos;

SELECT *
FROM dept;









































