-----------------------
-- Seção 27 - aula 1 --
-----------------------

-------------------------------------------
-- Utilizando o comando SELECT no PL/SQL --
-------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vFirst_name employees.first_name%type;
    vLast_name employees.last_name%type;
    vSalary employees.salary%type;
    vEmployee_id employees.employee_id%type := 121;
BEGIN
    SELECT first_name, last_name, salary
    INTO vFirst_name, vLast_name, vSalary
    FROM employees
    WHERE employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE('Employee id: ' || vEmployee_id);
    DBMS_OUTPUT.PUT_LINE('First name: ' || vFirst_name);
    DBMS_OUTPUT.PUT_LINE('Last name: ' || vLast_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || vSalary);
END;

------------------------------------
-- Erro ORA-01403 - No Data Found --
------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vFirst_name employees.first_name%type;
    vLast_name employees.last_name%type;
    vSalary employees.salary%type;
    vEmployee_id employees.employee_id%type := 50;
BEGIN
    SELECT first_name, last_name, salary
    INTO vFirst_name, vLast_name, vSalary
    FROM employees
    WHERE employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE('Employee id: ' || vEmployee_id);
    DBMS_OUTPUT.PUT_LINE('First name: ' || vFirst_name);
    DBMS_OUTPUT.PUT_LINE('Last name: ' || vLast_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || vSalary);
END;

SET SERVEROUTPUT ON
DECLARE
    vJob_id employees.job_id%type := 'IT_PROG';
    vAvg_Salary employees.salary%type;
    vSum_Salary employees.salary%type;
BEGIN
    SELECT ROUND(AVG(salary),2), ROUND(SUM(salary),2)
    INTO vAvg_Salary, vSum_Salary
    FROM employees
    WHERE job_id = vjob_id;
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || vJob_id);
    DBMS_OUTPUT.PUT_LINE('Média de salários: ' || vAvg_Salary);
    DBMS_OUTPUT.PUT_LINE('Somatório de salários: ' || vSum_Salary);
END;

------------------------------------
-- Erro ORA-01422 - Too many rows --
------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vJob_id employees.job_id%type := 'IT_PROG';
    vAvg_Salary employees.salary%type;
    vSum_Salary employees.salary%type;
BEGIN
    SELECT job_id, ROUND(AVG(salary),2), ROUND(SUM(salary),2)
    INTO vJob_id, vAvg_Salary, vSum_Salary
    FROM employees
    GROUP BY job_id;
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || vJob_id);
    DBMS_OUTPUT.PUT_LINE('Média de salários: ' || vAvg_Salary);
    DBMS_OUTPUT.PUT_LINE('Somatório de salários: ' || vSum_Salary);
END;

-------------------------------------------
-- Utilizando o comando INSERT do PL/SQL --
-------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vfirst_name employees.first_name%type;
    vlast_name  employees.last_name%type;
    vsalary     employees.salary%type;
BEGIN
    INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date, job_id,
    salary, commission_pct, manager_id, department_id)
    VALUES
    (employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '999.999.99999', SYSDATE,
    'IT_PROG', 15000, 0.4, 103, 60);
    COMMIT;
END;

-------------------------------------------
-- Utilizando o comando UPDATE no PL/SQL --
-------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vEmployee_id employees.employee_id%type := 207;
    vPercentual NUMBER(3) := 10;
BEGIN
    UPDATE employees
    SET salary = salary * (1 + vPercentual / 100)
    WHERE employee_id = vEmployee_id;
    COMMIT;
END;

----------------------
-- DELETE no PL/SQL --
----------------------

SET SERVEROUTPUT ON
DECLARE
    vEmployee_id employees.employee_id%type := 207;
BEGIN
    DELETE FROM employees
    WHERE employee_id = vEmployee_id;
    COMMIT;    
END;

----------------------------------------------
-- Controlando transações do banco de dados --
----------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vEmployee_id employees.employee_id%type := 207;
BEGIN
    UPDATE employees
    SET salary = 15000
    WHERE employee_id = vEmployee_id;
    COMMIT;
END;

SET SERVEROUTPUT ON
DECLARE
    vEmployee_id employees.employee_id%type := 207;
BEGIN
    UPDATE employees
    SET salary = 20000
    WHERE employee_id = vEmployee_id;
    ROLLBACK;
END;

--SET SERVEROUTPUT ON
--DECLARE
--    vEmployee_id employees.employee_id%type := 207;
--BEGIN
--    UPDATE employees
--    SET salary = 20000
--    WHERE employee_id = vEmployee_id;
--    INSERT...
--    DELETE...
--    
--    COMMIT;
--END;

---------------
-- Savepoint --
---------------

BEGIN
    INSERT INTO employees
    (employee_id, first_name, last_name, email, phone_number, hire_date, job_id,
    salary, commission_pct, manager_id, department_id)
    VALUES
    (employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '999.999.99999', SYSDATE,
    'IT_PROG', 15000, 0.4, 103, 60);
    
    SAVEPOINT INSERTOK;
    
    UPDATE employees
    SET salary = 30000
    WHERE job_id = 'IT_PROG';
    
    ROLLBACK TO INSERTOK;
    COMMIT;
END;

----------------------
-- Cursor implícito --
----------------------

----------------------------------------------
-- Utilizando atributos de cursor implícito --
----------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vdepartment_id employees.department_id%type := 60;
    vpercentual NUMBER(3) := 10;
BEGIN
    UPDATE employees
    SET salary = salary * (1 + vpercentual / 100)
    WHERE department_id = vdepartment_id;
    DBMS_OUTPUT.PUT_LINE('Número de empregados atualizados: ' || SQL%ROWCOUNT);
    --COMMIT
END;

ROLLBACK;

-----------------------------------------
-- Operadores PL/SQL - Erro no cálculo --
-----------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vNota1 NUMBER(11,2) := 7.0;
    vNota2 NUMBER(11,2) := 6.0;
    vNota3 NUMBER(11,2) := 9.0;
    vNota4 NUMBER(11,2) := 6.0;
    vMedia NUMBER(11,2);
BEGIN
    vMedia := vNota1 + vNota2 + vNota3 + vNota4 / 4;
    DBMS_OUTPUT.PUT_LINE('Média = ' || vMedia);
END;

--------------------------------------------
-- Operadores PL/SQL - Corrigindo cálculo --
--------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vNota1 NUMBER(11,2) := 7.0;
    vNota2 NUMBER(11,2) := 6.0;
    vNota3 NUMBER(11,2) := 9.0;
    vNota4 NUMBER(11,2) := 6.0;
    vMedia NUMBER(11,2);
BEGIN
    vMedia := ( vNota1 + vNota2 + vNota3 + vNota4 ) / 4;
    DBMS_OUTPUT.PUT_LINE('Média = ' || vMedia);
END;







































