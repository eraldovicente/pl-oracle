--------------
-- Seção 35 --
--------------

--------------------------------------
-- Gerenciando procedures e funções --
--------------------------------------

-----------------------------------------------------------------
-- Consultando objetos tipo procedure e function de um usuário --
-----------------------------------------------------------------

DESC USER_OBJECTS;

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM user_objects
WHERE object_type IN ('PROCEDURE', 'FUNCTION');

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM all_objects
WHERE object_type IN ('PROCEDURE', 'FUNCTION');

------------------------------------------------------------
-- Consultando objetos inválidos do schema do seu usuário --
------------------------------------------------------------


DESC USER_OBJECTS;

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM user_objects
WHERE status = 'INVALID';




















































