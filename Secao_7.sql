----------------------
-- Se��o 7 - Aula 1 --
------------------------------------
-- Restringindo e ordenando dados --
------------------------------------

---------------------------------
-- Utilizando a cl�usula WHERE --
---------------------------------

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

-------------------------------------------------------
-- Utilizando Strings de caractere na cl�usula WHERE --
-------------------------------------------------------

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';

-----------------------------------------------------------
-- Utilizando operadores de compara��o na cl�usula WHERE --
-----------------------------------------------------------

SELECT last_name, salary
FROM employees
WHERE salary >= 10000;

------------------------------------------------------------------
-- Selecionando faixas de valores utilizando o operador BETWEEN --
------------------------------------------------------------------

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 15000;

-----------------------------------------------------------------------
-- Selecionando valores dentro de uma lista utilizando o operador IN --
-----------------------------------------------------------------------

SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

--------------------------------
-- Utilizando o operador LIKE --
--------------------------------

SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa%';

-------------------------------
-- Use o operador LIKE para executar pesquisas de valores que coincidem com
-- padr�es utilizando caracteres curingas (wildcards)
----------------------------------------------------------------------
-- As condi��es de pesquisa podem conter caracters ou n�meros:
-- (%) Combina com zero ou mais caracteres
-- (_) Combina com um e somente um caracter
----------------------------------------------------------------------

---------------------------------------------------
-- Combinando o uso de v�rios caracteres curinga --
---------------------------------------------------

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '_a%';

--------------------------------
-- Compara��es com valor NULL --
--------------------------------

SELECT last_name, manager_id
FROM employees
WHERE manager_id = NULL;

--------------------------------------------------
-- Utilizando a express�o de compara��o IS NULL --
--------------------------------------------------

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-----------------------------------------
-- Definindo condi��es utilizando operadores l�gicos
-----------------------------------------

-----------------------------------------
-- AND - retorna TRUE se ambas as condi��es s�o verdadeiras
-- OR - retorna TRUE se pelo menos uma das condi��es for verdadeira
-- NOT - retorna a nega��o da condi��o. Retorna TRUE se a condi��o 
-- � falsa. Retorna FALSE se a condi��o � verdadeira. Retorna NULL
-- se a condi��o � NULL.
------------------------------------------

-------------------------------
-- Utilizando o operador AND --
-------------------------------

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000
AND job_id = 'IT_PROG';

------------------------------
-- Utilizando o operador OR --
------------------------------

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000
OR job_id = 'IT_PROG';

-------------------------------
-- Utilizando o operador NOT --
-------------------------------

SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

---------------------------
-- Regras de preced�ncia --
---------------------------

SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REF' OR job_id = 'IT_PROG' AND salary > 10000;

------------------------------------------------------------------
-- Utilizando par�nteses para sobrepor as regras de preced�ncia --
------------------------------------------------------------------

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR
            job_id = 'IT_PROG')
AND salary > 10000;

