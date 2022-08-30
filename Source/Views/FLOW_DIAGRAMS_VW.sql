--------------------------------------------------------
--  DDL for View FLOW_DIAGRAMS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_DIAGRAMS_VW" ("DGRM_ID", "DGRM_NAME", "DGRM_VERSION", "DGRM_STATUS", "DGRM_CATEGORY", "DGRM_LAST_UPDATE", "DGRM_CONTENT") AS 
  select dgrm.dgrm_id
       , dgrm.dgrm_name
       , dgrm.dgrm_version
       , dgrm.dgrm_status
       , dgrm.dgrm_category
       , dgrm.dgrm_last_update
       , dgrm.dgrm_content
  from flow_diagrams dgrm
with read only
;
