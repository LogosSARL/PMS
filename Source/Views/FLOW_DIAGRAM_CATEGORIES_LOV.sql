--------------------------------------------------------
--  DDL for View FLOW_DIAGRAM_CATEGORIES_LOV
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_DIAGRAM_CATEGORIES_LOV" ("D", "R") AS 
  select distinct
         dgrm_category d
       , dgrm_category r
    from flow_diagrams
with read only
;
