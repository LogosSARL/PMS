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
--     PAGE: 114
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00114
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>114);
end;
/
prompt --application/pages/page_00114
begin
wwv_flow_imp_page.create_page(
 p_id=>114
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'PROCESS INSTANCE'
,p_step_title=>'PROCESS INSTANCE'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20180625153811'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190900272041355501)
,p_plug_name=>'PROCESS INSTANCE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190900303169355502)
,p_plug_name=>'PROCESS INSTANCE FIELDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(193770480146298010)
,p_plug_name=>'START PROCESS INSTANCE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190900565416355504)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(190900272041355501)
,p_button_name=>'GETPI'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'GET PROCESS INSTANCE'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(193771663800298022)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(193770480146298010)
,p_button_name=>'STARTPROCESSINSTANCE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Start Process Instance'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190900422718355503)
,p_name=>'P114_WEBRESP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(190900272041355501)
,p_prompt=>'PROCESS INSTANCE'
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
 p_id=>wwv_flow_imp.id(190900649947355505)
,p_name=>'P114_PIID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(190900303169355502)
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
 p_id=>wwv_flow_imp.id(190900774968355506)
,p_name=>'P114_PIURL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(190900303169355502)
,p_prompt=>'URL'
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
 p_id=>wwv_flow_imp.id(190900855152355507)
,p_name=>'P114_PIBK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(190900303169355502)
,p_prompt=>'BUSINESS KEY'
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
 p_id=>wwv_flow_imp.id(190900903202355508)
,p_name=>'P114_PIS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(190900303169355502)
,p_prompt=>'SUSPENDED'
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
 p_id=>wwv_flow_imp.id(190901019572355509)
,p_name=>'P114_PIPDU'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(190900303169355502)
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
 p_id=>wwv_flow_imp.id(190901142548355510)
,p_name=>'P114_PIAID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(190900303169355502)
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
 p_id=>wwv_flow_imp.id(190901243682355511)
,p_name=>'P114_PITID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(190900303169355502)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(193771292935298018)
,p_name=>'P114_PIPDID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(193770480146298010)
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
 p_id=>wwv_flow_imp.id(193771341383298019)
,p_name=>'P114_PIBK_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(193770480146298010)
,p_prompt=>'BUSINESS KEY'
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
 p_id=>wwv_flow_imp.id(193771490902298020)
,p_name=>'P114_PIVN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(193770480146298010)
,p_prompt=>'VARIABLE NAME'
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
 p_id=>wwv_flow_imp.id(193771517715298021)
,p_name=>'P114_PIVV'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(193770480146298010)
,p_prompt=>'VARIABLE VALUE'
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
 p_id=>wwv_flow_imp.id(190901336616355512)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET PROCESS INSTANCE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' l_clob_response       CLOB;',
' ',
'BEGIN',
'',
'',
'  l_clob_response := APEX_WEB_SERVICE.make_rest_request(',
'    p_url         => ''http://activiti.lg:8080/activiti-rest/service/runtime/process-instances/'',',
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
'   :P114_WEBRESP := l_clob_response;',
'   ',
'   ',
'   --- PARSE THE CLOB CONTAINING JSON RESPONSE',
'         apex_json.parse(l_clob_response); ',
'',
'',
'',
'       --Set the fields on your page to the relevant response values',
'         :P114_PIID :=  apex_json.get_varchar2(p_path => ''id'');',
'         :P114_PIURL :=  apex_json.get_varchar2(p_path => ''url'');',
'         :P114_PIBK :=  apex_json.get_varchar2(p_path => ''businessKey'');',
'         :P114_PIS :=  apex_json.get_varchar2(p_path => ''suspended'');',
'        :P114_PIPDU :=  apex_json.get_varchar2(p_path => ''processDefinitionUrl'');',
'        :P114_PIAID :=  apex_json.get_varchar2(p_path => ''activityId'');',
'        :P114_PITID :=  apex_json.get_varchar2(p_path => ''tenantId'');',
'        ',
'        ',
'      --     :P1_MODEL := apex_json.get_varchar2(p_path => ''model'');',
'      --      :P1_MOT_DATE := apex_json.get_date (p_path => ''mot_date'', p_format => ''DD-MM-YYYY'');',
'      --    :P1_MILES := apex_json.get_number(p_path => ''miles'');',
'    ',
'',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(190900565416355504)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(193771799458298023)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'STARTPROCESSINSTANCE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  lc_entire_msg        CLOB;',
'  lv_url               VARCHAR2 (32000);',
'  lr_request            utl_http.req;',
'  lr_response          utl_http.resp;',
'  lv_msg               VARCHAR2 (80);',
'  content varchar2(4000) := ''{"processDefinitionId":"createTimersProcess:1:36","businessKey":"myBusinessKey",',
'   "variables": [',
'      {',
'        "name":"myVar",',
'        "value":"This is a variable"',
'      }',
'   ]',
'}'';',
'--  content varchar2(4000) := '' '';',
'  ',
'   l_list         varchar2(32000);',
'   pos            pls_integer;',
'   endpos          pls_integer;',
'',
'BEGIN ',
'',
'    ---CREATE A DEMO JSON REQUEST/RESPONSE',
'    lv_url := ''http://activiti.lg:8080/activiti-rest/service/runtime/process-instances'';',
'--    content  := ''{"assignee" : '' || :P115_TA_1 || '',"createTime" : '' || :P115_TCT_1 || '',"delegationState" : '' || :P115_TDS_1 || '',"description" : '' || :P115_TD_1 || '',"dueDate" : '' || :P115_TDD_1 || '',"executionUrl" : '' || :P115_TEU_1 || '',"execut'
||'ionId" : '' || :P115_TEID_1 || '',"id" : '' || :P115_TID_1 || '',"name" : '' || :P115_TN_1 || '',"owner" : '' || :P115_TO_1 || '',"parentTaskUrl" : '' || :P115_TPTU_1 || '',"parentTaskId" : '' || :P115_TPTID_1 || '',"priority" : '' || :P115_TP_1 || '',"processDefi'
||'nitionUrl" : '' || :P115_TPDU_1 || '',"processDefinitionId" : '' || :P115_TPDID_1 || '',"processInstanceUrl" : '' || :P115_TPIU_1 || '',"processInstanceId" : '' || :P115_TPIID_1 || '',"suspended" : '' || :P115_TS_1 || '',"formKey" : '' || :P115_TFK_1 || '',"cate'
||'gory": '' || :P115_TC_1 || '',"taskDefinitionKey" : '' || :P115_TTDK_1 || '',"url" : '' || :P115_TU_1 || '',"tenantId" : '' || :P115_TTID_1 || ''}'';',
'--content  := ''{"processDefinitionId":"'' || :P114_PIPDID || ''","businessKey":"'' || :P114_PIBK_1 || ''","variables": [{"name":"'' || :P114_PIVN || ''","value":"'' || :P114_PIVV || ''",}]}'';',
'  ',
'  ',
'  ',
'  --- CREATE http request and get response',
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
'    ',
'     ',
'   ',
'     ',
'    :P114_WEBRESP := lc_entire_msg;',
' ',
'  ---      :P356_TXT :=  l_list;',
'  ',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(193771663800298022)
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
