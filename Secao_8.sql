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

------------------------------------------
-- Funções de manipulação de caracteres --
------------------------------------------

SELECT CONCAT(' Curso: ', 'Introdução ORACLE 21c'), 
       SUBSTR('Introdução ORACLE 21c', 1, 11),
       LENGTH('Introdução ORACLE 21c'), INSTR('Introdução ORACLE 21c', 'ORACLE')
FROM dual;

-------------------------------------------------
-- Outras funções de manipulação de caracteres --
-------------------------------------------------

SELECT 
    first_name "Nome", 
    LPAD(first_name, 20, ' ') "Nome alinhado a direita", 
    RPAD(first_name, 20, ' ') "Nome alinhado a esquerda"
FROM
    employees;
    
--------------------
-- Função replace --
--------------------

SELECT 
    job_title, REPLACE(job_title, 'President', 'Presidente') CARGO
FROM
    jobs
WHERE
    job_title = 'President';

-------------------------
-- Funções tipo NUMBER --
-------------------------

SELECT 
    ROUND(45.923, 2), ROUND(45.923, 0)
FROM
    dual;
    
SELECT 
    TRUNC(45.923, 2), TRUNC(45.923, 0)
FROM
    dual;
    
SELECT 
    MOD(1300, 600) RESTO
FROM
    dual;

    
    
    
    


