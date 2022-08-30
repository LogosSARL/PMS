--------------------------------------------------------
--  DDL for Function PROJECT_PAID_FULLY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."PROJECT_PAID_FULLY" (p_contract_id in number) return varchar2
is
cursor c1 is 	select ID, APPROVAL_DATE, DSP_CODE, REF_TO_PIPELINE, REF_TO_CONTRACT, PARENT_CONTRACT, COMPANY_CODE,
                 REF_TO_PIPELINE, FINALIZED, STATUS, BRANCH_ID,
                project_pck.get_contract_desc (id) Contract_desc,
                project_pck.get_task_contract_enrollment (id,'0','d') Enr,
                project_pck.get_contract_estimate(id) Est,
                project_pck.get_contract_estimate(id) - project_pck.get_task_contract_enrollment (id,'0','d') Net,
                project_pck.get_contract_enrollment(id) EnrUnits,
                project_pck.get_contract_estimate(id) EstUnits,
                lgs_get_contract_first_emp(id) PM,
                get_contract_last_updated (id) Last_Updated                 
		from	lgs_contracts
		where 	id = p_contract_id
                and USAGE_TYPE = 2
                and created_date is not null
                and NVL(OFFER_STATUS,0) != 1;
c1r c1%rowtype;
cursor c2 is 	select ID,L_DESCRIPTION,DSP_CODE,END_DATE,START_DATE,CONTRACT_ID,INT_CODE,MODULE,
                       NEW_IMPLEMENTATION,MAINTENANCE,PRICING_DATE,ACTIVE,SEQ,HIGH_LEVEL_ESTIMATE,
                       HIGH_LEVEL_REMAINING,STATUS,IS_INVOICED_FLG,APPROVAL_DATE,PAYMENT_PERCENTAGE,
                       DECODE(PAYMENT_PERCENTAGE, 100, 'paid',null, 'unpaid','unpaid') payment_status
		from	lgs_projects
		where 	CONTRACT_ID = c1r.ID;
c2r c2%rowtype;

v_out 	varchar2(4000);
begin

	open c1; fetch c1 into c1r;
	open c2; fetch c2 into c2r;

  v_out := '';


    if c2r.payment_status = 'paid' then  v_out := c2r.id || ' is ' || 'paid';
    else if c2r.payment_status = 'unpaid' then v_out := c2r.id || ' is ' || 'unpaid';
    close c1;
	close c2;
    end if;



 return v_out;
end project_paid_fully;

/
