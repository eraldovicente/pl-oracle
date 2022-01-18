-----------------------
-- Seção 15 - aula 1 --
-----------------------

--------------------------------------------------
-- Comandos DDL - Criando e gerenciando tabelas --
--------------------------------------------------

SELECT
    *
FROM
    user_objects
ORDER BY
    object_type;

---------------------
-- Criando tabelas --
---------------------

DROP TABLE projects;

CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(1, 2) NOT NULL,
    description   VARCHAR(400) NOT NULL
);

DESC projects;

SELECT
    *
FROM
    projects;

DROP TABLE teams;

CREATE TABLE teams (
    project_id  NUMBER(6) NOT NULL,
    employee_id NUMBER(6) NOT NULL
);

--------------------------------------
-- Consultando aestrutura da tabela --
--------------------------------------

DESC projects;

DESC teams;

----------------------------------
-- Tipo ROWID - endereço lógico --
----------------------------------

-------------------------------------------------------------------
-- O Acesso por rowid é o método de acesso mais rápido no Oracle --
-------------------------------------------------------------------

DESC employees;

SELECT employee_id, first_name, rowid, LENGTH(rowid)
from employees
WHERE rowid = 'AAASe6AAMAAAADMAAA';

----------------------------------------------------------------
-- Consultando as tabelas existentes pelo dicionário de dados --
----------------------------------------------------------------

DESC user_tables;

SELECT table_name
FROM user_tables;

-----------------------------------------------------
-- Consultando os objetos do tipo TABLE do usuário --
-----------------------------------------------------

DESC user_objects;

SELECT object_name, object_type
FROM user_objects
WHERE object_type = 'TABLE';




