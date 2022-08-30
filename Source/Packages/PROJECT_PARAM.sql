--------------------------------------------------------
--  DDL for Package PROJECT_PARAM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."PROJECT_PARAM" 
as
function get_months_per_day return number;
function get_hours_per_day return number;
function salary_grade return number;
function get_on_site_factor return number;
end project_param;

/
