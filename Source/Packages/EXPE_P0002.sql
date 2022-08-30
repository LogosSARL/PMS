--------------------------------------------------------
--  DDL for Package EXPE_P0002
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."EXPE_P0002" 
as 
 
procedure get_sbfl_data
( p_prcs_id        in number
, p_sbfl_id       out number
, p_sbfl_step_key out varchar2
);
end;

/
