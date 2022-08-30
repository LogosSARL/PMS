--------------------------------------------------------
--  DDL for Package FLOW_ENGINE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."FLOW_ENGINE" 
accessible by (flow_api_pkg, flow_instances, flow_gateways, flow_tasks,  
               flow_boundary_events, flow_timers_pkg) 
 
as  
  procedure flow_handle_event 
  ( p_process_id    in flow_processes.prcs_id%type 
  , p_subflow_id    in flow_subflows.sbfl_id%type 
  , p_step_key      in flow_subflows.sbfl_step_key%type 
  , p_timr_id       in flow_timers.timr_id%type default null 
  , p_run           in flow_timers.timr_run%type default null 
  );  
procedure flow_complete_step 
  ( p_process_id        in flow_processes.prcs_id%type 
  , p_subflow_id        in flow_subflows.sbfl_id%type 
  , p_step_key          in flow_subflows.sbfl_step_key%type default null 
  , p_forward_route     in flow_connections.conn_bpmn_id%type default null    
  , p_log_as_completed  in boolean default true 
  , p_recursive_call    in boolean default true 
  ); 
 
procedure start_step 
  ( p_process_id          in flow_processes.prcs_id%type 
  , p_subflow_id          in flow_subflows.sbfl_id%type 
  , p_step_key            in flow_subflows.sbfl_step_key%type default null 
  , p_called_internally   in boolean default false 
  ); 
 
procedure restart_step 
  ( p_process_id          in flow_processes.prcs_id%type 
  , p_subflow_id          in flow_subflows.sbfl_id%type 
  , p_step_key            in flow_subflows.sbfl_step_key%type default null 
  , p_comment             in flow_instance_event_log.lgpr_comment%type default null 
  ); 
   
end flow_engine; 

/
