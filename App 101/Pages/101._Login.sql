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
--     PAGE: 101
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00101
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>101);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_imp_page.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Login'
,p_alias=>'LOGIN'
,p_step_title=>'Login'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function setCookie(cname, cvalue, exdays) {',
'  var d = new Date();',
'  d.setTime(d.getTime() + (exdays*24*60*60*1000));',
'  var expires = "expires="+ d.toUTCString();',
'  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";',
'}'))
,p_step_template=>wwv_flow_imp.id(20900253323019108)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20220828090109'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20908129998019208)
,p_plug_name=>'Login'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20908436058019233)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(20908129998019208)
,p_button_name=>'P101_LOGIN'
,p_button_static_id=>'P101_LOGIN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Login'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_request_source=>'LOGIN'
,p_request_source_type=>'STATIC'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_grid_row_span=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20908245202019223)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(20908129998019208)
,p_placeholder=>'Enter Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_colspan=>2
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_icon_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20908326480019233)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(20908129998019208)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(291158382780660229)
,p_name=>'SET_STYLE_COOKIE'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(20908436058019233)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(291158418312660230)
,p_event_id=>wwv_flow_imp.id(291158382780660229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.cookie = "THEME_ID=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";',
'document.cookie = "THEME_STYLE_ID=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";',
'setCookie("THEME_ID","42",1);',
'setCookie("THEME_STYLE_ID","148743626905243756",1);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(291159226765660238)
,p_event_id=>wwv_flow_imp.id(291158382780660229)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20908656573019242)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'owa_util.mime_header(''text/html'', FALSE);',
'owa_cookie.send(',
'    name=>''LOGIN_USERNAME_COOKIE'',',
'    value=>lower(:P101_USERNAME));',
'exception when others then null;',
'end;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20908530947019236)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':V_Pass := :P101_PASSWORD;',
'',
'wwv_flow_custom_auth_std.login(',
'    P_UNAME       => :P101_USERNAME,',
'    P_PASSWORD    => :P101_PASSWORD,',
'    P_SESSION_ID  => v(''APP_SESSION''),',
'    P_FLOW_PAGE   => :APP_ID||'':59'');'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20908831350019244)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(291158219133660228)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_THEME_DETAILS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P_THEME_NUMBER := 42;',
':P_THEME_STYLE_ID := 294583613996323682;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20908726639019242)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v varchar2(255) := null;',
'    c owa_cookie.cookie;',
'begin',
'   c := owa_cookie.get(''LOGIN_USERNAME_COOKIE'');',
'   :P101_USERNAME := c.vals(1);',
'exception when others then null;',
'end;'))
,p_process_clob_language=>'PLSQL'
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
