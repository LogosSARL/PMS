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
--   Date and Time:   11:22 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 20
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00020
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>20);
end;
/
prompt --application/pages/page_00020
begin
wwv_flow_imp_page.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Project'
,p_step_title=>'Project'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20210705134534'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1820656229195401)
,p_plug_name=>'Project Status History'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_plug_new_grid=>true
,p_plug_display_point=>'REGION_POSITION_02'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PSH_ID, PSH_PRJ_ID,PSH_STS_ID, PSH_DATE,',
'PSH_REMARK',
'FROM PRJ_PROJECT_STATUS_HISTORY',
'WHERE PSH_PRJ_ID = :P20_ID'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P20_ID IS NOT NULL'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1820826633195403)
,p_name=>'PSH_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PSH_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_default_type=>'SEQUENCE'
,p_default_expression=>'BM_PSH_SEQ'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1820983003195404)
,p_name=>'PSH_STS_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PSH_STS_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Status'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PST_DESC, PST_ID',
'FROM PRJ_STATUS',
'order by 1'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1821052544195405)
,p_name=>'PSH_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PSH_DATE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Psh date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'NONE'
,p_format_mask=>'dd/mm/yyyy'
,p_is_required=>true
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1821191883195406)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'N'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1821294388195407)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1821375312195408)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1833025541278013)
,p_name=>'PSH_PRJ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PSH_PRJ_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':P20_ID'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1833483255278017)
,p_name=>'PSH_REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PSH_REMARK'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Comments'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(1820717755195402)
,p_internal_uid=>1820717755195402
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>true
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(1826164570207619)
,p_interactive_grid_id=>wwv_flow_imp.id(1820717755195402)
,p_static_id=>'17815'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(1826258736207640)
,p_report_id=>wwv_flow_imp.id(1826164570207619)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1826751451207660)
,p_view_id=>wwv_flow_imp.id(1826258736207640)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(1820826633195403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1827282936207670)
,p_view_id=>wwv_flow_imp.id(1826258736207640)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(1820983003195404)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>290
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1827743167207674)
,p_view_id=>wwv_flow_imp.id(1826258736207640)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(1821052544195405)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>320
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1829264401235635)
,p_view_id=>wwv_flow_imp.id(1826258736207640)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(1821191883195406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1829751789235639)
,p_view_id=>wwv_flow_imp.id(1826258736207640)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(1821294388195407)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>1
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1927655235520808)
,p_view_id=>wwv_flow_imp.id(1826258736207640)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(1833025541278013)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51968756973900726)
,p_view_id=>wwv_flow_imp.id(1826258736207640)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(1833483255278017)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13022572255569818)
,p_plug_name=>'Project'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13022887855569823)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P20_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13023161025569823)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13022778746569823)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P20_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(48423307708072101)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_button_name=>'iSSUE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Issue Invoice'
,p_button_position=>'CREATE'
,p_button_condition=>'UPPER(:P20_IS_INVOICE_ISSUED) <> ''Y'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13022983941569823)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'1=0'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(13023761850569827)
,p_branch_name=>'Go To Page 40'
,p_branch_action=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1833252964278015)
,p_name=>'P20_TEMP'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1833318420278016)
,p_name=>'P20_IS_INVOICE_ISSUED'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Invoiced'
,p_source=>'IS_INVOICED_FLG'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:;Y'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'1'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2864255065683145)
,p_name=>'P20_FLAG'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2864357184683146)
,p_name=>'P20_CNTID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2864429120683147)
,p_name=>'P20_MODULES'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2864572359683148)
,p_name=>'P20_INTCODE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13023976189569829)
,p_name=>'P20_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13024160253569829)
,p_name=>'P20_L_DESCRIPTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_use_cache_before_default=>'NO'
,p_prompt=>'L Description'
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
 p_id=>wwv_flow_imp.id(13024361448569843)
,p_name=>'P20_DSP_CODE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Dsp Code'
,p_source=>'DSP_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906436051019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13024577191569843)
,p_name=>'P20_CONTRACT_ID'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contract Id'
,p_source=>'CONTRACT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CONTRACT_CODE_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE d, ID r',
'from   LGS_CONTRACTS',
'order by 1'))
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906436051019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13024789036569843)
,p_name=>'P20_INT_CODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Int Code'
,p_source=>'INT_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(13024983318569845)
,p_name=>'P20_MODULE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Module'
,p_source=>'MODULE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_modules',
' where int_code in (',
'',
'  select module_code from css_project_tasks)',
'--where e_name IN (select unique module_name from css_project_tasks)',
'order by 1',
''))
,p_cSize=>30
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906436051019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13025178358569845)
,p_name=>'P20_ACTIVE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
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
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13025361051569845)
,p_name=>'P20_SEQ'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Seq'
,p_source=>'SEQ'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(266568042115915003)
,p_name=>'P20_PAYMENT_PERCENTAGE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(13022572255569818)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Payment percentage'
,p_source=>'PAYMENT_PERCENTAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(13025669062569845)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from LGS_PROJECTS'
,p_attribute_02=>'LGS_PROJECTS'
,p_attribute_03=>'P20_ID'
,p_attribute_04=>'ID'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13025889743569846)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of LGS_PROJECTS'
,p_attribute_02=>'LGS_PROJECTS'
,p_attribute_03=>'P20_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>'Unable to process row of table LGS_PROJECTS.'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2864182445683144)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1820656229195401)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ProjectStatusWorkFlow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'  l_body      CLOB;',
'  ',
'    TO_EMAIL_V VARCHAR2(100);',
'    ind         NUMBER;',
'    DSP_CODE VARCHAR2(100);',
'    P20_INTCODE VARCHAR2(200) ;',
'    P20_MODULES VARCHAR2(200)  ;',
'    P20_CNTID NUMBER ;',
'   EMP_CODE_V VARCHAR2(200);',
'   FROM_EMAIL_V VARCHAR2(200);',
'',
'begin',
'--case :APEX$ROW_STATUS',
'-- when ''I'' then',
':P20_TEMP := :PSH_STS_ID;',
'--IF ( :PSH_STS_ID <> :OLDSTS or :PSH_DATE <> :OLDDATE) THEN ',
'SELECT NVL(PST_SEND_EMAIL_FLG,''N'')  into :P20_FLAG FROM PRJ_STATUS WHERE PST_ID = :PSH_STS_ID ;',
' IF UPPER(NVL(:P20_FLAG,''N'')) = ''Y'' THEN ',
'        select INT_CODE, MODULE,CONTRACT_ID into P20_INTCODE,P20_MODULES,P20_CNTID from lgs_projects where id = :P20_ID;',
' SELECT DSP_CODE, WHO_CREATED INTO DSP_CODE,EMP_CODE_V FROM LGS_CONTRACTS WHERE ID = P20_CNTID;',
'  SELECT EMP_EMAIL into  FROM_EMAIL_V  FROM PRJ_EMPLOYEE_SALARY WHERE UPPER(EMP_CODE) = UPPER(EMP_CODE_V );',
' ind := 1;',
'     ',
'         l_body := ''Project Change status Confirmation Email.''||utl_tcp.crlf||utl_tcp.crlf;',
'         l_body := l_body || ''Contract Integration Code: '' || DSP_CODE ||utl_tcp.crlf||utl_tcp.crlf;',
'         ',
'',
'        ',
'         l_body := l_body || ''Module:#'' || ind ||utl_tcp.crlf;',
'        l_body := l_body || ''Name: '' || P20_MODULES || '' ........... '' || ''INT_CODE: '' || P20_INTCODE || utl_tcp.crlf||utl_tcp.crlf; ',
'        ind := ind + 1;',
'    ',
'        l_body := l_body ||''Sincerely,''||utl_tcp.crlf;',
'         l_body := l_body ||''The Application Express Dev Team''||utl_tcp.crlf;',
'       ',
'      -- SELECT EMP_EMAIL INTO FROM_EMAIL_V',
'      -- FROM PRJ_EMPLOYEE_SALARY',
'      -- WHERE UPPER(USER_NAME) = UPPER(:P37_WHO_CREATED);',
'       ',
'       SELECT EMP_EMAIL into  TO_EMAIL_V',
'        FROM PRJ_EMPLOYEE_SALARY',
'        WHERE IS_ADMIN = ''Y'';',
'  ',
'        apex_mail.send(',
'                         p_to  => ''tareif.kh@gmail.com'' ,--- ''serineelhakim@gmail.com''   , -----TO_EMAIL_V,   -- change to your email address',
'                          p_from => FROM_EMAIL_V, ---  ''tareif.kh@gmail.com''   ,----- FROM_EMAIL_V, -- change to a real senders email address',
'                          p_cc =>FROM_EMAIL_V , ---- ''tareif.kh@gmail.com''   ,',
'                          p_body     => l_body,',
'                         p_subj => ''Project - Notification'');',
'                         APEX_MAIL.PUSH_QUEUE  ;',
'',
'',
'    ',
'     ',
'        ',
'       -- apex_mail.send(',
'         --                p_to  => TO_EMAIL_V,   -- change to your email address',
'           --               p_from =>  FROM_EMAIL_V, -- change to a real senders email address',
'             --             p_cc => FROM_EMAIL_V,',
'               --           p_body     => l_body,',
'                 --        p_subj => ''Contract Approved - Notification'');',
'                   --      APEX_MAIL.PUSH_QUEUE;',
'   ',
'',
' ',
' ',
' ',
'',
'',
'',
'END IF ;',
'--END IF;',
'',
'--end case;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1821436857195409)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1820656229195401)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Project Status History - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13026062041569848)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_imp.id(13022983941569823)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(48423434605072102)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ISSUEINVOICE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' DECLARE',
' ',
' TO_EMAIL_V VARCHAR2(200);',
' l_body      CLOB;',
' ',
'    ind         NUMBER;',
'    FROM_EMAIL_V VARCHAR2(100);',
'  ',
'    P20_CNTID NUMBER ;',
'   EMP_CODE_V VARCHAR2(200);',
'  ',
' DSP_CODE VARCHAR2(100);',
'    P20_INTCODE VARCHAR2(200) ;',
'    P20_MODULES VARCHAR2(200)  ;',
'',
'',
'       ',
' ',
' ',
'BEGIN',
'',
'ind := 1;',
'',
'UPDATE  LGS_PROJECTS SET',
'IS_INVOICED_FLG = ''Y'' and PAYMENT_PERCENTAGE = 100',
'WHERE ID = :P20_ID;',
'',
'  select INT_CODE, MODULE,CONTRACT_ID into P20_INTCODE,P20_MODULES,P20_CNTID from lgs_projects where id = :P20_ID;',
' SELECT DSP_CODE, WHO_CREATED INTO DSP_CODE,EMP_CODE_V FROM LGS_CONTRACTS WHERE ID = P20_CNTID;',
'  SELECT EMP_EMAIL INTO FROM_EMAIL_V FROM PRJ_EMPLOYEE_SALARY WHERE UPPER(EMP_CODE) = UPPER(EMP_CODE_V );',
' ',
' SELECT EMP_EMAIL into  TO_EMAIL_V',
'        FROM PRJ_EMPLOYEE_SALARY',
'        WHERE IS_ADMIN = ''Y'';',
'  ',
'         l_body := ''Project Invoice Issuing Email.''||utl_tcp.crlf||utl_tcp.crlf;',
'         l_body := l_body || ''Contract Integration Code: '' || DSP_CODE ||utl_tcp.crlf||utl_tcp.crlf;',
'         ',
'',
'        ',
'         l_body := l_body || ''Module:#'' || ind ||utl_tcp.crlf;',
'        l_body := l_body || ''Name: '' || P20_MODULES || '' ........... '' || ''INT_CODE: '' || P20_INTCODE || utl_tcp.crlf||utl_tcp.crlf; ',
'        ind := ind + 1;',
'    ',
'        l_body := l_body ||''Sincerely,''||utl_tcp.crlf;',
'         l_body := l_body ||''The Application Express Dev Team''||utl_tcp.crlf;',
'        apex_mail.send(',
'                         p_to  =>  ''tareif.kh@gmail.com''   , -----TO_EMAIL_V,   -- change to your email address',
'                          p_from =>   ''tareif.kh@gmail.com''   ,----- FROM_EMAIL_V, -- change to a real senders email address',
'                          p_cc => ''tareif.kh@gmail.com''   ,',
'                          p_body     => l_body,',
'                         p_subj => ''Project - Notification'');',
'                         APEX_MAIL.PUSH_QUEUE  ;',
'                         ',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(48423307708072101)
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
