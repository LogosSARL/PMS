--------------------------------------------------------
--  DDL for Package FLOW_PLUGIN_MANAGE_INSTANCE_STEP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."FLOW_PLUGIN_MANAGE_INSTANCE_STEP" authid current_user as 
   function execution ( 
      p_process  in  apex_plugin.t_process 
    , p_plugin   in  apex_plugin.t_plugin 
   ) return apex_plugin.t_process_exec_result; 
 
end flow_plugin_manage_instance_step; 

/
