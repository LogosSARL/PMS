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
--   Date and Time:   11:25 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 106
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00106
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>106);
end;
/
prompt --application/pages/page_00106
begin
wwv_flow_imp_page.create_page(
 p_id=>106
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'New Report'
,p_step_title=>'New Report'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20180515132427'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(174116934684863914)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(174119625756863941)
,p_name=>'Report'
,p_template=>wwv_flow_imp.id(20903049949019134)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dsp_code ContcODE ,b.e_name contractName,c.dsp_code  prjCODE, c.l_description PrjName,',
'                c.module, d.e_name taskName, g.employee,',
'                 SUM(f.no_of_days) Estimateddays ,SUM(g.no_of_hours) Enrolledhours',
'',
'from lgs_contracts a,logos.lgs_companies b,lgs_projects c,',
'     prj_work_types d,prj_projectwork_types e,prj_estimated_dets f',
'     , prj_enrolled_dets g',
'where a.company_code = b.code ',
'and a.usage_type= 2',
'and a.id= c.contract_id',
'and c.id= e.proj_id',
'and d.id= e.wrktyp_id',
'and f.project_worktype_id = e.id',
'and g.project_worktype_id = e.id',
'and (a.id = :P106_CONTRACT OR  :P106_CONTRACT IS NULL )',
'and (c.id= :P106_PROJECT OR :P106_PROJECT IS NULL)',
'and (to_char(f.employee)= :P106_EMPLOYEES OR :P106_EMPLOYEES IS NULL )',
'and (d.id = :P106_TASK  OR :P106_TASK  IS NULL )',
'GROUP BY a.dsp_code  ,b.e_name ,c.dsp_code  , c.l_description , c.module, d.e_name , g.employee  ',
''))
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
 p_id=>wwv_flow_imp.id(174119726621863942)
,p_query_column_id=>1
,p_column_alias=>'CONTCODE'
,p_column_display_sequence=>1
,p_column_heading=>'Contcode'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174119809396863943)
,p_query_column_id=>2
,p_column_alias=>'CONTRACTNAME'
,p_column_display_sequence=>2
,p_column_heading=>'Contractname'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174119902470863944)
,p_query_column_id=>3
,p_column_alias=>'PRJCODE'
,p_column_display_sequence=>3
,p_column_heading=>'Prjcode'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174120071489863945)
,p_query_column_id=>4
,p_column_alias=>'PRJNAME'
,p_column_display_sequence=>4
,p_column_heading=>'Prjname'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174120197932863946)
,p_query_column_id=>5
,p_column_alias=>'MODULE'
,p_column_display_sequence=>5
,p_column_heading=>'Module'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174120263102863947)
,p_query_column_id=>6
,p_column_alias=>'TASKNAME'
,p_column_display_sequence=>6
,p_column_heading=>'Taskname'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174120380811863948)
,p_query_column_id=>7
,p_column_alias=>'EMPLOYEE'
,p_column_display_sequence=>7
,p_column_heading=>'Employee'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174120491813863949)
,p_query_column_id=>8
,p_column_alias=>'ESTIMATEDDAYS'
,p_column_display_sequence=>8
,p_column_heading=>'Estimateddays'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174120534549863950)
,p_query_column_id=>9
,p_column_alias=>'ENROLLEDHOURS'
,p_column_display_sequence=>9
,p_column_heading=>'Enrolledhours'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(175246604353005401)
,p_plug_name=>'Contract vs Employees'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>40
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(175246720225005402)
,p_region_id=>wwv_flow_imp.id(175246604353005401)
,p_chart_type=>'pie'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(175246844140005403)
,p_chart_id=>wwv_flow_imp.id(175246720225005402)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      null, b.e_name contractName,g.employee ,SUM(g.no_of_hours) Enrolledhours',
'',
'from lgs_contracts a,logos.lgs_companies b,lgs_projects c,',
'     prj_work_types d,prj_projectwork_types e,prj_estimated_dets f',
'     , prj_enrolled_dets g',
'where a.company_code = b.code ',
'and a.usage_type= 2',
'and a.id= c.contract_id',
'and c.id= e.proj_id',
'and d.id= e.wrktyp_id',
'and f.project_worktype_id = e.id',
'and g.project_worktype_id = e.id',
'and a.id = :P106_CONTRACT ',
'',
'GROUP BY b.e_name , g.employee  ',
''))
,p_items_value_column_name=>'ENROLLEDHOURS'
,p_items_label_column_name=>'EMPLOYEE'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(175246998369005404)
,p_plug_name=>'Employees vs Projects'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>50
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(175247003422005405)
,p_region_id=>wwv_flow_imp.id(175246998369005404)
,p_chart_type=>'pie'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(175247171147005406)
,p_chart_id=>wwv_flow_imp.id(175247003422005405)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null, c.l_description PrjName, g.employee,SUM(g.no_of_hours) Enrolledhours',
'',
'from lgs_contracts a,logos.lgs_companies b,lgs_projects c,',
'     prj_work_types d,prj_projectwork_types e,prj_estimated_dets f',
'     , prj_enrolled_dets g',
'where a.company_code = b.code ',
'and a.usage_type= 2',
'and a.id= c.contract_id',
'and c.id= e.proj_id',
'and d.id= e.wrktyp_id',
'and f.project_worktype_id = e.id',
'and g.project_worktype_id = e.id',
'',
'and g.employee = :P106_EMPLOYEES',
'',
'GROUP BY  c.l_description , g.employee  ',
''))
,p_items_value_column_name=>'ENROLLEDHOURS'
,p_items_label_column_name=>'PRJNAME'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(349355111172534283)
,p_plug_name=>'Contract vs Worktype'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>30
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(175236870607670387)
,p_region_id=>wwv_flow_imp.id(349355111172534283)
,p_chart_type=>'pie'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_show_label=>false
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(175237359842670389)
,p_chart_id=>wwv_flow_imp.id(175236870607670387)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null,b.e_name contractName, d.e_name taskName,SUM(g.no_of_hours) Enrolledhours',
'',
'from lgs_contracts a,logos.lgs_companies b,lgs_projects c,',
'     prj_work_types d,prj_projectwork_types e,prj_estimated_dets f',
'     , prj_enrolled_dets g',
'where a.company_code = b.code ',
'and a.usage_type= 2',
'and a.id= c.contract_id',
'and c.id= e.proj_id',
'and d.id= e.wrktyp_id',
'and f.project_worktype_id = e.id',
'and g.project_worktype_id = e.id',
'and a.id = :P106_CONTRACT ',
'GROUP BY b.e_name , d.e_name ',
''))
,p_items_value_column_name=>'ENROLLEDHOURS'
,p_items_label_column_name=>'TASKNAME'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174118166709863926)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(174116934684863914)
,p_button_name=>'GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(174117960541863924)
,p_name=>'P106_CONTRACT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(174116934684863914)
,p_prompt=>'Contract'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE d, ID r',
'from   LGS_CONTRACTS',
'where USAGE_TYPE = 2',
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
 p_id=>wwv_flow_imp.id(174118037714863925)
,p_name=>'P106_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(174116934684863914)
,p_prompt=>'Project'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'PROJECT_L_DESCRIPTION_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select L_DESCRIPTION d, id r',
'from   lgs_projects',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P106_CONTRACT'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(174118274670863927)
,p_name=>'P106_EMPLOYEES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(174116934684863914)
,p_prompt=>'Employees'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'EMPLOYEE LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMP_NAME, EMP_CODE',
'from PRJ_EMPLOYEE_SALARY',
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
 p_id=>wwv_flow_imp.id(174118388936863928)
,p_name=>'P106_TASK'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(174116934684863914)
,p_prompt=>'Task'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'TASK_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name as d,',
'       id as r',
'  from PRJ_WORK_TYPES',
' order by 2'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
