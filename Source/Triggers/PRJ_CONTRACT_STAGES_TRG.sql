--------------------------------------------------------
--  DDL for Trigger PRJ_CONTRACT_STAGES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_CONTRACT_STAGES_TRG" 
 BEFORE INSERT or update or delete
 ON prj_contract_stages
 FOR EACH ROW
DECLARE
 v_seq number;
begin

if inserting then
 if :new.id is null then
 select  prj_contract_stages_seq.nextval
 into  v_seq  from  dual;
  :new.id := v_seq;
     end if;

end if;

end;

/
ALTER TRIGGER "PRJ"."PRJ_CONTRACT_STAGES_TRG" ENABLE;
