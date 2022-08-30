--------------------------------------------------------
--  DDL for View FLOW_P0010_INSTANCES_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_P0010_INSTANCES_VW" ("PRCS_ID", "PRCS_NAME", "PRCS_DGRM_ID", "PRCS_DGRM_NAME", "PRCS_DGRM_VERSION", "PRCS_DGRM_STATUS", "PRCS_DGRM_CATEGORY", "PRCS_STATUS", "PRCS_DGRM_STATUS_ICON", "PRCS_STATUS_ICON", "PRCS_INIT_DATE", "PRCS_LAST_UPDATE", "PRCS_BUSINESS_REF", "BTN", "CHECKBOX", "QUICK_ACTION") AS 
  select prcs_id
        , prcs_name
        , prcs_dgrm_id
        , prcs_dgrm_name
        , prcs_dgrm_version
        , prcs_dgrm_status
        , prcs_dgrm_category
        , prcs_status
        , prcs_dgrm_status_icon
        , prcs_status_icon
        , prcs_init_date
        , prcs_last_update
        , prcs_business_ref
        , null as btn
        , apex_item.checkbox2(p_idx => 1, p_value => prcs_id, p_attributes => 'data-prcs = "' || prcs_id || '" data-status = "' || prcs_status ||'"') as checkbox
        , null as quick_action
     from ( select prcs_id
                 , prcs_name
                 , dgrm_id as prcs_dgrm_id
                 , dgrm_name as prcs_dgrm_name
                 , dgrm_version as prcs_dgrm_version
                 , dgrm_status as prcs_dgrm_status
                 , case dgrm_status
                  when 'draft' then 'fa fa-wrench'
                  when 'released' then 'fa fa-check'
                  when 'deprecated' then 'fa fa-ban'
                  when 'archived' then 'fa fa-archive'
                end as prcs_dgrm_status_icon
                 , dgrm_category as prcs_dgrm_category
                 , prcs_status
                 , prcs_init_ts at time zone sessiontimezone as prcs_init_date
                 , prcs_last_update at time zone sessiontimezone as prcs_last_update
                 , prcs_business_ref
                 , case prcs_status
                     when 'running' then 'fa-play-circle-o'
                     when 'created' then 'fa-plus-circle-o'
                     when 'completed' then 'fa-check-circle-o'
                     when 'terminated' then 'fa-stop-circle-o'
                     when 'error' then 'fa-exclamation-circle-o'
                   end as prcs_status_icon
              from flow_instances_vw
          )
with read only
;
