--------------------------------------------------------
--  DDL for Package LDAP_GLOBALS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRJ"."LDAP_GLOBALS" 
authid definer
is
 
    g_host          constant varchar2(255)   := '128.128.5.200';
    g_port          constant number          := 636;
    g_search_base   constant varchar2(255)   := 'cn=administrator,cn=users,dc=ahfad,dc=edu,dc=sd';
    g_search_filter constant varchar2(255)   := 'cn=';
    g_exact_dn      constant boolean         := false;
    g_use_ssl       constant boolean         := true;

    -- if g_exact_dn is false, then we will start at the search base and find the user to get their DN.
    --   if true then we will just bind with the DN and you should pass the fully qualified user DN into p_username

    -- SSL is hard-coded to use mode 1, as modes 2 and 3 are highly unlikely.  See the DBMS_LDAP doc for more info.
    -- No wallet is needed for mode 1

end ldap_globals;

/
