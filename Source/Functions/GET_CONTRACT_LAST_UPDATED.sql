--------------------------------------------------------
--  DDL for Function GET_CONTRACT_LAST_UPDATED
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."GET_CONTRACT_LAST_UPDATED" (p_contract_id in number) return date
as
cursor c1 is  select  max(EST_DATE) max_date
  from PRJ_ESTIMATED_DETS
  where   PROJECT_WORKTYPE_ID in ( select  ppt.id
       from    prj_projectwork_types ppt
       where   ppt.proj_id in (select id from LGS_PROJECTS
          where contract_id = P_CONTRACT_ID ));
c1r c1%rowtype;
v_out date;
v_min_date date;
begin
select min(est_date) into v_min_date from prj_estimated_dets where est_date is not null;
open c1;
fetch c1 into c1r;
v_out := c1r.max_date;
close c1;
return nvl(v_out,v_min_date);
end get_contract_last_updated;

/
