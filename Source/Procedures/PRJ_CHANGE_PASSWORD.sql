--------------------------------------------------------
--  DDL for Procedure PRJ_CHANGE_PASSWORD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRJ"."PRJ_CHANGE_PASSWORD" (v_username in varchar2, v_password in varchar2, v_confirm_password in varchar2, v_out in out varchar2)
as
begin
if v_password = v_confirm_password then
 update prj_employee_salary set passwrd = v_password where user_name = v_username;
 v_out := 'Your Password was changed';
 commit;
else v_out := 'The confirmed password is not the same as the Password ... Please Re-Enter';
end if;
end;

/
