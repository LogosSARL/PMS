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
--     PAGE: 40
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00040
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>40);
end;
/
prompt --application/pages/page_00040
begin
wwv_flow_imp_page.create_page(
 p_id=>40
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Contracts'
,p_step_title=>'Contracts'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''table#report_contracts tr'').each(function(){',
'    var s = $(this).children().last().html();',
'	   $(this).find(''td'').each(function(){',
'			$(this).css("background-color",s);',
'           ',
'       });',
'   // alert(s);',
'   if (!$(this).find(''td'').hasClass(''pagination''))',
'        $(this).children().last().remove();',
'});',
'',
'',
'$(''table#report_projects tr'').each(function(){',
'    var s = $(this).children().last().html();',
'	   $(this).find(''td'').each(function(){',
'			$(this).css("background-color",s);',
'           ',
'       });',
'	 if (!$(this).find(''td'').hasClass(''pagination''))',
'	    $(this).children().last().remove();',
'});'))
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'03'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20220831092328'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2060014633201777)
,p_name=>'Employee Enrollment &P40_CURRENT_PROJECT_DESC.'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_display_column=>2
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
'                               where proj_id = :P40_CURRENT_PROJECT)',
'group by es.emp_name'))
,p_display_when_condition=>'P40_SHOW_WHAT'
,p_display_when_cond2=>'1'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Excel'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2060415049201779)
,p_query_column_id=>1
,p_column_alias=>'EMP_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Staff Name'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2060822174201780)
,p_query_column_id=>2
,p_column_alias=>'INHOUSE'
,p_column_display_sequence=>2
,p_column_heading=>'Office'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2061206703201780)
,p_query_column_id=>3
,p_column_alias=>'ONSITE'
,p_column_display_sequence=>3
,p_column_heading=>'OnSite'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2061654923201781)
,p_query_column_id=>4
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>4
,p_column_heading=>'Total'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2062022169201781)
,p_query_column_id=>5
,p_column_alias=>'SAL'
,p_column_display_sequence=>5
,p_column_heading=>'Sal'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'F114_USER_ROLE'
,p_display_when_condition2=>'1'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2062459578201782)
,p_name=>'Task Enrollment in &P40_CURRENT_PROJECT_DESC.'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_display_column=>2
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ppt.id, ppt.id task_Details,ppt.grade, ppt.estimated_days, ppt.enrolled_days, ppt.description, ppt.wrktyp_id, ppt.proj_id, ppt.qty, ',
'ppt.seq, ppt.id Est, ppt.id Work,',
'project_pck.get_project_work_estimate_num(ppt.id) Estimated,',
'project_pck.get_project_work_remaining_num(ppt.id) Remaining,',
'project_pck.get_task_enrollment(ppt.id,''0'',''d'') Enrollment,',
'ppt.id Exp,',
'project_pck.get_project_task_expences(ppt.id) Expences,',
'project_pck.get_contract_id(ppt.proj_id) Contract,',
'project_pck.get_project_module(ppt.proj_id) Module,',
'PROJECT_PCK.get_project_desc(ppt.PROJ_ID) ||'' ''||',
'project_pck.get_work_type_desc(ppt.wrktyp_id) Project_description',
'from prj_projectwork_types ppt',
'where ppt.proj_id = :P40_current_project   ',
'/*and ( ppt.id in (select project_worktype_id from prj_estimated_dets)   ',
'      or ',
'      ppt.id in (select project_worktype_id from prj_enrolled_dets))*/',
'and  project_pck.get_if_prj_worktype_disp(ppt.id, :P40_ZERO) = 1',
'and ppt.seq not in (80,50,55,60,70,200,100,90)',
'order by ppt.seq',
''))
,p_display_when_condition=>'P40_SHOW_WHAT'
,p_display_when_cond2=>'2'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Excel'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2062840928201783)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2063205998201784)
,p_query_column_id=>2
,p_column_alias=>'TASK_DETAILS'
,p_column_display_sequence=>3
,p_column_heading=>'TASK_DETAILS'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2063638762201784)
,p_query_column_id=>3
,p_column_alias=>'GRADE'
,p_column_display_sequence=>4
,p_column_heading=>'GRADE'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2064093806201785)
,p_query_column_id=>4
,p_column_alias=>'ESTIMATED_DAYS'
,p_column_display_sequence=>5
,p_column_heading=>'ESTIMATED_DAYS'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2064425591201785)
,p_query_column_id=>5
,p_column_alias=>'ENROLLED_DAYS'
,p_column_display_sequence=>6
,p_column_heading=>'ENROLLED_DAYS'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2064887013201786)
,p_query_column_id=>6
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>7
,p_column_heading=>'DESCRIPTION'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2065230412201789)
,p_query_column_id=>7
,p_column_alias=>'WRKTYP_ID'
,p_column_display_sequence=>8
,p_column_heading=>'Work Type'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(15760494688455984)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2065600140201790)
,p_query_column_id=>8
,p_column_alias=>'PROJ_ID'
,p_column_display_sequence=>10
,p_column_heading=>'PROJ_ID'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2066054200201790)
,p_query_column_id=>9
,p_column_alias=>'QTY'
,p_column_display_sequence=>11
,p_column_heading=>'QTY'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2066439413201791)
,p_query_column_id=>10
,p_column_alias=>'SEQ'
,p_column_display_sequence=>2
,p_column_heading=>'Seq'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2066803388201791)
,p_query_column_id=>11
,p_column_alias=>'EST'
,p_column_display_sequence=>13
,p_column_heading=>'Est.'
,p_column_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::P14_PROJECT_WORKTYPE_ID,P14_PROJECT_WORKTYPE_DESC,P14_PARENT_MODULE:#ID#,#PROJECT_DESCRIPTION#,#MODULE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#ws/small_page.gif" alt="Register / View Estimates">'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2067216089201792)
,p_query_column_id=>12
,p_column_alias=>'WORK'
,p_column_display_sequence=>15
,p_column_heading=>'Work'
,p_column_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::P13_PROJECT_WORKTYPE_ID,P13_PROJECT_WORKTYPE_DESC:#ID#,#PROJECT_DESCRIPTION#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil2_16x16.gif" alt="">'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2067642816201796)
,p_query_column_id=>13
,p_column_alias=>'ESTIMATED'
,p_column_display_sequence=>12
,p_column_heading=>'Estimated (Days)'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(432912314211306231)
,p_query_column_id=>14
,p_column_alias=>'REMAINING'
,p_column_display_sequence=>20
,p_column_heading=>'Remaining'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2068014071201796)
,p_query_column_id=>15
,p_column_alias=>'ENROLLMENT'
,p_column_display_sequence=>14
,p_column_heading=>'Enrollment (Days)'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_report_column_width=>5000
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2068440439201797)
,p_query_column_id=>16
,p_column_alias=>'EXP'
,p_column_display_sequence=>16
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2068896646201797)
,p_query_column_id=>17
,p_column_alias=>'EXPENCES'
,p_column_display_sequence=>17
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2069215183201798)
,p_query_column_id=>18
,p_column_alias=>'CONTRACT'
,p_column_display_sequence=>18
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2069643463201801)
,p_query_column_id=>19
,p_column_alias=>'MODULE'
,p_column_display_sequence=>19
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2070056938201802)
,p_query_column_id=>20
,p_column_alias=>'PROJECT_DESCRIPTION'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2071668848201804)
,p_name=>'Staff enrolled in &P40_CONTRACT_DESC.'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_display_column=>2
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select es.emp_name,',
'sum(ed.no_of_hours/project_param.get_hours_per_day) InHouse,',
'sum(on_site_days/project_param.get_hours_per_day) OnSite,',
'sum(ed.no_of_hours/project_param.get_hours_per_day)',
'+ sum(on_site_days/project_param.get_hours_per_day) Total,',
'sum((project_pck.get_emp_salary_to(ed.employee, ed.from_date)/project_param.get_months_per_day)*',
'(ed.no_of_hours+nvl(ed.on_site_days,0)*project_param.get_on_site_factor)/project_param.get_hours_per_day) Sal',
'from    PRJ_EMPLOYEE_SALARY es, prj_enrolled_dets ed',
'where es.emp_code = ed.employee',
'and   ed.PROJECT_WORKTYPE_ID in (select id from prj_projectwork_types',
'                               where proj_id in (select id from lgs_projects where contract_id=:P40_CONTRACT_ID))',
'group by es.emp_name'))
,p_display_when_condition=>'P40_SHOW_WHAT'
,p_display_when_cond2=>'3'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Excel'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2072003091201807)
,p_query_column_id=>1
,p_column_alias=>'EMP_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Staff'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2072492201201807)
,p_query_column_id=>2
,p_column_alias=>'INHOUSE'
,p_column_display_sequence=>2
,p_column_heading=>'In House'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2072817278201808)
,p_query_column_id=>3
,p_column_alias=>'ONSITE'
,p_column_display_sequence=>3
,p_column_heading=>'On Site'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2073256609201808)
,p_query_column_id=>4
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>4
,p_column_heading=>'Total'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2073639967201809)
,p_query_column_id=>5
,p_column_alias=>'SAL'
,p_column_display_sequence=>5
,p_column_heading=>'Sal'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'F114_USER_ROLE'
,p_display_when_condition2=>'1'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2074008040201810)
,p_name=>'Module WorkType of Contract &P40_CONTRACT_DESC.'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_display_column=>2
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select m.e_name module, wt.e_name Work_type, ',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) Estimated,',
'sum(project_pck.get_project_work_remaining_num(ppt.id)) Remaining,',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Enrollment,',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) -',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Net',
'from prj_projectwork_types ppt, prj_work_types wt, prj_modules m',
'where  ppt.wrktyp_id  =wt.id',
'and  m.code   = project_pck.get_project_module(ppt.proj_id)',
'and      ppt.proj_id in (select id from lgs_projects where contract_id = :P40_CONTRACT_ID)',
'group by m.e_name, wt.e_name',
'having sum(project_pck.get_project_work_estimate_num(ppt.id)) +',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) <> 0',
''))
,p_display_when_condition=>'P40_SHOW_WHAT'
,p_display_when_cond2=>'4'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'1'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
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
 p_id=>wwv_flow_imp.id(2074423796201810)
,p_query_column_id=>1
,p_column_alias=>'MODULE'
,p_column_display_sequence=>1
,p_column_heading=>'Module'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2074883027201811)
,p_query_column_id=>2
,p_column_alias=>'WORK_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Work Type'
,p_disable_sort_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2075251626201812)
,p_query_column_id=>3
,p_column_alias=>'ESTIMATED'
,p_column_display_sequence=>3
,p_column_heading=>'Est.'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(432912426498306232)
,p_query_column_id=>4
,p_column_alias=>'REMAINING'
,p_column_display_sequence=>6
,p_column_heading=>'Remaining'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2075689055201812)
,p_query_column_id=>5
,p_column_alias=>'ENROLLMENT'
,p_column_display_sequence=>4
,p_column_heading=>'Enr.'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2076000019201813)
,p_query_column_id=>6
,p_column_alias=>'NET'
,p_column_display_sequence=>5
,p_column_heading=>'Net'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(187335280941183423)
,p_plug_name=>'Search a Contract'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2040999586201677)
,p_name=>'Contracts'
,p_region_name=>'contracts'
,p_parent_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid=>true
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID",'''' as CSS,',
'case when CONTRACT_TYPE_ID = 2 then',
'''<A HREF=F?P=&APP_ID.:145:&SESSION.::NO::P145_FROM_ID:''||ID||''><img src="#APP_IMAGES#renewal-icon-15.jpg" width="30px" height="30px" border="2"></A>''',
'--''f?p='' || :APP_ID || '':145:'' || :APP_SESSION || ''::::P145_FROM_ID:'' ||    ID',
'else null',
'end as Renewal,',
''''' AS CHILD, '''' as proposals,'''' parentcontract ,"APPROVAL_DATE",',
'    CASE WHEN RFP_FILES IS NOT NULL THEN',
'''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || RFP_FILES END AS RFPCONTENT,',
'',
'    CASE WHEN RESPONSE_TO_RFP_FILES  IS NOT NULL THEN',
'''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || RESPONSE_TO_RFP_FILES END AS ResponseCONTENT,',
'"DSP_CODE","REF_TO_PIPELINE","REF_TO_CONTRACT","PARENT_CONTRACT",',
'"COMPANY_CODE","REF_TO_PIPELINE" as pipeline,',
'"FINALIZED","STATUS",',
'case when nvl(status,1) = 1 OR is_invoiced = ''1'' then ''rgba(244, 235, 65,0.3)'' ',
'else ''rgba(66, 244, 72,0.3)'' end as "row_color",',
'project_pck.get_contract_desc (id) Contract_desc,',
'project_pck.get_task_contract_enrollment (id,''0'',''d'') Enr,',
'project_pck.get_contract_estimate(id) Est,',
'project_pck.get_contract_remaining(id) Rem,',
'project_pck.get_contract_estimate(id) - project_pck.get_task_contract_enrollment (id,''0'',''d'') Net,',
'project_pck.get_contract_enrollment(id) EnrUnits,',
'project_pck.get_contract_estimate(id) EstUnits,',
'project_pck.get_contract_remaining(id) RemUnits,',
'lgs_get_contract_first_emp(id) PM,',
'get_contract_last_updated (id) Last_Updated,',
'id StaffEnrol,',
'id ModuleWorkType,',
'id ReCreateContractData,BRANCH_ID, '''' as contractdocument   , ''BLUE'' color',
'from LGS_CONTRACTS lgs ---, lgs_logos_branches ',
'WHERE  ',
'----  need permission',
'project_pck.get_if_contract_disp (id, V(''APP_USER'')) = 1  and  ---- lgs_contracts.BRANCH_ID(+) = lgs_logos_branches.llb_id and ',
'USAGE_TYPE = 2 ',
'and',
'( company_code = :P40_COMPANYNAME OR :P40_COMPANYNAME IS NULL )',
'AND',
'(( (:P40_STATUS = 1 and ( status = 1 or nvl(finalized,''N'')=''N''))',
'  or (:P40_status=5 and (nvl(finalized,''N'')=''Y'' or status = 5)))',
' or :p40_status is null)',
'AND',
'( DSP_CODE  like ''%''||upper(nvl(:P40_INTEGRATIONCODE,''-''))||''%''  or :P40_INTEGRATIONCODE is null)',
'AND (ID = :P40_PCI --- :P40_CONTRACT_ID  ',
'     OR ----:P40_CONTRACT_ID IS NULL)',
':P40_PCI IS NULL )',
'and created_date is not null',
'and NVL(OFFER_STATUS,0) != 1',
'--AND  not exists (select 1 from lgs_projects where contract_id = lgs.ID and nvl(payment_percentage,100) = 100)',
'/*union all',
'select "ID",'''' as CSS,'''' AS CHILD, '''' as proposals,'''' parentcontract ,"APPROVAL_DATE",',
'    CASE WHEN RFP_FILES IS NOT NULL THEN',
'''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || RFP_FILES END AS RFPCONTENT,',
'',
'    CASE WHEN RESPONSE_TO_RFP_FILES  IS NOT NULL THEN',
'''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || RESPONSE_TO_RFP_FILES END AS ResponseCONTENT,',
'"DSP_CODE","REF_TO_PIPELINE","REF_TO_CONTRACT","PARENT_CONTRACT",',
'"COMPANY_CODE","REF_TO_PIPELINE" as pipeline,',
'"FINALIZED","STATUS",',
'project_pck.get_contract_desc (id) Contract_desc,',
'project_pck.get_task_contract_enrollment (id,''0'',''d'') Enr,',
'project_pck.get_contract_estimate(id) Est,',
'project_pck.get_contract_estimate(id) - project_pck.get_task_contract_enrollment (id,''0'',''d'') Net,',
'project_pck.get_contract_enrollment(id) EnrUnits,',
'project_pck.get_contract_estimate(id) EstUnits,',
'lgs_get_contract_first_emp(id) PM,',
'get_contract_last_updated (id) Last_Updated,',
'id StaffEnrol,',
'id ModuleWorkType,',
'id ReCreateContractData,BRANCH_ID, '''' as contractdocument , ''GREEN'' color',
'from LGS_CONTRACTS lgs ---, lgs_logos_branches ',
'WHERE  ',
'----  need permission',
'project_pck.get_if_contract_disp (id, V(''APP_USER'')) = 1  and  ---- lgs_contracts.BRANCH_ID(+) = lgs_logos_branches.llb_id and ',
'USAGE_TYPE = 2 ',
'and',
'( company_code = :P40_COMPANYNAME OR :P40_COMPANYNAME IS NULL )',
'AND',
'(STATUS = :P40_STATUS or :P40_STATUS is null)  ',
'AND',
'( DSP_CODE  like ''%''||upper(:P40_INTEGRATIONCODE)||''%''  or DSP_CODE is null)',
'AND (ID = :P40_PCI --- :P40_CONTRACT_ID  ',
'     OR ----:P40_CONTRACT_ID IS NULL)',
':P40_PCI IS NULL )',
'and created_date is not null',
'and NVL(OFFER_STATUS,0) != 1',
'AND  not exists (select 1 from lgs_projects where contract_id = lgs.ID and nvl(payment_percentage,111) < 100)*/',
'order by start_date,30,1  desc'))
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Excel'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_exp_filename=>'List of Contracts'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2041788950201719)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Edit'
,p_column_link=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.::P83_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif"  border="0">'
,p_derived_column=>'N'
,p_include_in_export=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'ID'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(156453885690521909)
,p_query_column_id=>2
,p_column_alias=>'CSS'
,p_column_display_sequence=>2
,p_column_heading=>'Css'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID,P40_INTEGRATION_FLG:#ID#,1'
,p_column_linktext=>'<img src="#APP_IMAGES#sync.png" width="18px" height="18px" border="0">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(881288420088881735)
,p_query_column_id=>3
,p_column_alias=>'RENEWAL'
,p_column_display_sequence=>3
,p_column_heading=>'Renewal'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2719172050162011)
,p_query_column_id=>4
,p_column_alias=>'CHILD'
,p_column_display_sequence=>18
,p_column_heading=>'Child'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_VIEW,P40_CNTIDD:Show,#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#ws/small_page.gif" alt="">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2041375599201707)
,p_query_column_id=>5
,p_column_alias=>'PROPOSALS'
,p_column_display_sequence=>26
,p_column_heading=>'Proposals'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP:P36_CONTRACTID:#REF_TO_PIPELINE#'
,p_column_linktext=>'PIPELINE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2078435245538703)
,p_query_column_id=>6
,p_column_alias=>'PARENTCONTRACT'
,p_column_display_sequence=>25
,p_column_heading=>'Parentcontract'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID:#PARENTCONTRACT#'
,p_column_linktext=>'Parent Contract'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65980396176483002)
,p_query_column_id=>7
,p_column_alias=>'APPROVAL_DATE'
,p_column_display_sequence=>31
,p_column_heading=>'Approval Date'
,p_use_as_row_header=>'N'
,p_column_format=>'dd/mm/yyyy'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'APPROVAL_DATE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(90139471752650613)
,p_query_column_id=>8
,p_column_alias=>'RFPCONTENT'
,p_column_display_sequence=>7
,p_column_heading=>'RFP '
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<A HREF="#RFPCONTENT#">RFP FILE</A>'
,p_report_column_width=>50
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(90139526680650614)
,p_query_column_id=>9
,p_column_alias=>'RESPONSECONTENT'
,p_column_display_sequence=>8
,p_column_heading=>'Response '
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<A HREF="#RESPONSECONTENT#">RESPONSE FILE</A>'
,p_report_column_width=>50
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2042197653201720)
,p_query_column_id=>10
,p_column_alias=>'DSP_CODE'
,p_column_display_sequence=>4
,p_column_heading=>'Integration Code'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::P40_CONTRACT_ID,P40_CONTRACT_DESC,P40_SELECTED_INT_CODE,P40_CID,P40_INTCODE_SELECTED:#ID#,#CONTRACT_DESC#,#DSP_CODE#,#CHILD#,#ID#'
,p_column_linktext=>'#DSP_CODE#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'DSP_CODE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2078594698538704)
,p_query_column_id=>11
,p_column_alias=>'REF_TO_PIPELINE'
,p_column_display_sequence=>27
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2078677528538705)
,p_query_column_id=>12
,p_column_alias=>'REF_TO_CONTRACT'
,p_column_display_sequence=>28
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2719472408162014)
,p_query_column_id=>13
,p_column_alias=>'PARENT_CONTRACT'
,p_column_display_sequence=>29
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2042544294201720)
,p_query_column_id=>14
,p_column_alias=>'COMPANY_CODE'
,p_column_display_sequence=>5
,p_column_heading=>'CLIENT'
,p_use_as_row_header=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(15612817231694462)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'COMPANY_CODE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2079449203538713)
,p_query_column_id=>15
,p_column_alias=>'PIPELINE'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2042971859201721)
,p_query_column_id=>16
,p_column_alias=>'FINALIZED'
,p_column_display_sequence=>12
,p_column_heading=>'Finalized'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(20935140090118790)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'FINALIZED'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2078366166538702)
,p_query_column_id=>17
,p_column_alias=>'STATUS'
,p_column_display_sequence=>24
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(421625017202942023)
,p_query_column_id=>18
,p_column_alias=>'row_color'
,p_column_display_sequence=>34
,p_column_heading=>'Row color'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2043349104201721)
,p_query_column_id=>19
,p_column_alias=>'CONTRACT_DESC'
,p_column_display_sequence=>6
,p_column_heading=>'Customer'
,p_column_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::P17_SELECTED_CONTRACT_ID:#ID#'
,p_column_linktext=>'#CONTRACT_DESC#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2043730106201722)
,p_query_column_id=>20
,p_column_alias=>'ENR'
,p_column_display_sequence=>19
,p_column_heading=>'Enr'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2044184394201723)
,p_query_column_id=>21
,p_column_alias=>'EST'
,p_column_display_sequence=>16
,p_column_heading=>'Est'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(432912242630306230)
,p_query_column_id=>22
,p_column_alias=>'REM'
,p_column_display_sequence=>17
,p_column_heading=>'Rem'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2044548519201723)
,p_query_column_id=>23
,p_column_alias=>'NET'
,p_column_display_sequence=>20
,p_column_heading=>'Net'
,p_use_as_row_header=>'N'
,p_column_format=>'S999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2044962297201724)
,p_query_column_id=>24
,p_column_alias=>'ENRUNITS'
,p_column_display_sequence=>21
,p_column_heading=>'Enrunits'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'F114_USER_ROLE'
,p_display_when_condition2=>'1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2045310538201728)
,p_query_column_id=>25
,p_column_alias=>'ESTUNITS'
,p_column_display_sequence=>22
,p_column_heading=>'Estunits'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'F114_USER_ROLE'
,p_display_when_condition2=>'1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(432912551606306233)
,p_query_column_id=>26
,p_column_alias=>'REMUNITS'
,p_column_display_sequence=>23
,p_column_heading=>'Remunits'
,p_use_as_row_header=>'N'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'F114_USER_ROLE'
,p_display_when_condition2=>'1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2045769742201728)
,p_query_column_id=>27
,p_column_alias=>'PM'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2046109641201729)
,p_query_column_id=>28
,p_column_alias=>'LAST_UPDATED'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2046502334201729)
,p_query_column_id=>29
,p_column_alias=>'STAFFENROL'
,p_column_display_sequence=>13
,p_column_heading=>'Staff'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::P40_CONTRACT_ID,P40_CONTRACT_DESC,P40_SHOW_WHAT,P40_SELECTED_INT_CODE:#ID#,#CONTRACT_DESC#,3,#DSP_CODE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil2_16x16.gif" alt="Staff Enrollment">'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2046901078201730)
,p_query_column_id=>30
,p_column_alias=>'MODULEWORKTYPE'
,p_column_display_sequence=>14
,p_column_heading=>'Module Work Type'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::P40_CONTRACT_ID,P40_CONTRACT_DESC,P40_SHOW_WHAT,P40_SELECTED_INT_CODE:#ID#,#CONTRACT_DESC#,4,#DSP_CODE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#ed-item.gif" alt="Module/WorkType">'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2047344148201730)
,p_query_column_id=>31
,p_column_alias=>'RECREATECONTRACTDATA'
,p_column_display_sequence=>15
,p_column_heading=>'RePrj'
,p_column_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.::P22_CONTRACT_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="Re-Create Projects">'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(51971976247930721)
,p_query_column_id=>32
,p_column_alias=>'BRANCH_ID'
,p_column_display_sequence=>11
,p_column_heading=>'Branch Id'
,p_use_as_row_header=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(81277486830177530)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(184221641330304843)
,p_query_column_id=>33
,p_column_alias=>'CONTRACTDOCUMENT'
,p_column_display_sequence=>32
,p_column_heading=>'Contract Documents'
,p_column_link=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP:P40_LCDID:#ID#'
,p_column_linktext=>'Contract Documents'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(266785607279337805)
,p_query_column_id=>34
,p_column_alias=>'COLOR'
,p_column_display_sequence=>33
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(262513048602967304)
,p_plug_name=>'h89'
,p_parent_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20902846851019133)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P40_CONTRACT_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2050026183201760)
,p_name=>'Projects of  &P40_CONTRACT_DESC.'
,p_region_name=>'Projects'
,p_parent_plug_id=>wwv_flow_imp.id(262513048602967304)
,p_template=>wwv_flow_imp.id(13004471707590532)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select '''' as link, "ID", '''' as wbs,',
'"L_DESCRIPTION",',
'"DSP_CODE",',
'"END_DATE",',
'"START_DATE",',
'"CONTRACT_ID","APPROVAL_DATE",',
'"INT_CODE",',
'transfer_data.get_top_level_module_desc(module) as "TOP LEVEL MODULE",',
'transfer_data.get_module_desc(module) MODULE,',
'"NEW_IMPLEMENTATION",',
'"MAINTENANCE",',
'"PRICING_DATE",',
'"ACTIVE",STATUS,PAYMENT_PERCENTAGE ||''%'',',
'"SEQ",',
'project_pck.get_project_days(ID,''e'') Estimate,',
'project_pck.get_project_remaining_days(ID,''e'') Remaining,',
'project_pck.get_task_project_enrollment(ID,''0'',''d'') Work,',
'project_pck.get_project_days(ID,''e'') - project_pck.get_task_project_enrollment(ID,''0'',''d'') Expences,',
'---id Exp,',
'---id Emp,',
'---id Get_from_CSS,',
'AMOUNT,',
'PROJECT_PCK.GET_PROJECT_DESC(ID) Project_Desc,',
'case when nvl(status,1) = 1 OR is_invoiced_flg = ''1'' then ''rgba(244, 235, 65,0.3)'' ',
'else ''rgba(66, 244, 72,0.3)'' end as "row_color"',
'from "#OWNER#"."LGS_PROJECTS" ',
'where ',
'contract_id =    :P40_INTCODE_SELECTED   ---:P40_CONTRACT_ID ',
'AND ( (instr(LOWER(transfer_data.get_module_desc(MODULE)),LOWER(:P40_MODULE_SEARCH) )>0 and :P40_MODULE_SEARCH is not null)',
'or :P40_MODULE_SEARCH is  null)',
'                ',
'order by seq',
'  ',
''))
,p_display_when_condition=>'P40_CONTRACT_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(20905651468019153)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Excel'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(271182340123315302)
,p_query_column_id=>1
,p_column_alias=>'LINK'
,p_column_display_sequence=>1
,p_column_heading=>'Link'
,p_column_link=>'f?p=&APP_ID.:126:&SESSION.::&DEBUG.:RP:P126_INV_PROJECT_ID,P126_AMOUNT:#ID#,#AMOUNT#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2050438839201761)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_column_heading=>'Edit'
,p_column_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::P20_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif"  border="0">'
,p_derived_column=>'N'
,p_include_in_export=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'ID'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(318511525020150804)
,p_query_column_id=>3
,p_column_alias=>'WBS'
,p_column_display_sequence=>25
,p_column_heading=>'WBS'
,p_column_link=>'f?p=222:10:&SESSION.::&DEBUG.:RP:P10_PRJ_ID:#ID#'
,p_column_linktext=>'WBS'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2050871722201762)
,p_query_column_id=>4
,p_column_alias=>'L_DESCRIPTION'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'L_DESCRIPTION'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2051278311201762)
,p_query_column_id=>5
,p_column_alias=>'DSP_CODE'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'DSP_CODE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2051629435201763)
,p_query_column_id=>6
,p_column_alias=>'END_DATE'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'END_DATE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2052057503201763)
,p_query_column_id=>7
,p_column_alias=>'START_DATE'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'START_DATE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2052434610201764)
,p_query_column_id=>8
,p_column_alias=>'CONTRACT_ID'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'CONTRACT_ID'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65980403336483003)
,p_query_column_id=>9
,p_column_alias=>'APPROVAL_DATE'
,p_column_display_sequence=>18
,p_column_heading=>'Approval Date'
,p_use_as_row_header=>'N'
,p_column_format=>'dd/mm/yyyy'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'APPROVAL_DATE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2052873569201765)
,p_query_column_id=>10
,p_column_alias=>'INT_CODE'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'INT_CODE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2345080321116501)
,p_query_column_id=>11
,p_column_alias=>'TOP LEVEL MODULE'
,p_column_display_sequence=>10
,p_column_heading=>'Top level module'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2053255018201765)
,p_query_column_id=>12
,p_column_alias=>'MODULE'
,p_column_display_sequence=>11
,p_column_heading=>'Module'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CURRENT_PROJECT,P40_SHOW_WHAT,P40_ZERO,P40_CURRENT_PROJECT_DESC:#ID#,2,0,#PROJECT_DESC#'
,p_column_linktext=>'#MODULE#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'12'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'MODULE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(263158411691005102)
,p_query_column_id=>13
,p_column_alias=>'NEW_IMPLEMENTATION'
,p_column_display_sequence=>21
,p_column_heading=>'New implementation'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(263158545776005103)
,p_query_column_id=>14
,p_column_alias=>'MAINTENANCE'
,p_column_display_sequence=>22
,p_column_heading=>'Maintenance'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2054416451201766)
,p_query_column_id=>15
,p_column_alias=>'PRICING_DATE'
,p_column_display_sequence=>12
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'PRICING_DATE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2054814225201767)
,p_query_column_id=>16
,p_column_alias=>'ACTIVE'
,p_column_display_sequence=>13
,p_column_heading=>'Delete'
,p_column_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.::P21_CONTRACT_ID,P21_PROJECT_ID:#CONTRACT_ID#,#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#ws/small_page.gif" alt="Delete This Line">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'12'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'ACTIVE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(263159350925005111)
,p_query_column_id=>17
,p_column_alias=>'STATUS'
,p_column_display_sequence=>20
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(1974458000386842)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(266568557681915008)
,p_query_column_id=>18
,p_column_alias=>'PAYMENT_PERCENTAGE||''%'''
,p_column_display_sequence=>24
,p_column_heading=>'Payment percentage||&#x27;%&#x27;'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2055266619201767)
,p_query_column_id=>19
,p_column_alias=>'SEQ'
,p_column_display_sequence=>3
,p_column_heading=>'Seq'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'12'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'SEQ'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2055699613201768)
,p_query_column_id=>20
,p_column_alias=>'ESTIMATE'
,p_column_display_sequence=>14
,p_column_heading=>'Est.'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'12'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(432912683457306234)
,p_query_column_id=>21
,p_column_alias=>'REMAINING'
,p_column_display_sequence=>15
,p_column_heading=>'Rem.'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2056097379201768)
,p_query_column_id=>22
,p_column_alias=>'WORK'
,p_column_display_sequence=>16
,p_column_heading=>'Enr.'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'12'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2056404263201768)
,p_query_column_id=>23
,p_column_alias=>'EXPENCES'
,p_column_display_sequence=>17
,p_column_heading=>'Net'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'12'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(271182431937315303)
,p_query_column_id=>24
,p_column_alias=>'AMOUNT'
,p_column_display_sequence=>23
,p_column_heading=>'Amount'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(263158786474005105)
,p_query_column_id=>25
,p_column_alias=>'PROJECT_DESC'
,p_column_display_sequence=>19
,p_column_heading=>'Project desc'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(421625264055942025)
,p_query_column_id=>26
,p_column_alias=>'row_color'
,p_column_display_sequence=>26
,p_column_heading=>'Row color'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2078890365538707)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(2040999586201677)
,p_button_name=>'ShowAll'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Show All'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(262514379558967317)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(262513048602967304)
,p_button_name=>'go'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92535720945833603)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_button_name=>'GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(266567849336915001)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(262513048602967304)
,p_button_name=>'IssueInvoice'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Issue Invoice'
,p_button_alignment=>'LEFT-CENTER'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from lgs_projects where',
'',
' contract_id = :P40_INTCODE_SELECTED',
' AND nvl(IS_INVOICED_FLG,''N'') = ''N''',
' or PAYMENT_PERCENTAGE <> 100'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(263158879326005106)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(262513048602967304)
,p_button_name=>'ChangeAllStatuses'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'ChangeAllStatuses'
,p_button_alignment=>'LEFT-CENTER'
,p_button_execute_validations=>'N'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2047779389201734)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(2040999586201677)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2058475857201770)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(2050026183201760)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Create New Project within the Contract &P40_CONTRACT_DESC.'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RP:P78_CONTRACT_ID,P78_INT_CODE:&P40_CONTRACT_ID.,&P40_SELECTED_INT_CODE.'
,p_button_condition=>'P40_CONTRACT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2070462807201802)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(2062459578201782)
,p_button_name=>'SHOWZEROS'
,p_button_static_id=>'SHOWZEROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Show Un-Used Items'
,p_button_position=>'TOP'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::P40_ZERO:1'
,p_button_condition=>'P40_ZERO'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2070874292201803)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(2062459578201782)
,p_button_name=>'DONOTSHOWSEROS'
,p_button_static_id=>'DONOTSHOWSEROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(114244386751508)
,p_button_image_alt=>'Hide Unused items'
,p_button_position=>'TOP'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::P40_ZERO:0'
,p_button_condition=>'P40_ZERO'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2076910299201846)
,p_branch_name=>'Go To Page 40'
,p_branch_action=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID:&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(92535720945833603)
,p_branch_sequence=>20
,p_branch_comment=>'Created 15-FEB-2011 22:33 by ADMIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2048850079201756)
,p_name=>'P40_CONTRACT_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2040999586201677)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2049205084201757)
,p_name=>'P40_CONTRACT_DESC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2040999586201677)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2049611029201758)
,p_name=>'P40_SELECTED_INT_CODE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(2040999586201677)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2058832272201771)
,p_name=>'P40_CURRENT_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2050026183201760)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2059234024201772)
,p_name=>'P40_CURRENT_PROJECT_DESC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2050026183201760)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2059621821201776)
,p_name=>'P40_SHOW_WHAT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2050026183201760)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2071269781201803)
,p_name=>'P40_ZERO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(2062459578201782)
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2720706447162027)
,p_name=>'P40_START_DATETOVALID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(2040999586201677)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2720888526162028)
,p_name=>'P40_END_DATETOVALID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(2040999586201677)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92536140058833603)
,p_name=>'P40_COMPANYNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_prompt=>'Company Name'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'COMPANIES_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name d, code r',
'from   prj_companies',
'where upper(nvl(deleted,''N'')) <> ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(92536573144833607)
,p_name=>'P40_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'36_STATUS_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PST_DESC,PST_ID',
'from PRJ_STATUS',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(92536940026833607)
,p_name=>'P40_INTEGRATIONCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_prompt=>'int code'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(92537335686833608)
,p_name=>'P40_VIEW_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_item_default=>'non'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92537748026833608)
,p_name=>'P40_CNTIDD_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92538167176833609)
,p_name=>'P40_PCI_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92538544851833610)
,p_name=>'P40_CID_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92538912820833610)
,p_name=>'P40_INTCODE_SELECTED_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(156455283537521923)
,p_name=>'P40_INTEGRATION_FLG'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(2040999586201677)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(184221749317304844)
,p_name=>'P40_LCDID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(2040999586201677)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262514127576967315)
,p_name=>'P40_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(262513048602967304)
,p_prompt=>'Date'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
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
 p_id=>wwv_flow_imp.id(262514463181967318)
,p_name=>'P40_MODULE_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(262513048602967304)
,p_prompt=>'Module search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(263158393462005101)
,p_name=>'P40_STATUS_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(262513048602967304)
,p_prompt=>'Change Status for all'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'36_STATUS_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PST_DESC,PST_ID',
'from PRJ_STATUS',
'order by 1'))
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
 p_id=>wwv_flow_imp.id(266568219055915005)
,p_name=>'P40_PAYMENT_PERCENTAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(262513048602967304)
,p_prompt=>'Payment percentage'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from lgs_projects where',
'',
' contract_id = :P40_INTCODE_SELECTED',
' AND nvl(IS_INVOICED_FLG,''N'') = ''N''',
' or PAYMENT_PERCENTAGE <> 100'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'0'
,p_attribute_02=>'100'
,p_attribute_03=>'right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(266785705776337806)
,p_name=>'P40_CID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(266785855439337807)
,p_name=>'P40_INTCODE_SELECTED'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(266939067274206601)
,p_name=>'P40_PCI'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(266939124383206602)
,p_name=>'P40_VIEW'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(2040999586201677)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(266939691105206607)
,p_name=>'P40_CNTIDD'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(187335280941183423)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2079001414538709)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2078890365538707)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2079199254538710)
,p_event_id=>wwv_flow_imp.id(2079001414538709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' :P40_PCI := '''';',
' :P40_COMPANYNAME := NULL;',
' :P40_INTEGRATIONCODE := NULL;',
' :P40_STATUS := NULL;',
'end;',
''))
,p_attribute_02=>'P40_COMPANYNAME,P40_INTEGRATIONCODE,P40_STATUS'
,p_attribute_03=>'P40_COMPANYNAME,P40_INTEGRATIONCODE,P40_STATUS'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2079237531538711)
,p_event_id=>wwv_flow_imp.id(2079001414538709)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1833549450278018)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2058475857201770)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1833683723278019)
,p_event_id=>wwv_flow_imp.id(1833549450278018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(156455890858521929)
,p_name=>'loading'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P40_CONTRACT_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforerefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(156455909814521930)
,p_event_id=>wwv_flow_imp.id(156455890858521929)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' $(document.body).css({''cursor'' : ''wait''});'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(156455369897521924)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DO_INTEGRATION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    l_date varchar2(20);',
'begin',
'select * into l_date  from (select * from CSS_REFERESHED_ON order by REFERESH_DATE desc)  where rownum = 1 ;',
'if :P40_INTEGRATION_FLG = 1 then',
'--if to_char(l_date) != to_char(SYSDATE) then ',
'CSS_PCK.Refresh_data(); --end if;',
' Transfer_Data.Create_Enrolled_Data_Contract(:P40_CONTRACT_ID);',
' :P40_INTEGRATION_FLG := 0;',
'end if;',
' end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2076409941201837)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RUN_PROCESS_CONTRACT'
,p_process_sql_clob=>'transfer_data.create_enrolled_data_contract(:P40_SELECTED_CONTRACT_ID);'
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(436888689090146115)
,p_process_sequence=>5
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'SHOW_ALL_PRC'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2078890365538707)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(263851028489231003)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ChangeAllStatus'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'CURSOR C1 IS ',
'SELECT ID FROM LGS_PROJECTS',
'WHERE  CONTRACT_ID = :P40_INTCODE_SELECTED ;',
'',
'C1_ID NUMBER;',
'V_1  NUMBER;',
'BEGIN',
' OPEN C1;',
' LOOP',
'  FETCH  C1 into C1_ID; ',
'      EXIT WHEN C1%notfound; ',
'      UPDATE LGS_PROJECTS ',
'      SET STATUS = :P40_STATUS_1',
'      WHERE ID = C1_ID;',
'      ',
'      SELECT MAX(PSH_ID) INTO V_1 FROM PRJ_PROJECT_STATUS_HISTORY;',
'',
'  INSERT INTO PRJ_PROJECT_STATUS_HISTORY (PSH_ID, PSH_PRJ_ID,PSH_STS_ID, PSH_DATE,PSH_REMARK)',
'    VALUES ( V_1+1,C1_ID,:P40_STATUS_1,to_date(:P40_DATE,''dd-mon-yy''),'''');',
'      END LOOP;',
' ',
'      CLOSE C1;',
'      ',
'     --Change contract status',
'     UPDATE LGS_CONTRACTS ',
'      SET STATUS = :P40_STATUS_1',
'      WHERE ID = :P40_CONTRACT_ID',
'     ;',
'     ',
'     COMMIT;',
'      END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'error'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(263158879326005106)
,p_process_success_message=>'success'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(266567964084915002)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IssueInvoice'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' DECLARE',
' CURSOR C1 IS ',
'SELECT ID  FROM LGS_PROJECTS',
'WHERE  CONTRACT_ID = :P40_INTCODE_SELECTED ;',
'',
'C1_ID NUMBER;',
' TO_EMAIL_V VARCHAR2(200);',
' l_body      CLOB;',
' ',
'    ind         NUMBER;',
'    FROM_EMAIL_V VARCHAR2(100);',
'  ',
'    CNTID_V NUMBER ;',
'   EMP_CODE_V VARCHAR2(200);',
'  ',
' DSP_CODE VARCHAR2(100);',
'    INTCODE_V VARCHAR2(200) ;',
'    MODULES_V VARCHAR2(200)  ;',
'',
'',
' ',
'BEGIN',
'OPEN C1;',
' LOOP',
'  FETCH  C1 into C1_ID; ',
'      EXIT WHEN C1%notfound; ',
'ind := 1;',
'',
'UPDATE  LGS_PROJECTS',
'SET IS_INVOICED_FLG = ''Y'' ',
'WHERE ID = C1_ID;',
'',
'UPDATE  LGS_PROJECTS',
'SET  PAYMENT_PERCENTAGE = :P40_PAYMENT_PERCENTAGE',
'WHERE ID = C1_ID;',
'',
'',
'',
'  select INT_CODE, MODULE,CONTRACT_ID into INTCODE_V,MODULES_V,CNTID_V from lgs_projects where ID = C1_ID;',
' SELECT DSP_CODE, WHO_CREATED INTO DSP_CODE,EMP_CODE_V FROM LGS_CONTRACTS WHERE ID = :P40_INTCODE_SELECTED;',
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
'        l_body := l_body || ''Name: '' || MODULES_V || '' ........... '' || ''INT_CODE: '' || INTCODE_V || utl_tcp.crlf||utl_tcp.crlf; ',
'        ind := ind + 1;',
'    ',
'       ',
'                         ',
'END LOOP;',
'CLOSE C1;',
' l_body := l_body ||''Sincerely,''||utl_tcp.crlf;',
'         l_body := l_body ||''The Application Express Dev Team''||utl_tcp.crlf;',
'        apex_mail.send(',
'                         p_to  =>  ''tareif.kh@gmail.com''   , -----TO_EMAIL_V,   -- change to your email address',
'                          p_from =>   ''tareif.kh@gmail.com''   ,----- FROM_EMAIL_V, -- change to a real senders email address',
'                          p_cc => ''tareif.kh@gmail.com''   ,',
'                          p_body     => l_body,',
'                         p_subj => ''Project - Notification'');',
'                         APEX_MAIL.PUSH_QUEUE  ;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(266567849336915001)
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
