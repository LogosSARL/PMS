--------------------------------------------------------
--  DDL for Package Body PROJECT_PCK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."PROJECT_PCK" 
as
function get_contract_project_desc (p_project_worktype_id in number) return varchar2
is
cursor c1 is 	select 	description, wrktyp_id, proj_id
		from	PRJ_PROJECTWORK_TYPes
		where 	id = p_project_worktype_id;
c1r c1%rowtype;
cursor c2 is 	select 	L_DESCRIPTION Project_Name, contract_id
		from	lgs_projects
		where 	id = c1r.proj_id;
c2r c2%rowtype;
cursor c3 is 	select 	dsp_code Contract_Code, company_CODE, Start_Date Contract_Date
		from	lgs_contracts
		where 	id = c2r.contract_id;
c3r c3%rowtype;
cursor c4 is 	select 	dsp_code Company_Code, e_name Company_Name
		from	PRJ_COMPANIES
		where 	code = c3r.company_code;
c4r c4%rowtype;
cursor c5 is	select 	e_name Work_Type_Name
		from	prj_work_types
		where 	id = c1r.wrktyp_id;
c5r c5%rowtype;
 
v_out 	varchar2(4000);
begin
 
	open c1; fetch c1 into c1r;
	open c2; fetch c2 into c2r;
	open c3; fetch c3 into c3r;
	open c4; fetch c4 into c4r;
	open c5; fetch c5 into c5r;
 
		v_out := c4r.Company_name ||' -- '|| c2r.Project_Name||' -- '||c5r.Work_Type_Name;
 
	close c1;
	close c2;
	close c3;
	close c4;
	close c5;
 
return '<b>'||v_out||'</b>';
 
 
end get_contract_project_desc;
  
  
  
function get_inserted_contract_id        (p_pipe_id in number)        return number
is
cursor c1 is 
    select *
        from    LGS_CONTRACTS
        where     id = p_pipe_id 
        --and offer_status IN  (select pos_id from prj_offer_status
     --where instr(lower(pos_code),'pending')>0 ) 
     ;
c1r c1%rowtype;
cursor c2 is     select lut_id
        from    prj_lvl_usage_type
        where     lower(lut_code)= 'contract';
c2r c2%rowtype;
cursor c3 is     select pos_id
        from    prj_offer_status
        where     instr(lower(pos_code),lower('contract'))>0;
c3r c3%rowtype;
 
cursor c4 is     select PPM_MODULE, PPM_START_DATE, PPM_END_DATE, PPM_INT_CODE, PPM_NEW_IMPLEMENTATION, PPM_MAINTENANCE,
                       PPM_PRICING_DATE, PPM_HIGH_LEVEL_ESTIMATE
        from    prj_pipeline_modules
        where     PPM_cnt_id = p_pipe_id ;
c4r c4%rowtype;
cntrct_id number :=0;
 v_1  number :=0 ;
 v_2 number := 0 ;
 V_CONTRACT_DESC VARCHAR2(4000);
 begin
    select     pst_id into v_1
        from    PRJ_STATUS
        where     instr(lower(pst_code) ,lower('inp'))>0 ;
    
    select     pst_id into v_2
        from    PRJ_STATUS
        where     instr(lower(pst_code),lower('Apr'))>0;
 
 
  open c1; fetch c1 into c1r;
    open c2; fetch c2 into c2r;
    open c3; fetch c3 into c3r;
    -- open c4; fetch c4 into c4r;
 close c1;
    close c2;
    close c3;
   -- close c4;
select LGS_CONTRACTS_SEQ.NEXTVAL into cntrct_id from dual;
 
insert into lgs_contracts(ID,DSP_CODE ,COMPANY_CODE, START_DATE, END_DATE,  USD_VALUE , FINALIZED, CONTRACT_TYPE_ID,
CONTRACT_STAGE_ID, DISPLAY_IN_CONTRACTS, PRICING_DATE, PERDIUM, DAYS_PER_TICKET, TICKET_VALUE, HOTEL_RATE, CAR_RENTAL_PER_DAY
,INTERNATIONAL, WHO_CREATED,  ACCOUNT_MANAGER, USAGE_TYPE ,PARENT_CONTRACT,  REF_TO_PIPELINE , REF_TO_CONTRACT, PROJECT_NAME,
REF_PM ,REF_INTERNAL ,INHOUSE_RATE ,ONSITE_RATE, IN_SCOPE , INTERNAL_CLASSIFICATION ,INVOICED_DAYS  ,INITIAL_AMOUNT ,
DISCOUNT_IN_DAYS, DISCOUNT_IN_AMOUNT  ,VAT_VALUE, FINAL_AMOUNT ,EXPECTED_DELIVERY_DATE ,WARRANTY_IN_MONTH ,VALUE_IN_MAINTENANCE,
SIGNATURE_DATE ,SIGNED_BY, OFFER_STATUS ,PAYMENT_TERM ,REMARKS ,OTHER_EXPENSES_ON_CLIENT, SETTLED, STATUS,BRANCH_ID,LL_VALUE)
 
values (cntrct_id ,c1r.DSP_CODE ,c1r.COMPANY_CODE, c1r.START_DATE, c1r.END_DATE,  c1r.USD_VALUE , c1r.FINALIZED, c1r.CONTRACT_TYPE_ID,
c1r.CONTRACT_STAGE_ID, c1r.DISPLAY_IN_CONTRACTS, c1r.PRICING_DATE, c1r.PERDIUM, c1r.DAYS_PER_TICKET, c1r.TICKET_VALUE, c1r.HOTEL_RATE, c1r.CAR_RENTAL_PER_DAY
,c1r.INTERNATIONAL, c1r.WHO_CREATED,  c1r.ACCOUNT_MANAGER, c2r.lut_id ,c1r.PARENT_CONTRACT,p_pipe_id  , c1r.REF_TO_CONTRACT, c1r.PROJECT_NAME,
c1r.REF_PM ,c1r.REF_INTERNAL ,c1r.INHOUSE_RATE ,c1r.ONSITE_RATE, c1r.IN_SCOPE , c1r.INTERNAL_CLASSIFICATION ,c1r.INVOICED_DAYS  ,c1r.INITIAL_AMOUNT ,
c1r.DISCOUNT_IN_DAYS, c1r.DISCOUNT_IN_AMOUNT ,c1r.VAT_VALUE, c1r.FINAL_AMOUNT ,c1r.EXPECTED_DELIVERY_DATE ,c1r.WARRANTY_IN_MONTH ,c1r.VALUE_IN_MAINTENANCE,
c1r.SIGNATURE_DATE ,c1r.SIGNED_BY, null ,c1r.PAYMENT_TERM ,c1r.REMARKS ,c1r.OTHER_EXPENSES_ON_CLIENT, c1r.SETTLED, v_1, C1R.BRANCH_ID,c1r.LL_VALUE);
 
 update lgs_contracts
 set STATUS=v_2, OFFER_STATUS= c3r.pos_id ,ref_to_contract= cntrct_id
  where ID =p_pipe_id;
  
  
  --GET CONTRACT DESCRIPTION
  V_CONTRACT_DESC := project_pck.get_contract_desc (cntrct_id);
  
  for c4r in c4
  loop 
  
  insert into lgs_projects(CONTRACT_ID, INT_CODE, DSP_CODE, START_DATE, END_DATE, MODULE, NEW_IMPLEMENTATION, MAINTENANCE, PRICING_DATE, HIGH_LEVEL_ESTIMATE, STATUS)
      values(cntrct_id,c4r.PPM_INT_CODE, V_CONTRACT_DESC || '-' || c4r.PPM_INT_CODE, c4r.PPM_START_DATE, c4r.PPM_END_DATE, c4r.PPM_MODULE, c4r.PPM_NEW_IMPLEMENTATION, c4r.PPM_MAINTENANCE,
             c4r.PPM_PRICING_DATE, c4r.PPM_HIGH_LEVEL_ESTIMATE, v_1 );
      
  end loop;    
      
return cntrct_id;
end get_inserted_contract_id;
 
 
 
 
 
 
function change_contact_approved_status(p_pipe_id in number)		
return number
is
cursor c1 is 
    select *
		from	LGS_CONTRACTS
		where 	id = p_pipe_id 
                --and offer_status IN  (select pos_id from prj_offer_status     where instr(lower(pos_code),'pending')>0 ) 
                ;
c1r c1%rowtype;
cursor c2 is 	select lut_id
		from	prj_lvl_usage_type
		where 	lower(lut_code)= 'contract';
c2r c2%rowtype;
cursor c3 is 	select pos_id
		from	prj_offer_status
		where 	instr(lower(pos_code),lower('contract'))>0;
c3r c3%rowtype;
 
cursor c4 is     select PPM_MODULE, PPM_START_DATE, PPM_END_DATE, PPM_INT_CODE, PPM_NEW_IMPLEMENTATION, PPM_MAINTENANCE,
                       PPM_PRICING_DATE, PPM_HIGH_LEVEL_ESTIMATE
        from    prj_pipeline_modules
        where     PPM_cnt_id = p_pipe_id ;
        
cntrct_id number :=0;
 v_1  number :=0 ;
 v_2 number := 0 ;
 V_CONTRACT_DESC VARCHAR2(4000);
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
SIGNATURE_DATE ,SIGNED_BY, OFFER_STATUS ,PAYMENT_TERM ,REMARKS ,OTHER_EXPENSES_ON_CLIENT, SETTLED,STATUS,APPROVAL_DATE,BRANCH_ID,RFP_FILES,
             RESPONSE_TO_RFP_FILES, DESCRIPTION, REFERENCES, CLIENT_SIGNATURE_NAME, CLIENT_SIGNATURE_DATE, EXPECTED_DELIVERY_NUM_OF_DAYS,LL_VALUE,ORACLE_LICENSE,APP_LICENSE,ACTIVITI_TASK_ID,
             IH_INVOICE_DAYS, AS_INVOICE_DAYS)
 
values (cntrct_id ,c1r.DSP_CODE ,c1r.COMPANY_CODE, c1r.START_DATE, c1r.END_DATE,  c1r.USD_VALUE , c1r.FINALIZED, c1r.CONTRACT_TYPE_ID,
2, c1r.DISPLAY_IN_CONTRACTS, c1r.PRICING_DATE, c1r.PERDIUM, c1r.DAYS_PER_TICKET, c1r.TICKET_VALUE, c1r.HOTEL_RATE, c1r.CAR_RENTAL_PER_DAY
,c1r.INTERNATIONAL, c1r.WHO_CREATED,  c1r.ACCOUNT_MANAGER, c2r.lut_id ,c1r.PARENT_CONTRACT,p_pipe_id  , c1r.REF_TO_CONTRACT, c1r.PROJECT_NAME,
c1r.REF_PM ,c1r.REF_INTERNAL ,c1r.INHOUSE_RATE ,c1r.ONSITE_RATE, c1r.IN_SCOPE , c1r.INTERNAL_CLASSIFICATION ,c1r.INVOICED_DAYS  ,c1r.INITIAL_AMOUNT ,
c1r.DISCOUNT_IN_DAYS, c1r.DISCOUNT_IN_AMOUNT ,c1r.VAT_VALUE, c1r.FINAL_AMOUNT ,c1r.EXPECTED_DELIVERY_DATE ,c1r.WARRANTY_IN_MONTH ,c1r.VALUE_IN_MAINTENANCE,
c1r.SIGNATURE_DATE ,c1r.SIGNED_BY, 3 ,c1r.PAYMENT_TERM ,c1r.REMARKS ,c1r.OTHER_EXPENSES_ON_CLIENT, c1r.SETTLED, v_1,SYSDATE,C1R.BRANCH_ID,c1r.RFP_FILES,
        c1r.RESPONSE_TO_RFP_FILES,C1R.DESCRIPTION,
        C1R.REFERENCES, C1R.CLIENT_SIGNATURE_NAME, C1R.CLIENT_SIGNATURE_DATE, C1R.EXPECTED_DELIVERY_NUM_OF_DAYS,c1r.LL_VALUE,C1R.ORACLE_LICENSE,C1R.APP_LICENSE,C1R.ACTIVITI_TASK_ID,
        C1R.IH_INVOICE_DAYS, C1R.AS_INVOICE_DAYS);
 
 update lgs_contracts
 set STATUS=v_2, OFFER_STATUS= c3r.pos_id ,ref_to_contract= cntrct_id
  where ID =p_pipe_id;
 
  --GET CONTRACT DESCRIPTION
  V_CONTRACT_DESC := project_pck.get_contract_desc (cntrct_id);
  
  for c4r in c4
  loop 
  insert into tareif(c1,c2) values('cntrct_id',cntrct_id); commit;
  insert into tareif(c1,c2) values('c1r.DSP_CODE',c1r.DSP_CODE); commit;
  insert into tareif(c1,c2) values('c4r.PPM_INT_CODE c4r.PPM_MODULE',c4r.PPM_INT_CODE || '-' || c4r.PPM_MODULE); commit;
  insert into tareif(c1,c2) values('c4r.PPM_INT_CODE',c4r.PPM_INT_CODE); commit;
  insert into tareif(c1,c2) values('c4r.PPM_START_DATE',c4r.PPM_START_DATE); commit;
  insert into tareif(c1,c2) values('c4r.PPM_END_DATE',c4r.PPM_END_DATE); commit;
  insert into tareif(c1,c2) values('c4r.PPM_MODULE',c4r.PPM_MODULE); commit;
  insert into tareif(c1,c2) values('c4r.PPM_NEW_IMPLEMENTATION',c4r.PPM_NEW_IMPLEMENTATION); commit;
  insert into tareif(c1,c2) values('c4r.PPM_MAINTENANCE',c4r.PPM_MAINTENANCE); commit;
  insert into tareif(c1,c2) values(' c4r.PPM_PRICING_DATE', c4r.PPM_PRICING_DATE); commit;
  insert into tareif(c1,c2) values('c4r.PPM_HIGH_LEVEL_ESTIMATE',c4r.PPM_HIGH_LEVEL_ESTIMATE); commit;
  insert into tareif(c1,c2) values(' v_1 ', v_1 ); commit;
  insert into tareif(c1,c2) values('c1r.APPROVAL_DATE',c1r.APPROVAL_DATE); commit;
  insert into lgs_projects(CONTRACT_ID, INT_CODE, DSP_CODE, L_DESCRIPTION, START_DATE, END_DATE, MODULE, NEW_IMPLEMENTATION, MAINTENANCE, PRICING_DATE, HIGH_LEVEL_ESTIMATE, STATUS,APPROVAL_DATE)
      values(cntrct_id,c1r.DSP_CODE, c4r.PPM_INT_CODE || '-' || c4r.PPM_MODULE, c4r.PPM_INT_CODE, c4r.PPM_START_DATE, c4r.PPM_END_DATE, c4r.PPM_MODULE, c4r.PPM_NEW_IMPLEMENTATION, c4r.PPM_MAINTENANCE,
             c4r.PPM_PRICING_DATE, c4r.PPM_HIGH_LEVEL_ESTIMATE, v_1 ,c1r.APPROVAL_DATE);
      
  end loop;    
 
 
return cntrct_id;
end change_contact_approved_status;
 
 
 
 
function change_contact_rejected_status(p_pipe_id in number)		
return number
is
 
cntrct_id number :=0;
 v_1  number :=0 ;
 v_2 number := 0 ;
 begin
    select 	pst_id into v_1
		from	PRJ_STATUS
		where 	instr(lower(pst_code) ,lower('Rjc'))>0 ;
    
    select 	pos_id into v_2
		from	prj_offer_status
		where 	instr(lower(pos_code),lower('Rejected'))>0;
 
 
 
 update lgs_contracts
 set STATUS=v_1, OFFER_STATUS= v_2, REMARKS = 'The Contract has been rejected, Please follow up with Diana'
  where ID =p_pipe_id;
  
  commit;
  
  transfer_data.create_enrolled_data_contract(cntrct_id);
 
return cntrct_id;
end change_contact_rejected_status;
 
 
 
 
 
 
 
 
 
function get_contract_desc 	         (p_contract_id in number) return varchar2
is
cursor c3 is 	select 	dsp_code Contract_Code, company_CODE, Start_Date Contract_Date
		from	lgs_contracts
		where 	id = p_contract_id;
c3r c3%rowtype;
cursor c4 is 	select 	dsp_code Company_Code, substr(e_name,1,25) Company_Name
		from	PRJ_COMPANIES
		where 	code = c3r.company_code;
c4r c4%rowtype;
v_out varchar2(4000);
begin
	open c3; fetch c3 into c3r;
	open c4; fetch c4 into c4r;
 
		v_out := c4r.Company_name||' -- '||c3r.Contract_Code;
 
 
	close c3;
	close c4;
	return v_out;
 
end get_contract_desc;
function get_project_desc		(p_project_id in number)		return varchar2
is
cursor c2 is 	select 	L_DESCRIPTION Project_Name, contract_id
		from	lgs_projects
		where 	id = p_project_id;
c2r c2%rowtype;
v_out varchar2(4000);
begin
 
	open c2; fetch c2 into c2r;
 
	v_out := get_contract_desc(c2r.contract_id)||' -- '||c2r.Project_Name;
 
	close c2;
return v_out;
end get_project_desc;
function get_project_cost		(p_project_id in number)		return number
is
cursor c1 is 	select 	id
		from	PRJ_PROJECTWORK_TYPES
		where  	proj_id = p_project_id;
c1r c1%rowtype;
 
v_out number := 0;
begin
	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;
 
		v_out := v_out + get_project_work_enrollment(c1r.id);
 
	end loop;
	close c1;
return v_out;
end get_project_cost;
function get_project_work_estimate	(p_pw 			in number)		return varchar2
as
v_out 	varchar2(2000);
cursor c1 is 		select (nvl(e.no_of_days,0) +nvl(e.on_site_days*v_on_site_factor,0)) days, g.name
			from   prj_estimated_dets e,PRJ_PROJECTWORK_TYPES t, prj_work_types w, PRJ_SALARY_GRAdes g
			where  e.PROJECT_WORKTYPE_ID = t.id
			and 	w.id = WRKTYP_ID
			and         e.scale = g.id
			and	t.id = p_pw;
c1r c1%rowtype;
i number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
		if i = 0 then v_out := c1r.name ||'('||c1r.days||')'; else
		v_out := v_out ||' -- '|| c1r.name ||'('||c1r.days||')';
		end if;
i := i+1;
end loop;
close c1;
return v_out;
end get_project_work_estimate;
function get_project_work_enrollment  (p_pw			in number)		return number
is
cursor c1 is 	select 	id
		from	PRJ_PROJECTWORK_TYPES
		where  	id = p_pw;
c1r c1%rowtype;
cursor c2 is 	select 	(no_of_hours+nvl(on_site_days*v_on_site_factor,0))/v_no_of_hours_per_day days, employee,
			project_pck.get_emp_salary_to(employee, from_date)/v_no_of_days_per_month sal_per_day
		from	PRJ_ENROLLED_DETS
		where      PROJECT_WORKTYPE_ID = c1r.id;
c2r c2%rowtype;
 
v_out number := 0;
begin
	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;
		open c2;
		loop fetch c2 into c2r;
		exit when c2%notfound;
 
					v_out := v_out + c2r.sal_per_day*c2r.days/v_salary_scale;
 
		end loop;
		close c2;
	end loop;
	close c1;
return v_out;
end get_project_work_enrollment  ;
function get_project_estimate	(p_project_id 		in number)		return number
is
cursor c1 is 	select 	id
		from	PRJ_PROJECTWORK_TYPES
		where  	proj_id = p_project_id;
c1r c1%rowtype;
 
v_out number := 0;
begin
	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;
 
		v_out := v_out + get_project_work_estimate_num(c1r.id);
 
	end loop;
	close c1;
return v_out;
end get_project_estimate;
function get_project_remaining	(p_project_id 		in number)		return number
is
cursor c1 is 	select 	id
		from	PRJ_PROJECTWORK_TYPES
		where  	proj_id = p_project_id;
c1r c1%rowtype;
 
v_out number := 0;
begin
	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;
 
		v_out := v_out + get_project_work_remaining_num(c1r.id);
 
	end loop;
	close c1;
return v_out;
end get_project_remaining;

function get_project_work_estimate_num(p_pw 			in number, p_date date default sysdate)		return number
as
v_out 	number :=0;
cursor c1 is 		select 	(nvl(e.no_of_days,0) +nvl(e.on_site_days,0)) days--,
				--(get_scale_salary_to(e.scale, get_project_pricing_date(ppt.proj_id))/v_no_of_days_per_month)/v_salary_scale sal
			from   PRJ_PROJECTWORK_TYPES ppt,	prj_estimated_dets e
			where  	e.PROJECT_WORKTYPE_ID = p_pw
            and     e.ft_date = (select max(e1.ft_date)
            from prj_estimated_dets e1
            where e1.project_worktype_id = p_pw
            and e1.ft_date <= p_date
            AND nvl(e1.EST_TYPE,1) <> 10020
            )
			and 	 e.PROJECT_WORKTYPE_ID = ppt.id 
      AND nvl(e.EST_TYPE,1) <> 10020;
      
     
c1r c1%rowtype;
i number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
		-- v_out := v_out + c1r.days*c1r.sal;
		v_out := v_out + c1r.days;
i := i+1;
end loop;
close c1;
return v_out;
end get_project_work_estimate_num;
function get_project_work_remaining_num(p_pw 			in number, p_date date default sysdate)		return number
as
v_out 	number :=0;
cursor c1 is 		select 	(nvl(e.no_of_days,0) +nvl(e.on_site_days,0)) days ,
				(get_scale_salary_to(e.scale, get_project_pricing_date(ppt.proj_id))/v_no_of_days_per_month)/v_salary_scale sal
			from   PRJ_PROJECTWORK_TYPES ppt,	prj_estimated_dets e 
			where  	e.PROJECT_WORKTYPE_ID = p_pw
			and 	 e.PROJECT_WORKTYPE_ID = ppt.id 
            and e.est_type = 10020
              and     e.ft_date = (select max(e1.ft_date)
            from prj_estimated_dets e1
            where e1.project_worktype_id = p_pw
            and e1.ft_date <= sysdate
            AND nvl(e1.EST_TYPE,1) = 10020
            );
c1r c1%rowtype;
i number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
		-- v_out := v_out + c1r.days*c1r.sal;
		v_out := v_out + c1r.days;
i := i+1;
end loop;
close c1;
--if v_out < 0 then 
return v_out;
--else 
  --return round(get_task_enrollment(p_pw,'0','d'),2) - v_out;
  --end if;
end get_project_work_remaining_num;


function get_project_work_add_num(p_pw 			in number, p_date date default sysdate)		return number
as
v_out 	number :=0;
cursor c1 is 		select 	(nvl(e.no_of_days,0) +nvl(e.on_site_days,0)) days ,
				(get_scale_salary_to(e.scale, get_project_pricing_date(ppt.proj_id))/v_no_of_days_per_month)/v_salary_scale sal
			from   PRJ_PROJECTWORK_TYPES ppt,	prj_estimated_dets e 
			where  	e.PROJECT_WORKTYPE_ID = p_pw
             and     e.ft_date = (select max(e1.ft_date)
            from prj_estimated_dets e1
            where e1.project_worktype_id = p_pw
            and e1.ft_date <= p_date
             and e1.est_type = 10000
            )
			and 	 e.PROJECT_WORKTYPE_ID = ppt.id 
            and e.est_type = 10000;
c1r c1%rowtype;
i number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
		-- v_out := v_out + c1r.days*c1r.sal;
		v_out := v_out + c1r.days;
i := i+1;
end loop;
close c1;
--if v_out < 0 then 
return v_out;
--else 
  --return round(get_task_enrollment(p_pw,'0','d'),2) - v_out;
  --end if;
end get_project_work_add_num;

function get_project_work_init_num(p_pw 			in number, p_date date default sysdate)		return number
as
v_out 	number :=0;
cursor c1 is 		select 	(nvl(e.no_of_days,0) +nvl(e.on_site_days,0)) days ,
				(get_scale_salary_to(e.scale, get_project_pricing_date(ppt.proj_id))/v_no_of_days_per_month)/v_salary_scale sal
			from   PRJ_PROJECTWORK_TYPES ppt,	prj_estimated_dets e
			where  	e.PROJECT_WORKTYPE_ID = p_pw
             and     e.ft_date = (select max(e1.ft_date)
            from prj_estimated_dets e1
            where e1.project_worktype_id = p_pw
            and e1.ft_date <= p_date
            )
			and 	 e.PROJECT_WORKTYPE_ID = ppt.id 
            and e.est_type = 1;
c1r c1%rowtype;
i number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
		-- v_out := v_out + c1r.days*c1r.sal;
		v_out := v_out + c1r.days;
i := i+1;
end loop;
close c1;
--if v_out < 0 then 
return v_out;
--else 
  --return round(get_task_enrollment(p_pw,'0','d'),2) - v_out;
  --end if;
end get_project_work_init_num;

function get_project_work_sys_rem_num(p_pw 			in number, p_int_code varchar2 default null)		return number
as
v_out 	number :=0;
cursor c1 is 		
            select 	e.PROJECT_WORKTYPE_ID  ,(project_pck.get_project_work_init_num(p_pw)+project_pck.get_project_work_add_num(p_pw))-project_pck.get_task_enrollment(p_pw,'0','d') days
			from   PRJ_PROJECTWORK_TYPES ppt,prj_work_types wt,	prj_estimated_dets e 
			where  	e.PROJECT_WORKTYPE_ID = p_pw
			and 	 e.PROJECT_WORKTYPE_ID = ppt.id 
            and     ppt.WRKTYP_ID = wt.id
            and wt.int_code =nvl( p_int_code, wt.int_code);
           -- group by e.PROJECT_WORKTYPE_ID;
c1r c1%rowtype;
i number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
		-- v_out := v_out + c1r.days*c1r.sal;
		v_out := v_out + c1r.days;
i := i+1;
end loop;
close c1;
--if v_out < 0 then 
return v_out;
--else 
  --return round(get_task_enrollment(p_pw,'0','d'),2) - v_out;
  --end if;
end get_project_work_sys_rem_num;

function get_contract_estimate 	(p_contract_id 		in number)		return number
as
cursor c1	 is	select 	id
		from	lgs_projects
		where 	contract_id = p_contract_id;
c1r c1%rowtype;
v_out 	number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
 
		v_out := v_out + get_project_estimate(c1r.id);
 
end loop;
close c1;
return v_out;
end get_contract_estimate;

function get_contract_remaining 	(p_contract_id 		in number)		return number
as
cursor c1	 is	select 	id
		from	lgs_projects
		where 	contract_id = p_contract_id;
c1r c1%rowtype;
v_out 	number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
 
		v_out := v_out + get_project_remaining(c1r.id);
 
end loop;
close c1;
return v_out;
end get_contract_remaining;
function get_contract_enrollment	(p_contract_id 		in number)		return number
as
cursor c1	 is	select 	id
		from	lgs_projects
		where 	contract_id = p_contract_id;
c1r c1%rowtype;
v_out 	number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
 
		v_out := v_out + get_project_cost(c1r.id);
 
end loop;
close c1;
return v_out;
end get_contract_enrollment;
function get_contract_id			(p_project_id		in number)		return number
as
	cursor c1 is 	select 	contract_id
			from	lgs_projects
			where 	id = p_project_id;
	c1r c1%rowtype;
 
begin
open c1;
fetch c1 into c1r;
return c1r.contract_id;
close c1;
end get_contract_id;
function get_project_task_expences		(p_pw			in number)		return number
as
cursor c1 is 	select 	sum(amount/project_pck.get_rate(currency,day)) exp
		from	prj_expences
		where      task_id = p_pw;
c1r c1%rowtype;
begin
open c1;
fetch c1 into c1r;
return c1r.exp;
close c1;
end get_project_task_expences;
function get_project_expences		(p_project_id		in number)		return number
as
cursor c1 is 	select 	sum(amount/project_pck.get_rate(currency,day)) exp
		from	prj_expences
		where 	project_id = p_project_id;
c1r c1%rowtype;
begin
open c1;
fetch c1 into c1r;
return c1r.exp;
close c1;
end get_project_expences;
function get_contract_expences		(p_contract_id		in number)		return number
as
cursor c1 is 	select 	sum(amount/project_pck.get_rate(currency,day)) exp
		from	prj_expences
		where 	contract_id = p_contract_id;
c1r c1%rowtype;
begin
open c1;
fetch c1 into c1r;
return c1r.exp;
close c1;
end get_contract_expences;
function get_rate				(p_currency_id		in number, p_day_in	in date)		return number
as
cursor c1 is 	select 	rate
		from	prj_currency_rates
		where 	currency_id = p_currency_id
		and	trunc(day) = (select max(trunc(day)) from prj_currency_rates where currency_id = p_currency_id and trunc(day) <= trunc(p_day_in));
c1r c1%rowtype;
cursor c2 is 	select 	rate
		from	prj_currency_rates
		where 	currency_id = p_currency_id
		and	trunc(day) = (select min(trunc(day)) from prj_currency_rates where currency_id = p_currency_id and trunc(day) >=  trunc(p_day_in));
c2r c2%rowtype;
begin
open c1;
fetch c1 into c1r;
	if c1r.rate is not null then return c1r.rate;
	else 	open c2;
		fetch c2 into c2r;
		return c2r.rate;
		close c2;
	end if;
close c1;
end get_rate;
function get_project_module (p_project_id in number) return varchar2
as
cursor c1 is 	select 	module
		from	lgs_projects
		where 	id = p_project_id;
c1r c1%rowtype;
v_out varchar2(50);
begin
open c1;
fetch c1 into c1r;
v_out := c1r.module;
close c1;
return v_out;
end get_project_module;
function get_emp_salary_grade (p_emp_code in varchar2, p_day in date) return number
as
cursor c1 is 	select max(change_date) cd
		from    PRJ_EMPLOYEE_SALARY_history
		where 	emp_code = p_emp_code
		and 	trunc(change_date) <= trunc(p_day);
c1r c1%rowtype;
cursor c2 is 	select salary_grade_id, id, change_date
		from    PRJ_EMPLOYEE_SALARY_history
		where 	emp_code = p_emp_code
		and 	trunc(change_date) = trunc(c1r.cd)
		order by id  desc;
c2r c2%rowtype;
cursor c3 is 	select salary_grade_id
		from    PRJ_EMPLOYEE_SALARY_history
		where 	emp_code = p_emp_code
		and change_date = (select min(change_date)
				from PRJ_EMPLOYEE_SALARY_history
				where emp_code = p_emp_code) ;
c3r c3%rowtype;
v_out number;
begin
 
open c1;
fetch c1 into c1r;
	open c2;
	fetch c2 into c2r;
	v_out := c2r.salary_grade_id;
	close c2;
close c1;
if v_out is null then
		open c3;
		fetch c3 into c3r;
		v_out := c3r.salary_grade_id;
		close c3;
end if;
return v_out;
end get_emp_salary_grade;
function get_emp_salary_to (p_emp_code in varchar2, p_day in date) return number
as
cursor c1(p_salary_grade_id in number) is
		select 	max(change_date) cd
		from    	prj_SALARY_GRADES_history
		where 	id = p_salary_grade_id
		and 	trunc(change_date) <= trunc(p_day);
c1r c1%rowtype;
cursor c2(p_salary_grade_id in number) is
		select 	to_salary
		from    	prj_SALARY_GRADES_history
		where 	id = p_salary_grade_id
		and 	trunc(change_date) = trunc(c1r.cd)
		order by id  desc;
c2r c2%rowtype;
cursor c3(p_salary_grade_id in number) is
		select 	to_salary
		from    	prj_SALARY_GRADES_history
		where 	id  = p_salary_grade_id
		and 	change_date = (select min(change_date)
				from prj_SALARY_GRADES_history
				where id = p_salary_grade_id) ;
c3r c3%rowtype;
v_out number;
v_salary_grade_id number ;
begin
v_salary_grade_id := get_emp_salary_grade(p_emp_code, p_day);
open c1(v_salary_grade_id);
fetch c1 into c1r;
	open c2(v_salary_grade_id);
	fetch c2 into c2r;
	v_out := c2r.to_salary;
	close c2;
if v_out is null then
	open c3(v_salary_grade_id);
	fetch c3 into c3r;
	v_out := c3r.to_salary;
	close c3;
end if;
return v_out;
end get_emp_salary_to;
function get_scale_salary_to (p_scale_id in number, p_day in date) return number
as
cursor c1 is
		select 	max(change_date) cd
		from    	prj_SALARY_GRADES_history
		where 	id = p_scale_id
		and 	trunc(change_date) <= trunc(p_day);
c1r c1%rowtype;
cursor c2 is
		select 	to_salary
		from    	prj_SALARY_GRADES_history
		where 	id = p_scale_id
		and 	trunc(change_date) = trunc(c1r.cd)
		order by id  desc;
c2r c2%rowtype;
cursor c3 is
		select 	to_salary
		from    	prj_SALARY_GRADES_history
		where 	id  = p_scale_id
		and 	change_date = (select min(change_date)
				from prj_SALARY_GRADES_history
				where id = p_scale_id) ;
c3r c3%rowtype;
v_out number;
begin
open c1;
fetch c1 into c1r;
	open c2;
	fetch c2 into c2r;
	v_out := c2r.to_salary;
	close c2;
if v_out is null then
	open c3;
	fetch c3 into c3r;
	v_out := c3r.to_salary;
	close c3;
end if;
return v_out;
end get_scale_salary_to;
function get_project_pricing_date (p_project_id in number) return date
as
cursor c1 is 	select 	pricing_date
		from 	lgs_projects
		where 	id = p_project_id;
c1r c1%rowtype;
begin
open c1;
fetch c1 into c1r;
return c1r.pricing_date;
close c1;
end get_project_pricing_date;
function get_project_wrktype_os_days(p_project_id in number, p_wrtktype in number, p_int_code in varchar2 default null, p_date date default sysdate ) return number
as
cursor c1 is 		select 	sum(nvl(e.on_site_days,0)) days
			from   	prj_estimated_dets e,prj_work_types wt, PRJ_PROJECTWORK_TYPES ppt
			where  	ppt.proj_id = p_project_id
            and     ppt.WRKTYP_ID = wt.id
			and 	ppt.id = e.PROJECT_WORKTYPE_ID
            and ppt.id =p_wrtktype
            and wt.int_code = p_int_code;
    c1r c1%rowtype;
begin
    open c1;
    fetch c1 into c1r;
       return nvl(c1r.days,0);
    close c1;
 
end get_project_wrktype_os_days;
function get_project_management_est (p_id in number) return number
as 
    cursor c1 is select sum(nvl(e.no_of_days,0)) days
    from prj_estimated_dets e, prj_projectwork_types ppt
    where 	ppt.id = e.PROJECT_WORKTYPE_ID
    and ppt.id = p_id
    and e.scale = 14 ;
    c1r c1%rowtype;

begin

open c1 ;
fetch c1 into c1r;
return nvl(c1r.days,0);
close c1;
end get_project_management_est;
function get_project_on_site_days(p_project_id in number) return number
as
cursor c1 is 		select 	sum(nvl(e.on_site_days,0)) days
			from   	prj_estimated_dets e, PRJ_PROJECTWORK_TYPES ppt
			where  	ppt.proj_id = p_project_id
			and 	ppt.id = e.PROJECT_WORKTYPE_ID;
c1r c1%rowtype;
begin
open c1;
fetch c1 into c1r;
return(c1r.days);
close c1;
end get_project_on_site_days;
function prj_costing (p_Project_id in number) return number
as
cursor c1 is select  contract_id
		from lgs_projects
		where id = p_project_id;
c1r c1%rowtype;
cursor c2 is select   perdium,
		days_per_ticket days,
 		ticket_value ticket,
 		Hotel_rate hotel,
 		car_rental_per_day  car,
		nvl(international, 'N') Int,
		id
	from lgs_contracts
	where id = c1r.contract_id;
c2r c2%rowtype;
v_out varchar2(4000 char);
v_on_site_days 	number :=0;
v_man_weeks 	number :=0;
v_hotel_days	number :=0;
v_num_of_tickets 	number :=0;
v_total		number :=0;
begin
open c1;
fetch c1 into c1r;
 
	open c2;
	fetch c2 into c2r;
		v_on_site_days := project_pck.get_project_on_site_days(p_project_id);
		if c2r.int = 'Y' then 	v_out := 'Number of On Site Days is :'||v_on_site_days;
				if mod(v_on_site_days,5) <> 0 then
					if v_on_site_days > 5 then
						v_out := v_out ||'  Number of Man Weeks :'||to_char(round(v_on_site_days/5)  );
						v_man_weeks := round(v_on_site_days/5)  ;
					else
						v_out := v_out ||'  Number of Man Weeks :1' ;
						v_man_weeks := 1;
					end if;
				else
					v_out := v_out ||'  Number of Man Weeks :'||round(v_on_site_days/5) ;
					v_man_weeks := round(v_on_site_days/5);
 
				end if;
 
 
			v_hotel_days := v_man_weeks*7;
 
			v_num_of_tickets := ceil(v_hotel_days/c2r.days);
 
 
v_out := v_out || 'Hotel Days :'||to_char(v_hotel_days)||' Number of Tickets :'||to_char(v_num_of_tickets)||' ---- '||to_char(c2r.id);
 
		end if;
v_total := v_hotel_days * c2r.perdium + v_hotel_days*c2r.car + v_hotel_days*c2r.hotel + v_num_of_tickets*c2r.ticket;
 
	close c2;
close c1;
 
 
return v_total;
end prj_costing ;
function contract_costing (p_contract_id in number) return number
as
cursor c1 is select id from lgs_projects where contract_id = p_contract_id;
c1r c1%rowtype;
v_out number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
 
	v_out := v_out + prj_costing(c1r.id);
 
end loop;
close c1;
return v_out;
end contract_costing;
procedure prj_contracts_view
as
begin
delete contracts;
commit;
insert into contracts
  Select  co.id,
 co.dsp_code ,
 com.e_name ,
 co.start_date,
 co.end_date,
 ct.name Type,
 cs.name Stage,
 decode(co.finalized,'Y','Yes','No'),
 project_pck.get_contract_estimate(co.id) ,
 co.usd_value,
 project_pck.get_contract_expences(co.id),
 project_pck.get_contract_enrollment(co.id),
 project_pck.get_contract_estimate(co.id) - project_pck.get_contract_enrollment(co.id)
from  lgs_contracts co, LOGOS.lgs_companies com,  prj_contract_stages cs, PRJ_CONTRACT_TYPES ct
where co.company_code = com.code
and   co.CONTRACT_TYPE_ID(+) = ct.id
and   co.CONTRACT_STAGE_ID = cs.id;
commit;
end prj_contracts_view;
function get_project_days		(p_project_id in number,p_return_what in varchar2) return number
as
cursor c1 is
		select sum(estimated_days) Est_days, sum(enrolled_days) enr_days
		from prj_projectwork_types
		where proj_id = p_project_id;
c1r c1%rowtype;
begin
open c1;
fetch c1 into c1r;
		if p_return_what = 'w' then return c1r.enr_days; else return
		project_pck.get_project_estimate(p_project_id)	;
		end if;
close c1;
 
 
end get_project_days;

function get_project_remaining_days		(p_project_id in number,p_return_what in varchar2) return number
as
cursor c1 is
		select sum(estimated_days) Est_days, sum(enrolled_days) enr_days
		from prj_projectwork_types
		where proj_id = p_project_id;
c1r c1%rowtype;
begin
open c1;
fetch c1 into c1r;
		if p_return_what = 'w' then return c1r.enr_days; else return
		project_pck.get_project_remaining(p_project_id)	;
		end if;
close c1;
 
 
end get_project_remaining_days;


function get_task_enrollment (p_pw	in number, p_office_or_onsite in varchar2, p_hrs_or_days varchar2) return number
as
cursor c1 is 	 select sum(nvl(NO_OF_HOURS,0)) noh, sum(nvl(ON_SITE_DAYS,0)) osd
                 from PRJ_ENROLLED_DETS
                 where PROJECT_WORKTYPE_ID =p_pw;
c1r c1%rowtype;
v_out	number :=0;
p_div	number :=1;
begin
if p_hrs_or_days  = 'h' /*hours*/ then p_div := 1;
else p_div := v_no_of_hours_per_day;
end if;
open c1;
fetch c1 into c1r;
 
	if p_office_or_onsite = 'o' /* Office*/ then v_out := c1r.noh;
	elsif p_office_or_onsite = 's' /* site */ then v_out := c1r.osd;
	else v_out := c1r.noh + c1r.osd;
	end if;
 
close c1;
return nvl(v_out/p_div,0);
end get_task_enrollment;
function get_task_project_enrollment (p_pw	in number, p_office_or_onsite in varchar2, p_hrs_or_days varchar2) return number
as
cursor c1 is 	select 	id
		from 	prj_projectwork_types
		where 	proj_id = p_pw;
c1r c1%rowtype;
v_out number := 0;
begin
	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;
 
	v_out := v_out + get_task_enrollment(c1r.id, p_office_or_onsite, p_hrs_or_days);
 
	end loop;
	close c1;
 
return nvl(v_out,0);
end get_task_project_enrollment;
function get_task_contract_enrollment (p_pw	in number, p_office_or_onsite in varchar2, p_hrs_or_days varchar2) return number
as
cursor c1 is 	select 	id
		from 	lgs_projects
		where 	contract_id = p_pw;
c1r c1%rowtype;
v_out number := 0;
begin
	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;
 
	v_out := v_out + get_task_project_enrollment(c1r.id, p_office_or_onsite, p_hrs_or_days);
 
	end loop;
	close c1;
 
return nvl(v_out,0);
end get_task_contract_enrollment;
function get_work_type_desc (p_id in number) return varchar2
as
cursor c1 is 	select e_name||' ('||from_grade||')' d, id r
		from   prj_work_types
		where id = p_id;
c1r c1%rowtype;
begin
open c1; fetch c1 into c1r; return c1r.d; close c1;
end get_work_type_desc;
function get_if_prj_module_in_use (p_module_code in varchar2) return varchar2
as
v_out varchar2(5 Char);
v_cnt number :=0;
begin
	select count(*)
	into     v_cnt
	from    css_project_tasks
	where  module_code = p_module_code;
 
if v_cnt = 0 then return ''; else return '*'; end if;
 
end get_if_prj_module_in_use;
function get_if_contract_disp (p_contract_id in number, p_user_in varchar2) return number
as
v_out number;
v_temp number :=0;
begin
	select 	count(*)
	into	v_out
	from 	prj_user_contracts
	where         contract_id = p_contract_id
	and	emp_code = (select emp_code from prj_employee_salary where UPPER(user_name) = UPPER(decode(p_user_in,'JOYCE','EZGHEIB','ELIE','DBAZZI','DIANA','ROUWAIDA',p_user_in)));
       
        select count(*) into v_out
        FROM prj_group_employees
   WHERE PGE_PGR_ID IN (
   SELECT T.CODE FROM LGS_CONTRACTS C, LOGOS.LGS_COMPANIES COM, LOGOS.LGS_BUS_TYPES T
   WHERE C.COMPANY_CODE = COM.CODE
   AND COM.BUS_TYPE = T.CODE
   AND C.ID = p_contract_id) AND PGE_EMPLOYEE = upper(p_user_in);
   /*
         from prj_group_employees g1, LGS_CONTRACTS A
        where 
        a.id = p_contract_id and g1.pge_employee = a.who_created 
        and upper(g1.pge_employee) = upper(p_user_in);
        
        
       
        from prj_group_employees g1, LGS_CONTRACTS A
        where 
        a.id = p_contract_id and g1.pge_employee = a.who_created 
        and upper(g1.pge_employee) = upper(p_user_in);
       /* from prj_group_employees g1 
        where 
        g1.pge_pgr_id in (select g2.pge_pgr_id from prj_group_employees g2, lgs_contracts a
        where a.id = p_contract_id and g2.pge_employee = a.who_created )
        and upper(g1.pge_employee) = upper(p_user_in);*/
	select 	count(*)
	into 	v_temp
	from  	lgs_contracts
	where 	id = p_contract_id
	and             upper(who_created) = upper(p_user_in);
  
  if nvl(v_temp,0) < 1 then
 if upper(p_user_in) in( 'ELIE','RITAM') THEN
  select count(*) INTO v_temp
        from lgs_contracts
        where id = p_contract_id
        and UPPER(company_code) in ('874','12700');
 end if;
end if;
if 	p_user_in in ('ADMIN','FARES','WADIH','NAJD') then return 1;--, 'MSALLOUM','DBAZZI','HYAM','JOYCE')  then return 1;
/* ,'DBAZZI','HYAM','JOYCE')*/
elsif            v_temp > 0 then return 1;
else
			if v_out > 0 then return 1; else return 0; end if;
end if;
end get_if_contract_disp;
function get_if_prj_worktype_disp (p_id in number, p_show_zeros in number) return number
as
v_out number;
v_out1 number;
v_out2 number;
begin
	if 	p_show_zeros =  1 then return 1;
	else
			select count(*) into v_out1 from prj_estimated_dets where project_worktype_id = p_id;
			select count(*) into v_out2 from prj_enrolled_dets   where project_worktype_id = p_id;
		if v_out1 + v_out2 = 0 then return 0; else return 1; end if;
 
	end if;
end get_if_prj_worktype_disp ;
procedure delete_contract(p_contract_id in number, p_who_deleted in varchar2)
as
begin
-- Create history for rollback
insert into lgs_deleted_contracts (ID,DSP_CODE ,COMPANY_CODE,START_DATE,END_DATE,USD_VALUE,FINALIZED,
CONTRACT_TYPE_ID       ,CONTRACT_STAGE_ID      ,DISPLAY_IN_CONTRACTS   ,PRICING_DATE           ,PERDIUM ,
DAYS_PER_TICKET        ,TICKET_VALUE           ,HOTEL_RATE             ,CAR_RENTAL_PER_DAY     ,INTERNATIONAL          ,
WHO_CREATED   ,date_deleted, who_deleted         )
select ID,DSP_CODE ,COMPANY_CODE,START_DATE,END_DATE,USD_VALUE,FINALIZED,
CONTRACT_TYPE_ID       ,CONTRACT_STAGE_ID      ,DISPLAY_IN_CONTRACTS   ,PRICING_DATE           ,PERDIUM ,
DAYS_PER_TICKET        ,TICKET_VALUE           ,HOTEL_RATE             ,CAR_RENTAL_PER_DAY     ,INTERNATIONAL     ,
WHO_CREATED    , sysdate, p_who_deleted
from lgs_contracts where id = p_contract_id;
insert into lgs_deleted_projects (L_DESCRIPTION          ,ID                     ,DSP_CODE               ,END_DATE
,START_DATE             ,CONTRACT_ID            ,INT_CODE               ,MODULE                 ,NEW_IMPLEMENTATION
,MAINTENANCE            ,PRICING_DATE           ,ACTIVE                 ,SEQ                    )
select L_DESCRIPTION          ,ID                     ,DSP_CODE               ,END_DATE
,START_DATE             ,CONTRACT_ID            ,INT_CODE               ,MODULE                 ,NEW_IMPLEMENTATION
,MAINTENANCE            ,PRICING_DATE           ,ACTIVE                 ,SEQ
from lgs_projects where contract_id = p_contract_id;
 
insert into prj_deleted_estimated_dets (ID                     ,PROJECT_WORKTYPE_ID    ,NO_OF_DAYS             ,
SCALE                  ,ON_SITE_DAYS           ,NO_OF_TICKETS          ,MODULE                 ,NOTES                  ,EMPLOYEE               )
select ID                     ,PROJECT_WORKTYPE_ID    ,NO_OF_DAYS             ,
SCALE                  ,ON_SITE_DAYS           ,NO_OF_TICKETS          ,MODULE                 ,NOTES                  ,EMPLOYEE
from prj_estimated_dets where PROJECT_WORKTYPE_ID  in (select id from prj_projectwork_types
						where proj_id IN (select id from lgs_projects where contract_id = p_contract_id));
insert into prj_deleted_enrolled_dets (ID                             ,PROJECT_WORKTYPE_ID            ,FROM_DATE                      ,NO_OF_HOURS,
EMPLOYEE                      ,CUSTOMER_CERTIFIED             ,NOTES                          ,ON_SITE_DAYS                   ,MODULE                         ,
FROM_CSS                       ,CSS_SERIAL                     )
select ID                             ,PROJECT_WORKTYPE_ID            ,FROM_DATE                      ,NO_OF_HOURS,
EMPLOYEE                      ,CUSTOMER_CERTIFIED             ,NOTES                          ,ON_SITE_DAYS                   ,MODULE                         ,
FROM_CSS                       ,CSS_SERIAL                     from prj_enrolled_dets
where PROJECT_WORKTYPE_ID  in (select id from prj_projectwork_types
						where proj_id IN (select id from lgs_projects where contract_id = p_contract_id));
 
insert into prj_deleted_prj_work_types (ID                     ,GRADE                  ,ESTIMATED_DAYS         ,ENROLLED_DAYS          ,
DESCRIPTION            ,WRKTYP_ID              ,PROJ_ID                ,QTY                    ,SEQ                    )
select ID                     ,GRADE                  ,ESTIMATED_DAYS         ,ENROLLED_DAYS          ,
DESCRIPTION            ,WRKTYP_ID              ,PROJ_ID                ,QTY                    ,SEQ
from prj_projectwork_types
where proj_id in (select id from lgs_projects where contract_id = p_contract_id);
delete prj_enrolled_dets  where PROJECT_WORKTYPE_ID  in (select id from prj_projectwork_types
						where proj_id IN (select id from lgs_projects where contract_id = p_contract_id));
delete prj_estimated_dets  where PROJECT_WORKTYPE_ID  in (select id from prj_projectwork_types
						where proj_id IN (select id from lgs_projects where contract_id = p_contract_id));
delete prj_projectwork_types where proj_id in (select id from lgs_projects where contract_id = p_contract_id);
delete lgs_projects where contract_id = p_contract_id;
commit;
 
end delete_contract;
-- New
 
procedure delete_project(p_contract_id in number, p_project_id in number, p_who_deleted in varchar2)
as
begin
-- Create history for rollback
 
insert into lgs_deleted_projects (L_DESCRIPTION          ,ID                     ,DSP_CODE               ,END_DATE
,START_DATE             ,CONTRACT_ID            ,INT_CODE               ,MODULE                 ,NEW_IMPLEMENTATION
,MAINTENANCE            ,PRICING_DATE           ,ACTIVE                 ,SEQ                    )
select L_DESCRIPTION          ,ID                     ,DSP_CODE               ,END_DATE
,START_DATE             ,CONTRACT_ID            ,INT_CODE               ,MODULE                 ,NEW_IMPLEMENTATION
,MAINTENANCE            ,PRICING_DATE           ,ACTIVE                 ,SEQ
from lgs_projects where contract_id = p_contract_id
and   id = p_project_id;
 
insert into prj_deleted_estimated_dets (ID                     ,PROJECT_WORKTYPE_ID    ,NO_OF_DAYS             ,
SCALE                  ,ON_SITE_DAYS           ,NO_OF_TICKETS          ,MODULE                 ,NOTES                  ,EMPLOYEE               )
select ID                     ,PROJECT_WORKTYPE_ID    ,NO_OF_DAYS             ,
SCALE                  ,ON_SITE_DAYS           ,NO_OF_TICKETS          ,MODULE                 ,NOTES                  ,EMPLOYEE
from prj_estimated_dets where PROJECT_WORKTYPE_ID  in (select id from prj_projectwork_types
						where proj_id = p_project_id);
insert into prj_deleted_enrolled_dets (ID                             ,PROJECT_WORKTYPE_ID            ,FROM_DATE                      ,NO_OF_HOURS,
EMPLOYEE                      ,CUSTOMER_CERTIFIED             ,NOTES                          ,ON_SITE_DAYS                   ,MODULE                         ,
FROM_CSS                       ,CSS_SERIAL                     )
select ID                             ,PROJECT_WORKTYPE_ID            ,FROM_DATE                      ,NO_OF_HOURS,
EMPLOYEE                      ,CUSTOMER_CERTIFIED             ,NOTES                          ,ON_SITE_DAYS                   ,MODULE                         ,
FROM_CSS                       ,CSS_SERIAL                     from prj_enrolled_dets
where PROJECT_WORKTYPE_ID  in (select id from prj_projectwork_types
						where proj_id = p_project_id);
 
insert into prj_deleted_prj_work_types (ID                     ,GRADE                  ,ESTIMATED_DAYS         ,ENROLLED_DAYS          ,
DESCRIPTION            ,WRKTYP_ID              ,PROJ_ID                ,QTY                    ,SEQ                    )
select ID                     ,GRADE                  ,ESTIMATED_DAYS         ,ENROLLED_DAYS          ,
DESCRIPTION            ,WRKTYP_ID              ,PROJ_ID                ,QTY                    ,SEQ
from prj_projectwork_types
where proj_id = p_project_id;
 
delete prj_enrolled_dets  where PROJECT_WORKTYPE_ID  in (select id from prj_projectwork_types
						where proj_id = p_project_id);
delete prj_estimated_dets  where PROJECT_WORKTYPE_ID  in (select id from prj_projectwork_types
						where proj_id = p_project_id);
delete prj_projectwork_types where proj_id = p_project_id;
delete lgs_projects where id = p_project_id;
commit;
 
end delete_project;
-- End New
/* This is for the Work Still Needed Report */
function  Get_work_still_needed (p_pw 			in number)		return number
as
v_still_needed number := 0;
v_estimate number := 0;
v_enrolled number := 0;
 
begin
v_estimate := project_pck.get_project_work_estimate_num(p_pw);
v_enrolled := project_pck.get_task_enrollment(p_pw,'0','d');
 
if v_enrolled >= v_estimate then v_still_needed :=0;
else v_still_needed := v_estimate - v_enrolled ;
end if;
return v_still_needed;
end Get_work_still_needed;
/* End Work Still Needed */
end project_pck;

/
