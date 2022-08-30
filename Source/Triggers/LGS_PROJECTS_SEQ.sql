--------------------------------------------------------
--  DDL for Trigger LGS_PROJECTS_SEQ
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."LGS_PROJECTS_SEQ" 
BEFORE INSERT
ON LGS_PROJECTS
FOR EACH ROW
DECLARE
 v_seq number;
begin
if :new.id is null then
  select lgs_projects_seq.nextval into v_seq from dual;
  :new.id := v_seq;
    end if;
if :new.dsp_code is null then :new.dsp_code := :new.int_code ||'  --  '||:new.module; end if;
end;

/
ALTER TRIGGER "PRJ"."LGS_PROJECTS_SEQ" ENABLE;
