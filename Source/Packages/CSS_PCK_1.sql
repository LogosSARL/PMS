--------------------------------------------------------
--  DDL for Package Body CSS_PCK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."CSS_PCK" as
procedure refresh_data
as
begin

delete from css_project_tasks;

insert into css_project_tasks (SERIAL, SCHEDULE_DATE, PERSONNEL_CODE,
PERSONNEL_NAME, PERSONNEL_ACTIVE_FLG, CUSTOMER_CODE, CUSTOMER_NAME,
LOCATION, TASK_CODE, TASK_DESC, PROJECT_CODE, MODULE_CODE, MODULE_NAME,
LABOUR_HOURS, description)
select
SERIAL, SCHEDULE_DATE, PERSONNEL_CODE,
PERSONNEL_NAME, PERSONNEL_ACTIVE_FLG, CUSTOMER_CODE, CUSTOMER_NAME,
LOCATION, TASK_CODE, TASK_DESC, PROJECT_CODE, MODULE_CODE, MODULE_NAME,
LABOUR_HOURS, description
from CSS_PROJECT_TASKS_V@CSS254 where task_code is not null;

insert into css_refereshed_on (referesh_date) values (sysdate);

commit;
insert_tasks;
insert_employee;
--insert_modules;
commit;
css_to_cont.insert_company_contracts;
COMMIT;
end refresh_data;



procedure insert_tasks
as
	cursor c1 is 	select 	distinct task_code , task_desc, project_code
			from	css_project_tasks
			where	task_code not in
					(select NVL(int_code,'-F')
					from PRJ_WORK_TYPES);
c1r c1%rowtype;
begin

	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;

	insert into PRJ_WORK_TYPES (id, e_name, to_grade, int_code, from_grade, new_implementation, maintenance,
	support,tobechecked)
	values ('', nvl(c1r.task_desc,c1r.task_code) ,  0, c1r.task_code, 1, 'Y','Y','Y','Y');


	end loop;
	close c1;

	commit;

end insert_tasks;
procedure insert_employee
as
	cursor c1 is 	select distinct personnel_code, personnel_name, personnel_active_flg
			from	css_project_tasks
			where	personnel_code not in
					(select NVL(int_code,'-F')
					from PRJ_EMPLOYEE_SALARY);
c1r c1%rowtype;
begin

	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;

	insert into PRJ_EMPLOYEE_SALARY (emp_code, emp_name, active, salary_grade_id, int_code,tobechecked) values
		(c1r.personnel_code, c1r.personnel_name, c1r.personnel_active_flg, 1, c1r.personnel_code,'Y');


	end loop;
	close c1;

	commit;


end insert_employee;
procedure insert_modules
as
	cursor c1 is 	select distinct module_code, module_name
			from	css_project_tasks
			where	module_code not in
					(select NVL(int_code,'-F')
					from PRJ_MODULES)
			AND        module_code not in (select code from prj_modules);
c1r c1%rowtype;
begin

	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;

	insert into PRJ_modules (code, e_name, int_code, tobechecked) values
		(c1r.module_code, c1r.module_name, c1r.module_code,'Y');


	end loop;
	close c1;

	commit;


end insert_modules;
procedure insert_projectwork_types (p_project_id in number, p_wrktyp_id in number)
as
v_cnt number := 0;
v_seq number;
begin
 select count(*)
 into v_cnt
 from PRJ_PROJECTWORK_TYPES
 where  proj_id = p_project_id
 and wrktyp_id = p_wrktyp_id;

select nvl(max(seq),0)
 into v_seq
 from PRJ_PROJECTWORK_TYPES
 where  proj_id = p_project_id
 and wrktyp_id = p_wrktyp_id;

if v_cnt = 0 then
  insert into PRJ_PROJECTWORK_TYPES
  (id, grade, estimated_days, enrolled_days, description,
  wrktyp_id, proj_id, qty, seq)
  values ('','',0,0,'',p_wrktyp_id, p_project_id,1,v_seq + 1);
  commit;
end if;
end insert_projectwork_types;
end css_pck;

/
