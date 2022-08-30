--------------------------------------------------------
--  DDL for Trigger LGS_CONTRACTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."LGS_CONTRACTS_TRG" 
 BEFORE INSERT or update
 ON LGS_CONTRACTS
 FOR EACH ROW
DECLARE
 v_seq number;
begin
if inserting then
 if :new.id is null then
  select lgs_contracts_seq.nextval into v_seq from dual;
 :new.id := v_seq;
     end if;
 :NEW.CREATED_DATE := SYSDATE;
elsif updating then

 if :new.CONTRACT_STAGE_ID <> :old.CONTRACT_STAGE_ID then
  insert into prj_contract_summary (id, contract_id, day, contract_stage_id, amount)  values ('', :new.id, sysdate, :old.contract_stage_id, project_pck.get_contract_expences(:new.id));
 end if;

end if;
end;

/
ALTER TRIGGER "PRJ"."LGS_CONTRACTS_TRG" ENABLE;
