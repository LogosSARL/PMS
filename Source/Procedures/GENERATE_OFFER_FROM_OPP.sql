--------------------------------------------------------
--  DDL for Procedure GENERATE_OFFER_FROM_OPP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRJ"."GENERATE_OFFER_FROM_OPP" (opp_id_p  NUMBER)
is   
cursor c1 is     select * from    opportunities,opp_role  where    opp_id= opp_id_p and  opp_id = orl_opp_id and orl_rol_id = 1 ;
c1r c1%rowtype; cntrct_id number;   PIPE_ID NUMBER;
 cursor c2 is     select *  from    opp_scope  where    ops_opp_id = opp_id_p;
c2r c2%rowtype;
 begin
   open c1;  fetch c1 into c1r;
select LGS_CONTRACTS_SEQ.NEXTVAL into cntrct_id from dual;
select PRJ_PPM_SEQ.NEXTVAL into pipe_id from dual;
   insert into lgs_contracts(ID,DSP_CODE ,REF_INTERNAL,COMPANY_CODE, CONTRACT_TYPE_ID,PRICING_DATE, WHO_CREATED,  ACCOUNT_MANAGER, USAGE_TYPE ,PROJECT_NAME, OFFER_STATUS ,REMARKS,DESCRIPTION)
   values ( cntrct_id,c1r.OPP_CODE ,c1r.OPP_CODE ,c1r.OPP_CUSTOMER, 1,SYSDATE, c1r.orl_employee,  c1r.orl_employee, 1 ,c1r.OPP_PROJECT_NAME , 1,c1r.OPP_REMARKS,c1r.opp_desc);
 open c2;  
    LOOP
        fetch c2 into c2r;
        exit when c2%notfound;
 insert into prj_pipeline_modules(PPM_ID,ppm_cnt_id,PPM_MODULE)  values( PIPE_ID,cntrct_id,c2r.ops_module );   
  END LOOP; close c2;close c1;
 UPDATE OPPORTUNITIES SET OPP_REFERENCE_TO_PIPELINE = CNTRCT_ID  WHERE OPP_ID =opp_id_p;  
 end;

/
