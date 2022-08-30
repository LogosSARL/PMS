--------------------------------------------------------
--  DDL for Trigger PRJ_COMPANY_CONTRACTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_COMPANY_CONTRACTS_TRG" 
before insert or update on prj_company_contracts
for each row
declare
v_contract_id number;
begin
if inserting then
 if :new.id is null then
   select prj_company_contracts_seq.nextval into :new.id from dual;
 end if;
elsif updating then
 if :new.create_contract = 'Y' and nvl(:OLD.create_contract,'N') = 'N'  then
             select  lgs_contracts_seq.nextval
  into v_contract_id
  from  dual;

  insert into lgs_contracts (id, dsp_code, company_code, finalized, usage_type, who_created,offer_status)
  values (v_contract_id, :old.customer_code_css, :new.company_code,'N',1,:new.WHO_UPDATED,1);

 insert into prj_user_contracts (id, emp_code, contract_id, active) values
 ('', 'JOYCE', v_contract_id, 'Y');

 insert into prj_user_contracts (id, emp_code, contract_id, active) values
 ('', 'DIANA', v_contract_id, 'Y');

  transfer_data.create_enrolled_data_contract(v_contract_id);

 end if;



end if;
end prj_company_contracts_trg;

/
ALTER TRIGGER "PRJ"."PRJ_COMPANY_CONTRACTS_TRG" ENABLE;
