----------------------
-- Seção 9 - Aula 1 --
----------------------

-------------------------------------------
-- Utilizando a função TO_CHAR com datas --
-------------------------------------------

SELECT last_name, TO_CHAR(hire_date, 'DD/MM/YYYY HH24:MI:SS') DT_ADMISSÃO
FROM employees;

SELECT sysdate, TO_CHAR(sysdate, 'DD/MM/YYYY HH24:MI:SS') DATA
FROM dual;

SELECT last_name, TO_CHAR(hire_date, 'DD, "de" Month "de" YYYY') DT_ADMISSÃO
FROM employees;

SELECT last_name, TO_CHAR(hire_date, 'FMDD, "de" Month "de" YYYY') DT_ADMISSÃO
FROM employees;

---------------------------------------------
-- Utilizando a função TO_CHAR com números --
---------------------------------------------

SELECT first_name, last_name, TO_CHAR(salary, 'L99G999G999D99') SALARY
FROM employees;

SELECT 
    first_name, 
    last_name, 
    TO_CHAR(salary, 'FML99G999G999', 'NLS_CURRENCY=''R$ ''') SALARY
FROM 
    employees;

SELECT 
    first_name, 
    last_name, 
    TO_CHAR(0,'FML') || ' ' || 
    TO_CHAR(salary, 'FML99G999G999') SALARY
FROM 
    employees;
    
ALTER SESSION SET nls_currency = 'R$';

SELECT 
    first_name, 
    last_name, 
    TO_CHAR(0,'FML') || ' ' || 
    TO_CHAR(salary, 'FML99G999G999') SALARY
FROM 
    employees;
    
-----------------------
-- Estoura o tamanho --
-----------------------
-- SELECT first_name, last_name, TO_CHAR(salary, 'L999D99') SALARY
-- FROM employees;

-----------------------------------
-- Utilizando a função TO_NUMBER --
-----------------------------------

SELECT TO_NUMBER('1200,50')
FROM dual;

---------------------------------
-- Utilizando a função TO_DATE --
---------------------------------

SELECT TO_DATE('06/02/2020','DD/MM/YYYY') DATA
FROM dual;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('17/06/2003', 'DD/MM/RRRR');

----------------------------------
-- Utilizando funções aninhadas --
----------------------------------

SELECT 
    first_name, 
    last_name, 
    ROUND(MONTHS_BETWEEN(SYSDATE, hire_date), 0) NUMERO_MESES
FROM 
    employees
WHERE
    hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');
    
-----------------------------
-- Utilizando a função NVL --
-----------------------------

SELECT 
    last_name, 
    salary, 
    NVL(commission_pct, 0), 
    (salary * 12) SALARIO_ANUAL,
    (salary * 12) + (salary * 12 * NVL(commission_pct, 0)) REMUNERAÇÃO_ANUAL
FROM
    employees;
    
----------------------------------
-- Utilizando a função COALESCE --
----------------------------------

SELECT 
    COALESCE(NULL, NULL, 'Expressão 3'), 
    COALESCE(NULL, 'Expressão 2', 'Expressão 3'),
    COALESCE('Expressão 1', 'Expressão 2', 'Expressão 3')
FROM 
    dual;

SELECT last_name, employee_id, commission_pct, manager_id,
    COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id),
    'Sem percentual de comissão e sem gerente')
FROM 
    employees;
    
------------------------------
-- Utilizando a função NVL2 --
------------------------------

SELECT last_name, salary, commission_pct,
       NVL2(commission_pct, 10, 0) PERCENTUAL_ALTERADO
FROM employees;

--------------------------------
-- Utilizando a função NULLIF --
--------------------------------

SELECT NULLIF(1000, 1000), NULLIF(1000, 2000)
FROM dual;

SELECT first_name, last_name, LENGTH(first_name) "Expressão 1",
       LENGTH(last_name) "Expressão 2", NULLIF(LENGTH(first_name),
       LENGTH(last_name)) RESULTADO
FROM employees;

-----------------------------
-- Expressões condicionais --
-----------------------------

--------------------
-- Expressão CASE --
--------------------

SELECT 
    last_name, job_id, salary,
                       CASE job_id
                            WHEN 'IT_PROG' 
                                THEN (1.10 * salary)
                            WHEN 'ST_CLERK'
                                THEN (1.15 * salary)
                            WHEN 'SA_REP'
                                THEN (1.20 * salary)
                            ELSE salary
                            END "NOVO SALÁRIO"
FROM employees;

--------------------------------
-- Utilizando a função DECODE --
--------------------------------

SELECT last_name, job_id, salary,
DECODE(job_id, 'IT_PROG' , (1.10 * salary),
               'ST_CLERK', (1.15 * salary),
               'SA_REP'  , (1.20 * salary)
                         , salary) "NOVO SALÁRIO"
FROM employees;    
   
   
   
   
   
   
   
   
   
   
   
    












    
