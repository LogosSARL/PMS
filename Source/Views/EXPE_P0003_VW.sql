--------------------------------------------------------
--  DDL for View EXPE_P0003_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."EXPE_P0003_VW" ("PRCS_ID", "PRCS_NAME", "DGRM_ID", "DGRM_NAME", "DGRM_VERSION", "DGRM_STATUS", "DGRM_CATEGORY", "DGRM_CONTENT", "ALL_COMPLETED", "LAST_COMPLETED", "ALL_CURRENT", "PRCS_BUSINESS_REF", "ALL_ERRORS") AS 
  select prcs_id
       , prcs_name
       , dgrm_id
       , dgrm_name
       , dgrm_version
       , dgrm_status
       , dgrm_category
       , dgrm_content
       , all_completed
       , last_completed
       , all_current
       , prcs_business_ref
       , all_errors
    from flow_instance_details_vw
   where dgrm_name = 'Expense Claims'
    with read only
;
