--------------------------------------------------------
--  DDL for Function GET_PROJECT_WORK_ENROLLMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."GET_PROJECT_WORK_ENROLLMENT" (p_pw   in number)  return number
is
cursor c1 is  select  id
  from PRJ_PROJECTWORK_TYPES
  where   id = p_pw;
c1r c1%rowtype;
cursor c2 is  select  (no_of_hours+nvl(on_site_days*1.5,0))/8 days, employee,
   1000/28 sal_per_day
  from PRJ_ENROLLED_DETS
  where     PROJECT_WORKTYPE_ID = c1r.id;
c2r c2%rowtype;

v_no_of_days_per_month number := project_param.get_months_per_day;
v_no_of_hours_per_day number := project_param.get_hours_per_day;
v_salary_scale  number := project_param.salary_grade;
v_on_site_factor  number := project_param.get_on_site_factor;

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

/
