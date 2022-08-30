--------------------------------------------------------
--  DDL for Function GET_REM_EST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."GET_REM_EST" (p_project number, p_work_type number, p_int_code varchar2, p_date date default sysdate)
return varchar2
is
v_res number;
cursor c1 is
select 
    project_pck.get_project_work_remaining_num(w_t.id,p_date) 
    from prj_projectwork_Types w_t,prj_work_types wt, lgs_projects p
    where p.id = w_t.proj_id
    and p.id = p_project
    and w_t.id = p_work_type 
    and w_t.WRKTYP_ID = wt.id
    and wt.int_code = p_int_code;
begin

open c1;
    fetch c1 into v_res;
close c1;
return nvl(v_res,0);
end;

/
