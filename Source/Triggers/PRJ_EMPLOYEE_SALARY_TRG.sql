--------------------------------------------------------
--  DDL for Trigger PRJ_EMPLOYEE_SALARY_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_EMPLOYEE_SALARY_TRG" 
before insert or update on PRJ_EMPLOYEE_SALARY
for each row
declare
v_seq number;
begin
 select  PRJ_EMPLOYEE_SALARY_history_s.nextval
 into v_seq
 from  dual;
 if inserting then insert into PRJ_EMPLOYEE_SALARY_history
 (emp_code, emp_name, active, salary_grade_id, int_code,change_date, id)
 values (:new.emp_code, :new.emp_name, :new.active,:new.salary_grade_id, :new.int_code, sysdate, v_seq);
 elsif updating then insert into PRJ_EMPLOYEE_SALARY_history
 (emp_code, emp_name, active, salary_grade_id, int_code,change_date, id)
 values (:new.emp_code, :new.emp_name, :new.active,:new.salary_grade_id, :new.int_code, sysdate, v_seq);
 end if;

end;

/
ALTER TRIGGER "PRJ"."PRJ_EMPLOYEE_SALARY_TRG" ENABLE;
