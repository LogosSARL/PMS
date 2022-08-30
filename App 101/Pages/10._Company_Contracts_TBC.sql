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

prompt --application/pages/delete_00010
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>10);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Company Contracts TBC'
,p_page_mode=>'NORMAL'
,p_step_title=>'Company Contracts TBC'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20170516163739'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(15609516954676664)
,p_name=>'Company Contracts'
,p_template=>wwv_flow_api.id(20903138185019134)
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
'"COMPANY_CODE",',
'"CUSTOMER_CODE_CSS",',
'"CUSTOMER_NAME_CSS",',
'"MIN_DAY",',
'"CREATE_CONTRACT",',
':APP_USER CREATED',
'from "#OWNER#"."PRJ_COMPANY_CONTRACTS"',
'where (company_code in (select code from prj_companies ',
'                       where upper(e_name) like ''%''||upper(:P10_SEARCH)||''%'')',
'OR (upper(customer_code_css) like ''%''||upper(:P10_SEARCH)||''%''',
'or',
'upper(customer_name_css) like ''%''||upper(:P10_SEARCH)||''%'')',
')',
'AND to_char(min_day,''dd-mm-yyyy'') like ''%''||:P10_DAY||''%''',
'order by ID desc'))
,p_source_type=>'NATIVE_TABFORM'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>50000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Excel'
,p_prn_output=>'N'
,p_sort_null=>'F'
,p_query_asc_image_attr=>'width="13" height="12" alt=""'
,p_query_desc_image_attr=>'width="13" height="12" alt=""'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15609809754676667)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_pk_col_source_type=>'T'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_COMPANY_CONTRACTS'
,p_ref_column_name=>'ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15609892639676669)
,p_query_column_id=>2
,p_column_alias=>'ID_DISPLAY'
,p_column_display_sequence=>2
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15610001066676669)
,p_query_column_id=>3
,p_column_alias=>'COMPANY_CODE'
,p_column_display_sequence=>4
,p_column_heading=>'Company'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'POPUPKEY'
,p_named_lov=>wwv_flow_api.id(15612817231694462)
,p_lov_show_nulls=>'YES'
,p_column_width=>50
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_COMPANY_CONTRACTS'
,p_ref_column_name=>'COMPANY_CODE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15610114788676670)
,p_query_column_id=>4
,p_column_alias=>'CUSTOMER_CODE_CSS'
,p_column_display_sequence=>3
,p_column_heading=>'Customer Code Css'
,p_use_as_row_header=>'N'
,p_display_as=>'TEXT'
,p_column_width=>16
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_COMPANY_CONTRACTS'
,p_ref_column_name=>'CUSTOMER_CODE_CSS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15610210654676672)
,p_query_column_id=>5
,p_column_alias=>'CUSTOMER_NAME_CSS'
,p_column_display_sequence=>5
,p_column_heading=>'Customer Name Css'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT'
,p_column_width=>60
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_COMPANY_CONTRACTS'
,p_ref_column_name=>'CUSTOMER_NAME_CSS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15705116825893549)
,p_query_column_id=>6
,p_column_alias=>'MIN_DAY'
,p_column_display_sequence=>6
,p_column_heading=>'Min Day'
,p_use_as_row_header=>'N'
,p_column_format=>'dd-mm-yyyy'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_COMPANY_CONTRACTS'
,p_ref_column_name=>'MIN_DAY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15774893482117296)
,p_query_column_id=>7
,p_column_alias=>'CREATE_CONTRACT'
,p_column_display_sequence=>7
,p_column_heading=>'Create Contract'
,p_use_as_row_header=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(20935140090118790)
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_COMPANY_CONTRACTS'
,p_ref_column_name=>'CREATE_CONTRACT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(51971483189930716)
,p_query_column_id=>8
,p_column_alias=>'CREATED'
,p_column_display_sequence=>8
,p_use_as_row_header=>'N'
,p_display_as=>'DISPLAY_AND_SAVE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'PRJ_COMPANY_CONTRACTS'
,p_ref_column_name=>'WHO_UPDATED'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15610405470676678)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(15609516954676664)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15610308086676678)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(15609516954676664)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(15611102976676683)
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15613594683085287)
,p_name=>'P10_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(15609516954676664)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15707390159990920)
,p_name=>'P10_DAY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(15609516954676664)
,p_prompt=>'Date or Year'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(51971528580930717)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(15609516954676664)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UpdateCompanyContracts'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'update PRJ_COMPANY_CONTRACTS',
'set COMPANY_CODE = :COMPANY_CODE,',
'    CUSTOMER_CODE_CSS = :CUSTOMER_CODE_CSS,',
'    CUSTOMER_NAME_CSS = :CUSTOMER_NAME_CSS,',
'    MIN_DAY = :MIN_DAY,',
'    CREATE_CONTRACT = :CREATE_CONTRACT,',
'    who_updated = :created',
'where  ID = :ID;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(15610405470676678)
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
