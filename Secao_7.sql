----------------------
-- Seção 7 - Aula 1 --
------------------------------------
-- Restringindo e ordenando dados --
------------------------------------

---------------------------------
-- Utilizando a cláusula WHERE --
---------------------------------

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

-------------------------------------------------------
-- Utilizando Strings de caractere na cláusula WHERE --
-------------------------------------------------------

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';

-----------------------------------------------------------
-- Utilizando operadores de comparação na cláusula WHERE --
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
-- padrões utilizando caracteres curingas (wildcards)
----------------------------------------------------------------------
-- As condições de pesquisa podem conter caracters ou números:
-- (%) Combina com zero ou mais caracteres
-- (_) Combina com um e somente um caracter
----------------------------------------------------------------------

---------------------------------------------------
-- Combinando o uso de vários caracteres curinga --
---------------------------------------------------

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '_a%';

--------------------------------
-- Comparações com valor NULL --
--------------------------------

SELECT last_name, manager_id
FROM employees
WHERE manager_id = NULL;

--------------------------------------------------
-- Utilizando a expressão de comparação IS NULL --
--------------------------------------------------

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-----------------------------------------
-- Definindo condições utilizando operadores lógicos
-----------------------------------------

-----------------------------------------
-- AND - retorna TRUE se ambas as condições são verdadeiras
-- OR - retorna TRUE se pelo menos uma das condições for verdadeira
-- NOT - retorna a negação da condição. Retorna TRUE se a condição 
-- é falsa. Retorna FALSE se a condição é verdadeira. Retorna NULL
-- se a condição é NULL.
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
-- Regras de precedência --
---------------------------

SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REF' OR job_id = 'IT_PROG' AND salary > 10000;

------------------------------------------------------------------
-- Utilizando parênteses para sobrepor as regras de precedência --
------------------------------------------------------------------

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR
            job_id = 'IT_PROG')
AND salary > 10000;

