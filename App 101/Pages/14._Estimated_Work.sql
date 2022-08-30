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

prompt --application/pages/delete_00014
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>14);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'Estimated Work'
,p_page_mode=>'NORMAL'
,p_step_title=>'Estimated Work'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20200827162806'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(15750113536513289)
,p_name=>'Estimation of &P14_PROJECT_WORKTYPE_DESC.'
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'"ID",',
'"ID" ID_DISPLAY,',
'"PROJECT_WORKTYPE_ID",',
'"NO_OF_DAYS",',
'"SCALE",',
'"ON_SITE_DAYS",',
'"NO_OF_TICKETS",',
'"MODULE",',
'"NOTES",',
'"EMPLOYEE",',
'"FT_DATE",',
'EST_DATE,',
'WHO_ENTERED,',
'EST_TYPE,',
'is_contracted',
'from "#OWNER#"."PRJ_ESTIMATED_DETS"',
'WHERE PROJECT_WORKTYPE_ID = :P14_PROJECT_WORKTYPE_ID'))
,p_source_type=>'NATIVE_TABFORM'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15750402723513297)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_pk_col_source_type=>'T'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15750493680513297)
,p_query_column_id=>2
,p_column_alias=>'ID_DISPLAY'
,p_column_display_sequence=>3
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'ID_DISPLAY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15750610768513297)
,p_query_column_id=>3
,p_column_alias=>'PROJECT_WORKTYPE_ID'
,p_column_display_sequence=>4
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_column_default=>'P14_PROJECT_WORKTYPE_ID'
,p_column_default_type=>'ITEM'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'PROJECT_WORKTYPE_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15750702328513297)
,p_query_column_id=>4
,p_column_alias=>'NO_OF_DAYS'
,p_column_display_sequence=>9
,p_column_heading=>'In-House Days'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>6
,p_derived_column=>'N'
,p_column_default=>'P14_ZERO'
,p_column_default_type=>'ITEM'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'NO_OF_DAYS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15750801337513297)
,p_query_column_id=>5
,p_column_alias=>'SCALE'
,p_column_display_sequence=>6
,p_column_heading=>'Level of Effort'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(13037272978431558)
,p_lov_show_nulls=>'NO'
,p_derived_column=>'N'
,p_column_default=>'F114_ZERO_ITEM'
,p_column_default_type=>'ITEM'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'SCALE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15750920035513297)
,p_query_column_id=>6
,p_column_alias=>'ON_SITE_DAYS'
,p_column_display_sequence=>10
,p_column_heading=>'On Site Days'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>6
,p_derived_column=>'N'
,p_column_default=>'P14_ZERO'
,p_column_default_type=>'ITEM'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'ON_SITE_DAYS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15750990381513297)
,p_query_column_id=>7
,p_column_alias=>'NO_OF_TICKETS'
,p_column_display_sequence=>12
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'NO_OF_TICKETS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15751116975513297)
,p_query_column_id=>8
,p_column_alias=>'MODULE'
,p_column_display_sequence=>8
,p_column_heading=>'Module'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(15834205126704844)
,p_lov_show_nulls=>'NO'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'MODULE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15751219169513297)
,p_query_column_id=>9
,p_column_alias=>'NOTES'
,p_column_display_sequence=>11
,p_column_heading=>'Notes'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>20
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'NOTES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15751303088513297)
,p_query_column_id=>10
,p_column_alias=>'EMPLOYEE'
,p_column_display_sequence=>7
,p_column_heading=>'Employee'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_QUERY'
,p_inline_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select emp_name d, emp_code r',
'from   prj_employee_salary',
'where ACTIVE = ''Y''',
'order by 1'))
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'EMPLOYEE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(945214990065470047)
,p_query_column_id=>11
,p_column_alias=>'FT_DATE'
,p_column_display_sequence=>15
,p_column_heading=>'Ft date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'DATE_PICKER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'FT_DATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1581625632279265)
,p_query_column_id=>12
,p_column_alias=>'EST_DATE'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_column_default=>'SYSDATE'
,p_column_default_type=>'FUNCTION'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'EST_DATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1581709926279276)
,p_query_column_id=>13
,p_column_alias=>'WHO_ENTERED'
,p_column_display_sequence=>14
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_column_default=>'F101_USER_NAME'
,p_column_default_type=>'ITEM'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'WHO_ENTERED'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1581812393279276)
,p_query_column_id=>14
,p_column_alias=>'EST_TYPE'
,p_column_display_sequence=>5
,p_column_heading=>'Type'
,p_use_as_row_header=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(1582325580385568)
,p_lov_show_nulls=>'NO'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ESTIMATED_DETS'
,p_ref_column_name=>'EST_TYPE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(974490026971028615)
,p_query_column_id=>15
,p_column_alias=>'IS_CONTRACTED'
,p_column_display_sequence=>16
,p_column_heading=>'Is contracted'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'SIMPLE_CHECKBOX'
,p_inline_lov=>'1,0'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15754418051513301)
,p_query_column_id=>16
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15751701646513298)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(15750113536513289)
,p_button_name=>'ADD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Add Row'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:addRow();'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15751510794513298)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(15750113536513289)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15751421397513298)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(15750113536513289)
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
 p_id=>wwv_flow_api.id(15751608981513298)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(15750113536513289)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(15754519976513301)
,p_branch_action=>'f?p=&APP_ID.:14:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15754894530519195)
,p_name=>'P14_PROJECT_WORKTYPE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(15750113536513289)
,p_prompt=>'Project Worktype Id'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15755104573522128)
,p_name=>'P14_PROJECT_WORKTYPE_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(15750113536513289)
,p_prompt=>'Project Worktype Desc'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15833793998673179)
,p_name=>'P14_PARENT_MODULE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(15750113536513289)
,p_prompt=>'Parent Module'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16563586540691149)
,p_name=>'P14_ZERO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(15750113536513289)
,p_item_default=>'0'
,p_prompt=>'Zero'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15752509294513298)
,p_tabular_form_region_id=>wwv_flow_api.id(15750113536513289)
,p_validation_name=>'PROJECT_WORKTYPE_ID not null'
,p_validation_sequence=>30
,p_validation=>'PROJECT_WORKTYPE_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15751510794513298)
,p_associated_column=>'PROJECT_WORKTYPE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15752713257513298)
,p_tabular_form_region_id=>wwv_flow_api.id(15750113536513289)
,p_validation_name=>'PROJECT_WORKTYPE_ID must be numeric'
,p_validation_sequence=>30
,p_validation=>'PROJECT_WORKTYPE_ID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15751510794513298)
,p_associated_column=>'PROJECT_WORKTYPE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15752891016513298)
,p_tabular_form_region_id=>wwv_flow_api.id(15750113536513289)
,p_validation_name=>'IN_H/ON_S not null'
,p_validation_sequence=>40
,p_validation=>':NO_OF_DAYS IS NOT NULL OR :ON_SITE_DAYS IS NOT NULL'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'In house days or on site days must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15751510794513298)
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15753113701513298)
,p_tabular_form_region_id=>wwv_flow_api.id(15750113536513289)
,p_validation_name=>'NO_OF_DAYS must be numeric'
,p_validation_sequence=>40
,p_validation=>'NO_OF_DAYS'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15751510794513298)
,p_associated_column=>'NO_OF_DAYS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15753304581513298)
,p_tabular_form_region_id=>wwv_flow_api.id(15750113536513289)
,p_validation_name=>'SCALE not null'
,p_validation_sequence=>50
,p_validation=>'SCALE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15751510794513298)
,p_associated_column=>'SCALE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15753508194513298)
,p_tabular_form_region_id=>wwv_flow_api.id(15750113536513289)
,p_validation_name=>'SCALE must be numeric'
,p_validation_sequence=>50
,p_validation=>'SCALE'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15751510794513298)
,p_associated_column=>'SCALE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15753706004513298)
,p_tabular_form_region_id=>wwv_flow_api.id(15750113536513289)
,p_validation_name=>'ON_SITE_DAYS must be numeric'
,p_validation_sequence=>60
,p_validation=>'ON_SITE_DAYS'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15751510794513298)
,p_associated_column=>'ON_SITE_DAYS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15753902629513298)
,p_tabular_form_region_id=>wwv_flow_api.id(15750113536513289)
,p_validation_name=>'NO_OF_TICKETS must be numeric'
,p_validation_sequence=>70
,p_validation=>'NO_OF_TICKETS'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15751510794513298)
,p_associated_column=>'NO_OF_TICKETS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(945211740387470015)
,p_name=>'ON_SCALE_CHANGE'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'select[name="f05"]'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(945211828954470016)
,p_event_id=>wwv_flow_api.id(945211740387470015)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var elem = ''#'' + this.triggeringElement.id;',
'var key = ''#'' + ''f01_'' + this.triggeringElement.id.substring(4);',
'var set_list = ''#'' + ''f06_'' + this.triggeringElement.id.substring(4);',
'',
'',
'var key_val = $(key).val();',
'var elem_val = $(elem).val();',
'',
'var selected_val = '''';',
'console.log(elem_val);',
'console.log(key_val);',
'apex.server.process ( ',
'    "GET_EMPLOYEE",',
'    {',
'      x01: elem_val,',
'    },',
'    {',
'      success: function( pData ) {',
'          console.log(pData);',
'',
'      $(set_list).find(''option'').remove();',
'',
'      $.each(pData, function(key, innerjson) {',
'      $(set_list).append($(''<option>'', {',
'      value: innerjson.VALUE,',
'       text: innerjson.NAME',
'        }))',
'	  if (innerjson.SELECTED != '''') {selected_val = innerjson.SELECTED};',
'      });',
'',
'      if (selected_val != '''') {',
'        $(''select'' + set_list + '' option'').each(function() ',
'        {this.selected = (this.text == selected_val);});',
'      }',
'       },',
'    }',
');'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15754020794513298)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(15750113536513289)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'PRJ_ESTIMATED_DETS'
,p_attribute_03=>'ID'
,p_process_error_message=>'Unable to process update.'
,p_process_when_button_id=>wwv_flow_api.id(15751510794513298)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15754197146513298)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(15750113536513289)
,p_process_type=>'NATIVE_TABFORM_DELETE'
,p_process_name=>'ApplyMRD'
,p_attribute_02=>'PRJ_ESTIMATED_DETS'
,p_attribute_03=>'ID'
,p_process_error_message=>'Unable to process delete.'
,p_process_when=>'MULTI_ROW_DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'#MRD_COUNT# row(s) deleted.'
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
