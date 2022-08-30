--------------------------------------------------------
--  DDL for View FLOW_P0014_SUBFLOWS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_P0014_SUBFLOWS_VW" ("SBFL_ID", "SBFL_PRCS_ID", "SBFL_STEP_KEY", "SBFL_PROCESS_LEVEL", "SBFL_LAST_COMPLETED", "CURRENT_OBJECT", "SBFL_STATUS", "SBFL_BECAME_CURRENT", "SBFL_WORK_STARTED", "SBFL_RESERVATION", "SBFL_LAST_UPDATE") AS 
  select distinct sbfl.sbfl_id
                , sbfl.sbfl_prcs_id
                , sbfl.sbfl_step_key
                , sbfl.sbfl_process_level
                , sbfl.sbfl_last_completed
                , coalesce(objt.objt_name, sbfl.sbfl_current) as current_object
                , sbfl.sbfl_status
                , sbfl.sbfl_became_current at time zone sessiontimezone as sbfl_became_current
                , sbfl.sbfl_work_started at time zone sessiontimezone as sbfl_work_started
                , sbfl.sbfl_reservation
                , sbfl.sbfl_last_update at time zone sessiontimezone as sbfl_last_update
             from flow_subflows sbfl
             join flow_objects objt
               on sbfl.sbfl_current = objt.objt_bpmn_id
with read only
;
