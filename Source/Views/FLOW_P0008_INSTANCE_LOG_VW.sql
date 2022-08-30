--------------------------------------------------------
--  DDL for View FLOW_P0008_INSTANCE_LOG_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_P0008_INSTANCE_LOG_VW" ("LGPR_PRCS_ID", "LGPR_PRCS_NAME", "LGPR_BUSINESS_ID", "LGPR_PRCS_EVENT", "LGPR_PRCS_EVENT_ICON", "LGPR_TIMESTAMP", "LGPR_USER", "LGPR_COMMENT", "LGPR_ERROR_INFO", "PRETAG", "POSTTAG", "LGPR_OBJT_ID") AS 
  select lgpr.lgpr_prcs_id
       , lgpr.lgpr_prcs_name
       , lgpr.lgpr_business_id
       , lgpr.lgpr_prcs_event
       , case lgpr.lgpr_prcs_event
           when 'started' then 'fa-play-circle-o'
           when 'running' then 'fa-play-circle-o'
           when 'created' then 'fa-plus-circle-o'
           when 'completed' then 'fa-check-circle-o'
           when 'terminated' then 'fa-stop-circle-o'
           when 'error' then 'fa-exclamation-circle-o'
           when 'reset' then 'fa-undo'
           when 'restart step' then 'fa-undo'
           when 'rescheduled' then 'fa-clock-o'
         end as lgpr_prcs_event_icon
       , lgpr.lgpr_timestamp at time zone sessiontimezone as lgpr_timestamp
       , lgpr.lgpr_user
       , lgpr.lgpr_comment
       , lgpr_error_info
       , case when lgpr_error_info is not null then '<pre><code class="language-log">' end as pretag
       , case when lgpr_error_info is not null then '</code></pre>' end as posttag
       , lgpr.lgpr_objt_id
    from flow_instance_event_log lgpr
with read only
;
