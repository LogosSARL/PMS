--------------------------------------------------------
--  DDL for Function LGS_APEX_LOGIN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."LGS_APEX_LOGIN" (p_username in varchar2, p_password in varchar2) return boolean
as
v_out 	number :=0;
begin
	select 	count(*)
	into 	v_out
	from           PRJ_EMPLOYEE_SALARY
	where 	upper(user_name) = upper(p_username)
	and	upper(passwrd)  	= upper(p_password)
	and	nvl(active,'N') 	= 'Y';
if v_out >0 then return TRUE; else return FALSE; end if;
end lgs_apex_login;

/
