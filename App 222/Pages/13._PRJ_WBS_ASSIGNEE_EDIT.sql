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
,p_default_application_id=>222
,p_default_owner=>'PRJ'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 222 - PMS
--
-- Application Export:
--   Application:     222
--   Name:            PMS
--   Date and Time:   10:54 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00013
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>13);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(148753632100243889)
,p_name=>'PRJ_WBS_ASSIGNEE_EDIT'
,p_page_mode=>'MODAL'
,p_step_title=>'PRJ_WBS_ASSIGNEE_EDIT'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190206124003'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(313764305219971143)
,p_plug_name=>'Form on PRJ_WBS_ASSIGNEES'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148710019351243458)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(313765088743971143)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148710494650243459)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(313765467696971143)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(313765088743971143)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(313764964575971143)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(313765088743971143)
,p_button_name=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P13_WBA_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(313764804295971143)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(313765088743971143)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P13_WBA_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(313764795862971143)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(313765088743971143)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P13_WBA_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(326410322447954125)
,p_branch_name=>'10'
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313767832466971145)
,p_name=>'P13_WBA_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wba Id'
,p_source=>'WBA_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313768503115971197)
,p_name=>'P13_ROW_KEY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'ROW_KEY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313768968183971197)
,p_name=>'P13_WBA_TASK_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'WBA_TASK_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313769321476971198)
,p_name=>'P13_WBA_EMP_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Employee ID'
,p_source=>'WBA_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'PGE_EMPLOYEE_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMP_NAME, EMP_CODE',
'from PRJ_EMPLOYEE_SALARY',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313769791152971198)
,p_name=>'P13_WBA_STATUS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'WBA_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select PST_DESC,PST_ID FROM PRJ_STATUS'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313770174286971198)
,p_name=>'P13_WBA_START_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Start Date'
,p_source=>'WBA_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313770579591971199)
,p_name=>'P13_WBA_END_DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_prompt=>'End Date'
,p_source=>'WBA_END_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313770942669971199)
,p_name=>'P13_WBA_COMPLEATION_PERCENTAGE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Completion %'
,p_source=>'WBA_COMPLEATION_PERCENTAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313771368583971200)
,p_name=>'P13_WBA_ISRF'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_prompt=>'ISRF'
,p_source=>'WBA_ISRF'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_06=>'Y'
,p_attribute_08=>'attachment'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313771786493971200)
,p_name=>'P13_WBA_ISRF_FILENAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'WBA_ISRF_FILENAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313772130118971200)
,p_name=>'P13_WBA_ISRF_MIMETYPE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'WBA_ISRF_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313772539661971201)
,p_name=>'P13_WBA_ISRF_CHARSET'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'WBA_ISRF_CHARSET'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313772971175971201)
,p_name=>'P13_WBA_ISRF_LASTUPD'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'WBA_ISRF_LASTUPD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313773383886971201)
,p_name=>'P13_CREATED'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313773781034971201)
,p_name=>'P13_CREATED_BY'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313774120283971202)
,p_name=>'P13_UPDATED'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313774533890971202)
,p_name=>'P13_UPDATED_BY'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(318500278767007137)
,p_name=>'P13_PRJ_WORK_TYPES'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_prompt=>'Prj work types'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT e_name,id FROM PRJ_WORK_TYPES'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P13_WBA_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(318500495733007139)
,p_name=>'P13_PRJ_ID'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(318500626980007141)
,p_name=>'P13_WBS_SCALE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_prompt=>'Wbs scale'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LEVEL_OF_EFFORTS_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from   PRJ_SALARY_GRADES ',
'order by name'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(318500763754007142)
,p_name=>'P13_WBS_EST_TYPE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_prompt=>'Wbs est type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EST_TYPES_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from   est_types',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(318500856709007143)
,p_name=>'P13_NUMBER_OF_DAYS'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_prompt=>'Number of days'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(318500906165007144)
,p_name=>'P13_WBS_ONSITE_DAYS'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_prompt=>'Wbs onsite days'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(318501065751007145)
,p_name=>'P13_PRJECT_WRKTYP_ID'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(318501403507007149)
,p_name=>'P13_WBA_EST_DET_ID'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(313764305219971143)
,p_use_cache_before_default=>'NO'
,p_source=>'WBA_EST_DET_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(313765501877971143)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(313765467696971143)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(326410061480954122)
,p_event_id=>wwv_flow_api.id(313765501877971143)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'htp.p(''<script>'');',
'htp.p(''window.opener.doSubmit("REFRESH");'');',
'htp.p(''window.close();'');',
'htp.p(''</script>'');',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(313766353551971144)
,p_event_id=>wwv_flow_api.id(313765501877971143)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(318501572992007150)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(313764964575971143)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(326407980803954101)
,p_event_id=>wwv_flow_api.id(318501572992007150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'delete PRJ_ESTIMATED_DETS WHERE ID = :P13_WBA_EST_DET_ID;',
'PRJ_WBS_ASSIGNEES_API.delete_row(:P13_WBA_ID); ',
'commit;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(326409135889954113)
,p_event_id=>wwv_flow_api.id(318501572992007150)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(326408074521954102)
,p_name=>'New_1'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(313764804295971143)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(326408488166954106)
,p_event_id=>wwv_flow_api.id(326408074521954102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P13_NUMBER_OF_DAYS,P13_WBS_ONSITE_DAYS,P13_WBS_SCALE,P13_WBS_EST_TYPE,P13_WBA_EMP_ID,P13_WBA_ID,P13_WBA_TASK_ID,P13_WBA_STATUS,P13_WBA_START_DATE,P13_WBA_END_DATE,P13_WBA_COMPLEATION_PERCENTAGE'
,p_attribute_03=>'P13_WBS_EST_TYPE,P13_WBS_SCALE,P13_NUMBER_OF_DAYS,P13_WBS_ONSITE_DAYS,P13_WBA_EMP_ID,P13_WBA_ID,P13_WBA_TASK_ID,P13_WBA_STATUS,P13_WBA_START_DATE,P13_WBA_END_DATE,P13_WBA_COMPLEATION_PERCENTAGE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(326408157271954103)
,p_event_id=>wwv_flow_api.id(326408074521954102)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' UPDATE PRJ_ESTIMATED_DETS SET',
'     NO_OF_DAYS=:P13_NUMBER_OF_DAYS,',
'     SCALE=:P13_WBS_SCALE,',
'     ON_SITE_DAYS=:P13_WBS_ONSITE_DAYS,',
'     employee = :P13_WBA_EMP_ID,',
'     EST_TYPE=:P13_WBS_EST_TYPE ',
'     where ID = :P13_WBA_EST_DET_ID; ',
'     ',
'  ',
'PRJ_WBS_ASSIGNEES_API.UPDATE_ROW(',
'   p_wba_id => :P13_WBA_ID,',
'   p_wba_task_id => :P13_WBA_TASK_ID,',
'   p_wba_emp_id => :P13_WBA_EMP_ID,',
'   p_wba_status => :P13_WBA_STATUS,',
'   p_wba_start_date =>  :P13_WBA_START_DATE,',
'   p_wba_end_date =>  :P13_WBA_END_DATE,',
'   p_wba_compleation_percentage =>  to_number(:P13_WBA_COMPLEATION_PERCENTAGE)',
');',
'commit;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(326410276221954124)
,p_event_id=>wwv_flow_api.id(326408074521954102)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(313775953509971204)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PRJ_WBS_ASSIGNEES'
,p_attribute_02=>'PRJ_WBS_ASSIGNEES'
,p_attribute_03=>'P13_WBA_ID'
,p_attribute_04=>'WBA_ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(318500377895007138)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PRJ_PROJECTWORK_TYPES_INSERT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'begin',
'insert into PRJ_PROJECTWORK_TYPES (ESTIMATED_DAYS,ENROLLED_DAYS,WRKTYP_ID,PROJ_ID,SEQ) values (0,0,:P13_PRJ_WORK_TYPES,:P13_PRJ_ID,0)',
'returning ID into :P13_PRJECT_WRKTYP_ID; ',
'null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(313764795862971143)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(318500598303007140)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ESTIMATION_DETS_INSERT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'--select seq into seq_v from PRJ_WORK_TYPES where ID = :P13_PRJ_WORK_TYPES;',
'insert into prj_estimated_dets (PROJECT_WORKTYPE_ID,NO_OF_DAYS,SCALE,ON_SITE_DAYS,employee,WHO_ENTERED,EST_TYPE) values(:P13_PRJECT_WRKTYP_ID,',
'                                                                                                   :P13_NUMBER_OF_DAYS,',
'                                                                             :P13_WBS_SCALE,',
'                                                                             :P13_WBS_ONSITE_DAYS,',
'                                                                             :P13_WBA_EMP_ID,',
'                                                                             :APP_USER,',
'                                                                             :P13_WBS_EST_TYPE) returning ID into :P13_WBA_EST_DET_ID ; ',
'                                                                          ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(313764795862971143)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(313776349670971204)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of PRJ_WBS_ASSIGNEES'
,p_attribute_02=>'PRJ_WBS_ASSIGNEES'
,p_attribute_03=>'P13_WBA_ID'
,p_attribute_04=>'WBA_ID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(313776752263971204)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
