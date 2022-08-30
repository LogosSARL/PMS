--------------------------------------------------------
--  DDL for Package Body PROJECT_PARAM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."PROJECT_PARAM" 
as
function get_months_per_day return number
as
v_out number;
cursor c1 is select working_days from prj_parameters where id = 1;
c1r c1%rowtype;
begin
	open c1;
	fetch c1 into v_out;
	close c1;
return v_out;
end get_months_per_day;
function get_hours_per_day return number
as
v_out number;
cursor c1 is select working_hours from prj_parameters where id = 1;
c1r c1%rowtype;
begin
	open c1;
	fetch c1 into v_out;
	close c1;
return v_out;
end get_hours_per_day;
function salary_grade return number
as
v_out number;
cursor c1 is select salary_grade from prj_parameters where id = 1;
c1r c1%rowtype;
begin
	open c1;
	fetch c1 into v_out;
	close c1;
return v_out;
end salary_grade;
function get_on_site_factor return number
as
v_out number;
cursor c1 is select on_site_factor from prj_parameters where id = 1;
c1r c1%rowtype;
begin
	open c1;
	fetch c1 into v_out;
	close c1;
return v_out;
end get_on_site_factor;

end project_param;

/
