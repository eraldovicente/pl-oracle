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




















































