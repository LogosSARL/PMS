--------------------------------------------------------
--  DDL for View FLOW_P0013_SUBFLOWS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_P0013_SUBFLOWS_VW" ("SBFL_ID", "SBFL_PRCS_ID", "SBFL_STEP_KEY", "SBFL_PROCESS_LEVEL", "SBFL_LAST_COMPLETED", "SBFL_CURRENT", "SBFL_STATUS", "SBFL_BECAME_CURRENT", "SBFL_WORK_STARTED", "SBFL_RESERVATION", "SBFL_LAST_UPDATE") AS 
  select sbfl.sbfl_id
       , sbfl.sbfl_prcs_id
       , sbfl.sbfl_step_key
       , sbfl.sbfl_process_level
       , sbfl.sbfl_last_completed
       , sbfl.sbfl_current
       , sbfl.sbfl_status
       , sbfl.sbfl_became_current at time zone sessiontimezone as sbfl_became_current
       , sbfl.sbfl_work_started at time zone sessiontimezone as sbfl_work_started
       , sbfl.sbfl_reservation
       , sbfl.sbfl_last_update at time zone sessiontimezone as sbfl_last_update
    from flow_subflows sbfl
with read only
;
