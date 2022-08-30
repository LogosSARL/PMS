--------------------------------------------------------
--  DDL for Trigger EMP_TRG1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."EMP_TRG1" 
              before insert on emp
              for each row
              begin
                  if :new.empno is null then
                      select emp_seq.nextval into :new.empno from sys.dual;
                 end if;
              end;
/
ALTER TRIGGER "PRJ"."EMP_TRG1" ENABLE;
