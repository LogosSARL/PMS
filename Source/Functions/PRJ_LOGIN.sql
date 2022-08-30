--------------------------------------------------------
--  DDL for Function PRJ_LOGIN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."PRJ_LOGIN" (p_username in varchar2, p_password in varchar2) return boolean
as
V_CNT NUMBER;
begin

 select  count(*)
 into v_cnt
 from   prj_employee_salary
 where  upper(user_name) = upper(p_username)
 and upper(passwrd) = upper(p_password);

 if v_cnt = 1 then return TRUE;
 ELSE RETURN FALSE;
 END IF;
END PRJ_LOGIN;

/
