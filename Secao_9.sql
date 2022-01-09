----------------------
-- Se��o 9 - Aula 1 --
----------------------

-------------------------------------------
-- Utilizando a fun��o TO_CHAR com datas --
-------------------------------------------

SELECT last_name, TO_CHAR(hire_date, 'DD/MM/YYYY HH24:MI:SS') DT_ADMISS�O
FROM employees;

SELECT sysdate, TO_CHAR(sysdate, 'DD/MM/YYYY HH24:MI:SS') DATA
FROM dual;

SELECT last_name, TO_CHAR(hire_date, 'DD, "de" Month "de" YYYY') DT_ADMISS�O
FROM employees;

SELECT last_name, TO_CHAR(hire_date, 'FMDD, "de" Month "de" YYYY') DT_ADMISS�O
FROM employees;

---------------------------------------------
-- Utilizando a fun��o TO_CHAR com n�meros --
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
-- Utilizando a fun��o TO_NUMBER --
-----------------------------------

SELECT TO_NUMBER('1200,50')
FROM dual;

---------------------------------
-- Utilizando a fun��o TO_DATE --
---------------------------------

SELECT TO_DATE('06/02/2020','DD/MM/YYYY') DATA
FROM dual;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('17/06/2003', 'DD/MM/RRRR');

----------------------------------
-- Utilizando fun��es aninhadas --
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
-- Utilizando a fun��o NVL --
-----------------------------

SELECT 
    last_name, 
    salary, 
    NVL(commission_pct, 0), 
    (salary * 12) SALARIO_ANUAL,
    (salary * 12) + (salary * 12 * NVL(commission_pct, 0)) REMUNERA��O_ANUAL
FROM
    employees;
    
----------------------------------
-- Utilizando a fun��o COALESCE --
----------------------------------

SELECT 
    COALESCE(NULL, NULL, 'Express�o 3'), 
    COALESCE(NULL, 'Express�o 2', 'Express�o 3'),
    COALESCE('Express�o 1', 'Express�o 2', 'Express�o 3')
FROM 
    dual;

SELECT last_name, employee_id, commission_pct, manager_id,
    COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id),
    'Sem percentual de comiss�o e sem gerente')
FROM 
    employees;
    
------------------------------
-- Utilizando a fun��o NVL2 --
------------------------------

SELECT last_name, salary, commission_pct,
       NVL2(commission_pct, 10, 0) PERCENTUAL_ALTERADO
FROM employees;
   
   
   
   
   
   
   
   
   
   
   
   
   
    












    
