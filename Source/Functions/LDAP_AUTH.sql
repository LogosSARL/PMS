--------------------------------------------------------
--  DDL for Function LDAP_AUTH
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."LDAP_AUTH" 
(p_username in VARCHAR2, p_password in VARCHAR2)
return BOOLEAN

IS
  l_ldap_host     VARCHAR2(256) := '128.128.5.200';
  l_ldap_port     VARCHAR2(256) := '389';
  l_ldap_base     VARCHAR2(256) := ',CN=Users,DC=ahfad,DC=edu,DC=sd';
  l_dn_prefix     VARCHAR2(100) := 'CN=';-- 'USERS\'; 

  l_retval        PLS_INTEGER;
  l_session       DBMS_LDAP.session;
BEGIN
  -- Choose to raise exceptions.
  DBMS_LDAP.use_exception := TRUE;
  
  -- Connect to the LDAP server.
  l_session := DBMS_LDAP.init(hostname => l_ldap_host,
                              portnum  => l_ldap_port);
  
  l_retval := DBMS_LDAP.simple_bind_s(ld     => l_session,
                                     dn     =>  l_dn_prefix || p_username || l_ldap_base  ,
                                     passwd => p_password);
                                      
  -- No exceptions mean you are authenticated.
  RETURN TRUE;
EXCEPTION
  WHEN OTHERS THEN
    -- Exception means authentication failed. 
   if l_session is not null then
   l_retval := DBMS_LDAP.unbind_s(ld => l_session);
   end if;
   APEX_UTIL.set_custom_auth_status(p_status => 'Incorrect username and/or password');
    RETURN FALSE;    
END;

/
