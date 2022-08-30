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
--   Date and Time:   09:34 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00083
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>83);
end;
/
prompt --application/pages/page_00083
begin
wwv_flow_api.create_page(
 p_id=>83
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'MANAGE CONTRACT'
,p_page_mode=>'NORMAL'
,p_step_title=>'MANAGE CONTRACT'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'MANAGE CONTRACT'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20220620151846'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84100685024967224)
,p_plug_name=>'Manage Contracts'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20902140805019133)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(84216072444228226)
,p_name=>'List of Managers'
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_column=>2
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.emp_name Manager,',
'       c.active',
'from   prj_user_contracts c, prj_employee_salary s',
'where  c.contract_id = :P83_ID',
'and    c.emp_code = s.emp_code',
'order by 1'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(68401295200125505)
,p_query_column_id=>1
,p_column_alias=>'MANAGER'
,p_column_display_sequence=>1
,p_column_heading=>'MANAGER'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(68401631801125508)
,p_query_column_id=>2
,p_column_alias=>'ACTIVE'
,p_column_display_sequence=>2
,p_column_heading=>'ACTIVE'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(20935140090118790)
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(297232572867439487)
,p_plug_name=>'Financial Offer'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20902140805019133)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_2'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(298272482308265522)
,p_plug_name=>'Dates and Rates'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY_2'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68402072325125509)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(84216072444228226)
,p_button_name=>'CREATE_MANAGERS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Create Managers'
,p_button_position=>'ABOVE_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP:P2_CONTRACT_ID,P2_CONTRACT_INT_CODE:&P83_ID.,&P83_DSP_CODE.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68392111062125490)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(84100685024967224)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P83_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68392530506125490)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(84100685024967224)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68392928745125491)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(84100685024967224)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P83_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(221813208372557301)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(84100685024967224)
,p_button_name=>'isIssued'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Isissued'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'nvl(:P83_IS_INVOICED,''N'')<> ''Y'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68393330824125491)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(84100685024967224)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P83_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(68419142741125537)
,p_branch_name=>'Go To Page 40'
,p_branch_action=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27088869130379535)
,p_name=>'P83_ORACLELICENSE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oracle License'
,p_source=>'ORACLE_LICENSE'
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
 p_id=>wwv_flow_api.id(27088993660379536)
,p_name=>'P83_APPLICENSE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'App License'
,p_source=>'APP_LICENSE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68393721454125492)
,p_name=>'P83_ID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68394111800125493)
,p_name=>'P83_DSP_CODE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906436051019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68394509967125494)
,p_name=>'P83_COMPANY_CODE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Client'
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
,p_field_template=>wwv_flow_api.id(20906436051019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68394937613125494)
,p_name=>'P83_START_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68395351344125495)
,p_name=>'P83_END_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68395766919125495)
,p_name=>'P83_FINALIZED'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Finalized'
,p_source=>'FINALIZED'
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
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68396120656125496)
,p_name=>'P83_CONTRACT_TYPE_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68396591621125496)
,p_name=>'P83_CONTRACT_STAGE_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68396907003125497)
,p_name=>'P83_WHO_CREATED'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68397370370125498)
,p_name=>'P83_DESCRIPTION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68397785923125498)
,p_name=>'P83_PROJECTNAME'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project_Name'
,p_source=>'PROJECT_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
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
 p_id=>wwv_flow_api.id(68398196112125499)
,p_name=>'P83_ACCOUNTMANAGER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68398599543125499)
,p_name=>'P83_PARENTCONTRACT'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Parent Contract'
,p_source=>'PARENT_CONTRACT'
,p_source_type=>'DB_COLUMN'
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
 p_id=>wwv_flow_api.id(68398905645125500)
,p_name=>'P83_INTERNALCLLASSIFICATION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Internal Classifications'
,p_source=>'INTERNAL_CLASSIFICATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pic_desc,pic_id',
'from prj_internal_classification',
'order by 2'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68399374185125500)
,p_name=>'P83_OFFERSTATUS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68399781798125501)
,p_name=>'P83_LOGOSBRANCHES'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68400147602125502)
,p_name=>'P83_APPROVALDATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Approval Date'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'APPROVAL_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68400516643125503)
,p_name=>'P83_INSCOPE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68402713536125510)
,p_name=>'P83_IH_INVOICED_DAYS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'In House Invoiced Days'
,p_source=>'IH_INVOICE_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68403192649125511)
,p_name=>'P83_IH_INITIAL_AMOUNT'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'In House INITIAL AMOUNT'
,p_source=>'IH_INITIAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68403572033125512)
,p_name=>'P83_AS_INVOICED_DAYS'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'At Site INVOICED DAYS'
,p_source=>'AS_INVOICE_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68403931574125512)
,p_name=>'P83_AS_INITIAL_AMOUNT'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68404308666125513)
,p_name=>'P83_INITIAL_AMOUNT'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Initial Amount'
,p_source=>'INITIAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68404702529125513)
,p_name=>'P83_DISCOUNT_IN_DAYS'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Discount In Days'
,p_source=>'DISCOUNT_IN_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68405108261125514)
,p_name=>'P83_DISCOUNT_IN_AMOUNT'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Discount In Amount'
,p_source=>'DISCOUNT_IN_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68405572825125514)
,p_name=>'P83_FINAL_AMOUNT'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68405954976125514)
,p_name=>'P83_VAT_VALUE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68406379651125515)
,p_name=>'P83_USD_VALUE_1'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68406740839125516)
,p_name=>'P83_LL_VALUE'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Amount incl. VAT (L.L)'
,p_source=>'LL_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_column=>3
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68407116744125516)
,p_name=>'P83_WARRANTY_IN_MONTH'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Warranty In Month'
,p_source=>'WARRANTY_IN_MONTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68407558939125516)
,p_name=>'P83_VALUE_IN_MAINTENANCE'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Value In Maintenance'
,p_source=>'VALUE_IN_MAINTENANCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68407956518125517)
,p_name=>'P83_OTHER_EXPENSES_ON_CLIENT'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Other Expenses On Client'
,p_source=>'OTHER_EXPENSES_ON_CLIENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68408338859125517)
,p_name=>'P83_PERDIUM_1'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Perdium'
,p_source=>'PERDIUM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68408713547125518)
,p_name=>'P83_TICKET_VALUE_1'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ticket Value'
,p_source=>'TICKET_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68409182129125518)
,p_name=>'P83_HOTEL_RATE_1'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Hotel Rate'
,p_source=>'HOTEL_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68409555723125519)
,p_name=>'P83_CAR_RENTAL_PER_DAY_1'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Car Rental Per Day'
,p_source=>'CAR_RENTAL_PER_DAY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68409976443125519)
,p_name=>'P83_INTERNATIONAL_1'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'International'
,p_source=>'INTERNATIONAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68410323914125520)
,p_name=>'P83_DAYS_PER_TICKET_1'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Days Per Ticket'
,p_source=>'DAYS_PER_TICKET'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68410751086125520)
,p_name=>'P83_PAYMENT_TERM'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68411155215125522)
,p_name=>'P83_REMARKS'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68411527233125523)
,p_name=>'P83_SIGNED_BY'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Logos Signature'
,p_source=>'SIGNED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>1000
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
 p_id=>wwv_flow_api.id(68411965962125523)
,p_name=>'P83_SIGNATURE_DATE'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68412398741125524)
,p_name=>'P83_CLIENT_SIGNATURE'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Client Signature'
,p_source=>'CLIENT_SIGNATURE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>200
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
 p_id=>wwv_flow_api.id(68412786761125525)
,p_name=>'P83_CLIENT_SIGNATURE_DATE'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68413475532125526)
,p_name=>'P83_PRICING_DATE_1'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(298272482308265522)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date Raised'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'PRICING_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68413810284125527)
,p_name=>'P83_EXPECTED_DELIVERY_DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(298272482308265522)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68414269117125527)
,p_name=>'P83_REF_PM'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(298272482308265522)
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
,p_field_template=>wwv_flow_api.id(20906133438019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68414661628125528)
,p_name=>'P83_EXPECTED_DEL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(298272482308265522)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expected delivery <br>Number of Days'
,p_source=>'EXPECTED_DELIVERY_NUM_OF_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68415039195125529)
,p_name=>'P83_REFERENCE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(298272482308265522)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68415478391125529)
,p_name=>'P83_INHOUSE_RATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(298272482308265522)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68415895376125531)
,p_name=>'P83_ONSITE_RATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(298272482308265522)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72608603773718801)
,p_name=>'P83_INVOICED_DAYS'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Invoiced days'
,p_source=>'INVOICED_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(221853845330951401)
,p_name=>'P83_IS_INVOICED'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Is Invoiced'
,p_source=>'IS_INVOICED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:;Y'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(881286794207881718)
,p_name=>'P83_INHOUSE_O_RATE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(298272482308265522)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Off hours Inhouse Rate'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'INHOUSE_O_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(881286810253881719)
,p_name=>'P83_ONSITE_O_RATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(298272482308265522)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Off hours Onsite Rate'
,p_format_mask=>'999G999G999G999G990D00'
,p_source=>'ONSITE_O_RATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(881286901500881720)
,p_name=>'P83_PAYMENT_METHOD'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Payment Method'
,p_source=>'PAYMENT_METHOD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Cash;CASH,Money transfer;MONEY_TRANSFER'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(881287061605881721)
,p_name=>'P83_WORK_TO_BE_CONDUCTED'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(297232572867439487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Work To BE Conducted'
,p_source=>'WORK_TO_BE_CONDUCTED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_cMaxlength=>100
,p_cHeight=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1374091358256945219)
,p_name=>'P83_COMMENTS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(84100685024967224)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Comments'
,p_source=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(68416354943125532)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P83_START_DATE <= :P83_END_DATE THEN',
'RETURN TRUE;',
'ELSE RETURN FALSE ;',
'END IF;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'ERROR; INVALID DATE'
,p_always_execute=>'N'
,p_validation_condition=>'1=0'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(68394937613125494)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(68416790133125533)
,p_validation_name=>'New_1'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if  :P83_END_DATE >= :P83_START_DATE THEN',
'RETURN TRUE;',
'ELSE RETURN FALSE ;',
'END IF;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'ERROR; INVALID DATE'
,p_always_execute=>'N'
,p_validation_condition=>'1=0'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(68395351344125495)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68417077520125533)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from LGS_CONTRACTS'
,p_attribute_02=>'LGS_CONTRACTS'
,p_attribute_03=>'P83_ID'
,p_attribute_04=>'ID'
,p_process_error_message=>'Unable to fetch row.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68417415082125534)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of LGS_CONTRACTS'
,p_attribute_02=>'LGS_CONTRACTS'
,p_attribute_03=>'P83_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'Unable to process row of table LGS_CONTRACTS.'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68417862804125535)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_api.id(68393330824125491)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68418270295125536)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create_projects'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'transfer_data.insert_projects(:P83_DSP_CODE);',
'END;'))
,p_process_when_button_id=>wwv_flow_api.id(68392928745125491)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68418615618125536)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Newupdate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'UPDATE_PIP_CONT',
'( :P83_ID  ,',
':P83_DSP_CODE	, ',
':P83_COMPANY_CODE	,',
' to_date(:P83_START_DATE,''dd/MM/yyyy''),',
' to_date(:P83_END_DATE,''dd/MM/yyyy''),',
':P83_USD_VALUE_1, ',
' null,',
':P83_CONTRACT_TYPE_ID,	',
' :P83_CONTRACT_STAGE_ID,',
' null,',
' to_date(:P83_PRICING_DATE_1,''dd/MM/yyyy'')	,',
':P83_PERDIUM1	,',
':P83_DAYS_PER_TICKET,',
':P83_TICKET_VALUE	,',
':P83_HOTEL_RATE_1	,',
':P83_CAR_RENTAL_PER_DAY	,',
' null,',
':P83_WHO_CREATED,',
':P83_ACCOUNTMANAGER		,',
' :P83_PARENTCONTRACT	,',
':P83_PROJECTNAME	,',
':P83_REF_PM	,',
' null,',
':P83_INHOUSE_RATE	,',
':P83_ONSITE_RATE	,',
':P83_INHOUSE_O_RATE,',
' :P83_ONSITE_O_RATE,',
'  :P83_INSCOPE,',
':P83_INVOICED_DAYS	,',
':P83_INITIAL_AMOUNT	,',
':P83_DISCOUNT_IN_DAYS,',
':P83_DISCOUNT_IN_AMOUNT	,',
':P83_VAT_VALUE,',
':P83_FINAL_AMOUNT, ',
' to_date(:P83_EXPECTED_DELIVERY_DATE,''dd/MM/yyyy''),',
':P83_WARRANTY_IN_MONTH,',
':P83_VALUE_IN_MAINTENANCE	,',
' to_date(:P83_SIGNATURE_DATE,''dd/MM/yyyy''),',
' :P83_SIGNED_BY,	',
' :P83_PAYMENT_TERM,',
' :P83_PAYMENT_METHOD,',
':P83_REMARKS	,',
':P83_WORK_TO_BE_CONDUCTED,',
' v(''P83_OTHER_EXPENSES_ON_CLIENT'')	,',
' null		,',
':P83_IH_INVOICED_DAYS	,',
':P83_AS_INVOICED_DAYS	,',
':P83_IH_INITIAL_AMOUNT,',
' :P83_AS_INITIAL_AMOUNT	,',
' :P83_INTERNALCLLASSIFICATION,',
'to_date(:P83_APPROVALDATE,''dd/MM/yyyy''),',
':P83_LOGOSBRANCHES,',
'null,',
' null,',
' :P83_DESCRIPTION , ',
':P83_REFERENCE ,',
':P83_CLIENT_SIGNATURE , 	',
' to_date(:P83_CLIENT_SIGNATURE_DATE,''dd/MM/yyyy''),',
':P83_EXPECTED_DEL,   ',
' :P83_LL_VALUE  ,',
' null ,',
' null,',
':P83_APPLICENSE,',
':P83_ORACLELICENSE,',
':P83_COMMENTS);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(68392111062125490)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(221813301910557302)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'isinvoiced'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' DECLARE',
' ',
' TO_EMAIL_V VARCHAR2(200);',
' l_body      CLOB;',
' ',
'    ind         NUMBER;',
'    FROM_EMAIL_V VARCHAR2(100);',
'  ',
'    c1_id NUMBER ;',
'   EMP_CODE_V VARCHAR2(200);',
'  ',
'',
'    c1_INT_CODE VARCHAR2(200) ;',
'    c1_MODULE VARCHAR2(200)  ;',
'',
'Cursor c1_prj is ',
'  select id,INT_CODE, MODULE ',
'  from lgs_projects ',
'  where CONTRACT_ID = :P83_ID;',
'       ',
' ',
' ',
'BEGIN',
'',
'ind := 1;',
'',
'OPEN c1_prj; ',
'',
'  LOOP ',
'   FETCH c1_prj INTO c1_id, c1_INT_CODE, c1_MODULE; ',
'',
'     EXIT WHEN c1_prj%notfound; ',
'     ',
'      UPDATE  LGS_PROJECTS SET',
'      IS_INVOICED_FLG = ''Y'' ',
'      WHERE ID = c1_id;',
'',
'   END LOOP; ',
'   CLOSE c1_prj; ',
'   ',
'     ',
'      UPDATE  LGS_CONTRACTS SET',
'      IS_INVOICED= ''Y''',
'      WHERE ID = :P83_ID;',
'',
' /* SELECT EMP_EMAIL INTO FROM_EMAIL_V FROM PRJ_EMPLOYEE_SALARY WHERE UPPER(EMP_CODE) = UPPER(EMP_CODE_V );',
' ',
'  SELECT EMP_EMAIL into  TO_EMAIL_V',
'        FROM PRJ_EMPLOYEE_SALARY',
'        WHERE IS_ADMIN = ''Y'';',
'  ',
'         l_body := ''Project Invoice Issuing Email.''||utl_tcp.crlf||utl_tcp.crlf;',
'         l_body := l_body || ''Contract Integration Code: '' || DSP_CODE ||utl_tcp.crlf||utl_tcp.crlf;',
'         ',
'',
'        ',
'         l_body := l_body || ''Module:#'' || ind ||utl_tcp.crlf;',
'        l_body := l_body || ''Name: '' || P20_MODULES || '' ........... '' || ''INT_CODE: '' || .l, || utl_tcp.crlf||utl_tcp.crlf; ',
'        ind := ind + 1;',
'    ',
'        l_body := l_body ||''Sincerely,''||utl_tcp.crlf;',
'         l_body := l_body ||''The Application Express Dev Team''||utl_tcp.crlf;',
'        apex_mail.send(',
'                         p_to  =>  ''tareif.kh@gmail.com''   , -----TO_EMAIL_V,   -- change to your email ad//dress',
'                          p_from =>   ''tareif.kh@gmail.com''   ,----- FROM_EMAIL_V, -- change to a real senders email address',
'                          p_cc => ''tareif.kh@gmail.com''   ,',
'                          p_body     => l_body,',
'                         p_subj => ''Project - Notification'');',
'                         APEX_MAIL.PUSH_QUEUE  ;',
'                 */  ',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(221813208372557301)
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
