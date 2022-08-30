--------------------------------------------------------
--  DDL for View FLOW_INSTANCES_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_INSTANCES_VW" ("PRCS_ID", "PRCS_NAME", "DGRM_ID", "DGRM_NAME", "DGRM_VERSION", "DGRM_STATUS", "DGRM_CATEGORY", "PRCS_STATUS", "PRCS_INIT_TS", "PRCS_LAST_UPDATE", "PRCS_BUSINESS_REF") AS 
  select prcs.prcs_id
       , prcs.prcs_name
       , dgrm.dgrm_id
       , dgrm.dgrm_name
       , dgrm.dgrm_version
       , dgrm.dgrm_status
       , dgrm.dgrm_category
       , prcs.prcs_status
       , prcs.prcs_init_ts
       , prcs.prcs_last_update
       , prov.prov_var_vc2 as prcs_business_ref
    from flow_processes prcs
    join flow_diagrams dgrm
      on dgrm.dgrm_id = prcs.prcs_dgrm_id
    left join flow_process_variables prov
      on prov.prov_prcs_id = prcs.prcs_id
     and prov.prov_var_name = 'BUSINESS_REF'
     and prov.prov_var_type = 'VARCHAR2' 
with read only
;
