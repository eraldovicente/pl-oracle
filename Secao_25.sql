----------------------------------------------------
-- Seção 25 - Declarando uma variável tipo NUMBER --
----------------------------------------------------

SET SERVEROUTPUT ON

DECLARE
    vnumero NUMBER(
                  11,
                  2
    ) := 1200.50;
BEGIN
    dbms_output.put_line('Número = ' || vnumero);
END;

-----------------------------------------------
-- Declarando variáveis tipo CHAR e VARCHAR2 --
-----------------------------------------------

DECLARE
    vcaractertamfixo     CHAR(2) := 'RS';
    vcaractertamvariavel VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
    dbms_output.put_line('String caracteres tamanho fixo = ' || vcaractertamfixo);
    dbms_output.put_line('String caracteres tamanho variável = ' || vcaractertamvariavel);
END;

------------------------------------
-- Declarando variáveis tipo DATE --
------------------------------------

DECLARE
    vdata1 DATE := '19/01/2022';
    vdata2 DATE := '19/01/22';
BEGIN
    dbms_output.put_line('Data1 = ' || vdata1);
    dbms_output.put_line('Data2 = ' || vdata2);
END;

--------------------------
-- Declarando constante --
--------------------------

------------------------------------------
-- Declarando uma constante tipo NUMBER --
------------------------------------------

DECLARE
    vpi CONSTANT NUMBER(
                       38,
                       15
    ) := 3.141592653589793;
BEGIN
    dbms_output.put_line('vPi = ' || vpi);
END;

--------------------------------------------------
-- Declarando uma constante tipo CHAR e VARCHAR --
--------------------------------------------------

DECLARE
    vcaractertamfixo     CONSTANT CHAR(2) := 'PE';
    vcaractertamvariavel CONSTANT VARCHAR(100) := 'Igarassu, PE';
BEGIN
    dbms_output.put_line('String caracteres tamanho fixo = ' || vcaractertamfixo);
    dbms_output.put_line('String caracteres tamanho variável = ' || vcaractertamvariavel);
END;

------------------------------------------------------------------
-- Declarando variáveis utilizando os principais tipos de dados --
------------------------------------------------------------------

DESC employees;


SET SERVEROUTPUT ON
DECLARE
  vNumero              NUMBER(11,2) := 1200.50;
  vCaracterTamFixo     CHAR(100) := 'Texto de Tamanho Fixo de até 32767 bytes';
  vCaracterTamVariavel VARCHAR2(100) := 'Texto Tamanho variável de até 32767 bytes';
  vBooleano            BOOLEAN := TRUE;
  vData                DATE := sysdate;
  vLong                LONG := 'Texto Tamanho variável de até 32760 bytes';
  vRowid               ROWID;
  vTimestamp           TIMESTAMP := systimestamp;
  vTimestamptz         TIMESTAMP WITH TIME ZONE := systimestamp;
  vCaracterTamFixoUniversal     NCHAR(100) := 'Texto de Tamanho Fixo Universal de até 32767 bytes';
  vCaracterTamVariavelUniversal NVARCHAR2(100) := 'Texto Tamanho variável Universal de até 32767 bytes';
  vNumeroInteiro       BINARY_INTEGER := 1200;
  vNumeroFloat         BINARY_FLOAT := 15000000;
  vNumeroDouble        BINARY_DOUBLE := 15000000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Numero = ' ||   vNumero);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável = ' || vCaracterTamVariavel );
  IF  vBooleano = TRUE
  THEN 
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'TRUE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'FALSE OR NULL');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Data = ' || vData);
  DBMS_OUTPUT.PUT_LINE('Long = ' || vLong );
  SELECT rowid
  INTO   vRowid
  FROM   employees
  WHERE  first_name = 'Steven' AND last_name = 'King';
  DBMS_OUTPUT.PUT_LINE('Rowid = ' || vRowid );
  DBMS_OUTPUT.PUT_LINE('Timestamp = ' || vTimestamp);
  DBMS_OUTPUT.PUT_LINE('Timestamp with time zone= ' || vTimestamptz);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixoUniversal );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável = ' || vCaracterTamVariavelUniversal );
  DBMS_OUTPUT.PUT_LINE('Numero Inteiro = ' || vNumeroInteiro);
  DBMS_OUTPUT.PUT_LINE('Numero Float = ' || vNumeroFloat);
  DBMS_OUTPUT.PUT_LINE('Numero Double = ' || vNumeroDouble);
END;

-------------------------------
-- Utilizando variáveis BIND --
-------------------------------

SET SERVEROUTPUT ON
VARIABLE gmedia NUMBER;
DECLARE
    vnumero1 NUMBER(11,2) := 2000;
    vnumero2 NUMBER(11,2) := 5000;
BEGIN
    :gmedia := (vnumero1 + vnumero2) / 2;
    DBMS_OUTPUT.PUT_LINE('Média = ' || TO_CHAR(:gmedia));
EXCEPTION
    WHEN OTHERS
    THEN        
        DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM);
END;

























