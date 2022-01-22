--------------
-- Seçaõ 39 --
--------------

----------------------------------------------
-- Database DML triggers a nível de comando --
----------------------------------------------

CREATE OR REPLACE TRIGGER b_i_employees_s_trg BEFORE
    INSERT ON employees
BEGIN
    IF ( to_char(
        sysdate, 'DAY'
    ) IN ( 'SABADO', 'DOMINDO' ) OR to_number(
        to_char(
            sysdate, 'HH24'
        )
    ) NOT BETWEEN 8 AND 18 ) THEN
        raise_application_error(
                               -20001,
                               'O cadastro de empregados só é permitido em dias de semana dentro do horário comercial'
        );
    END IF;
END;