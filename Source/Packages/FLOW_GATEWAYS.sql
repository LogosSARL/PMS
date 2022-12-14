--------------------------------------------------------
--  DDL for Package FLOW_GATEWAYS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."FLOW_GATEWAYS" 
accessible by (flow_engine) 
as  
 
procedure process_para_incl_Gateway 
  ( p_sbfl_info     in flow_subflows%rowtype 
  , p_step_info     in flow_types_pkg.flow_step_info 
  ); 
procedure process_exclusiveGateway 
  ( p_sbfl_info     in flow_subflows%rowtype 
  , p_step_info     in flow_types_pkg.flow_step_info 
  ); 
 
 procedure process_eventBasedGateway 
  ( p_sbfl_info  in flow_subflows%rowtype 
  , p_step_info  in flow_types_pkg.flow_step_info 
  ); 
 
end flow_gateways; 

/
