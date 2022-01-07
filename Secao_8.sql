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
    
SELECT ABS(-9), SQRT(9)
FROM dual;

-----------------------
-- Fun��es tipo DATE --
-----------------------

SELECT sysdate
FROM dual;

DESC dual;

SELECT *
FROM dual;

SELECT 30000 * 1.25
FROM dual;

------------------------
-- C�lculos com datas --
------------------------

SELECT sysdate, sysdate + 30, sysdate + 60, sysdate - 30
FROM dual;

SELECT 
    last_name, hire_date, ROUND((SYSDATE - hire_date)/7, 2) "SEMANAS DE TRABALHO"
FROM
    employees;

------------------------------
-- Outras fun��es tipo date --
------------------------------

SELECT 
    first_name, 
    last_name, 
    ROUND(MONTHS_BETWEEN(SYSDATE, hire_date), 2) "MESES DE TRABALHO"
FROM 
    employees;
    
SELECT 
    SYSDATE, 
    ADD_MONTHS(SYSDATE, 3), 
    NEXT_DAY(SYSDATE, 'SEXTA FEIRA'), 
    LAST_DAY(SYSDATE)
FROM 
    dual; 
    

    
    
    


