--------------------------------------------------------
--  DDL for View EXPE_P10060_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."EXPE_P10060_VW" ("OBJT_NAME", "OBJT_TAG_NAME", "OBAT_VC_VALUE") AS 
  select distinct
         objt.objt_name
       , objt.objt_tag_name
       , obat.obat_vc_value
    from flow_object_attributes obat
    join flow_objects objt   
      on obat.obat_objt_id = objt.objt_id
    join flow_diagrams dgrm
      on objt.objt_dgrm_id = dgrm.dgrm_id
   where dgrm.dgrm_name = 'Expense Claims'
     and dgrm.dgrm_category = 'Integration Demo'
     and obat.obat_key = 'bpmn:documentation'
    with read only
;
