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









































