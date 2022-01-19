-----------------------
-- Se��o 20 - aula 1 --
-----------------------

--------------------------------
-- Criando sin�nimos privados --
--------------------------------

CREATE SYNONYM departamentos
FOR departments;
 
CREATE SYNONYM dept
FOR departments;

--------------------------
-- Utilizando sin�nimos --
--------------------------

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-------------------------
-- Romovendo sin�nimos --
-------------------------

DROP SYNONYM departamentos;

DROP SYNONYM dept;

-----------------------------------------
-- O DBA pode criar sin�nimos publicos --
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
-- Acessando como usu�rio HR --
-------------------------------

SELECT *
FROM departamentos;

SELECT *
FROM dept;












































