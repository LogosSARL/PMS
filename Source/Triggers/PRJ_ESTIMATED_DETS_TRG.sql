--------------------------------------------------------
--  DDL for Trigger PRJ_ESTIMATED_DETS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_ESTIMATED_DETS_TRG" 
 BEFORE INSERT or update or delete
 ON PRJ_estimated_DETS
 FOR EACH ROW
DECLARE
 v_seq number;
v_hours_per_day number := 8;
begin

if inserting then
 if :new.id is null then
  select PRJ_estimated_DETS_seq.nextval into v_seq from dual;
  :new.id := v_seq;
     end if;

end if;

end;

/
ALTER TRIGGER "PRJ"."PRJ_ESTIMATED_DETS_TRG" ENABLE;
