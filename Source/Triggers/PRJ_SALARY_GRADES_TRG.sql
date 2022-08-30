--------------------------------------------------------
--  DDL for Trigger PRJ_SALARY_GRADES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_SALARY_GRADES_TRG" 
before insert or update on PRJ_SALARY_grades
for each row
declare
v_seq number;
begin
 select  PRJ_SALARY_grades_history_s.nextval
 into v_seq
 from  dual;
 if inserting then insert into prj_salary_grades_history
 (id, from_salary,to_salary,grade_price_id, units, name, change_date, id_new)
 values ( :new.id, :new.from_salary, :new.to_salary,:new.grade_price_id, :new.units, :new.name, sysdate, v_seq);
 elsif updating then insert into prj_salary_grades_history
 (id, from_salary,to_salary,grade_price_id, units, name, change_date, id_new)
 values ( :new.id, :new.from_salary, :new.to_salary,:new.grade_price_id, :new.units, :new.name, sysdate, v_seq);
 end if;

end;

/
ALTER TRIGGER "PRJ"."PRJ_SALARY_GRADES_TRG" ENABLE;
