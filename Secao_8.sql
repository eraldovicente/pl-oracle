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

------------------------------------------
-- Fun��es de manipula��o de caracteres --
------------------------------------------

SELECT CONCAT(' Curso: ', 'Introdu��o ORACLE 21c'), 
       SUBSTR('Introdu��o ORACLE 21c', 1, 11),
       LENGTH('Introdu��o ORACLE 21c'), INSTR('Introdu��o ORACLE 21c', 'ORACLE')
FROM dual;

-------------------------------------------------
-- Outras fun��es de manipula��o de caracteres --
-------------------------------------------------

SELECT 
    first_name "Nome", 
    LPAD(first_name, 20, ' ') "Nome alinhado a direita", 
    RPAD(first_name, 20, ' ') "Nome alinhado a esquerda"
FROM
    employees;
    
--------------------
-- Fun��o replace --
--------------------

SELECT 
    job_title, REPLACE(job_title, 'President', 'Presidente') CARGO
FROM
    jobs
WHERE
    job_title = 'President';

-------------------------
-- Fun��es tipo NUMBER --
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

    
    
    
    


