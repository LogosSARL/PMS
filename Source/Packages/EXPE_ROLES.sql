--------------------------------------------------------
--  DDL for Package EXPE_ROLES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."EXPE_ROLES" 
as 
procedure get_role
( p_app_user  in varchar2
, p_role     out varchar2
);
procedure set_role
( p_app_id   in number
, p_app_user in varchar2
, p_role     in varchar2 
);
end;

/
