--------------------------------------------------------
--  DDL for Package Body EXPE_ROLES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRJ"."EXPE_ROLES" 
as
procedure get_role
( p_app_user  in varchar2
, p_role     out varchar2
)
is 
begin
  p_role:= 
    apex_util.get_preference
    ( p_preference => 'EXPE_ROLE'
    , p_user       => p_app_user
    );
end;
procedure set_role
( p_app_id   in number
, p_app_user in varchar2
, p_role     in varchar2 
)
is
begin
  apex_util.set_preference
  ( p_preference => 'EXPE_ROLE'
  , p_value      => p_role
  , p_user       => p_app_user
  ); 
  apex_acl.remove_user_role
  ( p_application_id => p_app_id
  , p_user_name      => p_app_user
  , p_role_static_id => 'ADMIN'
  );
  apex_acl.remove_user_role
  ( p_application_id => p_app_id
  , p_user_name      => p_app_user
  , p_role_static_id => 'VICE_PRESIDENT'
  );
  apex_acl.remove_user_role
  ( p_application_id => p_app_id
  , p_user_name      => p_app_user
  , p_role_static_id => 'MANAGER'
  );
  apex_acl.remove_user_role
  ( p_application_id => p_app_id
  , p_user_name      => p_app_user
  , p_role_static_id => 'ACCOUNTANT'
  );
  apex_acl.remove_user_role
  ( p_application_id => p_app_id
  , p_user_name      => p_app_user
  , p_role_static_id => 'EMPLOYEE'
  );
  apex_acl.add_user_role
  ( p_application_id => p_app_id
  , p_user_name      => p_app_user
  , p_role_static_id => p_role
  );
  
  -- if the user has the admin role, it also gets the other application roles
  if p_role = 'ADMIN'
  then
    apex_acl.add_user_role
    ( p_application_id => p_app_id
    , p_user_name      => p_app_user
    , p_role_static_id => 'VICE_PRESIDENT'
    );
    apex_acl.add_user_role
    ( p_application_id => p_app_id
    , p_user_name      => p_app_user
    , p_role_static_id => 'MANAGER'
    );
    
    apex_acl.add_user_role
    ( p_application_id => p_app_id
    , p_user_name      => p_app_user
    , p_role_static_id => 'ACCOUNTANT'
    );
    
    apex_acl.add_user_role
    ( p_application_id => p_app_id
    , p_user_name      => p_app_user
    , p_role_static_id => 'EMPLOYEE'
    );
  end if;
end;
end;

/
