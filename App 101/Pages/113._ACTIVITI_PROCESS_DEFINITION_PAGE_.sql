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
--     PAGE: 113
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00113
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>113);
end;
/
prompt --application/pages/page_00113
begin
wwv_flow_imp_page.create_page(
 p_id=>113
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'ACTIVITI PROCESS DEFINITION PAGE '
,p_step_title=>'ACTIVITI PROCESS DEFINITION PAGE '
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20180605130733'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190884398414007001)
,p_plug_name=>'PROCESS DEFINITION'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190884489688007002)
,p_plug_name=>'PROCESS DEFITION FIELDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190884702526007005)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(190884398414007001)
,p_button_name=>'GETPDEFNITION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'GET PROCESS DEFINITION'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(190884538893007003)
,p_name=>'P113_WEBRESP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(190884398414007001)
,p_prompt=>'PROCESS DEFINITION'
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
 p_id=>wwv_flow_imp.id(190884851854007006)
,p_name=>'P113_PDID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
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
 p_id=>wwv_flow_imp.id(190884990194007007)
,p_name=>'P113_PDURL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
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
 p_id=>wwv_flow_imp.id(190885077506007008)
,p_name=>'P113_PDVERSION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
,p_prompt=>'VERSION'
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
 p_id=>wwv_flow_imp.id(190885159079007009)
,p_name=>'P113_PDKEY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
,p_prompt=>'KEY'
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
 p_id=>wwv_flow_imp.id(190885220125007010)
,p_name=>'P113_PDCATEGORY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
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
 p_id=>wwv_flow_imp.id(190885337014007011)
,p_name=>'P113_PDSUSPENDED'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
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
 p_id=>wwv_flow_imp.id(190885492877007012)
,p_name=>'P113_PDNAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
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
 p_id=>wwv_flow_imp.id(190885529858007013)
,p_name=>'P113_PDDESCRIPTION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
,p_prompt=>'DESCRIPTION'
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
 p_id=>wwv_flow_imp.id(190885626973007014)
,p_name=>'P113_PDDID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
,p_prompt=>'DEPLOYMENT ID'
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
 p_id=>wwv_flow_imp.id(190885709622007015)
,p_name=>'P113_PDDURL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
,p_prompt=>'DEPLOYMENT URL'
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
 p_id=>wwv_flow_imp.id(190885895804007016)
,p_name=>'P113_PDGND'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
,p_prompt=>'GRAPHICAL NOTATION'
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
 p_id=>wwv_flow_imp.id(190885994840007017)
,p_name=>'P113_PDRESOURCE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
,p_prompt=>'RESOURCE'
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
 p_id=>wwv_flow_imp.id(190886005150007018)
,p_name=>'P113_PDDR'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
,p_prompt=>'DIAGRAM RESOURCE'
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
 p_id=>wwv_flow_imp.id(190886144538007019)
,p_name=>'P113_PDSFD'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(190884489688007002)
,p_prompt=>'START FORM DEFINED'
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
 p_id=>wwv_flow_imp.id(190886204245007020)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET PROCESS DEFINITION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
' l_clob_response       CLOB;',
' ',
'BEGIN',
'',
'',
'  l_clob_response := APEX_WEB_SERVICE.make_rest_request(',
'    p_url         => ''http://activiti.lg:8080/activiti-rest/service/repository/process-definitions/createTimersProcess:1:36'',',
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
'   :P113_WEBRESP := l_clob_response;',
'   ',
'   ',
'   --- PARSE THE CLOB CONTAINING JSON RESPONSE',
'         apex_json.parse(l_clob_response); ',
'',
'',
'',
'       --Set the fields on your page to the relevant response values',
'         :P113_PDID :=  apex_json.get_varchar2(p_path => ''id'');',
'         :P113_PDURL :=  apex_json.get_varchar2(p_path => ''url'');',
'         :P113_PDVERSION :=  apex_json.get_varchar2(p_path => ''version'');',
'         :P113_PDKEY :=  apex_json.get_varchar2(p_path => ''key'');',
'         :P113_PDCATEGORY :=  apex_json.get_varchar2(p_path => ''category'');',
'         :P113_PDSUSPENDED :=  apex_json.get_varchar2(p_path => ''suspended'');',
'         :P113_PDNAME :=  apex_json.get_varchar2(p_path => ''name'');',
'         :P113_PDDESCRIPTION :=  apex_json.get_varchar2(p_path => ''description'');',
'         :P113_PDDID :=  apex_json.get_varchar2(p_path => ''deploymentId'');',
'         :P113_PDDURL :=  apex_json.get_varchar2(p_path => ''deploymentUrl'');',
'         :P113_PDGND :=  apex_json.get_varchar2(p_path => ''graphicalNotationDefined'');',
'         :P113_PDRESOURCE :=  apex_json.get_varchar2(p_path => ''resource'');',
'         :P113_PDDR :=  apex_json.get_varchar2(p_path => ''diagramResource'');',
'         :P113_PDSFD :=  apex_json.get_varchar2(p_path => ''startFormDefined'');',
'         ',
'         ',
'         ',
'    --     :P110_DNAME :=  apex_json.get_varchar2(p_path => ''name'');',
'     ',
'   --      :P110_DTIME :=  apex_json.get_varchar2(p_path => ''deploymentTime'');',
'   --      :P110_DCATEGORY :=  apex_json.get_varchar2(p_path => ''category'');',
'   --      :P110_DURL :=  apex_json.get_varchar2(p_path => ''url'');',
'   --      :P110_DTENANT :=  apex_json.get_varchar2(p_path => ''tenant'');',
'      --     :P1_MODEL := apex_json.get_varchar2(p_path => ''model'');',
'      --      :P1_MOT_DATE := apex_json.get_date (p_path => ''mot_date'', p_format => ''DD-MM-YYYY'');',
'      --    :P1_MILES := apex_json.get_number(p_path => ''miles'');',
'    ',
'',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(190884702526007005)
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
