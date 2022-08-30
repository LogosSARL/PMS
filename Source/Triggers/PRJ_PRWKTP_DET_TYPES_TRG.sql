--------------------------------------------------------
--  DDL for Trigger PRJ_PRWKTP_DET_TYPES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_PRWKTP_DET_TYPES_TRG" 
 BEFORE INSERT
 ON PRJ_PRWKTP_DET_TYPES
 FOR EACH ROW
DECLARE
 v_seq number;
begin
if :new.id is null then
  select PRJ_PRWKTP_DET_TYPES_seq.nextval
  into v_seq from dual;
:new.id := v_seq;
    end if;
end;

/
ALTER TRIGGER "PRJ"."PRJ_PRWKTP_DET_TYPES_TRG" ENABLE;
