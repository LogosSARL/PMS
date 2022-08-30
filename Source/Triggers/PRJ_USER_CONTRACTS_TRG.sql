--------------------------------------------------------
--  DDL for Trigger PRJ_USER_CONTRACTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_USER_CONTRACTS_TRG" 
BEFORE INSERT
ON prj_user_contracts
FOR EACH ROW
DECLARE
    v_seq number;
v_user_name  varchar2(35 char);
v_passwrd   varchar2(35 char);
v_emp_name  varchar2(35 char);
v_email  varchar2(135 char) := 'fares@logos.com.lb';
begin
     if inserting then

      if :new.id is null then

      select  prj_user_contracts_seq.nextval
      into    v_seq
      from    dual;

      :new.id := v_seq;
      end if;
/*
  select  user_name, passwrd , emp_name
  into v_user_name, v_passwrd, v_emp_name
  from prj_employee_salary
  where  emp_code = :new.emp_code;

  if v_user_name is not null then

   if v_passwrd is null  then v_passwrd := v_user_name; end if;
   APEX_UTIL.CREATE_USER(
            p_user_name    =>  v_user_name,
            p_web_password =>  v_passwrd,
    P_first_name   =>  v_emp_name,
    p_email_address =>  v_email);


  end if;
  */
 end if;
end;

/
ALTER TRIGGER "PRJ"."PRJ_USER_CONTRACTS_TRG" ENABLE;
