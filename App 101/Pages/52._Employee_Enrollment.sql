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
--     PAGE: 52
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00052
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>52);
end;
/
prompt --application/pages/page_00052
begin
wwv_flow_imp_page.create_page(
 p_id=>52
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Employee Enrollment'
,p_step_title=>'Employee Enrollment'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20170418133346'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(182543548801767133)
,p_name=>'New'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select es.emp_name, ',
'sum(ed.no_of_hours/project_param.get_hours_per_day) InHouse, ',
'sum(on_site_days/project_param.get_hours_per_day) OnSite,',
'sum(ed.no_of_hours/project_param.get_hours_per_day) ',
'+ sum(on_site_days/project_param.get_hours_per_day) Total,',
'sum((project_pck.get_emp_salary_to(ed.employee, ed.from_date)/project_param.get_months_per_day)*',
'(ed.no_of_hours+nvl(ed.on_site_days,0)*project_param.get_on_site_factor)/project_param.get_hours_per_day) Sal',
'from    PRJ_EMPLOYEE_SALARY es, prj_enrolled_dets ed',
'where es.emp_code = ed.employee',
'and   ed.PROJECT_WORKTYPE_ID in (select id from prj_projectwork_types',
'                               where proj_id = :P52_PROJECT_ID)',
'group by es.emp_name'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(182543694471767134)
,p_query_column_id=>1
,p_column_alias=>'EMP_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Employee Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(182543786462767135)
,p_query_column_id=>2
,p_column_alias=>'INHOUSE'
,p_column_display_sequence=>2
,p_column_heading=>'Inhouse'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(182543876207767136)
,p_query_column_id=>3
,p_column_alias=>'ONSITE'
,p_column_display_sequence=>3
,p_column_heading=>'Onsite'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(182543923905767137)
,p_query_column_id=>4
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>4
,p_column_heading=>'Total'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(182544040496767138)
,p_query_column_id=>5
,p_column_alias=>'SAL'
,p_column_display_sequence=>5
,p_column_heading=>'Salary'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'P52_USER_ROLE'
,p_display_when_condition2=>'1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182544153595767139)
,p_name=>'P52_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(182543548801767133)
,p_item_default=>'4205'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182544260480767140)
,p_name=>'P52_USER_ROLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(182543548801767133)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
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
