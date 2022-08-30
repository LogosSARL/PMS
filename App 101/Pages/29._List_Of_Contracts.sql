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

prompt --application/pages/delete_00029
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>29);
end;
/
prompt --application/pages/page_00029
begin
wwv_flow_api.create_page(
 p_id=>29
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'List Of Contracts'
,p_page_mode=>'NORMAL'
,p_step_title=>'List Of Contracts'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'List Of Contracts'
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
,p_last_upd_yyyymmddhh24miss=>'20150417121106'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5202723667976985)
,p_name=>'List of Contracts'
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 	project_pck.get_contract_desc (c.id) Contract_desc',
'	,transfer_data.get_top_level_module_desc(p.module) MODULE',
'	,project_pck.get_work_type_desc(ppt.wrktyp_id) Work_Type',
'	,c.DSP_CODE Contract_Integration',
'	,p.int_code Project_Integration',
'	,c.id contract_id',
'	,PROJECT_PCK.GET_PROJECT_DESC(p.ID) Project_Desc',
'        ,p.id Project_id',
'	,ppt.id TaskId',
'from LGS_CONTRACTS c, lgs_projects p, prj_projectwork_types ppt',
'where 	c.id = p.contract_id',
'and   	project_pck.get_if_contract_disp (c.id, ''&USER.'') = 1',
'and 	ppt.proj_id = p.id',
'and  project_pck.get_if_prj_worktype_disp(ppt.id, 0) = 1'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1:2:3'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5203014030976992)
,p_query_column_id=>1
,p_column_alias=>'CONTRACT_DESC'
,p_column_display_sequence=>1
,p_column_heading=>'CONTRACT_DESC'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5203215621976994)
,p_query_column_id=>2
,p_column_alias=>'MODULE'
,p_column_display_sequence=>2
,p_column_heading=>'MODULE'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5206125922047628)
,p_query_column_id=>3
,p_column_alias=>'WORK_TYPE'
,p_column_display_sequence=>3
,p_column_heading=>'Work Type'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5203325514976994)
,p_query_column_id=>4
,p_column_alias=>'CONTRACT_INTEGRATION'
,p_column_display_sequence=>4
,p_column_heading=>'CONTRACT_INTEGRATION'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5203427393976994)
,p_query_column_id=>5
,p_column_alias=>'PROJECT_INTEGRATION'
,p_column_display_sequence=>5
,p_column_heading=>'PROJECT_INTEGRATION'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5203519562976994)
,p_query_column_id=>6
,p_column_alias=>'CONTRACT_ID'
,p_column_display_sequence=>6
,p_column_heading=>'CONTRACT_ID'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5203114008976994)
,p_query_column_id=>7
,p_column_alias=>'PROJECT_DESC'
,p_column_display_sequence=>7
,p_column_heading=>'PROJECT_DESC'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5204121862003960)
,p_query_column_id=>8
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>8
,p_column_heading=>'Project Id'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5206204592047628)
,p_query_column_id=>9
,p_column_alias=>'TASKID'
,p_column_display_sequence=>9
,p_column_heading=>'Taskid'
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
