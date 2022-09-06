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
--     PAGE: 119
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00119
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>119);
end;
/
prompt --application/pages/page_00119
begin
wwv_flow_imp_page.create_page(
 p_id=>119
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'ACTIVITI HISTORIC ACTIVITY INSTANCES'
,p_step_title=>'ACTIVITI HISTORIC ACTIVITY INSTANCES'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20180606174906'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190973475049979231)
,p_plug_name=>'HISTORIC ACTIVITY TASKS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190973582112979232)
,p_plug_name=>'HISTORIC ACTIVITY INSTANCE FIELDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190973643920979233)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(190973475049979231)
,p_button_name=>'GHAI'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'GET HISTORIC ACTIVITY INSTANCE'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190973756166979234)
,p_name=>'P119_WEBRESP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(190973475049979231)
,p_prompt=>'ACTIVITY INSTANCE'
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
 p_id=>wwv_flow_imp.id(190973812744979235)
,p_name=>'P119_HAIID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'ID'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190973948049979236)
,p_name=>'P119_HAIAI'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'ACTIVITY ID'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190974010799979237)
,p_name=>'P119_HAIAN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'ACTIVITY NAME'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190974146591979238)
,p_name=>'P119_HAIAT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'ACTIVITY TYPE'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190974230941979239)
,p_name=>'P119_HAIPDI'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'PROCESS DEFINITION ID'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190974308423979240)
,p_name=>'P119_HAIPDU'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'PROCESS DEFINITION URL'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190974479519979241)
,p_name=>'P119_HAIPIID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'PROCESS INSTANCE ID'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190974516650979242)
,p_name=>'P119_HAIPIU'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'PROCESS INSTANCE URL'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190974611611979243)
,p_name=>'P119_HAIEID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'EXECUTION ID'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190974752335979244)
,p_name=>'P119_HAITID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'TASK ID'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190974829749979245)
,p_name=>'P119_HAICPIID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'CALLED PROCESS INSTANCE ID'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190974959518979246)
,p_name=>'P119_HAIA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'ASSIGNEE'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190975039050979247)
,p_name=>'P119_HAIST'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'START TIME'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190975177176979248)
,p_name=>'P119_HAIET'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'END TIME'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190975201282979249)
,p_name=>'P119_HAIDIM'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'DURATION IN MILLIS'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190975362018979250)
,p_name=>'P119_HAITENID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(190973582112979232)
,p_prompt=>'TENANT ID'
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
 p_id=>wwv_flow_imp.id(191001638539555801)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GHAI'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' l_clob_response       CLOB;',
' ',
'BEGIN',
'',
'',
'  l_clob_response := APEX_WEB_SERVICE.make_rest_request(',
'    p_url         => ''http://activiti.lg:8080/activiti-rest/service/history/historic-activity-instances'',',
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
'   :P119_WEBRESP := l_clob_response;',
'   ',
'   ',
'   --- PARSE THE CLOB CONTAINING JSON RESPONSE',
'         apex_json.parse(l_clob_response); ',
'',
'',
'',
'       --Set the fields on your page to the relevant response values',
'         :P119_HAIID :=  apex_json.get_varchar2(p_path => ''id'');',
'         :P119_HAIAI :=  apex_json.get_varchar2(p_path => ''activityId'');',
'         :P119_HAIAN :=  apex_json.get_varchar2(p_path => ''activityName'');',
'         :P119_HAIAT :=  apex_json.get_varchar2(p_path => ''activityType'');',
'         :P119_HAIPDI :=  apex_json.get_varchar2(p_path => ''processDefinitionId'');',
'         :P119_HAIPDU :=  apex_json.get_varchar2(p_path => ''processDefinitionUrl'');',
'         :P119_HAIPIID :=  apex_json.get_varchar2(p_path => ''processInstanceId'');',
'         :P119_HAIPIU :=  apex_json.get_varchar2(p_path => ''processInstanceUrl'');',
'         :P119_HAIEID :=  apex_json.get_varchar2(p_path => ''executionId'');',
'         :P119_HAITID :=  apex_json.get_varchar2(p_path => ''taskId'');',
'         :P119_HAICPIID :=  apex_json.get_varchar2(p_path => ''calledProcessInstanceId'');',
'         :P119_HAIA :=  apex_json.get_varchar2(p_path => ''assignee'');',
'         :P119_HAIST :=  apex_json.get_varchar2(p_path => ''startTime'');',
'         :P119_HAIET :=  apex_json.get_varchar2(p_path => ''endTime'');',
'         :P119_HAIDIM :=  apex_json.get_varchar2(p_path => ''durationInMillis'');',
'         :P119_HAITENID :=  apex_json.get_varchar2(p_path => ''tenantId'');',
'         ',
'        ',
'      --     :P1_MODEL := apex_json.get_varchar2(p_path => ''model'');',
'      --      :P1_MOT_DATE := apex_json.get_date (p_path => ''mot_date'', p_format => ''DD-MM-YYYY'');',
'      --    :P1_MILES := apex_json.get_number(p_path => ''miles'');',
'    ',
'',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(190973643920979233)
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
