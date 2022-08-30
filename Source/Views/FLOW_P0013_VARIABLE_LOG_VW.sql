--------------------------------------------------------
--  DDL for View FLOW_P0013_VARIABLE_LOG_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_P0013_VARIABLE_LOG_VW" ("LGVR_PRCS_ID", "LGVR_OBJT_ID", "LGVR_VAR_NAME", "LGVR_EXPR_SET", "LGVR_TIMESTAMP", "LGVR_VAR_TYPE", "LGVR_VALUE") AS 
  select lgvr_prcs_id
       , lgvr_objt_id
       , lgvr_var_name
       , lgvr_expr_set
       , lgvr_timestamp at time zone sessiontimezone as lgvr_timestamp
       , lgvr_var_type
       , case
           when lgvr_var_vc2 is not null then lgvr_var_vc2
           when lgvr_var_num is not null then cast(lgvr_var_num as varchar2(4000))
           when lgvr_var_date is not null then cast(lgvr_var_date as varchar2(4000))
           when lgvr_var_clob is not null then '[clob]'
         end as lgvr_value
    from flow_variable_event_log
with read only
;
