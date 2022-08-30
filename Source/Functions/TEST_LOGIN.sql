--------------------------------------------------------
--  DDL for Function TEST_LOGIN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."TEST_LOGIN" (p_username in varchar2, p_password in varchar2)  RETURN VARCHAR2
AS
BEGIN

IF PRJ_LOGIN (p_username , p_password ) = TRUE THEN RETURN 'Pass'; else return 'Not'; end if;
end;

/
