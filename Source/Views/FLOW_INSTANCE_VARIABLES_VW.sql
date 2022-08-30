--------------------------------------------------------
--  DDL for View FLOW_INSTANCE_VARIABLES_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_INSTANCE_VARIABLES_VW" ("PROV_PRCS_ID", "PROV_VAR_NAME", "PROV_VAR_TYPE", "PROV_VAR_VC2", "PROV_VAR_NUM", "PROV_VAR_DATE", "PROV_VAR_CLOB", "PRCS_NAME", "PRCS_STATUS") AS 
  select prov.prov_prcs_id
       , prov.prov_var_name
       , prov.prov_var_type
       , prov.prov_var_vc2
       , prov.prov_var_num
       , prov.prov_var_date
       , prov.prov_var_clob
       , prcs.prcs_name
       , prcs.prcs_status
    from flow_process_variables prov
    join flow_processes prcs
      on prcs.prcs_id = prov.prov_prcs_id
with read only
;
