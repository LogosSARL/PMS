--------------------------------------------------------
--  DDL for Procedure ENABLE_ROLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRJ"."ENABLE_ROLE" (ROLE_NAME IN VARCHAR2) AUTHID CURRENT_USER AS
  VROLES VARCHAR2(4000);
BEGIN
  -- Created by Rodrigo Jorge - www.dbarj.com.br --
  IF SYS_CONTEXT('TWOFACTOR_CTX', 'AUTHENTICATED') = 'TRUE'
  THEN
    $IF DBMS_DB_VERSION.VER_LE_10
    $THEN SELECT WM_CONCAT(ROLE)
    $ELSIF DBMS_DB_VERSION.VER_LE_11_1
    $THEN SELECT WM_CONCAT(ROLE)
    $ELSE SELECT LISTAGG(ROLE, ', ') WITHIN GROUP(ORDER BY ROWNUM)
    $END
    INTO   VROLES
    FROM   (SELECT ROLE
            FROM   SESSION_ROLES
            UNION
            SELECT ROLE_NAME FROM DUAL);
    DBMS_SESSION.SET_ROLE(VROLES);
  ELSE
    RAISE_APPLICATION_ERROR(-20000, 'User not authenticated in 2Factor.');
  END IF;
END ENABLE_ROLE;

/
