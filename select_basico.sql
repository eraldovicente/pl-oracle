-- Seção 6 - aula 1
---------------------
-- Listando todas as colunas

SELECT * 
FROM employees;

SELECT *
FROM jobs;

SELECT *
FROM departments;
--------------------------------
-- Listando colunas específicas
--------------------------------

SELECT department_id, location_id
FROM departments;

SELECT employee_id, first_name, last_name, salary
FROM employees;

SELECT department_id, department_name, manager_id
FROM departments;

SELECT
    job_id,
    job_title,
    min_salary
FROM
    jobs;

