----------------------
-- Se��o 8 - Aula 1 --
----------------------

-----------------------------------
-- Utilizando fun��es single row --
-----------------------------------

------------------------------------------------
-- Fun��es de convers�o mai�sculo e minusculo --
------------------------------------------------

SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = 'KING';

SELECT employee_id, UPPER(last_name), department_id
FROM employees
WHERE UPPER(last_name) = 'KING';




