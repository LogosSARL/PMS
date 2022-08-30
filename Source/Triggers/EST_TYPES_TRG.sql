--------------------------------------------------------
--  DDL for Trigger EST_TYPES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."EST_TYPES_TRG" 
BEFORE INSERT
ON EST_TYPES
FOR EACH ROW
DECLARE
 v_seq number;
begin
if :new.id is null then
  select EST_TYPES_seq.nextval into v_seq from dual;
  :new.id := v_seq;
end if;
end;

/
ALTER TRIGGER "PRJ"."EST_TYPES_TRG" ENABLE;
