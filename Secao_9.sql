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













    
