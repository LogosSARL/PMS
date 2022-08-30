--------------------------------------------------------
--  DDL for Package Body EXPE_FLOW_EXPENSECLAIMS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."EXPE_FLOW_EXPENSECLAIMS" 
as 
 
function get_expe_comment_mgr
return varchar2
as
  l_business_ref      number;
  l_expe_comment_mgr  expe_expenses.expe_comment_mgr%type;
  
begin 
  -- retrieve business ref
  l_business_ref:= flow_globals.business_ref;
  -- retrieve expensed purpose and employee name
  select expe.expe_comment_mgr
    into l_expe_comment_mgr
    from expe_expenses expe 
   where expe.expe_id = l_business_ref
       ; 
  return l_expe_comment_mgr;
end;
function get_expe_comment_vp
return varchar2
as
  l_business_ref     number;
  l_expe_comment_vp  expe_expenses.expe_comment_mgr%type;
  
begin 
  -- retrieve business ref
  l_business_ref:= flow_globals.business_ref;
  -- retrieve expensed purpose and employee name
  select expe.expe_comment_vp
    into l_expe_comment_vp
    from expe_expenses expe 
   where expe.expe_id = l_business_ref
       ; 
  return l_expe_comment_vp;
end;
function get_expe_purpose
return varchar2
as
  l_business_ref   number;
  l_expe_purpose  expe_expenses.expe_purpose%type;
  
begin 
  -- retrieve business ref
  l_business_ref:= flow_globals.business_ref;
  -- retrieve expensed purpose and employee name
  select expe.expe_purpose
    into l_expe_purpose
    from expe_expenses expe 
   where expe.expe_id = l_business_ref
       ;
  return l_expe_purpose;
end;
function get_mailto
return varchar2
as
  l_business_ref      number;
  l_expe_submitted_by expe_expenses.expe_submitted_by%type;
  l_mailto            varchar2(255 char);
  
begin 
  -- retrieve business ref
  l_business_ref:= flow_globals.business_ref;
  -- retrieve expensed purpose and employee name
  select expe.expe_submitted_by
    into l_expe_submitted_by
    from expe_expenses expe 
   where expe.expe_id = l_business_ref
       ;
  -- retrieve users email 
  l_mailto:= apex_util.get_email(p_username => l_expe_submitted_by);
  return l_mailto;
end;
procedure make_payment
as 
 
  l_business_ref number;
begin 
  -- retrieve business ref
  l_business_ref:= flow_globals.business_ref;
  -- set expense status 
  update expe_expenses expe 
     set expe.expe_status = expe_constants.gc_expe_status_paid 
   where expe.expe_id = l_business_ref
       ;
end;
function check_amount
return varchar2
is
  l_business_ref  number;
  l_amount        number;
  l_bpmn_conn_id  varchar2(10 char);
begin
  l_bpmn_conn_id:= '';
  
  -- retrieve amount
  l_business_ref:= flow_globals.business_ref;
 
  select expe.expe_amount
    into l_amount
    from expe_expenses expe
   where expe.expe_id = l_business_ref
       ;
  -- decide if the vice president should approve this expense claim
  case
  when l_amount <= 50
  then
    l_bpmn_conn_id:= 'no_vp';
  else
    l_bpmn_conn_id:= 'yes_vp';
  end case;
  
  return l_bpmn_conn_id;
end;
procedure validate_expense
as
  l_prcs_id                number;
  l_business_ref           number;
  l_expe_validation_result expe_expenses.expe_validation_result%type;
  l_expe_amount            expe_expenses.expe_amount%type;
begin 
  -- retrieve business ref
  l_business_ref:= flow_globals.business_ref;
  --
  -- you can do background analysis on the expense claim here
  -- for instance, you could check for certain patterns
  -- to give the approver a better insight
  -- example: check for purpose 'hotel' for which an expense should not exceed 120 USD
  begin
    select expe.expe_amount
      into l_expe_amount
      from expe_expenses expe
     where expe.expe_id = l_business_ref
       and lower(expe.expe_purpose) like '%hotel%'
         ;
         
  exception
    when NO_DATA_FOUND
    then
      l_expe_amount:= 0;
  end; 
  case
  when l_expe_amount > 120
  then
    l_expe_validation_result:= 'cost for hotel exceeds limit';
  else  
    l_expe_validation_result:= 'clear';
  end case;
  -- set validation result
  update expe_expenses expe 
     set expe.expe_validation_result = l_expe_validation_result
   where expe.expe_id = l_business_ref
       ;
end;
end;

/
