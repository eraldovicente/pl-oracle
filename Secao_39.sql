--------------
-- Se�a� 39 --
--------------

----------------------------------------------
-- Database DML triggers a n�vel de comando --
----------------------------------------------

CREATE OR REPLACE TRIGGER B_I_EMPLOYEES_S_TRG
BEFORE INSERT
ON employees
BEGIN
  IF  (TO_CHAR(SYSDATE, 'DAY') IN ('S�BADO', 'DOMINGO') OR
       TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) NOT BETWEEN 8 AND 18) 
  THEN
       RAISE_APPLICATION_ERROR( -20001,'O cadastramento de Empregados s� � permitido em dias de semana dentro do hor�rio comercial');
  END IF;
END;

-------------------------------------
-- Testando a valida��o de trigger --
-------------------------------------

BEGIN
    PCK_EMPREGADOS.PRC_INSERI_EMPREGADO('Fabiana', 'Paes', 'BIANA', '999.999.9999', SYSDATE,'IT_PROG',25000,NULL,103,60);
    COMMIT;
END;












