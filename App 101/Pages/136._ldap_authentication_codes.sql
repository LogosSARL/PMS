prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_220100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.0'
,p_default_workspace_id=>1680420756714069
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'PRJ'
);
end;
/
 
prompt APPLICATION 101 - Projects
--
-- Application Export:
--   Application:     101
--   Name:            Projects
--   Date and Time:   10:34 Tuesday September 6, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 136
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00136
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>136);
end;
/
prompt --application/pages/page_00136
begin
wwv_flow_imp_page.create_page(
 p_id=>136
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'ldap authentication codes'
,p_step_title=>'ldap authentication codes'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190114130045'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(285213473100887302)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(285213860430887306)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(285213473100887302)
,p_button_name=>'submit'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Submit'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(285214138589887309)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(285213473100887302)
,p_button_name=>'submitssl'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Submit SSL'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(285214501494887313)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(285213473100887302)
,p_button_name=>'submitssl2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Submit SSL NO Wallet'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(296775012741388701)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(285213473100887302)
,p_button_name=>'submitsslnew'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'submit SSL Test'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285213556895887303)
,p_name=>'P136_DEBUG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(285213473100887302)
,p_prompt=>'Debug'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285213377801887301)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'DECLARE ',
'',
'',
'retval       PLS_INTEGER;',
'my_session   DBMS_LDAP.session;',
'my_attrs     DBMS_LDAP.string_collection;',
'my_message   DBMS_LDAP.message;',
'my_entry     DBMS_LDAP.message;',
'entry_index  PLS_INTEGER;',
'my_dn        VARCHAR2(256);',
'my_attr_name VARCHAR2(256);',
'my_ber_elmt  DBMS_LDAP.ber_element;',
'attr_index   PLS_INTEGER;',
'i          PLS_INTEGER;',
'my_vals DBMS_LDAP.STRING_COLLECTION ;',
'ldap_host  VARCHAR2(256);',
'ldap_port  VARCHAR2(256);',
'ldap_user  VARCHAR2(256);',
'ldap_passwd  VARCHAR2(256);',
'ldap_base  VARCHAR2(256);',
'',
'BEGIN',
'',
'retval         := -1;',
'   ',
'-- Please customize the following variables as needed',
'ldap_host  := ''128.128.5.200'' ;',
'ldap_port  := ''389'';',
'--ldap_user  := ''cn=orcladmin'';',
'ldap_user  := ''cn=administrator,cn=users,dc=ahfad,dc=edu,dc=sd'';',
'',
'ldap_passwd:= ''p@ssword4o7C&C'';',
'ldap_base  := ''cn=administrator,cn=users,dc=ahfad,dc=edu,dc=sd'';',
'-- end of customizable settings ',
'',
' DBMS_OUTPUT.PUT(''DBMS_LDAP Search Example '');',
' DBMS_OUTPUT.PUT_LINE(''to directory .. '');',
' DBMS_OUTPUT.PUT_LINE(RPAD(''LDAP Host '',25,'' '') || '': '' || ldap_host);',
' DBMS_OUTPUT.PUT_LINE(RPAD(''LDAP Port '',25,'' '') || '': '' || ldap_port);',
' ',
' :P136_DEBUG := :P136_DEBUG || '' - '' || ''DBMS_LDAP Search Example '' || ''to directory .. '' || RPAD(''LDAP Host '',25,'' '') || '': '' || ldap_host || RPAD(''LDAP Port '',25,'' '') || '': '' || ldap_port;',
' ',
'',
' -- Choosing exceptions to be raised by DBMS_LDAP library.',
' DBMS_LDAP.USE_EXCEPTION := TRUE;',
'',
'',
' my_session := DBMS_LDAP.init(ldap_host,ldap_port);',
' ',
' DBMS_OUTPUT.PUT_LINE (RPAD(''Ldap session '',25,'' '')  || '': '' || RAWTOHEX(SUBSTR(my_session,1,8)) || ''(returned from init)'');',
'',
':P136_DEBUG := :P136_DEBUG || '' - '' || RPAD(''Ldap session '',25,'' '')  || '': '' || RAWTOHEX(SUBSTR(my_session,1,8)) || ''(returned from init)'';',
'',
' -- bind to the directory',
' retval := DBMS_LDAP.simple_bind_s(my_session,ldap_user, ldap_passwd);',
' ',
' DBMS_OUTPUT.PUT_LINE(RPAD(''simple_bind_s Returns '',25,'' '') || '': '' || TO_CHAR(retval));',
' ',
' :P136_DEBUG := :P136_DEBUG || '' - '' || RPAD(''simple_bind_s Returns '',25,'' '') || '': '' || TO_CHAR(retval);',
' ',
' -- issue the search',
' my_attrs(1) := ''*''; -- retrieve all attributes ',
' retval := DBMS_LDAP.search_s(my_session, ldap_base, DBMS_LDAP.SCOPE_SUBTREE,''objectclass=*'',my_attrs,0,my_message);',
'',
' DBMS_OUTPUT.PUT_LINE(RPAD(''search_s Returns '',25,'' '') || '': '' || TO_CHAR(retval));',
' DBMS_OUTPUT.PUT_LINE (RPAD(''LDAP message  '',25,'' '')  || '': '' || RAWTOHEX(SUBSTR(my_message,1,8)) || ''(returned from search_s)'');',
'',
'   :P136_DEBUG := :P136_DEBUG || '' - '' || RPAD(''search_s Returns '',25,'' '') || '': '' || TO_CHAR(retval) || RPAD(''LDAP message  '',25,'' '')  || '': '' || RAWTOHEX(SUBSTR(my_message,1,8)) || ''(returned from search_s)'';',
'   ',
' -- count the number of entries returned',
' retval := DBMS_LDAP.count_entries(my_session, my_message);',
' DBMS_OUTPUT.PUT_LINE(RPAD(''Number of Entries '',25,'' '') || '': '' || TO_CHAR(retval));',
' DBMS_OUTPUT.PUT_LINE(''---------------------------------------------------'');',
'',
'   :P136_DEBUG := :P136_DEBUG || '' - '' || RPAD(''Number of Entries '',25,'' '') || '': '' || TO_CHAR(retval);',
'',
' -- get the first entry',
' my_entry := DBMS_LDAP.first_entry(my_session, my_message);',
' entry_index := 1;',
'',
' -- Loop through each of the entries one by one',
' while my_entry IS NOT NULL loop',
'',
'   -- print the current entry',
'   my_dn := DBMS_LDAP.get_dn(my_session, my_entry);',
'   -- DBMS_OUTPUT.PUT_LINE (''        entry #'' || TO_CHAR(entry_index) ||',
'    -- '' entry ptr: '' || RAWTOHEX(SUBSTR(my_entry,1,8)));',
'   DBMS_OUTPUT.PUT_LINE (''        dn: '' || my_dn); ',
'   ',
'   :P136_DEBUG := :P136_DEBUG || '' - '' || ''        entry #'' || TO_CHAR(entry_index) || '' entry ptr: '' || RAWTOHEX(SUBSTR(my_entry,1,8));',
'   ',
'    :P136_DEBUG := :P136_DEBUG || '' - '' || ''        dn: '' || my_dn;',
'   ',
'   my_attr_name := DBMS_LDAP.first_attribute(my_session,my_entry,  my_ber_elmt);',
'   attr_index := 1;',
'   while my_attr_name IS NOT NULL loop',
'',
'     my_vals := DBMS_LDAP.get_values (my_session, my_entry, my_attr_name);',
'     if my_vals.COUNT > 0 then',
'       FOR i in my_vals.FIRST..my_vals.LAST loop',
'         DBMS_OUTPUT.PUT_LINE(''           '' || my_attr_name || '' : '' ||  SUBSTR(my_vals(i),1,200));',
'          ',
'          :P136_DEBUG := :P136_DEBUG || '' - '' || ''           '' || my_attr_name || '' : '' ||  SUBSTR(my_vals(i),1,200);',
'       end loop;',
'',
'     end if;',
'     my_attr_name := DBMS_LDAP.next_attribute(my_session,my_entry, my_ber_elmt);',
'     attr_index := attr_index+1;',
'',
'   end loop;',
'   my_entry := DBMS_LDAP.next_entry(my_session, my_entry);',
'   DBMS_OUTPUT.PUT_LINE(''==================================================='');',
'   entry_index := entry_index+1;',
'',
'end loop; -- unbind from the directory retval := DBMS_LDAP.unbind_s(my_session); DBMS_OUTPUT.PUT_LINE(RPAD(''unbind_res Returns '',25,'' '') || '': '' || TO_CHAR(retval)); DBMS_OUTPUT.PUT_LINE(''Directory operation Successful .. exiting''); -- Handle Excepti'
||'ons',
'',
'EXCEPTION',
'',
'WHEN OTHERS THEN',
'',
'   DBMS_OUTPUT.PUT_LINE('' Error code    : '' || TO_CHAR(SQLCODE));',
'   DBMS_OUTPUT.PUT_LINE('' Error Message : '' || SQLERRM);',
'   DBMS_OUTPUT.PUT_LINE('' Exception encountered .. exiting'');',
'',
'     :P136_DEBUG := :P136_DEBUG || '' - '' || '' Error code    : '' || TO_CHAR(SQLCODE) || '' Error Message : '' || SQLERRM || '' Exception encountered .. exiting'';',
'END; '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(285213860430887306)
,p_process_success_message=>'success'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285213991764887307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'',
'',
'retval       PLS_INTEGER;',
'my_session   DBMS_LDAP.session;',
'my_attrs     DBMS_LDAP.string_collection;',
'my_message   DBMS_LDAP.message;',
'my_entry     DBMS_LDAP.message;',
'entry_index  PLS_INTEGER;',
'my_dn        VARCHAR2(256);',
'my_attr_name VARCHAR2(256);',
'my_ber_elmt  DBMS_LDAP.ber_element;',
'attr_index   PLS_INTEGER;',
'i          PLS_INTEGER;',
'my_vals DBMS_LDAP.STRING_COLLECTION ;',
'ldap_host  VARCHAR2(256);',
'ldap_port  VARCHAR2(256);',
'ldap_user  VARCHAR2(256);',
'ldap_passwd  VARCHAR2(256);',
'ldap_base  VARCHAR2(256);',
'',
'BEGIN',
'',
'retval         := -1;',
'   ',
'-- Please customize the following variables as needed',
'ldap_host  := ''128.128.5.200'' ;',
'ldap_port  := ''636'';',
'--ldap_user  := ''cn=orcladmin'';',
'ldap_user  := ''cn=administrator,cn=users,dc=ahfad,dc=edu,dc=sd'';',
'',
'ldap_passwd:= ''p@ssword4o7C&C'';',
'ldap_base  := ''cn=administrator,cn=users,dc=ahfad,dc=edu,dc=sd'';',
'-- end of customizable settings ',
'',
' DBMS_OUTPUT.PUT(''DBMS_LDAP Search Example '');',
' DBMS_OUTPUT.PUT_LINE(''to directory .. '');',
' DBMS_OUTPUT.PUT_LINE(RPAD(''LDAP Host '',25,'' '') || '': '' || ldap_host);',
' DBMS_OUTPUT.PUT_LINE(RPAD(''LDAP Port '',25,'' '') || '': '' || ldap_port);',
' ',
' :P136_DEBUG := :P136_DEBUG || '' - '' || ''DBMS_LDAP Search Example '' || ''to directory .. '' || RPAD(''LDAP Host '',25,'' '') || '': '' || ldap_host || RPAD(''LDAP Port '',25,'' '') || '': '' || ldap_port;',
' ',
'',
' -- Choosing exceptions to be raised by DBMS_LDAP library.',
' DBMS_LDAP.USE_EXCEPTION := TRUE;',
'',
'',
' my_session := DBMS_LDAP.init(ldap_host,ldap_port);',
' ',
' DBMS_OUTPUT.PUT_LINE (RPAD(''Ldap session '',25,'' '')  || '': '' || RAWTOHEX(SUBSTR(my_session,1,8)) || ''(returned from init)'');',
'',
':P136_DEBUG := :P136_DEBUG || '' - '' || RPAD(''Ldap session '',25,'' '')  || '': '' || RAWTOHEX(SUBSTR(my_session,1,8)) || ''(returned from init)'';',
'',
' -- bind to the directory',
' retval := DBMS_LDAP.simple_bind_s(my_session,ldap_user, ldap_passwd);',
' ',
' DBMS_OUTPUT.PUT_LINE(RPAD(''simple_bind_s Returns '',25,'' '') || '': '' || TO_CHAR(retval));',
' ',
' :P136_DEBUG := :P136_DEBUG || '' - '' || RPAD(''simple_bind_s Returns '',25,'' '') || '': '' || TO_CHAR(retval);',
' ',
' -- issue the search',
' my_attrs(1) := ''*''; -- retrieve all attributes ',
' retval := DBMS_LDAP.search_s(my_session, ldap_base, DBMS_LDAP.SCOPE_SUBTREE,''objectclass=*'',my_attrs,0,my_message);',
'',
' DBMS_OUTPUT.PUT_LINE(RPAD(''search_s Returns '',25,'' '') || '': '' || TO_CHAR(retval));',
' DBMS_OUTPUT.PUT_LINE (RPAD(''LDAP message  '',25,'' '')  || '': '' || RAWTOHEX(SUBSTR(my_message,1,8)) || ''(returned from search_s)'');',
'',
'   :P136_DEBUG := :P136_DEBUG || '' - '' || RPAD(''search_s Returns '',25,'' '') || '': '' || TO_CHAR(retval) || RPAD(''LDAP message  '',25,'' '')  || '': '' || RAWTOHEX(SUBSTR(my_message,1,8)) || ''(returned from search_s)'';',
'   ',
' -- count the number of entries returned',
' retval := DBMS_LDAP.count_entries(my_session, my_message);',
' DBMS_OUTPUT.PUT_LINE(RPAD(''Number of Entries '',25,'' '') || '': '' || TO_CHAR(retval));',
' DBMS_OUTPUT.PUT_LINE(''---------------------------------------------------'');',
'',
'   :P136_DEBUG := :P136_DEBUG || '' - '' || RPAD(''Number of Entries '',25,'' '') || '': '' || TO_CHAR(retval);',
'',
' -- get the first entry',
' my_entry := DBMS_LDAP.first_entry(my_session, my_message);',
' entry_index := 1;',
'',
' -- Loop through each of the entries one by one',
' while my_entry IS NOT NULL loop',
'',
'   -- print the current entry',
'   my_dn := DBMS_LDAP.get_dn(my_session, my_entry);',
'   -- DBMS_OUTPUT.PUT_LINE (''        entry #'' || TO_CHAR(entry_index) ||',
'    -- '' entry ptr: '' || RAWTOHEX(SUBSTR(my_entry,1,8)));',
'   DBMS_OUTPUT.PUT_LINE (''        dn: '' || my_dn); ',
'   ',
'   :P136_DEBUG := :P136_DEBUG || '' - '' || ''        entry #'' || TO_CHAR(entry_index) || '' entry ptr: '' || RAWTOHEX(SUBSTR(my_entry,1,8));',
'   ',
'    :P136_DEBUG := :P136_DEBUG || '' - '' || ''        dn: '' || my_dn;',
'   ',
'   my_attr_name := DBMS_LDAP.first_attribute(my_session,my_entry,  my_ber_elmt);',
'   attr_index := 1;',
'   while my_attr_name IS NOT NULL loop',
'',
'     my_vals := DBMS_LDAP.get_values (my_session, my_entry, my_attr_name);',
'     if my_vals.COUNT > 0 then',
'       FOR i in my_vals.FIRST..my_vals.LAST loop',
'         DBMS_OUTPUT.PUT_LINE(''           '' || my_attr_name || '' : '' ||  SUBSTR(my_vals(i),1,200));',
'          ',
'          :P136_DEBUG := :P136_DEBUG || '' - '' || ''           '' || my_attr_name || '' : '' ||  SUBSTR(my_vals(i),1,200);',
'       end loop;',
'',
'     end if;',
'     my_attr_name := DBMS_LDAP.next_attribute(my_session,my_entry, my_ber_elmt);',
'     attr_index := attr_index+1;',
'',
'   end loop;',
'   my_entry := DBMS_LDAP.next_entry(my_session, my_entry);',
'   DBMS_OUTPUT.PUT_LINE(''==================================================='');',
'   entry_index := entry_index+1;',
'',
'end loop; -- unbind from the directory retval := DBMS_LDAP.unbind_s(my_session); DBMS_OUTPUT.PUT_LINE(RPAD(''unbind_res Returns '',25,'' '') || '': '' || TO_CHAR(retval)); DBMS_OUTPUT.PUT_LINE(''Directory operation Successful .. exiting''); -- Handle Excepti'
||'ons',
'',
'EXCEPTION',
'',
'WHEN OTHERS THEN',
'',
'   DBMS_OUTPUT.PUT_LINE('' Error code    : '' || TO_CHAR(SQLCODE));',
'   DBMS_OUTPUT.PUT_LINE('' Error Message : '' || SQLERRM);',
'   DBMS_OUTPUT.PUT_LINE('' Exception encountered .. exiting'');',
'',
'     :P136_DEBUG := :P136_DEBUG || '' - '' || '' Error code    : '' || TO_CHAR(SQLCODE) || '' Error Message : '' || SQLERRM || '' Exception encountered .. exiting'';',
'END; '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(285214138589887309)
,p_process_success_message=>'success'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285214250159887310)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create ldap_globals'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'create or replace package ldap_globals',
'authid definer',
'is',
' ',
'    g_host          constant varchar2(255)   := ''ldap.mycompany.com'';',
'    g_port          constant number          := 636;',
'    g_search_base   constant varchar2(255)   := ''dc=mycompany,dc=com'';',
'    g_search_filter constant varchar2(255)   := ''cn='';',
'    g_exact_dn      constant boolean         := false;',
'    g_use_ssl       constant boolean         := true;',
' ',
'    -- if g_exact_dn is false, then we will start at the search base and find the user to get their DN.',
'    --   if true then we will just bind with the DN and you should pass the fully qualified user DN into p_username',
' ',
'    -- SSL is hard-coded to use mode 1, as modes 2 and 3 are highly unlikely.  See the DBMS_LDAP doc for more info.',
'    -- No wallet is needed for mode 1',
' ',
'end ldap_globals;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(285214501494887313)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285214348700887311)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create ldap_authenticate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'begin',
'',
'',
'create or replace function  ldap_authenticate(',
'    p_username        in    varchar2,',
'    p_password        in    varchar2)',
'return boolean',
'authid definer',
'is',
'    l_retval      pls_integer;',
'    l_session     dbms_ldap.session;',
'    l_attrs       dbms_ldap.string_collection;',
'    l_message     dbms_ldap.message;',
'    l_entry       dbms_ldap.message;',
'    l_dn          varchar2(1000);',
'    l_user_handle dbms_ldap_utl.handle;',
'    l_return      pls_integer;',
'    l_user_type   pls_integer;',
' ',
'    l_filter      varchar2(256);',
' ',
'    function do_connect',
'        return pls_integer',
'    as',
'        l_ldap_user   varchar2(256) := NULL;',
'        l_ldap_pwd    varchar2(256) := NULL;',
'    begin',
'        dbms_ldap.use_exception := true;',
'        l_session := dbms_ldap.init( ldap_globals.g_host , ldap_globals.g_port);',
' ',
'    if ldap_globals.g_use_ssl = true then',
'      l_retval := DBMS_LDAP.open_ssl(',
'                    ld              => l_session,',
'                    sslwrl          => NULL, -- wallet location, ie file:/etc/ORACLE/WALLETS/oracle',
'                    sslwalletpasswd => NULL, -- wallet password',
'                    sslauth         => 1); -- NO_AUTH :1, ONE_WAY_AUTH: 2, TWO_WAY_AUTH: 3',
'    end if; ',
' ',
'        return dbms_ldap.simple_bind_s( l_session, l_ldap_user, l_ldap_pwd );',
'    end;',
' ',
'    procedure do_close',
'    as',
'    begin',
'        l_retval := dbms_ldap.unbind_s( l_session );',
'    end do_close;',
' ',
'    procedure handle_error(p_message in varchar2)',
'    as',
'    begin',
'        do_close;',
' ',
'        $IF $$logger $THEN',
'            logger.log_error(p_message);',
'        $END',
' ',
'        RAISE_APPLICATION_ERROR (-20001,p_message);',
'    end;',
' ',
'begin',
'    l_user_type := DBMS_LDAP_UTL.AUTH_SIMPLE;',
' ',
'    l_retval := do_connect;',
' ',
'    if ldap_globals.g_exact_dn = false then',
' ',
'        l_attrs(1)  := ''dn'';',
'    l_filter := ''(''|| ldap_globals.g_search_filter|| p_username||'')'';',
'        l_retval := dbms_ldap.search_s( l_session, ldap_globals.g_search_base, dbms_ldap.scope_subtree, l_filter, l_attrs, 0, l_message );',
' ',
'        l_retval := DBMS_LDAP.count_entries(l_session, l_message);',
' ',
'        if l_retval > 1 then',
'            handle_error(''More than one entry found when searching for users DN.'');',
'        end if;',
' ',
'        if l_retval = 0 then',
'            handle_error(''No entries were found when searching for user DN'');',
'        end if;',
' ',
'        l_entry := dbms_ldap.first_entry( l_session, l_message );',
'        l_dn := dbms_ldap.get_dn( l_session, l_entry );',
'    else',
'        l_dn := p_username;',
'    end if; -- ldap_globals.g_exact_dn = false',
' ',
'    l_retval := null;',
'    l_retval := DBMS_LDAP_UTL.create_user_handle(',
'                user_hd     => l_user_handle,',
'                user_type   => DBMS_LDAP_UTL.TYPE_DN,',
'                user_id     => l_dn);',
' ',
'        begin',
'      dbms_ldap.use_exception := false;',
'      l_return := null;',
'            l_return := dbms_ldap.simple_bind_s(',
'                ld      => l_session,',
'                dn      => l_dn,',
'                passwd  => p_password',
'                );',
'      if l_return != 0 then',
'        do_close;',
'        return false;',
'      end if;',
' ',
'        exception when others then',
'            do_close;',
'            raise;',
'        end;',
' ',
'    dbms_ldap.use_exception := true;',
'    do_close;',
'    if l_return is null then',
'        handle_error(''simple_bind_s did not return a value.'');',
'        return false;',
'    end if;',
' ',
'    if l_return = 0 then',
'        return true;',
'    end if;',
' ',
'    exception when others then',
'        do_close;',
'        raise;',
'        return false;',
'end ldap_authenticate;',
'',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(285214501494887313)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(285214474504887312)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'test ssl'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_return boolean;',
'begin',
'    l_return := ldap_authenticate(',
'                    p_username  => ''first.last'',',
'                    p_password  => '''');',
' ',
'    if l_return = true then',
'        dbms_output.put_line(''Authenticated'');',
'    else',
'        dbms_output.put_line(''Fail!'');',
'    end;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(285214501494887313)
,p_process_success_message=>'success'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(296775154240388702)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_return boolean;',
'begin',
'    l_return := ldap_authenticate(',
'                    p_username  => ''first.last'',',
'                    p_password  => '''');',
' ',
'    if l_return = true then',
'        dbms_output.put_line(''Authenticated'');',
'    else',
'        dbms_output.put_line(''Fail!'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(296775012741388701)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
