--------------------------------------------------------
--  DDL for View FLOW_P0007_INSTANCES_COUNTER_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PRJ"."FLOW_P0007_INSTANCES_COUNTER_VW" ("DGRM_ID", "CREATED_INSTANCES", "RUNNING_INSTANCES", "COMPLETED_INSTANCES", "TERMINATED_INSTANCES", "ERROR_INSTANCES") AS 
  select distinct d.dgrm_id,
    sum(case when i.prcs_status = 'created' then 1 else 0 end) over (partition by d.dgrm_id)  as created_instances,
    sum(case when i.prcs_status = 'running' then 1 else 0 end) over (partition by d.dgrm_id) as running_instances,
    sum(case when i.prcs_status = 'completed' then 1 else 0 end) over (partition by d.dgrm_id) as completed_instances,
    sum(case when i.prcs_status = 'terminated' then 1 else 0 end) over (partition by d.dgrm_id) as terminated_instances,
    sum(case when i.prcs_status = 'error' then 1 else 0 end) over (partition by d.dgrm_id) as error_instances
from flow_diagrams_vw d
left join flow_instances_vw i on i.dgrm_id = d.dgrm_id
with read only
;
