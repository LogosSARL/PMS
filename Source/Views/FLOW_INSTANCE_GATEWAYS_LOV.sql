--------------------------------------------------------
--  DDL for View FLOW_INSTANCE_GATEWAYS_LOV
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_INSTANCE_GATEWAYS_LOV" ("OBJT_ID", "OBJT_BPMN_ID", "OBJT_NAME", "SELECT_OPTION", "PRCS_ID") AS 
  select obj.objt_id
       , obj.objt_bpmn_id
       , case when obj.objt_name is null then obj.objt_bpmn_id else obj.objt_name || ' (' || obj.objt_bpmn_id ||')' end objt_name
       , case obj.objt_tag_name
           when 'bpmn:exclusiveGateway' then 'single'
           when 'bpmn:inclusiveGateway' then 'multi'
           else null
         end as select_option
       , ins.prcs_id
    from flow_instances_vw ins
    join flow_objects obj
      on obj.objt_dgrm_id = ins.dgrm_id
   where obj.objt_tag_name in ('bpmn:exclusiveGateway', 'bpmn:inclusiveGateway')
     and ( select count(*) from flow_connections conn where conn.conn_src_objt_id = obj.objt_id ) > 1
with read only
;
