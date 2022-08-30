--------------------------------------------------------
--  DDL for View FLOW_P0013_STEP_LOG_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_P0013_STEP_LOG_VW" ("LGSF_PRCS_ID", "LGSF_OBJT_ID", "LGSF_SBFL_ID", "LGSF_SBFL_PROCESS_LEVEL", "LGSF_LAST_COMPLETED", "LGSF_STATUS_WHEN_COMPLETE", "LGSF_WAS_CURRENT", "LGSF_STARTED", "LGSF_COMPLETED", "LGSF_RESERVATION", "LGSF_USER", "LGSF_COMMENT") AS 
  select lgsf.lgsf_prcs_id
       , lgsf.lgsf_objt_id
       , lgsf.lgsf_sbfl_id
       , lgsf.lgsf_sbfl_process_level
       , lgsf.lgsf_last_completed
       , lgsf.lgsf_status_when_complete
       , lgsf.lgsf_was_current at time zone sessiontimezone as lgsf_was_current
       , lgsf.lgsf_started at time zone sessiontimezone as lgsf_started
       , lgsf.lgsf_completed at time zone sessiontimezone as lgsf_completed
       , lgsf.lgsf_reservation
       , lgsf.lgsf_user
       , lgsf.lgsf_comment
    from flow_step_event_log lgsf
with read only
;
