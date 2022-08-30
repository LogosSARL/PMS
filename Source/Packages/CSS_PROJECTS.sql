--------------------------------------------------------
--  DDL for Package CSS_PROJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."CSS_PROJECTS" 
as
function get_emp_scale (v_emp_code in varchar2) return number;
function get_client_task_cost(p_task in varchar2, p_comp in varchar2, p_mod in varchar2) return number;
end css_projects;

/
