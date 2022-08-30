--------------------------------------------------------
--  DDL for Trigger PRJ_EMPLOYEE_SKILLS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_EMPLOYEE_SKILLS_TRG" 
 BEFORE INSERT or update or delete
 ON prj_employee_skills
 FOR EACH ROW
DECLARE
 v_seq number;
begin

if inserting then
 if :new.id is null then
  select prj_employee_skills_seq.nextval into v_seq from dual;
  :new.id := v_seq;
     end if;

end if;

end;

/
ALTER TRIGGER "PRJ"."PRJ_EMPLOYEE_SKILLS_TRG" ENABLE;
