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

-------------------------
-- Romovendo sinônimos --
-------------------------

DROP SYNONYM departamentos;

DROP SYNONYM dept;

-----------------------------------------
-- O DBA pode criar sinônimos publicos --
-----------------------------------------

----------------------------
-- Conectando-se como SYS --
----------------------------

CREATE PUBLIC SYNONYM departamentos
FOR hr.departments;

CREATE PUBLIC SYNONYM dept
FOR hr.departments;

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-------------------------------
-- Acessando como usuário HR --
-------------------------------

SELECT *
FROM departamentos;

SELECT *
FROM dept;












































