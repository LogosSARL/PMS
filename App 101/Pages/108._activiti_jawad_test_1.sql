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
--   Date and Time:   11:25 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 108
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00108
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>108);
end;
/
prompt --application/pages/page_00108
begin
wwv_flow_imp_page.create_page(
 p_id=>108
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'activiti jawad test'
,p_step_title=>'activiti jawad test'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20180604172618'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190744943935994001)
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
 p_id=>wwv_flow_imp.id(190745053204994002)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(190744943935994001)
,p_button_name=>'activitirestapi'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'test activiti rest api'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190842162276190502)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(190744943935994001)
,p_button_name=>'list_task'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'List Task'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190842368766190504)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(190744943935994001)
,p_button_name=>'query_task'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Create Task'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190842574368190506)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(190744943935994001)
,p_button_name=>'list_deployment'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'List Deployment'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190842006014190501)
,p_name=>'P108_RESPONSE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(190744943935994001)
,p_prompt=>'Response: '
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190842709690190508)
,p_name=>'P108_DEPLOYMENTID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(190744943935994001)
,p_prompt=>'Deployment ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190730501963451501)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' l_clob_response       CLOB;',
' ',
'BEGIN',
'',
'',
'  l_clob_response := APEX_WEB_SERVICE.make_rest_request(',
'    p_url         => ''http://activiti.lg:8080/activiti-rest/service/runtime/tasks'',',
'    p_http_method => ''GET'',',
' --    p_scheme => ''APEX_050000'',',
'      p_transfer_timeout => 1440000,',
' --      p_parm_name   => APEX_UTIL.string_to_table(''year:month''),',
'   --   p_parm_value  => APEX_UTIL.string_to_table(param_v),',
'      p_username          => ''kermit'',',
'   p_password          =>    ''kermit''',
'  );',
'  ',
'  if apex_web_service.g_status_code = 200 then --ok  ',
'     apex_debug.message(''DEBUGMSG: service Tranfer ACTIVITI REST API DEPLOYMENTS was invoked successfully'');  ',
'    else  ',
'      raise_application_error(-20000,''ACTIVITI REST API DEPLOYMENTS WS call failed with response code '' || apex_web_service.g_status_code);',
'      ',
'    end if;  ',
'    ',
'    ',
'   :P108_RESPONSE := l_clob_response;',
'    ',
'',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(190745053204994002)
,p_process_success_message=>'success apex message'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190842281123190503)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'list task'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' l_clob_response       CLOB;',
' ',
'BEGIN',
'',
'',
'  l_clob_response := APEX_WEB_SERVICE.make_rest_request(',
'    p_url         => ''http://activiti.lg:8080/activiti-rest/service/runtime/tasks'',',
'    p_http_method => ''GET'',',
' --    p_scheme => ''APEX_050000'',',
'      p_transfer_timeout => 1440000,',
' --      p_parm_name   => APEX_UTIL.string_to_table(''year:month''),',
'   --   p_parm_value  => APEX_UTIL.string_to_table(param_v),',
'      p_username          => ''kermit'',',
'   p_password          =>    ''kermit''',
'  );',
'  ',
'  if apex_web_service.g_status_code = 200 then --ok  ',
'     apex_debug.message(''DEBUGMSG: service Tranfer ACTIVITI REST API DEPLOYMENTS was invoked successfully'');  ',
'    else  ',
'      raise_application_error(-20000,''ACTIVITI REST API DEPLOYMENTS WS call failed with response code '' || apex_web_service.g_status_code);',
'      ',
'    end if;  ',
'    ',
'    ',
'   :P108_RESPONSE := l_clob_response;',
'    ',
'',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(190842162276190502)
,p_process_success_message=>'success list task'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190842479156190505)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'query task'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  lc_entire_msg        CLOB;',
'  lv_url               VARCHAR2 (32000);',
'  lr_request            utl_http.req;',
'  lr_response          utl_http.resp;',
'  lv_msg               VARCHAR2 (80);',
'  content varchar2(4000) := ''{"name":"My task", "description":"The task description"}'';',
'--  content varchar2(4000) := '' '';',
'  ',
'   l_list         varchar2(32000);',
'   pos            pls_integer;',
'   endpos          pls_integer;',
'',
'BEGIN ',
'',
'    ---CREATE A DEMO JSON REQUEST/RESPONSE',
'    lv_url := ''http://activiti.lg:8080/activiti-rest/service/query/tasks'';',
'',
'',
'    --- CREATE http request and get response',
'  ',
'    lr_request := utl_http.begin_request(lv_url, ''POST'','' HTTP/1.1'');',
'    utl_http.set_header(lr_request, ''user-agent'', ''mozilla/4.0''); ',
'    utl_http.set_header(lr_request, ''content-type'', ''application/json''); ',
'    utl_http.set_header(lr_request, ''Content-Length'', length(content));',
'    utl_http.set_header(lr_request, ''Authorization'',''Basic '' || utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_i18n.string_to_raw(''kermit:kermit'', ''AL32UTF8''))));',
'    ',
'    ',
' ',
'    ',
' ',
' ',
'   utl_http.write_text(lr_request, content);',
'',
'   lr_response := utl_http.get_response(lr_request);',
'',
'',
'   --- LOOP THROUGH THE RESPONSE AND ADD IT TO THE CLOB',
'     BEGIN ',
'        LOOP ',
'          utl_http.read_text(r => lr_response, data => lv_msg);',
'           lc_entire_msg := lc_entire_msg || lv_msg;',
'      --  UTL_HTTP.READ_LINE(lr_response, lv_msg , TRUE);',
'',
'        END LOOP;',
'',
'    EXCEPTION ',
'       WHEN utl_http.end_of_body THEN',
'          utl_http.end_response(lr_response);',
'',
'      WHEN OTHERS THEN ',
'        utl_tcp.close_all_connections;',
'',
'      END;',
'',
'      --- PARSE THE CLOB CONTAINING JSON RESPONSE',
'      --    apex_json.parse(lc_entire_msg); ',
'',
'',
'',
'       --Set the fields on your page to the relevant response values',
'      --    :P1_MAKE :=  apex_json.get_varchar2(p_path => ''make'');',
'      --     :P1_MODEL := apex_json.get_varchar2(p_path => ''model'');',
'      --      :P1_MOT_DATE := apex_json.get_date (p_path => ''mot_date'', p_format => ''DD-MM-YYYY'');',
'      --    :P1_MILES := apex_json.get_number(p_path => ''miles'');',
'     ',
'     ',
'  --    pos := instr(lc_entire_msg,''<b>'');',
'  --   endpos := instr(lc_entire_msg,''<br>'',pos);',
'  --   l_list := substr(lc_entire_msg,pos,endpos - pos);',
'     ',
'   ',
'     ',
'    :P108_RESPONSE := lc_entire_msg;',
' ',
'  ---      :P356_TXT :=  l_list;',
'  ',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(190842368766190504)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190842652466190507)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'list deployment'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' l_clob_response       CLOB;',
' ',
'BEGIN',
'',
'',
'  l_clob_response := APEX_WEB_SERVICE.make_rest_request(',
'    p_url         => ''http://activiti.lg:8080/activiti-rest/service/repository/deployments'',',
'    p_http_method => ''GET'',',
' --    p_scheme => ''APEX_050000'',',
'      p_transfer_timeout => 1440000,',
' --      p_parm_name   => APEX_UTIL.string_to_table(''year:month''),',
'   --   p_parm_value  => APEX_UTIL.string_to_table(param_v),',
'      p_username          => ''kermit'',',
'   p_password          =>    ''kermit''',
'  );',
'  ',
'  if apex_web_service.g_status_code = 200 then --ok  ',
'     apex_debug.message(''DEBUGMSG: service Tranfer ACTIVITI REST API DEPLOYMENTS was invoked successfully'');  ',
'    else  ',
'      raise_application_error(-20000,''ACTIVITI REST API DEPLOYMENTS WS call failed with response code '' || apex_web_service.g_status_code);',
'      ',
'    end if;  ',
'    ',
'    ',
'   :P108_RESPONSE := l_clob_response;',
'   ',
'   ',
'   --- PARSE THE CLOB CONTAINING JSON RESPONSE',
'   --       apex_json.parse(l_clob_response); ',
'',
'',
'',
'       --Set the fields on your page to the relevant response values',
'     --     :P108_DEPLOYMENTID :=  apex_json.get_varchar2(p_path => ''name'');',
'     ',
'                :P108_DEPLOYMENTID :=  SUBSTR(l_clob_response, 17, 2);',
'      --     :P1_MODEL := apex_json.get_varchar2(p_path => ''model'');',
'      --      :P1_MOT_DATE := apex_json.get_date (p_path => ''mot_date'', p_format => ''DD-MM-YYYY'');',
'      --    :P1_MILES := apex_json.get_number(p_path => ''miles'');',
'    ',
'',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(190842574368190506)
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
