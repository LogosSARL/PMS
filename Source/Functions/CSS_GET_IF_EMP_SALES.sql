--------------------------------------------------------
--  DDL for Function CSS_GET_IF_EMP_SALES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."CSS_GET_IF_EMP_SALES" (p_personnel_code in varchar2) return number /* 0 or 1 */
as
cursor c1 is  select  count(*) cnt
  from  CSS_PROJECT_TASKS
  where   PERsONNEL_CODE = P_PERSONNEL_CODE
  AND     task_code = 'DEM';
C1R c1%rowtype;
cursor c2 is  select  count(*) cnt
  from  CSS_PROJECT_TASKS
  where   PERsONNEL_CODE = P_PERSONNEL_CODE
  AND     task_code not in  ('OTH','ADM','DEM','DOC','FAIL','TRA');
c2r c2%rowtype;
v_out number :=0;
begin

open c1;
fetch c1 into c1r;
if  c1r.cnt = 0 then v_out := 0;
elsif  c1r.cnt > 0 then
   open  c2;
   fetch  c2 into c2r;
    if c2r.cnt > 0  then v_out := 0;
      else  v_out := 1;
    end if;
   close c2;
end if;
close c1;
return v_out ;
end css_get_if_emp_sales;

/
