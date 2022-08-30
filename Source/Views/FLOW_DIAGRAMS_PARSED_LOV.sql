--------------------------------------------------------
--  DDL for View FLOW_DIAGRAMS_PARSED_LOV
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_DIAGRAMS_PARSED_LOV" ("DGRM_ID", "DGRM_NAME", "DGRM_VERSION", "DGRM_STATUS", "DGRM_CATEGORY") AS 
  select dgrm.dgrm_id
       , dgrm.dgrm_name
       , dgrm.dgrm_version
       , dgrm.dgrm_status
       , dgrm.dgrm_category
    from flow_diagrams dgrm
   where exists 
         ( select null
             from flow_objects objt
            where objt.objt_dgrm_id = dgrm.dgrm_id
         )
    and dgrm_status in ('draft','released')
  with read only
;
