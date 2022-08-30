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
--   Date and Time:   09:31 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00012
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>12);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'Maintain Projects'
,p_page_mode=>'NORMAL'
,p_step_title=>'Maintain Projects'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function validateFormBeforeSubmit(pForm, pFiringElement) {',
'    var d = new Date($(''#P12_START_DATE'').val());',
'   var d1 = new Date($(''#P12_STRTDATE_TOVALIDATE'').val());',
'    ',
'     var d3 = new Date($(''#P12_END_DATE'').val());',
'var d4= new Date($(''#P12_ENDDATE_TOVALIDATE'').val());',
'',
'  var firingElement = $(pFiringElement);',
'',
'  var originalOnclickEvent = $(($(''.t15C'')[1]).children[0]).attr(''href'');',
'',
'  //firingElement.data(''origOnclickEvent'', originalOnclickEvent);',
'',
'  $(($(''.t15C'')[1]).children[0]).removeAttr(''href'');',
'',
'  $(($(''.t15C'')[1]).children[0]).on(''click'', function() {',
'',
'   ',
' if (    d>d1 && d3<d4   )',
'             {',
'',
'      $(($(''.t15C'')[1]).children[0]).attr(''href'',originalOnclickEvent)',
'',
'    } else {',
'',
'      alert("Please fix all errors before continuing");',
'',
'    }',
'',
'  });',
'',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20170216110003'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15720616580922794)
,p_plug_name=>'Maintain Projects'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20902140805019133)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15720915073922814)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(15720616580922794)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15721218381922817)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(15720616580922794)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15720798095922813)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(15720616580922794)
,p_button_name=>'CREATE'
,p_button_static_id=>'BTNCREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15721014162922814)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(15720616580922794)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(15721804248922824)
,p_branch_name=>'Go To Page 5'
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(15721014162922814)
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2079547506538714)
,p_name=>'P12_NEW'
,p_item_sequence=>161
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2079690802538715)
,p_name=>'P12_HIGH_LEVEL_ESTIMATE'
,p_item_sequence=>171
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_prompt=>'HIGH LEVEL ESTIMATE'
,p_source=>'HIGH_LEVEL_ESTIMATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2079776204538716)
,p_name=>'P12_HIGHLVLREMAINING'
,p_item_sequence=>181
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_prompt=>'HIGH LEVEL REMAINING'
,p_source=>'HIGH_LEVEL_REMAINING'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2081084029538729)
,p_name=>'P12_SEARCH'
,p_item_sequence=>21
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_prompt=>'SearchModuleText'
,p_placeholder=>'Module Name'
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
 p_id=>wwv_flow_api.id(2081879983538737)
,p_name=>'P12_MODULE'
,p_is_required=>true
,p_item_sequence=>31
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Modules'
,p_source=>'MODULE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select e_name d, code r',
'From   prj_modules',
'where instr(LOWER(E_NAME),LOWER(:P12_SEARCH))>0',
'--CONNECT BY PRIOR CODE = PARENT_CODE',
'---START WITH CODE = :P14_PARENT_MODULE',
'',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2082194772538740)
,p_name=>'P12_CONTRACT_DESC'
,p_item_sequence=>191
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2720990306162029)
,p_name=>'P12_STRTDATE_TOVALIDATE'
,p_item_sequence=>201
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2722043304162040)
,p_name=>'P12_ENDDATE_TOVALIDATE'
,p_item_sequence=>211
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15721989538922831)
,p_name=>'P12_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15722193697922856)
,p_name=>'P12_L_DESCRIPTION'
,p_item_sequence=>41
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15722389489922863)
,p_name=>'P12_DSP_CODE'
,p_item_sequence=>111
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Dsp Code'
,p_source=>'DSP_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15722616407922863)
,p_name=>'P12_END_DATE'
,p_is_required=>true
,p_item_sequence=>61
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15722814137922863)
,p_name=>'P12_START_DATE'
,p_is_required=>true
,p_item_sequence=>51
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15723018773922863)
,p_name=>'P12_CONTRACT_ID'
,p_item_sequence=>131
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_item_default=>'RETURN(:P12_SELECTED_CONTRACT_ID);'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_source=>'CONTRACT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15723203145922863)
,p_name=>'P12_INT_CODE'
,p_is_required=>true
,p_item_sequence=>121
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15723592743922864)
,p_name=>'P12_NEW_IMPLEMENTATION'
,p_item_sequence=>71
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_source=>'NEW_IMPLEMENTATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15723790049922864)
,p_name=>'P12_MAINTENANCE'
,p_item_sequence=>81
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_source=>'MAINTENANCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15723994458922864)
,p_name=>'P12_PRICING_DATE'
,p_item_sequence=>91
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_source=>'PRICING_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15724200147922864)
,p_name=>'P12_ACTIVE'
,p_item_sequence=>101
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Active'
,p_source=>'ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YESNO'
,p_lov=>'.'||wwv_flow_api.id(20935140090118790)||'.'
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15724397088922864)
,p_name=>'P12_SEQ'
,p_item_sequence=>11
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_use_cache_before_default=>'NO'
,p_item_default=>'RETURN (:P12_PROJECT_SEQ);'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15801606446022600)
,p_name=>'P12_SELECTED_CONTRACT_ID'
,p_item_sequence=>141
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15809815107844358)
,p_name=>'P12_PROJECT_SEQ'
,p_item_sequence=>151
,p_item_plug_id=>wwv_flow_api.id(15720616580922794)
,p_prompt=>'Project Seq'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2081307767538732)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_SEARCH'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2081437281538733)
,p_event_id=>wwv_flow_api.id(2081307767538732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2081779630538736)
,p_event_id=>wwv_flow_api.id(2081307767538732)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_MODULE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2082207641538741)
,p_name=>'New'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_MODULE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2082322449538742)
,p_event_id=>wwv_flow_api.id(2082207641538741)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#P12_INT_CODE'').val($v(''P12_CONTRACT_DESC'') + $( "#P12_MODULE option:selected" ).text());'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2721374708162033)
,p_name=>'New_2'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_START_DATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2721423667162034)
,p_event_id=>wwv_flow_api.id(2721374708162033)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_START_DATE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var d = new Date($(''#P12_START_DATE'').val());',
'var d1 = new Date($(''#P12_STRTDATE_TOVALIDATE'').val());',
'',
'if ( d1 > d)',
' {alert(''invalid date'');}',
'else',
'{alert(''valid date'');}',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2721572817162035)
,p_name=>'New_3'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_END_DATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2721625327162036)
,p_event_id=>wwv_flow_api.id(2721572817162035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var d = new Date($(''#P12_END_DATE'').val());',
'var d1 = new Date($(''#P12_ENDDATE_TOVALIDATE'').val());',
'',
'if ( d1 > d)',
' {alert(''valid date'');}',
'else',
'{alert(''invalid date'');}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15724703265922869)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from LGS_PROJECTS'
,p_attribute_02=>'LGS_PROJECTS'
,p_attribute_03=>'P12_ID'
,p_attribute_04=>'ID'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15724907800922875)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of LGS_PROJECTS'
,p_attribute_02=>'LGS_PROJECTS'
,p_attribute_03=>'P12_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'Unable to process row of table LGS_PROJECTS.'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15725112669922875)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_api.id(15721014162922814)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15809891044875237)
,p_process_sequence=>50
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_SEQ'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'     SELECT MAX(SEQ)+1',
'     INTO   :P12_PROJECT_SEQ',
'     FROM   LGS_PROJECTS',
'     WHERE  CONTRACT_ID = :P12_SELECTED_CONTRACT_ID;',
'EXCEPTION WHEN NO_DATA_FOUND THEN :P12_PROJECT_SEQ := 1;',
'END;'))
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
