--------------------------------------------------------
--  DDL for Trigger WORK_TYPE_GROUPS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."WORK_TYPE_GROUPS_TRG" 
    BEFORE INSERT
    ON work_type_groups
    FOR EACH ROW
DECLARE
 p_seqno number;
begin
 if inserting then
  if :new.id is null then
  select work_type_groups_seq.nextval into p_seqno from dual;
  :new.id := p_seqno;
  end if;
end if;
end;

/
ALTER TRIGGER "PRJ"."WORK_TYPE_GROUPS_TRG" ENABLE;
