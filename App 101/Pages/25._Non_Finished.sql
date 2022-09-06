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
--     PAGE: 25
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00025
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>25);
end;
/
prompt --application/pages/page_00025
begin
wwv_flow_imp_page.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Non Finished'
,p_step_title=>'Non Finished'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'03'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20120727205128'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13053079749205422)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902927143019133)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13054660933205506)
,p_name=>'Report 1'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select project_pck.get_contract_desc(c.id) contract,p.l_description project,wt.e_name Work_type ,',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) Estimated,',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Enrollment,',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) -',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Net,',
'pd.scale , nvl(no_of_days,0)+nvl(on_site_days,0) Est, mm.e_name module_name',
'from prj_projectwork_types ppt, prj_work_types wt, prj_modules m, lgs_projects p, lgs_contracts c, prj_estimated_dets pd, prj_modules mm',
'where  ppt.wrktyp_id  =wt.id',
'and  m.code   = project_pck.get_project_module(ppt.proj_id)',
'and      ppt.proj_id = p.id',
'and      p.contract_id = c.id',
'and      pd.PROJECT_WORKTYPE_ID = ppt.id',
'and      mm.code = pd.module',
'group by project_pck.get_contract_desc(c.id) ,p.l_description , wt.e_name, pd.scale , nvl(no_of_days,0)+nvl(on_site_days,0), mm.e_name',
'having sum(project_pck.get_project_work_estimate_num(ppt.id)) +',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) <> 0',
'and',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) -',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) >0)',
'where (',
' instr(upper("PROJECT"),upper(nvl(:P25_REPORT_SEARCH,"PROJECT"))) > 0  or',
' instr(upper("WORK_TYPE"),upper(nvl(:P25_REPORT_SEARCH,"WORK_TYPE"))) > 0 ',
')',
''))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1:2:3'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_item=>'P25_ROWS'
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
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13055866478261867)
,p_query_column_id=>1
,p_column_alias=>'CONTRACT'
,p_column_display_sequence=>1
,p_column_heading=>'Contract'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13054963206205517)
,p_query_column_id=>2
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>2
,p_column_heading=>'PROJECT'
,p_column_hit_highlight=>'&P25_REPORT_SEARCH.'
,p_default_sort_column_sequence=>2
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13055069622205524)
,p_query_column_id=>3
,p_column_alias=>'WORK_TYPE'
,p_column_display_sequence=>3
,p_column_heading=>'WORK_TYPE'
,p_column_hit_highlight=>'&P25_REPORT_SEARCH.'
,p_default_sort_column_sequence=>3
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13055186723205524)
,p_query_column_id=>4
,p_column_alias=>'ESTIMATED'
,p_column_display_sequence=>4
,p_column_heading=>'ESTIMATED'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13055269526205524)
,p_query_column_id=>5
,p_column_alias=>'ENROLLMENT'
,p_column_display_sequence=>5
,p_column_heading=>'ENROLLMENT'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13055373157205524)
,p_query_column_id=>6
,p_column_alias=>'NET'
,p_column_display_sequence=>6
,p_column_heading=>'NET'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13055472025205524)
,p_query_column_id=>7
,p_column_alias=>'SCALE'
,p_column_display_sequence=>7
,p_column_heading=>'SCALE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13055571871205524)
,p_query_column_id=>8
,p_column_alias=>'EST'
,p_column_display_sequence=>9
,p_column_heading=>'EST'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13056058691297463)
,p_query_column_id=>9
,p_column_alias=>'MODULE_NAME'
,p_column_display_sequence=>8
,p_column_heading=>'Module Name'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13053785423205477)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(13053079749205422)
,p_button_name=>'P25_GO'
,p_button_static_id=>'P25_GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_alignment=>'LEFT'
,p_request_source=>'GO'
,p_request_source_type=>'STATIC'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_grid_row_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13053964388205478)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(13053079749205422)
,p_button_name=>'P25_RESET'
,p_button_static_id=>'P25_RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Reset'
,p_button_alignment=>'LEFT'
,p_request_source=>'RESET'
,p_request_source_type=>'STATIC'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_grid_row_span=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(13054585340205502)
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13053367735205449)
,p_name=>'P25_REPORT_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13053079749205422)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13053573466205472)
,p_name=>'P25_ROWS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13053079749205422)
,p_item_default=>'15'
,p_prompt=>'Display'
,p_source=>'15'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P25_Report Row Per Page'
,p_lov=>'.'||wwv_flow_imp.id(13050864429205389)||'.'
,p_cSize=>30
,p_cMaxlength=>2000
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13054177760205485)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_error_message=>'Unable to reset pagination.'
,p_process_when=>'GO,P25_REPORT_SEARCH,RESET'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13054381160205499)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Reset report search'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P25_REPORT_SEARCH,P25_ROWS'
,p_process_error_message=>'Unable to clear cache.'
,p_process_when_button_id=>wwv_flow_imp.id(13053964388205478)
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
