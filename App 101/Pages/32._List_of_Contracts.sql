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
--   Date and Time:   09:32 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00032
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>32);
end;
/
prompt --application/pages/page_00032
begin
wwv_flow_api.create_page(
 p_id=>32
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'List of Contracts'
,p_page_mode=>'NORMAL'
,p_step_title=>'List of Contracts'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'List of Contracts'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160616141157'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2804980100254133)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20902927143019133)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(2808164543254162)
,p_name=>'List of Contracts'
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select "ID", ',
'"DSP_CODE",',
'"COMPANY_CODE",',
'"FINALIZED",',
'project_pck.get_contract_desc (id) Contract_desc,',
'lgs_get_contract_first_emp(id) PM,',
'get_contract_last_updated (id) Last_Updated,',
'project_pck.get_project_days(ID,''e'') Estimate',
'from "#OWNER#"."LGS_CONTRACTS" ',
'order by dsp_code',
') where (',
' instr(upper("DSP_CODE"),upper(nvl(:P32_REPORT_SEARCH,"DSP_CODE"))) > 0  or',
' instr(upper("COMPANY_CODE"),upper(nvl(:P32_REPORT_SEARCH,"COMPANY_CODE"))) > 0  or',
' instr(upper("FINALIZED"),upper(nvl(:P32_REPORT_SEARCH,"FINALIZED"))) > 0  or',
' instr(upper("CONTRACT_DESC"),upper(nvl(:P32_REPORT_SEARCH,"CONTRACT_DESC"))) > 0  or',
' instr(upper("PM"),upper(nvl(:P32_REPORT_SEARCH,"PM"))) > 0 ',
')',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_item=>'P32_ROWS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2808845443254172)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2809106147254175)
,p_query_column_id=>2
,p_column_alias=>'DSP_CODE'
,p_column_display_sequence=>2
,p_column_heading=>'Dsp Code'
,p_column_hit_highlight=>'&P32_REPORT_SEARCH.'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2809572642254176)
,p_query_column_id=>3
,p_column_alias=>'COMPANY_CODE'
,p_column_display_sequence=>3
,p_column_heading=>'Company Code'
,p_column_hit_highlight=>'&P32_REPORT_SEARCH.'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2809924236254176)
,p_query_column_id=>4
,p_column_alias=>'FINALIZED'
,p_column_display_sequence=>4
,p_column_heading=>'Finalized'
,p_column_hit_highlight=>'&P32_REPORT_SEARCH.'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2810304780254176)
,p_query_column_id=>5
,p_column_alias=>'CONTRACT_DESC'
,p_column_display_sequence=>5
,p_column_heading=>'Contract Desc'
,p_column_hit_highlight=>'&P32_REPORT_SEARCH.'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2810761918254177)
,p_query_column_id=>6
,p_column_alias=>'PM'
,p_column_display_sequence=>6
,p_column_heading=>'Pm'
,p_column_hit_highlight=>'&P32_REPORT_SEARCH.'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2811181139254177)
,p_query_column_id=>7
,p_column_alias=>'LAST_UPDATED'
,p_column_display_sequence=>7
,p_column_heading=>'Last Updated'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2815386672281901)
,p_query_column_id=>8
,p_column_alias=>'ESTIMATE'
,p_column_display_sequence=>8
,p_column_heading=>'Estimate'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2806285079254145)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(2804980100254133)
,p_button_name=>'GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2806646285254148)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(2804980100254133)
,p_button_name=>'RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2807826975254157)
,p_branch_action=>'f?p=&APP_ID.:32:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2805496782254139)
,p_name=>'P32_REPORT_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2804980100254133)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_colspan=>3
,p_grid_label_column_span=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2805859956254142)
,p_name=>'P32_ROWS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(2804980100254133)
,p_item_default=>'15'
,p_prompt=>'Display'
,p_source=>'15'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P32_Report Row Per Page'
,p_lov=>'.'||wwv_flow_api.id(2800646848254123)||'.'
,p_cSize=>30
,p_cMaxlength=>2000
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2807027769254149)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GO,P32_REPORT_SEARCH,RESET'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2807453355254156)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Reset report search'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P32_REPORT_SEARCH,P32_ROWS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2806646285254148)
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
