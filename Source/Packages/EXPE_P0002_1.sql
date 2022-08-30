--------------------------------------------------------
--  DDL for Package Body EXPE_P0002
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."EXPE_P0002" 
as
procedure get_sbfl_data
( p_prcs_id        in number
, p_sbfl_id       out number
, p_sbfl_step_key out varchar2
)
is
begin
  begin
    -- we expect only one subflow
    select sbfl.sbfl_id
         , sbfl.sbfl_step_key
      into p_sbfl_id
         , p_sbfl_step_key
      from flow_subflows_vw sbfl
     where sbfl.sbfl_prcs_id = p_prcs_id
         ;
  exception 
  when TOO_MANY_ROWS
  then
    raise;
  end;
end;
end;

/
