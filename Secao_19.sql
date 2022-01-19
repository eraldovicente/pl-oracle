-----------------------
-- Seção 19 - aula 1 --
-----------------------

-----------------------------------------------------
-- Analize o custo do comando no plano de execução --
-----------------------------------------------------

DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;
DROP INDEX employees_name_idx;

SELECT *
FROM employees
WHERE last_name = 'Himuro';

-------------------------------
-- Criando um índice simples --
-------------------------------

CREATE INDEX employees_last_name_idx
ON employees(last_name);

--------------------------------
-- Criando um índice composto --
--------------------------------

CREATE INDEX employees_last_name_first_name_idx
ON employees(last_name, first_name);

































