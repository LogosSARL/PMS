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
--     PAGE: 34
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00034
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>34);
end;
/
prompt --application/pages/page_00034
begin
wwv_flow_imp_page.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Maintain Projects'
,p_step_title=>'Maintain Projects'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20170105164409'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2381864198990207)
,p_plug_name=>'Maintain Projects'
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
 p_id=>wwv_flow_imp.id(2382231197990217)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P34_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2382609045990232)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2383040982990233)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P34_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2383412072990233)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P34_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2396800001990300)
,p_branch_name=>'Go To Page 5'
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(2383412072990233)
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2383842417990235)
,p_name=>'P34_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2384215100990247)
,p_name=>'P34_SEQ'
,p_item_sequence=>11
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_item_default=>'RETURN (:P34_PROJECT_SEQ);'
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Seq'
,p_source=>'SEQ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2384649733990247)
,p_name=>'P34_SEARCH'
,p_item_sequence=>21
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_prompt=>'SearchModuleText'
,p_placeholder=>'Module Name'
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
 p_id=>wwv_flow_imp.id(2385014924990248)
,p_name=>'P34_MODULE'
,p_is_required=>true
,p_item_sequence=>31
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Module'
,p_source=>'MODULE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_modules',
'where instr(:P34_SEARCH,CODE)>0',
'CONNECT BY PRIOR CODE = PARENT_CODE',
'START WITH CODE = :P14_PARENT_MODULE'))
,p_cSize=>30
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906436051019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2385415089990249)
,p_name=>'P34_L_DESCRIPTION'
,p_item_sequence=>41
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>' Description'
,p_source=>'L_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2385835840990250)
,p_name=>'P34_START_DATE'
,p_item_sequence=>51
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Start Date'
,p_source=>'START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2386293438990251)
,p_name=>'P34_END_DATE'
,p_item_sequence=>61
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>'End Date'
,p_source=>'END_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2386633614990253)
,p_name=>'P34_NEW_IMPLEMENTATION'
,p_item_sequence=>71
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_source=>'NEW_IMPLEMENTATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2387034678990253)
,p_name=>'P34_MAINTENANCE'
,p_item_sequence=>81
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_source=>'MAINTENANCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2387490063990254)
,p_name=>'P34_PRICING_DATE'
,p_item_sequence=>91
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_source=>'PRICING_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2387829881990254)
,p_name=>'P34_ACTIVE'
,p_item_sequence=>101
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Active'
,p_source=>'ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YESNO'
,p_lov=>'.'||wwv_flow_imp.id(20935140090118790)||'.'
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2388245289990255)
,p_name=>'P34_DSP_CODE'
,p_item_sequence=>111
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Dsp Code'
,p_source=>'DSP_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2388621404990255)
,p_name=>'P34_INT_CODE'
,p_is_required=>true
,p_item_sequence=>121
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Int Code'
,p_source=>'INT_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2389010040990256)
,p_name=>'P34_CONTRACT_ID'
,p_item_sequence=>131
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_item_default=>'RETURN(:P34_SELECTED_CONTRACT_ID);'
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source=>'CONTRACT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2389443001990257)
,p_name=>'P34_SELECTED_CONTRACT_ID'
,p_item_sequence=>141
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2389832631990258)
,p_name=>'P34_PROJECT_SEQ'
,p_item_sequence=>151
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_prompt=>'Project Seq'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2390253614990258)
,p_name=>'P34_NEW'
,p_item_sequence=>161
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pst_desc,pst_id ',
'from prj_status',
'where instr(pst_code,''InP'')>0'))
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2390674861990259)
,p_name=>'P34_HIGH_LEVEL_ESTIMATE'
,p_item_sequence=>171
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>'HIGH LEVEL ESTIMATE'
,p_source=>'HIGH_LEVEL_ESTIMATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2391085559990260)
,p_name=>'P34_HIGHLVLREMAINING'
,p_item_sequence=>181
,p_item_plug_id=>wwv_flow_imp.id(2381864198990207)
,p_use_cache_before_default=>'NO'
,p_prompt=>'HIGH LEVEL REMAINING'
,p_source=>'HIGH_LEVEL_REMAINING'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2394306771990295)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34_MODULE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2395349182990296)
,p_event_id=>wwv_flow_imp.id(2394306771990295)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P34_MODULE'
,p_attribute_03=>'P34_MODULE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2395853436990297)
,p_event_id=>wwv_flow_imp.id(2394306771990295)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'select company_code||''-''||dsp_code||''-'' || :P34_MODULE  INTO :P34_INT_CODE',
'from LGS_CONTRACTS',
'where id = :P34_SELECTED_CONTRACT_ID;',
'end ;'))
,p_attribute_02=>'P34_INT_CODE'
,p_attribute_03=>'P34_INT_CODE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2396372427990298)
,p_event_id=>wwv_flow_imp.id(2394306771990295)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#P34_INT_CODE'').val($v(''P34_INT_CODE''));'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2394899364990296)
,p_event_id=>wwv_flow_imp.id(2394306771990295)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34_MODULE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2392953788990289)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34_SEARCH'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2393946493990293)
,p_event_id=>wwv_flow_imp.id(2392953788990289)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2393483446990292)
,p_event_id=>wwv_flow_imp.id(2392953788990289)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34_MODULE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2391412448990282)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from LGS_PROJECTS'
,p_attribute_02=>'LGS_PROJECTS'
,p_attribute_03=>'P34_ID'
,p_attribute_04=>'ID'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2391767388990288)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of LGS_PROJECTS'
,p_attribute_02=>'LGS_PROJECTS'
,p_attribute_03=>'P34_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>'Unable to process row of table LGS_PROJECTS.'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2392135977990288)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_imp.id(2383412072990233)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2392502297990289)
,p_process_sequence=>50
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_SEQ'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'     SELECT MAX(SEQ)+1',
'     INTO   :P34_PROJECT_SEQ',
'     FROM   LGS_PROJECTS',
'     WHERE  CONTRACT_ID = :P34_SELECTED_CONTRACT_ID;',
'EXCEPTION WHEN NO_DATA_FOUND THEN :P34_PROJECT_SEQ := 1;',
'END;'))
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
