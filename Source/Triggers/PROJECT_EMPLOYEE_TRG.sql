--------------------------------------------------------
--  DDL for Trigger PROJECT_EMPLOYEE_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PROJECT_EMPLOYEE_TRG" 
 BEFORE DELETE OR INSERT OR UPDATE OF ID
 ON project_employee
 FOR EACH ROW
DECLARE



    v_seq number;
begin
     if inserting then

      if :new.id is null then

      select  project_employee_seq.nextval
      into    v_seq
      from    dual;

      :new.id := v_seq;

      end if;
 end if;
end;

/
ALTER TRIGGER "PRJ"."PROJECT_EMPLOYEE_TRG" ENABLE;
