--------------------------------------------------------
--  DDL for Package EXPE_P0006
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."EXPE_P0006" 
as 
 
procedure process_ig
( p_prcs_id      in number
, p_sbfl_id      in number
, p_step_key     in varchar2
, p_expe_account in varchar2
);
end;

/
