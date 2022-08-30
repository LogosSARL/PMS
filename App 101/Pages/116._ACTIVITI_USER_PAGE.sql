set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.1.00.08'
,p_default_workspace_id=>1680420756714069
,p_default_application_id=>101
,p_default_owner=>'PRJ'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 101 - Projects
--
-- Application Export:
--   Application:     101
--   Name:            Projects
--   Date and Time:   09:35 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00116
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>116);
end;
/
prompt --application/pages/page_00116
begin
wwv_flow_api.create_page(
 p_id=>116
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'ACTIVITI USER PAGE'
,p_page_mode=>'NORMAL'
,p_step_title=>'ACTIVITI USER PAGE'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20180607104338'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190932638419441901)
,p_plug_name=>'USER'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190932797410441902)
,p_plug_name=>'USER FIELD'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(191020890179857003)
,p_plug_name=>'USER CREATE FIELD'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(190932922434441904)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(190932638419441901)
,p_button_name=>'GETUSER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'GET USER'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(191020736426857002)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(190932638419441901)
,p_button_name=>'CREATEUSER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'CREATE USER'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190932805204441903)
,p_name=>'P116_WEBRESP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(190932638419441901)
,p_prompt=>'USER'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190933027866441905)
,p_name=>'P116_UID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(190932797410441902)
,p_prompt=>'ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190933146528441906)
,p_name=>'P116_UFN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(190932797410441902)
,p_prompt=>'FIRST NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190933232624441907)
,p_name=>'P116_ULN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(190932797410441902)
,p_prompt=>'LAST NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190933368621441908)
,p_name=>'P116_UU'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(190932797410441902)
,p_prompt=>'URL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190933450390441909)
,p_name=>'P116_UE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(190932797410441902)
,p_prompt=>'EMAIL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191020980960857004)
,p_name=>'P116_UID_C'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(191020890179857003)
,p_prompt=>'ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191021023480857005)
,p_name=>'P116_UFN_C'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(191020890179857003)
,p_prompt=>'FIRST NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191021113850857006)
,p_name=>'P116_ULN_C'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(191020890179857003)
,p_prompt=>'LAST NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191021206728857007)
,p_name=>'P116_UE_C'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(191020890179857003)
,p_prompt=>'EMAIL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191021344938857008)
,p_name=>'P116_UP_C'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(191020890179857003)
,p_prompt=>'PASSWORD'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190933573631441910)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET USER'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' l_clob_response       CLOB;',
' ',
'BEGIN',
'',
'',
'  l_clob_response := APEX_WEB_SERVICE.make_rest_request(',
'    p_url         => ''http://activiti.lg:8080/activiti-rest/service/identity/users/100'',',
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
'   :P116_WEBRESP := l_clob_response;',
'   ',
'   ',
'   --- PARSE THE CLOB CONTAINING JSON RESPONSE',
'         apex_json.parse(l_clob_response); ',
'',
'',
'',
'       --Set the fields on your page to the relevant response values',
'         :P116_UID :=  apex_json.get_varchar2(p_path => ''id'');',
'         :P116_UFN :=  apex_json.get_varchar2(p_path => ''firstName'');',
'         :P116_ULN :=  apex_json.get_varchar2(p_path => ''lastName'');',
'         :P116_UU :=  apex_json.get_varchar2(p_path => ''url'');',
'         :P116_UE :=  apex_json.get_varchar2(p_path => ''email'');',
'      ',
'      --     :P1_MODEL := apex_json.get_varchar2(p_path => ''model'');',
'      --      :P1_MOT_DATE := apex_json.get_date (p_path => ''mot_date'', p_format => ''DD-MM-YYYY'');',
'      --    :P1_MILES := apex_json.get_number(p_path => ''miles'');',
'    ',
'',
' END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(190932922434441904)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191020638495857001)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE USER'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  lc_entire_msg        CLOB;',
'  lv_url               VARCHAR2 (32000);',
'  lr_request            utl_http.req;',
'  lr_response          utl_http.resp;',
'  lv_msg               VARCHAR2 (500);',
'  content              varchar2(4000)     := '''';',
'--  content varchar2(4000) := '' '';',
'  ',
'   l_list         varchar2(32000);',
'   pos            pls_integer;',
'   endpos          pls_integer;',
'',
'BEGIN ',
'',
'    ---CREATE A DEMO JSON REQUEST/RESPONSE',
'    lv_url := ''http://activiti.lg:8080/activiti-rest/service/identity/users'';',
'',
'',
'    --- CREATE http request and get response',
'    ',
'    ',
'    content := ''{"id":"'' || :P116_UID_C || ''", "firstName":"'' || :P116_UFN_C || ''","lastName":"'' || :P116_ULN_C || ''","email":"'' || :P116_UE_C ||''","password":"'' || :P116_UP_C || ''"}'';',
'  ',
'    lr_request := utl_http.begin_request(lv_url, ''POST'','' HTTP/1.1'');',
'    utl_http.set_header(lr_request, ''user-agent'', ''mozilla/4.0''); ',
'    utl_http.set_header(lr_request, ''content-type'', ''application/json''); ',
'    utl_http.set_header(lr_request, ''Content-Length'', length(content));',
'    utl_http.set_header(lr_request, ''Authorization'',''Basic '' || utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_i18n.string_to_raw(''kermit:kermit'', ''AL32UTF8''))));',
'    ',
'    ',
'   --  content varchar2(4000) := ''{"name":"My task", "description":"The task description"}'';',
'   -- :P116_UID  :P116_UFN :P116_ULN  :P116_UU  :P116_UE',
'--   content := ''{"id":"'' || :P116_UID_C || ''", "firstName":"","lastName":"","email":"","password":""}'';',
'   ',
'   ',
'--   content := ''{"id":"50", "firstName":"jawad","lastName":"degheili","email":"jawadegheili@gmail.com","password":"123456"}'';',
'   ',
'    utl_http.write_text(lr_request, content);',
'    ',
'    ',
' --   lr_response := utl_http.get_response(lr_request);',
'',
' --   begin',
' --   loop',
' --   utl_http.read_line(lr_response, lv_msg);',
'  ',
'--  lc_entire_msg := lc_entire_msg || lv_msg;',
'',
'--    end loop;',
'--    utl_http.end_response(lr_response);',
'--    exception',
'--    when utl_http.end_of_body then',
'--    utl_http.end_response(lr_response);',
'--    end;',
'',
'  ',
' --   :P116_WEBRESP := lc_entire_msg;',
'     ',
'   ',
'     ',
'   ',
'  ',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(191020736426857002)
,p_process_success_message=>'CREATE USER SUCCESS'
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
