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
--     PAGE: 110
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00110
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>110);
end;
/
prompt --application/pages/page_00110
begin
wwv_flow_imp_page.create_page(
 p_id=>110
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'ACTIVITI DEPLOYMENT PAGE'
,p_step_title=>'ACTIVITI DEPLOYMENT PAGE'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20180625130942'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190867412498056416)
,p_plug_name=>'DEPLOYMENT'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190867725118056419)
,p_plug_name=>'DEPLOYMENT FIELDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(193769593179297901)
,p_plug_name=>'CREATE DEPLOYMENT FIELDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190867556606056417)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(190867412498056416)
,p_button_name=>'GETDEPLOYMENT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'GET DEPLOYMENT'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(193770203921298008)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(193769593179297901)
,p_button_name=>'createdeployment'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Create Deployment'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190867674055056418)
,p_name=>'P110_WEBRESP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(190867412498056416)
,p_prompt=>'Webresp'
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
 p_id=>wwv_flow_imp.id(190867883647056420)
,p_name=>'P110_DID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(190867725118056419)
,p_prompt=>' ID'
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
 p_id=>wwv_flow_imp.id(190867961146056421)
,p_name=>'P110_DNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(190867725118056419)
,p_prompt=>'NAME'
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
 p_id=>wwv_flow_imp.id(190868051026056422)
,p_name=>'P110_DTIME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(190867725118056419)
,p_prompt=>'TIME'
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
 p_id=>wwv_flow_imp.id(190868102881056423)
,p_name=>'P110_DCATEGORY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(190867725118056419)
,p_prompt=>'CATEGORY'
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
 p_id=>wwv_flow_imp.id(190868236384056424)
,p_name=>'P110_DURL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(190867725118056419)
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
 p_id=>wwv_flow_imp.id(190868319122056425)
,p_name=>'P110_DTENANT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(190867725118056419)
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
 p_id=>wwv_flow_imp.id(193769659589297902)
,p_name=>'P110_DID_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(193769593179297901)
,p_prompt=>' ID'
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
 p_id=>wwv_flow_imp.id(193769766354297903)
,p_name=>'P110_DNAME_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(193769593179297901)
,p_prompt=>'NAME'
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
 p_id=>wwv_flow_imp.id(193769806540297904)
,p_name=>'P110_DTIME_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(193769593179297901)
,p_prompt=>'TIME'
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
 p_id=>wwv_flow_imp.id(193769936301297905)
,p_name=>'P110_DCATEGORY_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(193769593179297901)
,p_prompt=>'CATEGORY'
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
 p_id=>wwv_flow_imp.id(193770027943297906)
,p_name=>'P110_DURL_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(193769593179297901)
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
 p_id=>wwv_flow_imp.id(193770122670297907)
,p_name=>'P110_DTENANT_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(193769593179297901)
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
 p_id=>wwv_flow_imp.id(190868436754056426)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GETDEPLOYMENT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' l_clob_response       CLOB;',
' ',
'BEGIN',
'',
'',
'  l_clob_response := APEX_WEB_SERVICE.make_rest_request(',
'    p_url         => ''http://activiti.lg:8080/activiti-rest/service/repository/deployments/20'',',
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
'   :P110_WEBRESP := l_clob_response;',
'   ',
'   ',
'   --- PARSE THE CLOB CONTAINING JSON RESPONSE',
'         apex_json.parse(l_clob_response); ',
'',
'',
'',
'       --Set the fields on your page to the relevant response values',
'         :P110_DID :=  apex_json.get_varchar2(p_path => ''id'');',
'         :P110_DNAME :=  apex_json.get_varchar2(p_path => ''name'');',
'     ',
'         :P110_DTIME :=  apex_json.get_varchar2(p_path => ''deploymentTime'');',
'         :P110_DCATEGORY :=  apex_json.get_varchar2(p_path => ''category'');',
'         :P110_DURL :=  apex_json.get_varchar2(p_path => ''url'');',
'         :P110_DTENANT :=  apex_json.get_varchar2(p_path => ''tenant'');',
'      --     :P1_MODEL := apex_json.get_varchar2(p_path => ''model'');',
'      --      :P1_MOT_DATE := apex_json.get_date (p_path => ''mot_date'', p_format => ''DD-MM-YYYY'');',
'      --    :P1_MILES := apex_json.get_number(p_path => ''miles'');',
'    ',
'',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(190867556606056417)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(193770398972298009)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'createdeployment'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  lc_entire_msg        CLOB;',
'  lv_url               VARCHAR2 (32000);',
'  lr_request            utl_http.req;',
'  lr_response          utl_http.resp;',
'  lv_msg               VARCHAR2 (80);',
'--  content varchar2(4000) := ''{"name":"My task", "description":"The task description"}'';',
'  content varchar2(4000) := '' '';',
'  ',
'   l_list         varchar2(32000);',
'   pos            pls_integer;',
'   endpos          pls_integer;',
'',
'BEGIN ',
'',
'    ---CREATE A DEMO JSON REQUEST/RESPONSE',
'    lv_url := ''http://activiti.lg:8080/activiti-rest/service/repository/deployments'';',
'--    content  := ''{"assignee" : '' || :P115_TA_1 || '',"createTime" : '' || :P115_TCT_1 || '',"delegationState" : '' || :P115_TDS_1 || '',"description" : '' || :P115_TD_1 || '',"dueDate" : '' || :P115_TDD_1 || '',"executionUrl" : '' || :P115_TEU_1 || '',"execut'
||'ionId" : '' || :P115_TEID_1 || '',"id" : '' || :P115_TID_1 || '',"name" : '' || :P115_TN_1 || '',"owner" : '' || :P115_TO_1 || '',"parentTaskUrl" : '' || :P115_TPTU_1 || '',"parentTaskId" : '' || :P115_TPTID_1 || '',"priority" : '' || :P115_TP_1 || '',"processDefi'
||'nitionUrl" : '' || :P115_TPDU_1 || '',"processDefinitionId" : '' || :P115_TPDID_1 || '',"processInstanceUrl" : '' || :P115_TPIU_1 || '',"processInstanceId" : '' || :P115_TPIID_1 || '',"suspended" : '' || :P115_TS_1 || '',"formKey" : '' || :P115_TFK_1 || '',"cate'
||'gory": '' || :P115_TC_1 || '',"taskDefinitionKey" : '' || :P115_TTDK_1 || '',"url" : '' || :P115_TU_1 || '',"tenantId" : '' || :P115_TTID_1 || ''}'';',
' content  := ''{"id": '' || :P110_DID_1 || '',"name": '' || :P110_DNAME_1 || '',"deploymentTime": '' || :P110_DTIME_1 || '',"category": '' || :P110_DCATEGORY_1 || '',"url": '' || :P110_DURL_1 || '',"tenantId" : '' || :P110_DTENANT_1 || ''}'';',
'',
'--content  := ''{"id": '' || ''"'' || :P110_DID_1 || ''"'' || '',"name": '' || ''"'' || :P110_DNAME_1 || ''"'' || '',"deploymentTime": '' || ''"'' || :P110_DTIME_1 || ''"'' || '',"category": '' || :P110_DCATEGORY_1 || '',"url": '' || ''"'' || :P110_DURL_1 || ''"'' || '',"tenan'
||'tId" : '' || ''"'' || :P110_DTENANT_1 || ''"'' || ''}'';',
' ',
'',
'',
'',
'--- CREATE http request and get response',
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
'    :P110_WEBRESP := lc_entire_msg;',
' ',
'  ---      :P356_TXT :=  l_list;',
'  ',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(193770203921298008)
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
