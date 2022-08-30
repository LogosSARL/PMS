--------------------------------------------------------
--  DDL for View CONTRACT_WORK
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."CONTRACT_WORK" ("CONTRACT_ID", "COMPANY", "WORK", "SEQ", "INHOUSE", "ONSITE", "TOTAL") AS 
  select cn.id Contract_id, c.e_name Company, wt.e_name Work,
wt.seq, sum(no_of_hours/project_param.get_hours_per_day) InHouse,
sum(on_site_days/project_param.get_hours_per_day) OnSite,
sum(no_of_hours/project_param.get_hours_per_day) + sum(on_site_days/project_param.get_hours_per_day) Total
from    lgs_contracts cn,prj_companies c, prj_work_types wt, prj_enrolled_dets en,
 lgs_projects pp, prj_projectwork_types ppt
where   c.code  = cn.company_code
and     cn.id  = pp.contract_id
and  wt.id  = ppt.WRKTYP_ID
and    en.PROJECT_WORKTYPE_ID    = ppt.id
and    ppt.proj_id = pp.id
group by cn.id, c.e_name,wt.e_name , wt.seq;
