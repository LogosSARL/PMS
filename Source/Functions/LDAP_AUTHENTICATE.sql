--------------------------------------------------------
--  DDL for Function LDAP_AUTHENTICATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."LDAP_AUTHENTICATE" (
    p_username        in    varchar2,
    p_password        in    varchar2)
return boolean
authid definer
is
    l_retval      pls_integer;
    l_session     dbms_ldap.session;
    l_attrs       dbms_ldap.string_collection;
    l_message     dbms_ldap.message;
    l_entry       dbms_ldap.message;
    l_dn          varchar2(1000);
    l_user_handle dbms_ldap_utl.handle;
    l_return      pls_integer;
    l_user_type   pls_integer;

    l_filter      varchar2(256);

    ---------------
    function do_connect
        return pls_integer
    as
        l_ldap_user   varchar2(256) := NULL;
        l_ldap_pwd    varchar2(256) := NULL;
    begin
        dbms_ldap.use_exception := true;
        l_session := dbms_ldap.init( ldap_globals.g_host , ldap_globals.g_port);

    if ldap_globals.g_use_ssl = true then
      l_retval := DBMS_LDAP.open_ssl(
                    ld              => l_session,
                    sslwrl          => NULL, -- wallet location, ie file:/etc/ORACLE/WALLETS/oracle
                    sslwalletpasswd => NULL, -- wallet password
                    sslauth         => 1); -- NO_AUTH :1, ONE_WAY_AUTH: 2, TWO_WAY_AUTH: 3
    end if; 

        return dbms_ldap.simple_bind_s( l_session, l_ldap_user, l_ldap_pwd );
    end;
    ----------------------

    ------------
    procedure do_close
    as
    begin
        l_retval := dbms_ldap.unbind_s( l_session );
    end do_close;
    ------------

    ------ 
    procedure handle_error(p_message in varchar2)
    as
    begin
        do_close;

        $IF $$logger $THEN
            logger.log_error(p_message);
        $END

        RAISE_APPLICATION_ERROR (-20001,p_message);
    end;
    ---------

begin
    l_user_type := DBMS_LDAP_UTL.AUTH_SIMPLE;

    l_retval := do_connect;

    if ldap_globals.g_exact_dn = false then

        l_attrs(1)  := 'dn';
    l_filter := '('|| ldap_globals.g_search_filter|| p_username||')';
        l_retval := dbms_ldap.search_s( l_session, ldap_globals.g_search_base, dbms_ldap.scope_subtree, l_filter, l_attrs, 0, l_message );

        l_retval := DBMS_LDAP.count_entries(l_session, l_message);

        if l_retval > 1 then
            handle_error('More than one entry found when searching for users DN.');
        end if;

        if l_retval = 0 then
            handle_error('No entries were found when searching for user DN');
        end if;

        l_entry := dbms_ldap.first_entry( l_session, l_message );
        l_dn := dbms_ldap.get_dn( l_session, l_entry );
    else
        l_dn := p_username;
    end if; -- ldap_globals.g_exact_dn = false

    l_retval := null;
    l_retval := DBMS_LDAP_UTL.create_user_handle(
                user_hd     => l_user_handle,
                user_type   => DBMS_LDAP_UTL.TYPE_DN,
                user_id     => l_dn);

        begin
      dbms_ldap.use_exception := false;
      l_return := null;
            l_return := dbms_ldap.simple_bind_s(
                ld      => l_session,
                dn      => l_dn,
                passwd  => p_password
                );
      if l_return != 0 then
        do_close;
        return false;
      end if;

        exception when others then
            do_close;
            raise;
        end;

    dbms_ldap.use_exception := true;
    do_close;
    if l_return is null then
        handle_error('simple_bind_s did not return a value.');
        return false;
    end if;

    if l_return = 0 then
        return true;
    end if;

    exception when others then
        do_close;
        raise;
        return false;
end ldap_authenticate;

/
