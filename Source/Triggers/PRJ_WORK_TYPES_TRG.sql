--------------------------------------------------------
--  DDL for Trigger PRJ_WORK_TYPES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_WORK_TYPES_TRG" 
 BEFORE INSERT
 ON PRJ_WORK_TYPES
 FOR EACH ROW
DECLARE
 v_seq number;
begin
if :new.id is null then
		select prj_work_types_seq.nextval into v_seq from dual;
:new.id := v_seq;
    end if;
end;

/
ALTER TRIGGER "PRJ"."PRJ_WORK_TYPES_TRG" ENABLE;
