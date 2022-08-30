--------------------------------------------------------
--  DDL for View FLOW_P0008_INSTANCE_DETAILS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_P0008_INSTANCE_DETAILS_VW" ("PRCS_ID", "PRCS_NAME", "DGRM_NAME", "DGRM_VERSION", "STATUS", "INITIALIZED_ON", "LAST_UPDATE_ON", "BUSINESS_REFERENCE") AS 
  select 
       prcs_id,
       prcs_name,
       dgrm_name,
       dgrm_version,
       prcs_status as status,
       prcs_init_ts at time zone sessiontimezone as initialized_on,
       prcs_last_update at time zone sessiontimezone as last_update_on,
       prcs_business_ref as business_reference
  from flow_instances_vw
with read only
;
