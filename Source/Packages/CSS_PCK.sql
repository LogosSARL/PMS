--------------------------------------------------------
--  DDL for Package CSS_PCK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."CSS_PCK" as
procedure refresh_data;
procedure insert_tasks;
procedure insert_employee;
procedure insert_modules;
 procedure insert_projectwork_types (p_project_id in number, p_wrktyp_id in number);
end css_pck;


/
