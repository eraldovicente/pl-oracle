--------------
-- Se��o 36 --
--------------

-----------------------------------------
-- Gerenciando depend�ncias de objetos --
-----------------------------------------

-----------------------------------------------------
-- Consultando depend�ncias diretas dos objetos do --
-- seu schema utilizando a vis�o USER_DEPENDENCIES --
-----------------------------------------------------

DESC user_dependencies;

SELECT *
FROM user_dependencies
WHERE referenced_name = 'EMPLOYEES' AND
      referenced_type = 'TABLE';
































