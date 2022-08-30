--------------------------------------------------------
--  DDL for Function CHANGE_CONTACT_APPROVED_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."CHANGE_CONTACT_APPROVED_STATUS" 
(p_pipe_id in NUMBER)
return NUMBER
is
function change_contact_approved_status(p_pipe_id in number)		
return number
is
cursor c1 is 
    select *
		from	LGS_CONTRACTS
		where 	id = p_pipe_id and offer_status IN  (select pos_id from prj_offer_status
     where instr(lower(pos_code),'pending')>0 ) ;
c1r c1%rowtype;
cursor c2 is 	select lut_id
		from	prj_lvl_usage_type
		where 	lower(lut_code)= 'contract';
c2r c2%rowtype;
cursor c3 is 	select pos_id
		from	prj_offer_status
		where 	instr(lower(pos_code),lower('contract'))>0;
c3r c3%rowtype;
cntrct_id number :=0;
 v_1  number :=0 ;
 v_2 number := 0 ;
 begin
    select 	pst_id into v_1
		from	PRJ_STATUS
		where 	instr(lower(pst_code) ,lower('inp'))>0 ;
    
    select 	pst_id into v_2
		from	PRJ_STATUS
		where 	instr(lower(pst_code),lower('Apr'))>0;
 
 
  open c1; fetch c1 into c1r;
	open c2; fetch c2 into c2r;
	open c3; fetch c3 into c3r;
 close c1;
	close c2;
	close c3;
select LGS_CONTRACTS_SEQ.NEXTVAL into cntrct_id from dual;

insert into lgs_contracts(ID,DSP_CODE ,COMPANY_CODE, START_DATE, END_DATE,  USD_VALUE , FINALIZED, CONTRACT_TYPE_ID,
CONTRACT_STAGE_ID, DISPLAY_IN_CONTRACTS, PRICING_DATE, PERDIUM, DAYS_PER_TICKET, TICKET_VALUE, HOTEL_RATE, CAR_RENTAL_PER_DAY
,INTERNATIONAL, WHO_CREATED,  ACCOUNT_MANAGER, USAGE_TYPE ,PARENT_CONTRACT,  REF_TO_PIPELINE , REF_TO_CONTRACT, PROJECT_NAME,
REF_PM ,REF_INTERNAL ,INHOUSE_RATE ,ONSITE_RATE, IN_SCOPE , INTERNAL_CLASSIFICATION ,INVOICED_DAYS  ,INITIAL_AMOUNT ,
DISCOUNT_IN_DAYS, DISCOUNT_IN_AMOUNT  ,VAT_VALUE, FINAL_AMOUNT ,EXPECTED_DELIVERY_DATE ,WARRANTY_IN_MONTH ,VALUE_IN_MAINTENANCE,
SIGNATURE_DATE ,SIGNED_BY, OFFER_STATUS ,PAYMENT_TERM ,REMARKS ,OTHER_EXPENSES_ON_CLIENT, SETTLED, STATUS)

values (cntrct_id ,c1r.DSP_CODE ,c1r.COMPANY_CODE, c1r.START_DATE, c1r.END_DATE,  c1r.USD_VALUE , c1r.FINALIZED, c1r.CONTRACT_TYPE_ID,
c1r.CONTRACT_STAGE_ID, c1r.DISPLAY_IN_CONTRACTS, c1r.PRICING_DATE, c1r.PERDIUM, c1r.DAYS_PER_TICKET, c1r.TICKET_VALUE, c1r.HOTEL_RATE, c1r.CAR_RENTAL_PER_DAY
,c1r.INTERNATIONAL, c1r.WHO_CREATED,  c1r.ACCOUNT_MANAGER, c2r.lut_id ,c1r.PARENT_CONTRACT,p_pipe_id  , c1r.REF_TO_CONTRACT, c1r.PROJECT_NAME,
c1r.REF_PM ,c1r.REF_INTERNAL ,c1r.INHOUSE_RATE ,c1r.ONSITE_RATE, c1r.IN_SCOPE , c1r.INTERNAL_CLASSIFICATION ,c1r.INVOICED_DAYS  ,c1r.INITIAL_AMOUNT ,
c1r.DISCOUNT_IN_DAYS, c1r.DISCOUNT_IN_AMOUNT ,c1r.VAT_VALUE, c1r.FINAL_AMOUNT ,c1r.EXPECTED_DELIVERY_DATE ,c1r.WARRANTY_IN_MONTH ,c1r.VALUE_IN_MAINTENANCE,
c1r.SIGNATURE_DATE ,c1r.SIGNED_BY, null ,c1r.PAYMENT_TERM ,c1r.REMARKS ,c1r.OTHER_EXPENSES_ON_CLIENT, c1r.SETTLED, v_1);

 update lgs_contracts
 set STATUS=v_2, OFFER_STATUS= c3r.pos_id ,ref_to_contract= cntrct_id
  where ID =p_pipe_id;
 
return cntrct_id;
end change_contact_approved_status;

/
