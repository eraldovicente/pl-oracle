--------------
-- Se��o 26 --
--------------

---------------------------------------------
-- Sintaxe e diretrizes de um bloco PL/SQL --
---------------------------------------------

----------------
-- Coment�rio --
----------------

SET SERVEROUTPUT ON
DECLARE
  vNumero1  NUMBER(13,2);  -- Declara��o de vari�vel para o Primeiro n�mero
  vNumero2  NUMBER(13,2);  -- Declara��o de vari�vel para o Segundo n�mero
  vMedia    NUMBER(13,2);  -- Declara��o de vari�vel para receber a Media calculada
BEGIN
  /* C�lculo do valor da m�dia entre dois n�meros
     Autor: Em�lio Scudero
     Data: 05/05/2020 */
	 
  vNumero1  :=  8000;
  vNumero2  :=  4000;
  vmedia    := (vNumero1 + vNumero2) / 2;           -- C�lculo da m�dia entre os dois n�meros  
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vNumero1);  -- Impress�o do primeiro n�mero
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vNumero2);  -- Impress�o do segundo n�mero
  DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);     -- Impress�o da m�dia calculada 
END;

--------------------------------------------
-- Utilizando fun��es SQL no bloco PL/SQL --
--------------------------------------------

SET SERVEROUTPUT ON
DECLARE
  vNumero1  NUMBER(13,2);  -- Declara��o de vari�vel para o Primeiro n�mero
  vNumero2  NUMBER(13,2);  -- Declara��o de vari�vel para o Segundo n�mero
  vMedia    NUMBER(13,2);  -- Declara��o de vari�vel para receber a Media calculada
BEGIN
  /* C�lculo do valor da m�dia entre dois n�meros
     Autor: Em�lio Scudero
     Data: 05/05/2020 */
	 
  vNumero1  :=  5000.8888;
  vNumero2  :=  3000.4444;
  vmedia    := ROUND((vNumero1 + vNumero2) / 2, 2);           -- C�lculo da m�dia entre os dois n�meros  
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vNumero1);  -- Impress�o do primeiro n�mero
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vNumero2);  -- Impress�o do segundo n�mero
  DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(vMedia, '99G999G999D99'));     -- Impress�o da m�dia calculada 
END;

---------------------------------------------------------------------------
-- Blocos aninhados e escopo de identificadores (vari�veis e constantes) --
---------------------------------------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando vari�veis do bloco 1: ' || vbloco1);
    -- Se voc� referenciar vbloco2 aqui ocorrer� erro.
    DECLARE
        vbloco2 VARCHAR2(20) := 'Bloco 2';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Referenciando vari�veis do bloco 1: ' || vbloco1); 
        DBMS_OUTPUT.PUT_LINE('Referenciando vari�veis do bloco 2: ' || vbloco2);
    END;
     DBMS_OUTPUT.PUT_LINE('Referenciando vari�veis do bloco 1: ' || vbloco1);
     -- Se voc� referenciar vbloco2 aqui ocorrer� erro.
END;










