--------------------------------------------------------
--  DDL for Package TRANSFER_DATA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."TRANSFER_DATA" 
as
procedure transfer_project_tasks (p_project in varchar2, p_month varchar2);
procedure identify_project (p_project_id in number); /* from prj not css*/
Procedure identify;
function     get_top_level_module (p_module_code in varchar2) return varchar2;
function     get_module_desc (p_module_code in varchar2) return varchar2;
function     get_top_level_module_desc (p_module_code in varchar2) return varchar2;
function     get_top_level_module_INT (p_INT_code in varchar2) return varchar2;
function     get_top_level_module_INT_DESC (p_INT_code in varchar2) return varchar2;
procedure insert_projects(p_contract_dsp_code in varchar2) ;
procedure insert_project_work_type (p_project_id in number);
procedure create_enrolled_data (p_project_id in number);
procedure create_enrolled_data_contract (p_contract_id in number);
procedure create_details;
end transfer_data;

/
