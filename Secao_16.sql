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
-- Definindo constraints FOREIGN a nível de coluna --
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
        REFERENCES projects ( project_id ) ON DELETE CASCADE,
    CONSTRAINT teams_employee_id_pk FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id )
);







