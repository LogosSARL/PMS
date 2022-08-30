--------------------------------------------------------
--  DDL for View FLOW_P0010_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_P0010_VW" ("DGRM_CONTENT", "PRCS_ID", "ALL_COMPLETED", "LAST_COMPLETED", "ALL_ERRORS", "ALL_CURRENT") AS 
  select dgrm_content
       , prcs_id
       , all_completed
       , last_completed
       , all_errors
       , all_current
    from flow_instance_details_vw
with read only
;
