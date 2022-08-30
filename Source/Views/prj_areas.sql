--------------------------------------------------------
--  DDL for View prj_areas
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."prj_areas" ("CODE", "AREA_TYPE", "E_NAME", "A_NAME", "PARENT_CODE") AS 
  select code,area_type,e_name,a_name,parent_code from logos.lgs_areas;
