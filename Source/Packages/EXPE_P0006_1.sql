--------------------------------------------------------
--  DDL for Package Body EXPE_P0006
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."EXPE_P0006" 
as 
 
procedure process_ig
( p_prcs_id      in number
, p_sbfl_id      in number
, p_step_key     in varchar2
, p_expe_account in varchar2
)
is
  l_expe_id expe_expenses.expe_id%type;
begin
  -- upon instantiating the flow by the process plug-in, the built-in process variable BUSINESS_REF is set with EXPE_ID.
  l_expe_id:= 
    to_number
    ( flow_process_vars.get_var_vc2
      ( pi_prcs_id  => p_prcs_id
      , pi_var_name => 'BUSINESS_REF'
      )
    );
    
  update expe_expenses expe
     set expe.expe_account = p_expe_account
   where expe.expe_id      = l_expe_id
       ;
       
  flow_api_pkg.flow_complete_step
  ( p_process_id => p_prcs_id
  , p_subflow_id => p_sbfl_id
  , p_step_key   => p_step_key
  ); 
end;
end;

/
