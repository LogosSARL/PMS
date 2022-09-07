--------------------------------------------------------
--  DDL for Procedure DUPLICATE_MODULE
--------------------------------------------------------

--Comment by Tareif
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRJ"."DUPLICATE_MODULE" (p_from_module varchar2, p_to_module varchar2)
as
p_int_code_from varchar2(50 char);
p_int_code_to varchar2(50 char);
v_out number := 0;
v_name	varchar2(4000 char);
begin

begin
    select 	e_name
	into	v_name
	from	prj_modules
	where   code = p_from_module;

	select nvl(int_code,'-1') into p_int_code_from from prj_modules
	where  code = p_from_module;

	select nvl(int_code,'-1') into p_int_code_to from prj_modules
	where  code = p_to_module;

	  if p_int_code_from = p_int_code_to then v_out := 1; else v_out := 0; end if;


	exception when others then v_out := 0;

end;

if v_out = 1 then

update PRJ_ENROLLED_DETS
set module = p_to_module
where module = p_from_module;

update lgs_projects
set module = p_to_module
where module = p_from_module;

update PRJ_ESTIMATED_DETS
set module = p_to_module
where module = p_from_module;

update LGS_DELETED_PROJECTS
set module = p_to_module
where module = p_from_module;

update PRJ_DELETED_ESTIMATED_DETS
set module = p_to_module
where module = p_from_module;

update PRJ_EXPENCES
set module = p_to_module
where module = p_from_module;

update prj_modules
set    parent_code = p_to_module
where  parent_code = p_from_module;

update PRJ_PROJECT_TEMPLATES
set    module_id = p_to_module
where  module_id = p_from_module;

update PROJECT_EMPLOYEE
set    module_id = p_to_module
where  module_id = p_from_module;


delete prj_modules where code = p_from_module;
insert into deleted_modules (code , to_code , name ) values (p_from_module, p_to_module, v_name);

commit;

end if;

end duplicate_module;

/
