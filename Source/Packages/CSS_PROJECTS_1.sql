--------------------------------------------------------
--  DDL for Package Body CSS_PROJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."CSS_PROJECTS" 
as
function get_emp_scale (v_emp_code in varchar2) return number
as
cursor c1 is  select  sg.to_salary/20 daily_rate
  from    prj_salary_grades sg, prj_employee_salary es, prj_grade_prices gp
  where  sg.id   =  es.salary_grade_id
  and sg.grade_price_id  =  gp.id
  and         gp.end_date is null
  and         es.emp_code  =  v_emp_code;
c1r c1%rowtype;
begin
open c1;
fetch c1 into c1r;
return c1r.daily_rate;
close c1;
end get_emp_scale;
function get_client_task_cost(p_task in varchar2, p_comp in varchar2, p_mod in varchar2) return number
as
cursor c1 is select  hrs*css_projects.get_emp_scale(css.emp)/8 Cost
  from     css
  where css.task = p_task
  and         css.comp = p_comp
  and  css.mod = p_mod;
c1r c1%rowtype;
v_total number := 0;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;

 v_total := v_total + nvl(c1r.cost,0);

end loop;
close c1;
return v_total;
end get_client_task_cost;
end css_projects;

/
