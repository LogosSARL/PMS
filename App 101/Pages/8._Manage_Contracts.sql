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
--     PAGE: 8
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00008
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>8);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_imp_page.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Manage Contracts'
,p_step_title=>'Manage Contracts'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20200713150925'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15709212529841736)
,p_plug_name=>'Manage Contracts'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902140805019133)
,p_plug_display_sequence=>10
,p_plug_new_grid=>true
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15824599949102738)
,p_name=>'List of Managers'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_column=>2
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.emp_name Manager,',
'       c.active',
'from   prj_user_contracts c, prj_employee_salary s',
'where  c.contract_id = :P8_ID',
'and    c.emp_code = s.emp_code',
'order by 1'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15824910448102744)
,p_query_column_id=>1
,p_column_alias=>'MANAGER'
,p_column_display_sequence=>1
,p_column_heading=>'MANAGER'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15825014943102746)
,p_query_column_id=>2
,p_column_alias=>'ACTIVE'
,p_column_display_sequence=>2
,p_column_heading=>'ACTIVE'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(20935140090118790)
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(228841100372313999)
,p_plug_name=>'Financial Offer'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902140805019133)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY_2'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(229881009813140034)
,p_plug_name=>'Dates and Rates'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>30
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY_2'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15825610516143638)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(15824599949102738)
,p_button_name=>'CREATE_MANAGERS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Create Managers'
,p_button_position=>'ABOVE_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP:P2_CONTRACT_ID,P2_CONTRACT_INT_CODE:&P8_ID.,&P8_DSP_CODE.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15709507529841748)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P8_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15709808739841768)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15709415237841748)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P8_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15709616052841748)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P8_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(15710297458841798)
,p_branch_name=>'Go To Page 40'
,p_branch_action=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14440681746133157)
,p_name=>'P8_WHO_CREATED'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&USER.'
,p_prompt=>'Who Created'
,p_source=>'WHO_CREATED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15710498223841804)
,p_name=>'P8_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15710698686841834)
,p_name=>'P8_DSP_CODE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Integration Code'
,p_source=>'DSP_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(15710913705841837)
,p_name=>'P8_COMPANY_CODE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Company'
,p_source=>'COMPANY_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'COMPANIES_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_companies',
'where upper(nvl(deleted,''N'')) <> ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'%'
,p_cSize=>60
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(15711098364841839)
,p_name=>'P8_START_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Start Date'
,p_format_mask=>'dd/mm/yyyy'
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
 p_id=>wwv_flow_imp.id(15711306898841845)
,p_name=>'P8_END_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'End Date'
,p_format_mask=>'dd/mm/yyyy'
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
 p_id=>wwv_flow_imp.id(15711692586841846)
,p_name=>'P8_FINALIZED'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Finalized'
,p_source=>'FINALIZED'
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
 p_id=>wwv_flow_imp.id(15711909546841848)
,p_name=>'P8_CONTRACT_TYPE_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contract Type'
,p_source=>'CONTRACT_TYPE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CONTRACT_TYPE_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from   prj_contract_types',
'order by seq'))
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
 p_id=>wwv_flow_imp.id(15712112577841848)
,p_name=>'P8_CONTRACT_STAGE_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contract Stage'
,p_source=>'CONTRACT_STAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CONTRACT_STAGES_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from   prj_contract_stages',
'order by seq'))
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
 p_id=>wwv_flow_imp.id(72608730312718802)
,p_name=>'P8_INVOICED_DAYS'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Invoiced days'
,p_source=>'INVOICED_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182544543727767143)
,p_name=>'P8_DESCRIPTION'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
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
 p_id=>wwv_flow_imp.id(182544632756767144)
,p_name=>'P8_PROJECTNAME'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project_Name'
,p_source=>'PROJECT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
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
 p_id=>wwv_flow_imp.id(182544766132767145)
,p_name=>'P8_OFFERSTATUS'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Offer Status'
,p_source=>'OFFER_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT POS_DESC,POS_ID',
'FROM PRJ_OFFER_STATUS',
'ORDER BY 1',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182544801616767146)
,p_name=>'P8_PARENTCONTRACT'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Parent Contract'
,p_source=>'PARENT_CONTRACT'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_imp.id(182544924953767147)
,p_name=>'P8_INTERNALCLLASSIFICATION'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Internal Classifications'
,p_source=>'REF_INTERNAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pic_desc,pic_id',
'from prj_internal_classification',
'order by 2'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182545003849767148)
,p_name=>'P8_LOGOSBRANCHES'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Logos Branches'
,p_source=>'BRANCH_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOGOS_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  LLB_DESC as d,',
'       LLB_ID as r',
'  from LGS_LOGOS_BRANCHES',
' order by 2'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182545161207767149)
,p_name=>'P8_APPROVALDATE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Approval Date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'APPROVAL_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182545207088767150)
,p_name=>'P8_INSCOPE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'In Scope'
,p_source=>'IN_SCOPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;1,No;0'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227007779951195101)
,p_name=>'P8_ACCOUNTMANAGER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(15709212529841736)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Account_Manager'
,p_source=>'ACCOUNT_MANAGER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'36_ACCOUNT_MANAGER_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMP_NAME,EMP_CODE',
'from PRJ_EMPLOYEE_SALARY',
'where ACTIVE = ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>2000
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227019706843456921)
,p_name=>'P8_PRICING_DATE_1'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(229881009813140034)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date Raised'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'PRICING_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227020162517456926)
,p_name=>'P8_EXPECTED_DELIVERY_DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(229881009813140034)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expected Delivery Date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'EXPECTED_DELIVERY_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>28
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227020504260456926)
,p_name=>'P8_REF_PM'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(229881009813140034)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'REF_PM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>2000
,p_cHeight=>4
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227020939438456927)
,p_name=>'P8_EXPECTED_DEL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(229881009813140034)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expected delivery <br>Number of Days'
,p_source=>'EXPECTED_DELIVERY_NUM_OF_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227021311513456929)
,p_name=>'P8_REFERENCE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(229881009813140034)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reference'
,p_source=>'REFERENCES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>2000
,p_cHeight=>3
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
 p_id=>wwv_flow_imp.id(227021798277456929)
,p_name=>'P8_INHOUSE_RATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(229881009813140034)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Inhouse Rate'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'INHOUSE_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>200
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227022192975456930)
,p_name=>'P8_ONSITE_RATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(229881009813140034)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Onsite Rate'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'ONSITE_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227024433538459352)
,p_name=>'P8_IH_INVOICED_DAYS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'In House Invoiced Days'
,p_source=>'IH_INVOICE_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227024853678459353)
,p_name=>'P8_IH_INITIAL_AMOUNT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'In House INITIAL AMOUNT'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'IH_INITIAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227025264124459354)
,p_name=>'P8_AS_INVOICED_DAYS'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'At Site INVOICED DAYS'
,p_source=>'AS_INVOICE_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227025602182459354)
,p_name=>'P8_AS_INITIAL_AMOUNT'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'At Site INITIAL AMOUNT'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'AS_INITIAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227026027503459355)
,p_name=>'P8_INITIAL_AMOUNT'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Initial Amount'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'INITIAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227026457564459355)
,p_name=>'P8_DISCOUNT_IN_DAYS'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Discount In Days'
,p_source=>'DISCOUNT_IN_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227026840095459356)
,p_name=>'P8_DISCOUNT_IN_AMOUNT'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Discount In Amount'
,p_source=>'DISCOUNT_IN_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227027231357459356)
,p_name=>'P8_FINAL_AMOUNT'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Final Amount'
,p_source=>'FINAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227027631337459364)
,p_name=>'P8_VAT_VALUE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_item_default=>'10'
,p_prompt=>'Vat Value'
,p_source=>'VAT_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227028024608459364)
,p_name=>'P8_USD_VALUE_1'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Amount incl. VAT (USD)'
,p_source=>'USD_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227028493175459365)
,p_name=>'P8_LL_VALUE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Amount incl. VAT (L.L)'
,p_source=>'LL_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227028829143459365)
,p_name=>'P8_WARRANTY_IN_MONTH'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Warranty In Month'
,p_source=>'WARRANTY_IN_MONTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
end;
/
begin
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227029294777459366)
,p_name=>'P8_VALUE_IN_MAINTENANCE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Value In Maintenance'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'VALUE_IN_MAINTENANCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227029652575459366)
,p_name=>'P8_OTHER_EXPENSES_ON_CLIENT'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Other Expenses On Client'
,p_source=>'OTHER_EXPENSES_ON_CLIENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227030092969459367)
,p_name=>'P8_PERDIUM_1'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Perdium'
,p_source=>'PERDIUM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227030486803459368)
,p_name=>'P8_TICKET_VALUE_1'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ticket Value'
,p_source=>'TICKET_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227030847729459368)
,p_name=>'P8_HOTEL_RATE_1'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Hotel Rate'
,p_source=>'HOTEL_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227031264244459369)
,p_name=>'P8_CAR_RENTAL_PER_DAY_1'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Car Rental Per Day'
,p_source=>'CAR_RENTAL_PER_DAY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227031664976459370)
,p_name=>'P8_INTERNATIONAL_1'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'International'
,p_source=>'INTERNATIONAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(227032019884459370)
,p_name=>'P8_DAYS_PER_TICKET_1'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Days Per Ticket'
,p_source=>'DAYS_PER_TICKET'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227032447717459371)
,p_name=>'P8_PAYMENT_TERM'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Payment Term'
,p_source=>'PAYMENT_TERM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>5
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(227032845809459371)
,p_name=>'P8_REMARKS'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Remarks'
,p_source=>'REMARKS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_cMaxlength=>4000
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
 p_id=>wwv_flow_imp.id(227033254551459372)
,p_name=>'P8_SIGNED_BY'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Logos Signature'
,p_source=>'SIGNED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>1000
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
 p_id=>wwv_flow_imp.id(227033677794459372)
,p_name=>'P8_SIGNATURE_DATE'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Logos Signature Date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'SIGNATURE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>28
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(227034086341459373)
,p_name=>'P8_CLIENT_SIGNATURE'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Client Signature'
,p_source=>'CLIENT_SIGNATURE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>200
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
 p_id=>wwv_flow_imp.id(227034476230459374)
,p_name=>'P8_CLIENT_SIGNATURE_DATE'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(228841100372313999)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Client Signature Date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'CLIENT_SIGNATURE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2720448055162024)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P8_START_DATE <= :P8_END_DATE THEN',
'RETURN TRUE;',
'ELSE RETURN FALSE ;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'ERROR; INVALID DATE'
,p_validation_condition=>'1=0'
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(15711098364841839)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2720508228162025)
,p_validation_name=>'New_1'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if  :P8_END_DATE >= :P8_START_DATE THEN',
'RETURN TRUE;',
'ELSE RETURN FALSE ;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'ERROR; INVALID DATE'
,p_validation_condition=>'1=0'
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(15711306898841845)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15713991475841857)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from LGS_CONTRACTS'
,p_attribute_02=>'LGS_CONTRACTS'
,p_attribute_03=>'P8_ID'
,p_attribute_04=>'ID'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15714203949841864)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of LGS_CONTRACTS'
,p_attribute_02=>'LGS_CONTRACTS'
,p_attribute_03=>'P8_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_process_error_message=>'Unable to process row of table LGS_CONTRACTS.'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15714391544841864)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_imp.id(15709616052841748)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15761612421766929)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create_projects'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'transfer_data.insert_projects(:P8_DSP_CODE);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_button_id=>wwv_flow_imp.id(15709415237841748)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27088152020379528)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Newupdate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'UPDATE_PIP_CONT',
'( :P8_ID  ,',
':P8_DSP_CODE	, ',
':P8_COMPANY_CODE	,',
' to_date(:P8_START_DATE,''dd/MM/yyyy''),',
' to_date(:P8_END_DATE,''dd/MM/yyyy''),',
':P8_USD_VALUE_1, ',
' :P8_FINALIZED,',
':P8_CONTRACT_TYPE_ID,	',
' :P8_CONTRACT_STAGE_ID,',
' null,',
' to_date(:P8_PRICING_DATE_1,''dd/MM/yyyy'')	,',
':P8_PERDIUM1	,',
':P8_DAYS_PER_TICKET,',
':P8_TICKET_VALUE	,',
':P8_HOTEL_RATE_1	,',
':P8_CAR_RENTAL_PER_DAY	,',
' null,',
':P8_WHO_CREATED,',
':P8_ACCOUNTMANAGER		,',
' :P8_PARENTCONTRACT	,',
':P8_PROJECTNAME	,',
':P8_REF_PM	,',
' null,',
':P8_INHOUSE_RATE	,',
':P8_ONSITE_RATE	,',
':P8_INSCOPE,',
':P8_INVOICED_DAYS	,',
':P8_INITIAL_AMOUNT	,',
':P8_DISCOUNT_IN_DAYS,',
':P8_DISCOUNT_IN_AMOUNT	,',
':P8_VAT_VALUE,',
':P8_FINAL_AMOUNT, ',
' to_date(:P8_EXPECTED_DELIVERY_DATE,''dd/MM/yyyy''),',
':P8_WARRANTY_IN_MONTH,',
':P8_VALUE_IN_MAINTENANCE	,',
' to_date(:P8_SIGNATURE_DATE,''dd/MM/yyyy''),',
' :P8_SIGNED_BY,	',
' :P8_PAYMENT_TERM,',
':P8_REMARKS	,',
'v(''P8_OTHER_EXPENSES_ON_CLIENT'')	,',
' null		,',
':P8_IH_INVOICED_DAYS	,',
':P8_AS_INVOICED_DAYS	,',
':P8_IH_INITIAL_AMOUNT,',
' :P8_AS_INITIAL_AMOUNT	,',
' :P8_INTERNALCLLASSIFICATION,',
'to_date(:P8_APPROVALDATE,''dd/MM/yyyy''),',
':P8_LOGOSBRANCHES,',
'null,',
' null,',
' :P8_DESCRIPTION , ',
':P8_REFERENCE ,',
':P8_CLIENT_SIGNATURE , 	',
' to_date(:P8_CLIENT_SIGNATURE_DATE,''dd/MM/yyyy''),',
':P8_EXPECTED_DEL,   ',
' :P8_LL_VALUE  ,',
' null ,',
' null);',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(15709507529841748)
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
