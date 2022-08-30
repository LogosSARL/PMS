--------------------------------------------------------
--  DDL for Package PROJECT_PCK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."PROJECT_PCK" 
as
function get_contract_project_desc 		(p_project_worktype_id 	in number) 		return varchar2;
function get_contract_desc 	         		(p_contract_id 		in number) 		return varchar2;
function get_project_desc			(p_project_id 		in number)		return varchar2;
function get_project_cost			(p_project_id 		in number)		return number;
function get_project_work_estimate		(p_pw 			in number)		return varchar2;
function get_project_work_enrollment  		(p_pw			in number)		return number;
function get_project_estimate		(p_project_id 		in number)		return number;
function get_contract_remaining 	(p_contract_id 		in number)		return number;
function get_project_work_estimate_num	(p_pw 			in number, p_date date default sysdate)		return number;
function get_project_work_add_num(p_pw 			in number, p_date date default sysdate)		return number;
function get_project_work_init_num(p_pw 			in number, p_date date default sysdate)		return number;
function get_project_work_sys_rem_num(p_pw 			in number, p_int_code varchar2 default null)		return number;
function get_contract_estimate 		(p_contract_id 		in number)		return number;
function get_contract_enrollment		(p_contract_id 		in number)		return number;
function get_project_work_remaining_num(p_pw 			in number, p_date date default sysdate)		return number;
function get_project_remaining	(p_project_id 		in number)		return number;
function get_project_task_expences		(p_pw			in number)		return number;
function get_project_expences		(p_project_id		in number)		return number;
function get_contract_expences		(p_contract_id		in number)		return number;
function get_rate				(p_currency_id		in number, p_day_in	in date)		return number;
function get_project_module (p_project_id in number) return varchar2;
function get_emp_salary_grade (p_emp_code in varchar2, p_day in date) return number;
function get_emp_salary_to (p_emp_code in varchar2, p_day in date) return number;
function get_scale_salary_to (p_scale_id in number, p_day in date) return number;


function get_inserted_contract_id		(p_pipe_id		in number)		return number;
function change_contact_approved_status(p_pipe_id in number)    return number;
function change_contact_rejected_status(p_pipe_id in number) return number;


function get_project_pricing_date (p_project_id in number) return date;
function get_project_on_site_days(p_project_id in number) return number;
function get_project_wrktype_os_days(p_project_id in number, p_wrtktype in number,p_int_code in varchar2 default null, p_date date default sysdate) return number;
function get_project_management_est (p_id in number) return number;
function prj_costing (p_Project_id in number) return number;
function contract_costing (p_contract_id in number) return number;
function get_project_days	(p_project_id 		in number, p_return_what in varchar2)		return number;
function get_project_remaining_days		(p_project_id in number,p_return_what in varchar2) return number;
procedure prj_contracts_view ;
function get_task_enrollment (p_pw	in number, p_office_or_onsite in varchar2, p_hrs_or_days varchar2) return number;
function get_task_project_enrollment (p_pw	in number, p_office_or_onsite in varchar2, p_hrs_or_days varchar2) return number;
function get_task_contract_enrollment (p_pw	in number, p_office_or_onsite in varchar2, p_hrs_or_days varchar2) return number;
function get_contract_id			(p_project_id		in number)		return number;
function get_work_type_desc (p_id in number) return varchar2;
function get_if_prj_module_in_use (p_module_code in varchar2) return varchar2;
function get_if_contract_disp (p_contract_id in number, p_user_in varchar2) return number;
function get_if_prj_worktype_disp (p_id in number, p_show_zeros in number) return number;
procedure delete_contract(p_contract_id in number , p_who_deleted in varchar2);
procedure delete_project(p_contract_id in number, p_project_id in number, p_who_deleted in varchar2);
/* This is for the Work Still Needed Report */
function  Get_work_still_needed (p_pw 			in number)		return number;
/* End Work Still Needed */
v_no_of_days_per_month	number := project_param.get_months_per_day;
v_no_of_hours_per_day	number := project_param.get_hours_per_day;
v_salary_scale		number := project_param.salary_grade;
v_on_site_factor		number := project_param.get_on_site_factor;

end project_pck;

/
