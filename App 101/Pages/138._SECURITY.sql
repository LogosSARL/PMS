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
--     PAGE: 138
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00138
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>138);
end;
/
prompt --application/pages/page_00138
begin
wwv_flow_imp_page.create_page(
 p_id=>138
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'SECURITY'
,p_step_title=>'SECURITY'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'21'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190207102854'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(296821181654073112)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(296822180915073122)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  PRJ_GROUPS.PGR_ID,',
'  PRJ_GROUPS.PGR_CODE,',
'  PRJ_GROUP_EMPLOYEES.PGE_ID,',
'  PRJ_EMPLOYEE_SALARY.EMP_CODE,',
'  PRJ_EMPLOYEE_SALARY.EMP_NAME,',
'  PRJ_EMPLOYEE_SALARY.EMP_TITLE',
'FROM',
'  PRJ_GROUPS',
'INNER JOIN PRJ_GROUP_EMPLOYEES',
'ON',
'  PRJ_GROUPS.PGR_ID = PRJ_GROUP_EMPLOYEES.PGE_PGR_ID',
'INNER JOIN PRJ_EMPLOYEE_SALARY',
'ON',
'  PRJ_EMPLOYEE_SALARY.EMP_CODE = PRJ_GROUP_EMPLOYEES.PGE_EMPLOYEE',
'   where PGR_ID = :P138_PRJ_TMP;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(298389520630319810)
,p_name=>'PGR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PGR_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Pgr id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(298389673185319811)
,p_name=>'PGR_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PGR_CODE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Pgr code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(298389727028319812)
,p_name=>'PGE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PGE_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Pge id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(298389808082319813)
,p_name=>'EMP_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_CODE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(298389938611319814)
,p_name=>'EMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>35
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(298390095905319815)
,p_name=>'EMP_TITLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_TITLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Emp title'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(298390146423319816)
,p_name=>'-'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(298389445784319809)
,p_internal_uid=>298389445784319809
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>false
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(298401821188329515)
,p_interactive_grid_id=>wwv_flow_imp.id(298389445784319809)
,p_static_id=>'17936'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(298401942946329515)
,p_report_id=>wwv_flow_imp.id(298401821188329515)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(298402415413329516)
,p_view_id=>wwv_flow_imp.id(298401942946329515)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(298389520630319810)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(298402973119329517)
,p_view_id=>wwv_flow_imp.id(298401942946329515)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(298389673185319811)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(298403457612329518)
,p_view_id=>wwv_flow_imp.id(298401942946329515)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(298389727028319812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(298403950272329519)
,p_view_id=>wwv_flow_imp.id(298401942946329515)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(298389808082319813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(298404489646329520)
,p_view_id=>wwv_flow_imp.id(298401942946329515)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(298389938611319814)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(298404993959329521)
,p_view_id=>wwv_flow_imp.id(298401942946329515)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(298390095905319815)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(296821421834073115)
,p_name=>'P138_PRJ'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(296821181654073112)
,p_prompt=>'Project Module'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select PGR_DESC,PGR_ID from PRJ_GROUPS'
,p_lov_display_null=>'YES'
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
 p_id=>wwv_flow_imp.id(296822764427073128)
,p_name=>'P138_PRJ_TMP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(296821181654073112)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(296821879440073119)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P138_PRJ'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(296821966326073120)
,p_event_id=>wwv_flow_imp.id(296821879440073119)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P138_PRJ_TMP := :P138_PRJ;'
,p_attribute_02=>'P138_PRJ,P138_PRJ_TMP'
,p_attribute_03=>'P138_PRJ,P138_PRJ_TMP'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(296822596714073126)
,p_event_id=>wwv_flow_imp.id(296821879440073119)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(296822654636073127)
,p_process_sequence=>10
,p_process_point=>'AFTER_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_process_sql_clob=>' :P138_PRJ := '''';'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(296822878767073129)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>':P138_PRJ := '''';'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
