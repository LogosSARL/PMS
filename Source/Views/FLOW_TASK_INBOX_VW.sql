--------------------------------------------------------
--  DDL for View FLOW_TASK_INBOX_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_TASK_INBOX_VW" ("SBFL_ID", "SBFL_SBFL_ID", "SBFL_PRCS_ID", "SBFL_PROCESS_NAME", "SBFL_PRCS_INIT_TS", "SBFL_DGRM_ID", "SBFL_DGRM_NAME", "SBFL_DGRM_VERSION", "SBFL_DGRM_STATUS", "SBFL_DGRM_CATEGORY", "SBFL_STARTING_OBJECT", "SBFL_STARTING_OBJECT_NAME", "SBFL_ROUTE", "SBFL_ROUTE_NAME", "SBFL_LAST_COMPLETED", "SBFL_LAST_COMPLETED_NAME", "SBFL_CURRENT", "SBFL_CURRENT_NAME", "SBFL_STEP_KEY", "LINK_TEXT", "SBFL_CURRENT_TAG_NAME", "SBFL_LAST_UPDATE", "SBFL_STATUS", "SBFL_CURRENT_LANE", "SBFL_CURRENT_LANE_NAME", "SBFL_RESERVATION", "SBFL_BUSINESS_REF") AS 
  select sbfl_id
        , sbfl_sbfl_id
        , sbfl_prcs_id
        , sbfl_process_name
        , sbfl_prcs_init_ts
        , sbfl_dgrm_id
        , sbfl_dgrm_name
        , sbfl_dgrm_version
        , sbfl_dgrm_status
        , sbfl_dgrm_category
        , sbfl_starting_object
        , sbfl_starting_object_name
        , sbfl_route
        , sbfl_route_name
        , sbfl_last_completed
        , sbfl_last_completed_name
        , sbfl_current
        , sbfl_current_name
        , sbfl_step_key
        , case sbfl_current_tag_name
            when 'bpmn:userTask' then
              flow_usertask_pkg.get_url
              (
                pi_prcs_id  => sbfl_prcs_id
              , pi_sbfl_id  => sbfl_id
              , pi_objt_id  => sbfl_current_objt_id
              , pi_step_key => sbfl_step_key
              )
            else null
          end link_text
        , sbfl_current_tag_name
        , sbfl_last_update
        , sbfl_status
        , sbfl_current_lane
        , sbfl_current_lane_name
        , sbfl_reservation
        , prov.prov_var_vc2 as sbfl_business_ref
     from flow_subflows_vw sbfl
     left join flow_process_variables prov
        on prov.prov_prcs_id = sbfl.sbfl_prcs_id
       and prov.prov_var_name = 'BUSINESS_REF'
       and prov.prov_var_type = 'VARCHAR2' 
    where sbfl_status = 'running'
with read only
;
