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

prompt --application/pages/delete_00013
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>13);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'Enrollment Details'
,p_page_mode=>'NORMAL'
,p_step_title=>'Enrollment Details'
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
,p_last_upd_yyyymmddhh24miss=>'20200727211815'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(15734007131337218)
,p_name=>'Enrollment in &P13_PROJECT_WORKTYPE_DESC.'
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
'"FROM_DATE",',
'"NO_OF_HOURS",',
'"INIT_EST",',
'"EMPLOYEE",',
'"CUSTOMER_CERTIFIED",',
'"NOTES",',
'"ON_SITE_DAYS",',
'"MODULE",',
'"ADDITIONAL_EST",',
'"ADDITIONAL_EST_DT",',
'"SYS_REM",',
'"CUR_REM",',
'"CUR_REM_DT",',
'"FROM_CSS",',
'"CSS_SERIAL"',
'from "#OWNER#"."PRJ_ENROLLED_DETS"',
'WHERE PROJECT_WORKTYPE_ID = :P13_PROJECT_WORKTYPE_ID',
''))
,p_source_type=>'NATIVE_TABFORM'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Excel'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_exp_filename=>'Enrollment in &P13_PROJECT_WORKTYPE_DESC.'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15734289531337222)
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
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15734399521337223)
,p_query_column_id=>2
,p_column_alias=>'ID_DISPLAY'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'ID_DISPLAY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15734508640337223)
,p_query_column_id=>3
,p_column_alias=>'PROJECT_WORKTYPE_ID'
,p_column_display_sequence=>4
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_column_default=>'P13_PROJECT_WORKTYPE_ID'
,p_column_default_type=>'ITEM'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'PROJECT_WORKTYPE_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15734599064337223)
,p_query_column_id=>4
,p_column_alias=>'FROM_DATE'
,p_column_display_sequence=>8
,p_column_heading=>'Date'
,p_use_as_row_header=>'N'
,p_column_format=>'dd-mm-yyyy'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'DATE_PICKER'
,p_column_width=>12
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'FROM_DATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15734696152337223)
,p_query_column_id=>5
,p_column_alias=>'NO_OF_HOURS'
,p_column_display_sequence=>9
,p_column_heading=>'No Of Hours'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_display_as=>'TEXT'
,p_column_width=>5
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'NO_OF_HOURS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(945213463990470032)
,p_query_column_id=>6
,p_column_alias=>'INIT_EST'
,p_column_display_sequence=>7
,p_column_heading=>'Initial Est.'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'INIT_EST'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15734802669337223)
,p_query_column_id=>7
,p_column_alias=>'EMPLOYEE'
,p_column_display_sequence=>5
,p_column_heading=>'Employee'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(15749702055464653)
,p_lov_show_nulls=>'NO'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'EMPLOYEE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15734907604337223)
,p_query_column_id=>8
,p_column_alias=>'CUSTOMER_CERTIFIED'
,p_column_display_sequence=>10
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'CUSTOMER_CERTIFIED'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15735012297337223)
,p_query_column_id=>9
,p_column_alias=>'NOTES'
,p_column_display_sequence=>15
,p_column_heading=>'Notes'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>50
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'NOTES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15735102961337223)
,p_query_column_id=>10
,p_column_alias=>'ON_SITE_DAYS'
,p_column_display_sequence=>11
,p_column_heading=>'On Site Hours'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_display_as=>'TEXT'
,p_column_width=>5
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'ON_SITE_DAYS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15735218811337223)
,p_query_column_id=>11
,p_column_alias=>'MODULE'
,p_column_display_sequence=>6
,p_column_heading=>'Module'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(20927250648083995)
,p_lov_show_nulls=>'NO'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'MODULE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(945213550284470033)
,p_query_column_id=>12
,p_column_alias=>'ADDITIONAL_EST'
,p_column_display_sequence=>12
,p_column_heading=>'Additional est.'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'ADDITIONAL_EST'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(945213679033470034)
,p_query_column_id=>13
,p_column_alias=>'ADDITIONAL_EST_DT'
,p_column_display_sequence=>13
,p_column_heading=>'Additional Est. Dt.'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'DATE_PICKER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'ADDITIONAL_EST_DT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(945213752565470035)
,p_query_column_id=>14
,p_column_alias=>'SYS_REM'
,p_column_display_sequence=>17
,p_column_heading=>'Sys. Remaining'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'SYS_REM'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(945213829586470036)
,p_query_column_id=>15
,p_column_alias=>'CUR_REM'
,p_column_display_sequence=>18
,p_column_heading=>'Curr. Remaining'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'CUR_REM'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(945213978906470037)
,p_query_column_id=>16
,p_column_alias=>'CUR_REM_DT'
,p_column_display_sequence=>19
,p_column_heading=>'Curr. Rem. Dt.'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'DATE_PICKER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'CUR_REM_DT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15735299764337223)
,p_query_column_id=>17
,p_column_alias=>'FROM_CSS'
,p_column_display_sequence=>14
,p_column_heading=>'From Css'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(20935140090118790)
,p_lov_show_nulls=>'NO'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'FROM_CSS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15735403714337223)
,p_query_column_id=>18
,p_column_alias=>'CSS_SERIAL'
,p_column_display_sequence=>16
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'PRJ_ENROLLED_DETS'
,p_ref_column_name=>'CSS_SERIAL'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15738717354337234)
,p_query_column_id=>19
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15735807508337225)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(15734007131337218)
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
 p_id=>wwv_flow_api.id(15735609966337225)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(15734007131337218)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15735498343337225)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(15734007131337218)
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
 p_id=>wwv_flow_api.id(15735704277337225)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(15734007131337218)
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
 p_id=>wwv_flow_api.id(15738818622337234)
,p_branch_action=>'f?p=&APP_ID.:13:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15740603992380030)
,p_name=>'P13_PROJECT_WORKTYPE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(15734007131337218)
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
 p_id=>wwv_flow_api.id(15740814035382878)
,p_name=>'P13_PROJECT_WORKTYPE_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(15734007131337218)
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
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15736595448337228)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'PROJECT_WORKTYPE_ID not null'
,p_validation_sequence=>30
,p_validation=>'PROJECT_WORKTYPE_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15735609966337225)
,p_associated_column=>'PROJECT_WORKTYPE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15736801607337231)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'PROJECT_WORKTYPE_ID must be numeric'
,p_validation_sequence=>30
,p_validation=>'PROJECT_WORKTYPE_ID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15735609966337225)
,p_associated_column=>'PROJECT_WORKTYPE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15736995162337231)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'FROM_DATE not null'
,p_validation_sequence=>40
,p_validation=>'FROM_DATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15735609966337225)
,p_associated_column=>'FROM_DATE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15737218136337231)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'FROM_DATE must be a valid date'
,p_validation_sequence=>40
,p_validation=>'FROM_DATE'
,p_validation_type=>'ITEM_IS_DATE'
,p_error_message=>'#COLUMN_HEADER# must be a valid date.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15735609966337225)
,p_associated_column=>'FROM_DATE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15737399475337231)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'NO_OF_HOURS not null'
,p_validation_sequence=>50
,p_validation=>'NO_OF_HOURS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15735609966337225)
,p_associated_column=>'NO_OF_HOURS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15737605962337231)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'NO_OF_HOURS must be numeric'
,p_validation_sequence=>50
,p_validation=>'NO_OF_HOURS'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15735609966337225)
,p_associated_column=>'NO_OF_HOURS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15737792015337232)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'EMPLOYEE not null'
,p_validation_sequence=>60
,p_validation=>'EMPLOYEE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15735609966337225)
,p_associated_column=>'EMPLOYEE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15738016187337232)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'ON_SITE_DAYS must be numeric'
,p_validation_sequence=>90
,p_validation=>'ON_SITE_DAYS'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15735609966337225)
,p_associated_column=>'ON_SITE_DAYS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(15738212666337232)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'CSS_SERIAL must be numeric'
,p_validation_sequence=>120
,p_validation=>'CSS_SERIAL'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(15735609966337225)
,p_associated_column=>'CSS_SERIAL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(945214708405470045)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'ADDITIONAL_EST_DT must be a valid date'
,p_validation_sequence=>130
,p_validation=>'ADDITIONAL_EST_DT'
,p_validation_type=>'ITEM_IS_DATE'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'ADDITIONAL_EST_DT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(945214815332470046)
,p_tabular_form_region_id=>wwv_flow_api.id(15734007131337218)
,p_validation_name=>'CUR_REM_DT'
,p_validation_sequence=>140
,p_validation=>'CUR_REM_DT'
,p_validation_type=>'ITEM_IS_DATE'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'CUR_REM_DT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(945214379675470041)
,p_name=>'INIT_EST_CHANGED'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'input[name="f06"]'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(945214444969470042)
,p_event_id=>wwv_flow_api.id(945214379675470041)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var elem = ''#'' + this.triggeringElement.id;',
'var sys_rem = ''#'' + ''f16_'' + this.triggeringElement.id.substring(4);',
'var cur_rem = ''#'' + ''f17_'' + this.triggeringElement.id.substring(4);',
'',
'',
'var cur_rem_val = $(cur_rem).val();',
'var elem_val = $(elem).val();',
'console.log(cur_rem_val);',
'console.log(sys_rem);',
'$(sys_rem).val(elem_val - cur_rem_val);',
'',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(945214557565470043)
,p_name=>'CURR_EST_CHANGED'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'input[name="f17"]'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(945214681210470044)
,p_event_id=>wwv_flow_api.id(945214557565470043)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var elem = ''#'' + this.triggeringElement.id;',
'var sys_rem = ''#'' + ''f16_'' + this.triggeringElement.id.substring(4);',
'var cur_rem = ''#'' + ''f17_'' + this.triggeringElement.id.substring(4);',
'',
'',
'var cur_rem_val = $(cur_rem).val();',
'var elem_val = $(elem).val();',
'console.log(cur_rem_val);',
'console.log(sys_rem);',
'$(sys_rem).val(elem_val - cur_rem_val);',
'',
''))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15738309904337232)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(15734007131337218)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'PRJ_ENROLLED_DETS'
,p_attribute_03=>'ID'
,p_process_error_message=>'Unable to process update.'
,p_process_when_button_id=>wwv_flow_api.id(15735609966337225)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15738501547337232)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(15734007131337218)
,p_process_type=>'NATIVE_TABFORM_DELETE'
,p_process_name=>'ApplyMRD'
,p_attribute_02=>'PRJ_ENROLLED_DETS'
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
