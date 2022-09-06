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
--     PAGE: 64
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00064
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>64);
end;
/
prompt --application/pages/page_00064
begin
wwv_flow_imp_page.create_page(
 p_id=>64
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Form on Opp Actions'
,p_step_title=>'Form on Opp Actions'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20170407085405'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(183276653071946432)
,p_plug_name=>'Form on OPP_ACTIONS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902140805019133)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183277137924946432)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P64_OAC_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183277375197946432)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183277034695946432)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P64_OAC_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183277203441946432)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P64_OAC_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(183278981795946436)
,p_branch_action=>'f?p=&APP_ID.:63:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183279340196946436)
,p_name=>'P64_OAC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Id'
,p_source=>'OAC_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183279731334946437)
,p_name=>'P64_OAC_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Date'
,p_source=>'OAC_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183280195943946438)
,p_name=>'P64_OAC_DESC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Desc'
,p_source=>'OAC_DESC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183280587501946438)
,p_name=>'P64_OAC_DURATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Duration'
,p_source=>'OAC_DURATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>200
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183280935124946439)
,p_name=>'P64_OAC_OUTPUTS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Outputs'
,p_source=>'OAC_OUTPUTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183281306139946440)
,p_name=>'P64_OAC_NEXT_ACTION_DESC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Next Action Desc'
,p_source=>'OAC_NEXT_ACTION_DESC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183281753810946440)
,p_name=>'P64_OAC_NEXT_ACTION_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Next Action Date'
,p_source=>'OAC_NEXT_ACTION_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183282102565946441)
,p_name=>'P64_OAC_REMARKS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Remarks'
,p_source=>'OAC_REMARKS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183282517427946442)
,p_name=>'P64_OAC_OPP_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Opp Id'
,p_source=>'OAC_OPP_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183282997138946442)
,p_name=>'P64_OAC_OPA_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Opa Id'
,p_source=>'OAC_OPA_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183283302218946443)
,p_name=>'P64_OAC_TAKEN_BY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Taken By'
,p_source=>'OAC_TAKEN_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183283760330946444)
,p_name=>'P64_OAC_LOCATION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(183276653071946432)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oac Location'
,p_source=>'OAC_LOCATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>200
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(183284527582946445)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from OPP_ACTIONS'
,p_attribute_02=>'OPP_ACTIONS'
,p_attribute_03=>'P64_OAC_ID'
,p_attribute_04=>'OAC_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(183284933110946446)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of OPP_ACTIONS'
,p_attribute_02=>'OPP_ACTIONS'
,p_attribute_03=>'P64_OAC_ID'
,p_attribute_04=>'OAC_ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(183285338971946446)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(183277203441946432)
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
