--------------------------------------------------------
--  DDL for Function GET_EMP_LIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."GET_EMP_LIST" (work_type number)
return varchar2
is
v_res varchar2(1000);
cursor c1 is
select listagg(det1.employee,'/') within group (order by det1.employee ) 
    from prj_estimated_dets det1 
    where det1.project_worktype_id = work_type;

begin

open c1;
    fetch c1 into v_res;
close c1;

return v_res;
end;

/
