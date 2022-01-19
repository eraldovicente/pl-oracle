-----------------------
-- Seção 16 - aula 1 --
-----------------------

-----------------
-- Constraints --
-----------------

------------------------------------
-- Definindo constraints NOT NULL --
------------------------------------

DROP TABLE projects;

CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(4) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL,
    description   VARCHAR2(400) NOT NULL
);

---------------------------------------------------------
-- Definindo constraints PRIMARY KEY a nível de coluna --
---------------------------------------------------------

DROP TABLE projects;

CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL
        CONSTRAINT projects_project_id_pk PRIMARY KEY,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(4) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL,
    description   VARCHAR2(400) NOT NULL
);

---------------------------------------------------------
-- Definindo constraints PRIMARY KEY a nível de tabela --
---------------------------------------------------------

DROP TABLE projects;

CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(4) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL,
    description   VARCHAR2(400) NOT NULL,
    CONSTRAINT projects_project_id_pk PRIMARY KEY ( project_id )
);

----------------------------------------------------
-- Definindo constraints UNIQUE a nível de coluna --
----------------------------------------------------

DROP TABLE projects;

CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL
        CONSTRAINT projects_project_id_pk PRIMARY KEY,
    project_code  VARCHAR2(10) NOT NULL
        CONSTRAINT projects_project_code_uk UNIQUE,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(4) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL,
    description   VARCHAR2(400) NOT NULL
);

---------------------------------------------------------
-- Definindo constraints UNIQUE a nível de tabela --
---------------------------------------------------------

DROP TABLE projects;

CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(4) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL,
    description   VARCHAR2(400) NOT NULL,
    CONSTRAINT projects_project_id_pk PRIMARY KEY ( project_id ),
    CONSTRAINT projects_project_code_uk UNIQUE ( project_code )
);

-----------------------------------------------------
-- Definindo constraints FOREIG a nível de coluna --
-----------------------------------------------------

DROP TABLE projects;

CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL
        CONSTRAINT projects_project_id_pk PRIMARY KEY,
    project_code  VARCHAR2(10) NOT NULL
        CONSTRAINT projects_project_code_uk UNIQUE,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(4) NOT NULL
        CONSTRAINT projects_department_id_fk
            REFERENCES departments,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL,
    description   VARCHAR2(400) NOT NULL
);

-----------------------------------------------------
-- Definindo constraints FOREIGN a nível de tabela --
-----------------------------------------------------

DROP TABLE projects;

CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(4) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL,
    description   VARCHAR2(400) NOT NULL,
    CONSTRAINT projects_project_id_pk PRIMARY KEY ( project_id ),
    CONSTRAINT projects_project_code_uk UNIQUE ( project_code ),
    CONSTRAINT projects_department_id_fk FOREIGN KEY ( department_id )
        REFERENCES departments ( department_id )
);

----------------------------------------------------------
-- FOREIGN KEY - Regras de deleção -- Default no action --
----------------------------------------------------------

DROP TABLE teams;

CREATE TABLE teams (
    project_id  NUMBER(6) NOT NULL,
    employee_id NUMBER(6) NOT NULL,
    CONSTRAINT teams_project_id_fk FOREIGN KEY ( project_id )
        REFERENCES projects ( project_id ),
    CONSTRAINT teams_employee_id_pk FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id )
);

----------------------------------------------------------
-- FOREIGN KEY - Regras de deleção -- ON DELETE CASCADE --
----------------------------------------------------------

DROP TABLE teams;

CREATE TABLE teams (
    project_id  NUMBER(6) NOT NULL,
    employee_id NUMBER(6) NOT NULL,
    CONSTRAINT teams_project_id_fk FOREIGN KEY ( project_id )
        REFERENCES projects ( project_id )
            ON DELETE CASCADE,
    CONSTRAINT teams_employee_id_pk FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id )
);

-----------------------------------------------------------
-- FOREIGN KEY - Regras de deleção -- ON DELETE SET NULL --
-----------------------------------------------------------

DROP TABLE teams;

CREATE TABLE teams (
    project_id  NUMBER(6),
    employee_id NUMBER(6) NOT NULL,
    CONSTRAINT teams_project_id_fk FOREIGN KEY ( project_id )
        REFERENCES projects ( project_id )
            ON DELETE SET NULL,
    CONSTRAINT teams_employee_id_pk FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id )
);

--------------------------------------------------
-- Definindo constraint CHECK a nível de coluna --
--------------------------------------------------

------------------------------------------------------------------------
-- (Oracle functions e pseudo colunas não podem ser referenciadas na constraint CHECK) --
------------------------------------------------------------------------

SELECT
    uid,
    userenv(
        'language'
    ),
    user,
    sysdate
FROM
    dual;

SELECT
    employee_id,
    first_name,
    ROWNUM
FROM
    employees;

----------------------------------------
-- Constraint CHECK a nível de coluna --
----------------------------------------

DROP TABLE projects CASCADE CONSTRAINTS;

CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL
        CONSTRAINT projects_project_id_pk PRIMARY KEY,
    project_code  VARCHAR2(10) NOT NULL
        CONSTRAINT projects_project_code_uk UNIQUE,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(4) NOT NULL
        CONSTRAINT projects_department_id_fk
            REFERENCES departments,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL
        CONSTRAINT projects_budget_ck CHECK ( budget > 0 ),
    description   VARCHAR2(400) NOT NULL
);

---------------------------------------------------
-- Definindo constraints CHECK a nível de tabela --
---------------------------------------------------

DROP TABLE projects CASCADE CONSTRAINTS;

CREATE TABLE projects (
    project_id    NUMBER(6) NOT NULL,
    project_code  VARCHAR2(10) NOT NULL,
    project_name  VARCHAR2(100) NOT NULL,
    department_id NUMBER(4) NOT NULL,
    creation_date DATE DEFAULT sysdate NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        VARCHAR2(20) NOT NULL,
    priority      VARCHAR2(10) NOT NULL,
    budget        NUMBER(11, 2) NOT NULL,
    description   VARCHAR2(400) NOT NULL,
    CONSTRAINT projects_project_id_pk PRIMARY KEY ( project_id ),
    CONSTRAINT projects_project_code_uk UNIQUE ( project_code ),
    CONSTRAINT projects_department_id_fk FOREIGN KEY ( department_id )
        REFERENCES departments ( department_id ),
    CONSTRAINT projects_budget_ck CHECK ( budget > 0 )
);

----------------------------------------
-- Violar constraints resulta em erro --
----------------------------------------

INSERT INTO projects (
    project_id,
    project_code,
    project_name,
    department_id,
    creation_date,
    start_date,
    end_date,
    status,
    priority,
    budget,
    description
) VALUES (
    1,
    'ERPIMP',
    'ERP Implementation',
    77,
    sysdate,
    NULL,
    NULL,
    'Aproved',
    'HIGH',
    1000000.00,
    'Oracle ERP Implementation'
);


---------------------------------------------------
-- Violar constraints resulta em erro - CORREÇÃO --
---------------------------------------------------

INSERT INTO projects (
    project_id,
    project_code,
    project_name,
    department_id,
    creation_date,
    start_date,
    end_date,
    status,
    priority,
    budget,
    description
) VALUES (
    1,
    'ERPIMP',
    'ERP Implementation',
    60,
    sysdate,
    NULL,
    NULL,
    'Aproved',
    'HIGH',
    1000000.00,
    'Oracle ERP Implementation'
);

----------------------------
-- Efetivando a transação --
----------------------------

COMMIT;

------------------------------------------------------
-- Consultando constraints pelo dicionário de dados --
------------------------------------------------------

DESC user_constraints;

DESC user_cons_columns;

SELECT
    co.constraint_name,
    co.constraint_type,
    co.search_condition,
    co.r_constraint_name,
    co.delete_rule,
    cc.column_name,
    cc.position,
    co.status
FROM
    user_constraints co
    JOIN user_cons_columns cc ON ( co.constraint_name = cc.constraint_name )
                                 AND ( co.table_name = cc.table_name )
WHERE
    co.table_name = 'PROJECTS'
ORDER BY
    co.constraint_name,
    cc.position;
    
------------
-- Aula 2 --
------------

-------------------------------------------
-- Removendo uma constraint e uma tabela --
-------------------------------------------

ALTER TABLE projects
DROP CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
DROP CONSTRAINT projects_project_id_pk CASCADE;

---------------------------------------------
-- Adicionando uma constraint a uma tabela --
---------------------------------------------

ALTER TABLE projects
ADD CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)
REFERENCES departments(department_id);

ALTER TABLE projects
ADD CONSTRAINT projects_project_id_pk PRIMARY KEY (project_id);

----------------------------------
-- Desabilitando uma constraint --
----------------------------------

ALTER TABLE projects
DISABLE CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
DISABLE CONSTRAINT projects_project_id_pk CASCADE;


































































