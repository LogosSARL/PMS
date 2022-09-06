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
--     PAGE: 21
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00021
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>21);
end;
/
prompt --application/pages/page_00021
begin
wwv_flow_imp_page.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Delete Project'
,p_step_title=>'Delete Project'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'16'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20170615102755'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13026967503940690)
,p_plug_name=>'Are You Sure you want to Delete Project (This will delete all Enrolments and Estimates)'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902140805019133)
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
 p_id=>wwv_flow_imp.id(13027175333940701)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(13026967503940690)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'LEFT_OF_TITLE'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13027263134940701)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(13026967503940690)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Submit'
,p_button_position=>'LEFT_OF_TITLE'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(13028461358940707)
,p_branch_name=>'Go To Page 40'
,p_branch_action=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(13027263134940701)
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13027689849940706)
,p_name=>'P21_CONTRACT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13026967503940690)
,p_prompt=>'Contract Id'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CONTRACT_CODE_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE d, ID r',
'from   LGS_CONTRACTS',
'order by 1'))
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13027873176940706)
,p_name=>'P21_PROJECT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13026967503940690)
,p_prompt=>'Project Id'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT_L_DESCRIPTION_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select L_DESCRIPTION d, id r',
'from   lgs_projects',
'order by 1'))
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13028072274940706)
,p_name=>'P21_WHO_DELETED'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13026967503940690)
,p_item_default=>'&USER.'
,p_prompt=>'Who Deleted'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13028284918940707)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Run Stored Procedure'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.PROJECT_PCK.DELETE_PROJECT(',
'P_CONTRACT_ID => :P21_CONTRACT_ID,',
'P_PROJECT_ID => :P21_PROJECT_ID,',
'P_WHO_DELETED => ''ROUWAIDA'');'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_process_when_button_id=>wwv_flow_imp.id(13027263134940701)
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
