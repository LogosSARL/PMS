--------------------------------------------------------
--  DDL for Package EXPE_FLOW_EXPENSECLAIMS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."EXPE_FLOW_EXPENSECLAIMS" 
as 
 
function get_expe_comment_mgr
return varchar2;
function get_expe_comment_vp
return varchar2;
function get_expe_purpose
return varchar2;
function get_mailto
return varchar2;
procedure make_payment;
function check_amount
return varchar2;
procedure validate_expense;
end;

/
