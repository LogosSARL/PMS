--------------------------------------------------------
--  DDL for View FLOW_INSTANCE_CONNECTIONS_LOV
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_INSTANCE_CONNECTIONS_LOV" ("CONN_BPMN_ID", "CONN_NAME", "CONN_SRC_OBJT_ID", "SRC_OBJT_BPMN_ID", "PRCS_ID") AS 
  select cn.conn_bpmn_id
       , coalesce(cn.conn_name,conn_bpmn_id) conn_name
       , cn.conn_src_objt_id
       , objt.objt_bpmn_id as src_objt_bpmn_id
       , ins.prcs_id
    from flow_instances_vw ins
    join flow_connections cn 
      on cn.conn_dgrm_id = ins.dgrm_id
     and cn.conn_tag_name = 'bpmn:sequenceFlow'
    join flow_objects objt
      on objt.objt_id = cn.conn_src_objt_id
with read only
;
