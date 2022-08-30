--------------------------------------------------------
--  DDL for Package Body TRANSFER_DATA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."TRANSFER_DATA" 
as
procedure transfer_project_tasks (p_project in varchar2, p_month varchar2)
as
cursor c1 is  SELECT  DISTINCT TO_CHAR(SCHEDULE_DATE,'MM-YYYY') d,customer_code,
   personnel_code, task_code, MODULE_CODE,LOCATION,
   SUM(LABOUR_HOURS) hrs
       FROM CSS_PROJECT_TASKS
  WHERE CUSTOMER_CODE=p_project
  GROUP BY TO_CHAR(SCHEDULE_DATE,'MM-YYYY'),customer_code,
  personnel_code, task_code, MODULE_CODE, LOCATION
  ORDER BY 1;
c1r c1%rowtype;

cursor c2 is  select  id , int_code task
 from prj_work_types
 where   int_code = c1r.task_code;
c2r c2%rowtype;

cursor c3 is  select  id, int_code project
 from lgs_projects
 where  int_code = c1r.customer_code;
-- and      module = transfer_data.get_top_level_module_int(c1r.module_code);
c3r c3%rowtype;

cursor c4 is  select id from prj_projectwork_types where proj_id = c3r.id and WRKTYP_ID = c2r.id;
c4r c4%rowtype;

cursor c5 is  select emp_code
  from prj_employee_salary
  where int_code = c1r.personnel_code;
c5r c5%rowtype;
CURSOR C6 IS  SELECT CODE
  FROM PRJ_MODULES
  WHERE INT_CODE = C1R.MODULE_CODE;
C6R C6%ROWTYPE;
v_day varchar2(200);
v_no_of_hours number :=0;
v_no_on_site  number :=0;
v_note   varchar2(2000);
v_module varchar2(2000);
v_staff  varchar2(2000);
v_cnt  number;
v_project_seq number;
begin





 open c1;
 loop fetch c1 into c1r;
 exit when c1%notfound;


 open c2;
 FETCH C2 INTO C2R;

 open c3;
 FETCH C3 INTO C3R;
                  css_pck.insert_projectwork_types (c3r.id, c2r.id);

 open c4;
 FETCH C4 INTO C4R;
 open c5;
 FETCH C5 INTO C5R;
 OPEN C6;
 FETCH C6 INTO C6R;







  IF C6%NOTFOUND THEN v_note := v_note || ' Module : '||c1r.module_code; else   v_module := c6r.code; end if;
  IF C5%NOTFOUND THEN v_note := v_note || ' Employee : '||c1r.personnel_code; else  v_staff := c5r.emp_code; end if;
  IF C4%NOTFOUND THEN v_note := v_note || ' task_code : '||c1r.task_code; else null; end if;



 v_day := '01-'||c1r.d;
   if  c1r.location = 'I' then v_no_of_hours := c1r.hrs;
   else  v_no_on_site  := c1r.hrs;
   end if;

  v_note := 'From CSS Module '||c1r.module_code;

  IF C4R.ID IS NOT NULL then


  insert into PRJ_enrolled_dets  (id, PROJECT_WORKTYPE_ID,FROM_DATE,NO_OF_HOURS,
       EMPLOYEE,CUSTOMER_CERTIFIED,NOTES,ON_SITE_DAYS,MODULE,FROM_CSS)
     values  ('', c4r.id, TO_DATE(v_day,'DD-MM-YYYY'),  v_no_of_hours, v_staff,'Y',v_note ,
       v_no_on_site ,v_module,'Y'  );

  END IF;


 close c2;
 close c3;
 close c4;
 close c5;
 CLOSE C6;



v_no_of_hours := 0;
v_no_on_site  := 0;
v_note := '';
v_module := '';
v_staff := '';
v_cnt :=0;



end loop;
close c1;

end transfer_project_tasks;
procedure identify_project (p_project_id in number)
as
p_css_customer_code varchar2(200);
begin



 begin

 delete from PRJ_ENROLLED_DETS
 where from_css = 'Y'
 and PROJECT_WORKTYPE_ID in
  (select id from prj_projectwork_types where proj_id = p_project_id);



 select INT_CODE into p_css_customer_code from lgs_projects where id = p_project_id;

 transfer_project_tasks(p_css_customer_code,'');

 exception when others then null;
 end;

end identify_project;

Procedure identify
as
cursor c1 is  select id, int_code from lgs_projects
  where int_code in (select customer_code from css_project_tasks);
c1r c1%rowtype;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;


identify_project(c1r.id);

end loop;
close c1;


end identify;
function     get_top_level_module (p_module_code in varchar2) return varchar2
as
cursor c1 is 	select code, LEVEL from prj_modules
		WHERE CODE NOT IN ('ALL')
		connect by code = PRIOR parent_code
		start with code = p_module_code
		ORDER BY LEVEL desc;
c1r c1%rowtype;
v_out varchar2(2000) := 'N.A.';
begin
open c1;
fetch c1 into c1r;
v_out := c1r.code;
close c1;
return v_out;
end get_top_level_module;

function     get_module_desc (p_module_code in varchar2) return varchar2
as
cursor c1 is 	select e_name from prj_modules
		WHERE  code = p_module_code
		;
c1r c1%rowtype;
v_out varchar2(2000) := 'N.A.';
begin
open c1;
fetch c1 into c1r;
v_out := c1r.e_name;
close c1;
return v_out;
end get_module_desc ;


function     get_top_level_module_desc (p_module_code in varchar2) return varchar2
as
cursor c1 is 	select e_name, LEVEL from prj_modules
		WHERE CODE NOT IN ('ALL')
		connect by code = PRIOR parent_code
		start with code = p_module_code
		ORDER BY LEVEL desc;
c1r c1%rowtype;
v_out varchar2(2000) := 'N.A.';
begin
open c1;
fetch c1 into c1r;
v_out := c1r.e_name;
close c1;
return v_out;
end get_top_level_module_desc ;
function     get_top_level_module_INT (p_INT_code in varchar2) return varchar2
AS
cursor c1 is select code from prj_modules where int_code = p_int_code;
c1r c1%rowtype;
v_out varchar2(2000);
begin
open c1;
fetch c1 into c1r;
v_out := get_top_level_module(c1r.code);
close c1;
return v_out;
end get_top_level_module_INT;
function     get_top_level_module_INT_DESC (p_INT_code in varchar2) return varchar2
AS
cursor c1 is select CODE from prj_modules where int_code = p_int_code;
c1r c1%rowtype;
v_out varchar2(2000);
begin
open c1;
fetch c1 into c1r;
v_out := get_top_level_module_desc(c1r.code);
close c1;
return v_out;
end get_top_level_module_INT_DESC;
procedure insert_projects(p_contract_dsp_code in varchar2)
as
/*
cursor c1 is
	select distinct 	get_top_level_module_INT(module_code) Mod,
			get_top_level_module_INT_DESC(module_code) mod_desc
	from  css_project_tasks
	where  customer_code = p_contract_dsp_code
	order by 2;
  */
cursor c1 is
	select distinct 	module_code Mod,CODE PRJMod,
			Module_Name mod_desc
	from  css_project_tasks, PRJ_MODULES
	where  UPPER(customer_code) = UPPER(p_contract_dsp_code)
  AND CSS_PROJECT_TASKS.MODULE_CODE = PRJ_MODULES.INT_CODE
	order by 2;
c1r c1%rowtype;
v_cnt number :=0;
i number := 0;
v_project_seq number;
v_contract_id number;
begin

		begin
			select nvl(max(seq),0)
			into    i
			from lgs_projects
			where UPPER(int_code) = UPPER(p_contract_dsp_code);
		exception when no_data_found then i := 0;
		end;


	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;

		select count(*) into v_cnt from lgs_projects, prj_modules
		where UPPER(lgs_projects.int_code) = UPPER(p_contract_dsp_code)
    and lgs_projects.module = prj_modules.code
		and     prj_modules.int_code   = c1r.mod;

		if v_cnt = 0 then  /* Insert project */
		i:=i+1;
				begin
					select id into v_contract_id from lgs_contracts
					where  UPPER(dsp_code) = UPPER(p_contract_dsp_code)
                                        AND USAGE_TYPE = 2;

					select lgs_projects_seq.nextval into v_project_seq from dual;

				insert into lgs_projects (id,seq, l_description, dsp_code, contract_id,int_code,module, active)
				values (v_project_seq, i,c1r.mod_desc, p_contract_dsp_code||'-'||
				c1r.mod, v_contract_id, p_contract_dsp_code,c1r.PRJMod, 'Y');

				insert_project_work_type(v_project_seq);
				exception when no_data_found then null;
        WHEN OTHERS THEN NULL;
        
				end;
                                
       commit;        
		end if;
	end loop;
	close c1;

end insert_projects;
procedure insert_project_work_type (p_project_id in number)
as
cursor c1 is select 	id, seq
	from 	prj_work_types
	where 	id not in (select WRKTYP_ID from PRJ_PROJECTWORK_TYPES where proj_id = p_project_id)
	order by seq;
c1r c1%rowtype;

begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;

	insert into prj_projectwork_types (id, estimated_days, enrolled_days, wrktyp_id, proj_id, seq, qty)
	values ('', 0, 0, c1r.id, p_project_id,c1r.seq,1);

end loop;
close c1;

end insert_project_work_type ;
procedure create_enrolled_data (p_project_id in number)
as
cursor c1 is 	select 	int_code, module
		from	lgs_projects
		where 	id = p_project_id;
c1r c1%rowtype;
cursor c2 is 	select	wt.id work_type_id, wt.int_code css_work_type, wt.int_code ic,
			pwt.id project_work_type_id
		from	prj_work_types wt, prj_projectwork_types pwt
		where         pwt.wrktyp_id 	= wt.id
		and	pwt.proj_id 	= p_project_id;
c2r c2%rowtype;
/*
cursor c3 is		select 	distinct trunc(schedule_date) d, customer_code, personnel_code,
			task_code,	module_code, location, sum(labour_hours) hrs
		from  	css_project_tasks --,PRJ_MODULES
		where  	customer_code = c1r.int_code --AND css_project_tasks.MODULE_CODE = PRJ_MODULES.INT_CODE
		and 	transfer_data.get_top_level_module_int(module_code) = c1r.module 
		and             task_code = c2r.ic --AND C1R.MODULE = PRJ_MODULES.CODE
		group by trunc(schedule_date), customer_code, personnel_code, task_code, module_code, location;
    */
    cursor c3 is		select 	distinct trunc(schedule_date) d, customer_code, personnel_code,
			task_code,	module_code, location, sum(labour_hours) hrs
		from  	css_project_tasks ,PRJ_MODULES
		where  	UPPER(customer_code) = UPPER(c1r.int_code) 
    AND css_project_tasks.MODULE_CODE = PRJ_MODULES.INT_CODE
		--and 	transfer_data.get_top_level_module_int(module_code) = c1r.module 
		and             task_code = c2r.ic 
    AND C1R.MODULE = PRJ_MODULES.CODE
		group by trunc(schedule_date), customer_code, personnel_code, task_code, module_code, location;
c3r c3%rowtype;
v_no_of_hours number :=0;
v_no_on_site  number :=0;
v_note   varchar2(2000);
v_module varchar2(2000);
v_staff  varchar2(2000);
test_v varchar2(1000);
begin

			delete from prj_enrolled_dets
			where project_worktype_id in 	(select id from prj_projectwork_types
						where proj_id = p_project_id)
			and   from_css = 'Y';

	open c1;
	loop fetch c1 into c1r;
	exit when c1%notfound;
		open c2;
		loop fetch c2 into c2r;
		exit when c2%notfound;
			open c3;
			loop fetch c3 into c3r;
			exit when c3%notfound;
			v_no_of_hours 	:= 0;
			v_no_on_site 	:=0;
			if c3r.location = 'I' then v_no_of_hours := c3r.hrs; else v_no_on_site := c3r.hrs; end if;

			begin
				select  	MIN(code)
				into 	v_module
				from	prj_modules
				where  	int_code = c3r.module_code;
			exception when no_data_found then v_module := '';
			end;
			begin
				select 	MIN(emp_code)
				into	v_staff
				from 	prj_employee_salary
				where 	int_code = c3r.personnel_code;
			exception when no_data_found then v_staff := '';
			end;

			v_note := 'From CSS Module '||c3r.module_code;
        /*test_v := 'insert into PRJ_enrolled_dets  (id, project_worktype_id, from_date, no_of_hours,
			employee,  CUSTOMER_CERTIFIED, notes, on_site_days, module, from_css)
     			values  ('''', '''||c2r.project_work_type_id||''','''||c3r.d||''','''||  nvl(v_no_of_hours,0)||''','''|| v_staff||''',''Y'','''||v_note||''' ,
       			'''||v_no_on_site||''' ,'''||v_module||''',''Y''  );';*/
                insert into tareif(c1,c2,c3,c4) values (c2r.project_work_type_id,v_module,v_note,p_project_id); commit;
			insert into PRJ_enrolled_dets  (id, project_worktype_id, from_date, no_of_hours,
			employee,  CUSTOMER_CERTIFIED, notes, on_site_days, module, from_css)
     			values  ('', c2r.project_work_type_id, c3r.d,  nvl(v_no_of_hours,0), v_staff,'Y',v_note ,
       			v_no_on_site ,v_module,'Y'  );

			end loop;
			close c3;
		end loop;
		close c2;


	end loop;
	close c1;

end create_enrolled_data ;
procedure create_enrolled_data_contract (p_contract_id in number)
as
cursor c0 is select dsp_code from lgs_contracts where id = p_contract_id;
c0r c0%rowtype;
cursor c1 is select id from lgs_projects where contract_id = p_contract_id;
c1r c1%rowtype;
begin
open c0;
fetch c0 into c0r;
  INSERT INTO TAREIF(C1) VALUES('BEFORE INSERT PROJECTS OF '||C0R.DSP_CODE);COMMIT;
	insert_projects(c0r.dsp_code);
  INSERT INTO TAREIF(C1) VALUES('AFTER INSERT PROJECTS OF '||C0R.DSP_CODE);COMMIT;
close c0;
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;
  INSERT INTO TAREIF(C1) VALUES('BEFORE CREATE ENROLLED DATA OF PROJECT '||C1R.ID);COMMIT;
	create_enrolled_data(c1r.id);
  INSERT INTO TAREIF(C1) VALUES('AFTER CREATE ENROLLED DATA OF PROJECT '||C1R.ID);COMMIT;
end loop;
close c1;

end create_enrolled_data_contract ;
procedure create_details
as
cursor c1 is select id from lgs_contracts;
c1r c1%rowtype;
begin
open c1;
loop fetch c1 into c1r;
exit when c1%notfound;

create_enrolled_data_contract(c1r.id);

end loop;
close c1;
commit;

end create_details;
end transfer_data;

/
