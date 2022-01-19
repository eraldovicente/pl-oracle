-----------------------
-- Se��o 19 - aula 1 --
-----------------------

-----------------------------------------------------
-- Analize o custo do comando no plano de execu��o --
-----------------------------------------------------

DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;
DROP INDEX employees_name_idx;

SELECT *
FROM employees
WHERE last_name = 'Himuro';

-------------------------------
-- Criando um �ndice simples --
-------------------------------

CREATE INDEX employees_last_name_idx
ON employees(last_name);

--------------------------------
-- Criando um �ndice composto --
--------------------------------

CREATE INDEX employees_last_name_first_name_idx
ON employees(last_name, first_name);

------------------------------------------------------
-- An�lise do custo do comando no plano de execu��o --
------------------------------------------------------

SELECT *
FROM employees
WHERE last_name = 'Himuro' AND
      first_name = 'Guy';
      
---------------------------------------------
-- Reconstruindo e reorganizando um �ndice --
---------------------------------------------

ALTER INDEX employees_last_name_first_name_idx REBUILD; 






























