--------------
-- Seção 36 --
--------------

-----------------------------------------
-- Gerenciando dependências de objetos --
-----------------------------------------

-----------------------------------------------------
-- Consultando dependências diretas dos objetos do --
-- seu schema utilizando a visão USER_DEPENDENCIES --
-----------------------------------------------------

DESC user_dependencies;

SELECT *
FROM user_dependencies
WHERE referenced_name = 'EMPLOYEES' AND
      referenced_type = 'TABLE';
































