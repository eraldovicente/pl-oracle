--------------
-- Seção 26 --
--------------

---------------------------------------------
-- Sintaxe e diretrizes de um bloco PL/SQL --
---------------------------------------------

----------------
-- Comentário --
----------------

SET SERVEROUTPUT ON
DECLARE
  vNumero1  NUMBER(13,2);  -- Declaração de variável para o Primeiro número
  vNumero2  NUMBER(13,2);  -- Declaração de variável para o Segundo número
  vMedia    NUMBER(13,2);  -- Declaração de variável para receber a Media calculada
BEGIN
  /* Cálculo do valor da média entre dois números
     Autor: Emílio Scudero
     Data: 05/05/2020 */
	 
  vNumero1  :=  8000;
  vNumero2  :=  4000;
  vmedia    := (vNumero1 + vNumero2) / 2;           -- Cálculo da média entre os dois números  
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vNumero1);  -- Impressão do primeiro número
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vNumero2);  -- Impressão do segundo número
  DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);     -- Impressão da média calculada 
END;

--------------------------------------------
-- Utilizando funções SQL no bloco PL/SQL --
--------------------------------------------

SET SERVEROUTPUT ON
DECLARE
  vNumero1  NUMBER(13,2);  -- Declaração de variável para o Primeiro número
  vNumero2  NUMBER(13,2);  -- Declaração de variável para o Segundo número
  vMedia    NUMBER(13,2);  -- Declaração de variável para receber a Media calculada
BEGIN
  /* Cálculo do valor da média entre dois números
     Autor: Emílio Scudero
     Data: 05/05/2020 */
	 
  vNumero1  :=  5000.8888;
  vNumero2  :=  3000.4444;
  vmedia    := ROUND((vNumero1 + vNumero2) / 2, 2);           -- Cálculo da média entre os dois números  
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vNumero1);  -- Impressão do primeiro número
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vNumero2);  -- Impressão do segundo número
  DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(vMedia, '99G999G999D99'));     -- Impressão da média calculada 
END;

---------------------------------------------------------------------------
-- Blocos aninhados e escopo de identificadores (variáveis e constantes) --
---------------------------------------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando variáveis do bloco 1: ' || vbloco1);
    -- Se você referenciar vbloco2 aqui ocorrerá erro.
    DECLARE
        vbloco2 VARCHAR2(20) := 'Bloco 2';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Referenciando variáveis do bloco 1: ' || vbloco1); 
        DBMS_OUTPUT.PUT_LINE('Referenciando variáveis do bloco 2: ' || vbloco2);
    END;
     DBMS_OUTPUT.PUT_LINE('Referenciando variáveis do bloco 1: ' || vbloco1);
     -- Se você referenciar vbloco2 aqui ocorrerá erro.
END;










