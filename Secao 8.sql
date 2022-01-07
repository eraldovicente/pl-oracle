----------------------
-- Seção 8 - Aula 1 --
----------------------

-----------------------------------
-- Utilizando funções single row --
-----------------------------------

------------------------------------------------
-- Funções de conversão maiúsculo e minusculo --
------------------------------------------------

SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = 'KING';

SELECT employee_id, UPPER(last_name), department_id
FROM employees
WHERE UPPER(last_name) = 'KING';




