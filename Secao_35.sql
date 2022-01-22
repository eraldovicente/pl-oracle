--------------
-- Se��o 35 --
--------------

--------------------------------------
-- Gerenciando procedures e fun��es --
--------------------------------------

-----------------------------------------------------------------
-- Consultando objetos tipo procedure e function de um usu�rio --
-----------------------------------------------------------------

DESC USER_OBJECTS;

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM user_objects
WHERE object_type IN ('PROCEDURE', 'FUNCTION');

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM all_objects
WHERE object_type IN ('PROCEDURE', 'FUNCTION');

------------------------------------------------------------
-- Consultando objetos inv�lidos do schema do seu usu�rio --
------------------------------------------------------------


DESC USER_OBJECTS;

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM user_objects
WHERE status = 'INVALID';

-----------------------------------------------------------------------
-- Consultando o c�digo fonte de procedures e fun��es do seu usu�rio --
-----------------------------------------------------------------------

DESC user_source;

SELECT line, text
FROM user_source
WHERE name = 'PRC_INSERI_EMPREGADO' AND
      type = 'PROCEDURE'
ORDER BY line;

SELECT line, text
FROM user_source
WHERE name = 'PRC_CONSULTA_SALARIO_EMPREGADO' AND
      type = 'FUNCTION'
ORDER BY line;

---------------------------------------------------------------
-- Consultando a lista de par�metros de procedures e fun��es --
---------------------------------------------------------------

DESC PRC_INSERI_EMPREGADO;

DESC FNC_CONSULTA_SALARIO_EMPREGADO;

-----------------------------------------------------------
-- Consultando erros de compila��o - comando SHOW ERRORS --
-----------------------------------------------------------

SHOW ERROR PROCEDURE FNC_CONSULTA_SALARIO_EMPREGADO;

---------------------------------------------------------
-- Consultando erros de compila��o - vis�o USER_ERRORS --
---------------------------------------------------------

DESC user_errors

COLUMN position FORMAT a4
COLUMN text FORMAT a60
SELECT line ||'/'|| position position, text
FROM user_errors
WHERE name = 'FNC_CONSULTA_SALARIO_EMPREGADO'
ORDER BY line;



































































