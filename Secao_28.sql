---------------------------------------
-- Seção 28 - Estruturas de controle --
---------------------------------------

-----------------------------
-- Utilizando o comando IF --
-----------------------------

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o id do departamento';
DECLARE
    vpercentual NUMBER(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    IF vDepartment_id = 80
    THEN 
        vpercentual := 10; --Sales
    ELSE
        IF vDepartment_id = 20
        THEN
            vpercentual := 15; --Marketing
        ELSE
            IF vDepartment_id = 60
            THEN
                vpercentual := 20; --IT
            ELSE
                vpercentual := 5;
            END IF;
        END IF;      
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Id do departamento: ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual: ' || vpercentual);
    
    UPDATE employees
    SET salary = salary * (1 + vpercentual / 100)
    WHERE department_id = vDepartment_id;
    COMMIT;
END;

---------------------------------------
-- Utilizando o comando IF com ELSIF --
---------------------------------------

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o id do departamento';
DECLARE
    vpercentual NUMBER(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    IF vDepartment_id = 80
    THEN 
        vpercentual := 10; --Sales
    ELSIF vDepartment_id = 20
    THEN
        vpercentual := 15; --Marketing
    ELSIF vDepartment_id = 60
    THEN
        vpercentual := 20; --IT
    ELSE
        vpercentual := 5;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Id do departamento: ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual: ' || vpercentual);
    
    UPDATE employees
    SET salary = salary * (1 + vpercentual / 100)
    WHERE department_id = vDepartment_id;
    COMMIT;
END;

-------------------------------
-- Utilizando o comando CASE --
-------------------------------

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o id do departamento';
DECLARE
    vpercentual NUMBER(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    CASE vDepartment_id 
    WHEN 80
    THEN 
        vpercentual := 10; --Sales
    WHEN 20
    THEN
        vpercentual := 15; --Marketing  
    WHEN 60
    THEN
        vpercentual := 20; --IT
    ELSE
        vpercentual := 5;
    END CASE;
    
    DBMS_OUTPUT.PUT_LINE('Id do departamento: ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual: ' || vpercentual);
    
    UPDATE employees
    SET salary = salary * (1 + vpercentual / 100)
    WHERE department_id = vDepartment_id;
    COMMIT;
END;

-----------------------------------------------
-- Utilizando o comando CASE - outra sintaxe --
-----------------------------------------------

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o id do departamento';
DECLARE
    vpercentual NUMBER(3);
    vDepartment_id employees.employee_id%type := &pdepartment_id;
BEGIN
    CASE 
    WHEN vDepartment_id = 80
    THEN 
        vpercentual := 10; --Sales  
    WHEN vDepartment_id = 20
    THEN
        vpercentual := 15; --Marketing 
    WHEN vDepartment_id = 60
    THEN
        vpercentual := 20; --IT
    ELSE
        vpercentual := 5;
    END CASE;
    
    DBMS_OUTPUT.PUT_LINE('Id do departamento: ' || vDepartment_id);
    DBMS_OUTPUT.PUT_LINE('Percentual: ' || vpercentual);
    
    UPDATE employees
    SET salary = salary * (1 + vpercentual / 100)
    WHERE department_id = vDepartment_id;
    --COMMIT;
END;

-----------------
-- LOOP básico --
-----------------

SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT "Digite o valor do limite;
DECLARE
    vNumero NUMBER(38) := 1;
    vLimite NUMBER(38) := &pLimite;
BEGIN
-- Imprimindo números de 1 até o limite
LOOP
   DBMS_OUTPUT.PUT_LINE('Número = ' || TO_CHAR(vNumero));
   EXIT WHEN vNumero = vLimite;
   vNumero := vNumero + 1;
END LOOP;
END;

------------------------------
-- FOR LOOP - É mais seguro --
------------------------------

SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: ';
DECLARE
    vinicio INTEGER(3) := 1;
    vfim  NUMBER(38) := &pLimite;
BEGIN
    FOR i IN vinicio..vfim LOOP
         DBMS_OUTPUT.PUT_LINE('Número = ' || TO_CHAR(i));
    END LOOP;
END;

----------------
-- WHILE LOOP --
----------------

SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: ';
DECLARE
    vNumero NUMBER(38) := 1;
    vLimite  NUMBER(38) := &pLimite;
BEGIN

-- Variáveis inicializadas na seção DECLARE

    WHILE vNumero <= vLimite LOOP
        DBMS_OUTPUT.PUT_LINE('Número = ' || TO_CHAR(vNumero));
        vNumero := vNumero + 1;
    END LOOP;
END;

---------------------------------
-- Controlando LOOPs aninhados --
---------------------------------

SET SERVEROUTPUT ON
DECLARE
    vTotal NUMBER(38) := 1;
BEGIN
<<LOOP1>>
     FOR i IN 1..8 LOOP
        DBMS_OUTPUT.PUT_LINE('Número = ' || TO_CHAR(i));
        <<LOOP2>>
        FOR j IN 1..8 LOOP
            DBMS_OUTPUT.PUT_LINE('Número = ' || TO_CHAR(j));            
            DBMS_OUTPUT.PUT_LINE('Total = ' || TO_CHAR(vTotal, '99G999G999G999G999G999G999D99'));
            vTotal := vTotal * 2;
            -- EXIT LOOP1 WHEN vTotal > 10000000000000000000;
        END LOOP;
     END LOOP;
     DBMS_OUTPUT.PUT_LINE('Total final = ' || TO_CHAR(vTotal));
END;




































































