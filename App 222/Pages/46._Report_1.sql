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
,p_default_application_id=>222
,p_default_id_offset=>0
,p_default_owner=>'PRJ'
);
end;
/
 
prompt APPLICATION 222 - PMS
--
-- Application Export:
--   Application:     222
--   Name:            PMS
--   Date and Time:   11:29 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 46
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00046
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>46);
end;
/
prompt --application/pages/page_00046
begin
wwv_flow_imp_page.create_page(
 p_id=>46
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'Report'
,p_step_title=>'Report'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20201119125931'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(877314142956390736)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(877314237411390737)
,p_region_id=>wwv_flow_imp.id(877314142956390736)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
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
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(877315184840390746)
,p_chart_id=>wwv_flow_imp.id(877314237411390737)
,p_seq=>90
,p_name=>'ADM'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''ADM-''||CUSTOMER_CODE,extract(year from schedule_date)||''-''||extract(month from schedule_date) lable,',
'',
'--PERSONNEL_NAME, CUSTOMER_CODE, CUSTOMER_NAME,',
'--LOCATION, ',
'--TASK_CODE,-- TASK_DESC, PROJECT_CODE, MODULE_CODE, MODULE_NAME,',
'sum(LABOUR_HOURS/9) value--,-- description, ',
'',
'--extract(year from schedule_date)||''-''||extract(month from schedule_date) month',
'from CSS_PROJECT_TASKS_V@CSS254',
'where task_code = ''ADM'' and  schedule_date >= nvl(:p46_fd,schedule_date) and schedule_date <= nvl(:p46_td,schedule_date)',
'and (instr( upper(:p46_customer),upper(customer_code))>0  or  :p46_customer is null)',
'and (instr(upper(:p46_employee),upper( personnel_code) )>0  or :p46_employee is null)',
'group by extract(year from schedule_date)||''-''||extract(month from schedule_date),extract(year from schedule_date),extract(month from schedule_date)',
',CUSTOMER_CODE',
'order by extract(year from schedule_date),extract(month from schedule_date)'))
,p_series_name_column_name=>'''ADM-''||CUSTOMER_CODE'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABLE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(881285341514881704)
,p_chart_id=>wwv_flow_imp.id(877314237411390737)
,p_seq=>100
,p_name=>'SUP'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''SUP-''||CUSTOMER_CODE,extract(year from schedule_date)||''-''||extract(month from schedule_date) lable,',
'',
'--PERSONNEL_NAME, CUSTOMER_CODE, CUSTOMER_NAME,',
'--LOCATION, ',
'--TASK_CODE,-- TASK_DESC, PROJECT_CODE, MODULE_CODE, MODULE_NAME,',
'sum(LABOUR_HOURS/9) value--,-- description, ',
'',
'--extract(year from schedule_date)||''-''||extract(month from schedule_date) month',
'from CSS_PROJECT_TASKS_V@CSS254',
'where task_code = ''SUP'' and schedule_date >= nvl(:p46_fd,schedule_date) and schedule_date <= nvl(:p46_td,schedule_date)',
'and (instr( upper(:p46_customer),upper(customer_code))>0  or  :p46_customer is null)',
'and (instr(upper(:p46_employee),upper( personnel_code) )>0  or :p46_employee is null)',
'group by extract(year from schedule_date)||''-''||extract(month from schedule_date),extract(year from schedule_date),extract(month from schedule_date)',
',CUSTOMER_CODE',
'order by extract(year from schedule_date),extract(month from schedule_date)'))
,p_series_name_column_name=>'''SUP-''||CUSTOMER_CODE'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABLE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(881285411434881705)
,p_chart_id=>wwv_flow_imp.id(877314237411390737)
,p_seq=>110
,p_name=>'IMP'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''IMP-''||CUSTOMER_CODE,extract(year from schedule_date)||''-''||extract(month from schedule_date) lable,',
'',
'--PERSONNEL_NAME, CUSTOMER_CODE, CUSTOMER_NAME,',
'--LOCATION, ',
'--TASK_CODE,-- TASK_DESC, PROJECT_CODE, MODULE_CODE, MODULE_NAME,',
'sum(LABOUR_HOURS/9) value--,-- description, ',
'',
'--extract(year from schedule_date)||''-''||extract(month from schedule_date) month',
'from CSS_PROJECT_TASKS_V@CSS254',
'where task_code = ''IMP'' and schedule_date >= nvl(:p46_fd,schedule_date) and schedule_date <= nvl(:p46_td,schedule_date)',
'and (instr( upper(:p46_customer),upper(customer_code))>0  or  :p46_customer is null)',
'and (instr(upper(:p46_employee),upper( personnel_code) )>0  or :p46_employee is null)',
'group by extract(year from schedule_date)||''-''||extract(month from schedule_date),extract(year from schedule_date),extract(month from schedule_date)',
',CUSTOMER_CODE',
'order by extract(year from schedule_date),extract(month from schedule_date)'))
,p_series_name_column_name=>'''IMP-''||CUSTOMER_CODE'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABLE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(881285564078881706)
,p_chart_id=>wwv_flow_imp.id(877314237411390737)
,p_seq=>120
,p_name=>'DEV'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''DEV-''||CUSTOMER_CODE,extract(year from schedule_date)||''-''||extract(month from schedule_date) lable,',
'',
'--PERSONNEL_NAME, CUSTOMER_CODE, CUSTOMER_NAME,',
'--LOCATION, ',
'--TASK_CODE,-- TASK_DESC, PROJECT_CODE, MODULE_CODE, MODULE_NAME,',
'sum(LABOUR_HOURS/9) value--,-- description, ',
'',
'--extract(year from schedule_date)||''-''||extract(month from schedule_date) month',
'from CSS_PROJECT_TASKS_V@CSS254',
'where task_code = ''DEV'' and schedule_date >= nvl(:p46_fd,schedule_date) and schedule_date <= nvl(:p46_td,schedule_date)',
'and (instr( upper(:p46_customer),upper(customer_code))>0  or  :p46_customer is null)',
'and (instr(upper(:p46_employee),upper( personnel_code) )>0  or :p46_employee is null)',
'group by extract(year from schedule_date)||''-''||extract(month from schedule_date),extract(year from schedule_date),extract(month from schedule_date)',
',CUSTOMER_CODE',
'order by extract(year from schedule_date),extract(month from schedule_date)'))
,p_series_name_column_name=>'''DEV-''||CUSTOMER_CODE'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABLE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(881285654795881707)
,p_chart_id=>wwv_flow_imp.id(877314237411390737)
,p_seq=>130
,p_name=>'TRA'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''TRA-''||CUSTOMER_CODE,extract(year from schedule_date)||''-''||extract(month from schedule_date) lable,',
'',
'--PERSONNEL_NAME, CUSTOMER_CODE, CUSTOMER_NAME,',
'--LOCATION, ',
'--TASK_CODE,-- TASK_DESC, PROJECT_CODE, MODULE_CODE, MODULE_NAME,',
'sum(LABOUR_HOURS/9) value--,-- description, ',
'',
'--extract(year from schedule_date)||''-''||extract(month from schedule_date) month',
'from CSS_PROJECT_TASKS_V@CSS254',
'where task_code = ''TRA'' and schedule_date >= nvl(:p46_fd,schedule_date) and schedule_date <= nvl(:p46_td,schedule_date)',
'and (instr( upper(:p46_customer),upper(customer_code))>0  or  :p46_customer is null)',
'and (instr(upper(:p46_employee),upper( personnel_code) )>0  or :p46_employee is null)',
'group by extract(year from schedule_date)||''-''||extract(month from schedule_date),extract(year from schedule_date),extract(month from schedule_date)',
',CUSTOMER_CODE',
'order by extract(year from schedule_date),extract(month from schedule_date)'))
,p_series_name_column_name=>'''TRA-''||CUSTOMER_CODE'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABLE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(881285796553881708)
,p_chart_id=>wwv_flow_imp.id(877314237411390737)
,p_seq=>140
,p_name=>'OTH'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''OTH-''||CUSTOMER_CODE,extract(year from schedule_date)||''-''||extract(month from schedule_date) lable,',
'',
'--PERSONNEL_NAME, CUSTOMER_CODE, CUSTOMER_NAME,',
'--LOCATION, ',
'--TASK_CODE,-- TASK_DESC, PROJECT_CODE, MODULE_CODE, MODULE_NAME,',
'sum(LABOUR_HOURS/9) value--,-- description, ',
'',
'--extract(year from schedule_date)||''-''||extract(month from schedule_date) month',
'from CSS_PROJECT_TASKS_V@CSS254',
'where task_code not in (''ADM'',''SUP'',''IMP'',''DEV'',''TRA'') and schedule_date >= nvl(:p46_fd,schedule_date) and schedule_date <= nvl(:p46_td,schedule_date)',
'and (instr( upper(:p46_customer),upper(customer_code))>0  or  :p46_customer is null)',
'and (instr(upper(:p46_employee),upper( personnel_code) )>0  or :p46_employee is null)',
'group by extract(year from schedule_date)||''-''||extract(month from schedule_date),extract(year from schedule_date),extract(month from schedule_date)',
',CUSTOMER_CODE',
'order by extract(year from schedule_date),extract(month from schedule_date)'))
,p_series_name_column_name=>'''OTH-''||CUSTOMER_CODE'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABLE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(881285118961881702)
,p_chart_id=>wwv_flow_imp.id(877314237411390737)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(881285216345881703)
,p_chart_id=>wwv_flow_imp.id(877314237411390737)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(881202760576680710)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(901731311007000801)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CUSTOMER_CODE,extract(year from schedule_date)||''-''||extract(month from schedule_date)||''-''||to_char(schedule_date,''W'') lable,',
'personnel_code,',
'',
'--PERSONNEL_NAME, CUSTOMER_CODE, CUSTOMER_NAME,',
'--LOCATION, ',
'--TASK_CODE,-- TASK_DESC, PROJECT_CODE, MODULE_CODE, MODULE_NAME,',
'sum(LABOUR_HOURS/9) value--,-- description, ',
'',
'--extract(year from schedule_date)||''-''||extract(month from schedule_date) month',
'from CSS_PROJECT_TASKS_V@CSS254',
'where --task_code = ''ADM'' and ',
'extract(year from schedule_date)||''-''||extract(month from schedule_date)||''-''||to_char(schedule_date,''W'') > ''2020''',
'and customer_code like ''LOGOS%''',
'--and (instr( :p46_employee,personnel_code) > 0 or :p46_employee is null)',
'group by extract(year from schedule_date)||''-''||extract(month from schedule_date),extract(year from schedule_date),extract(month from schedule_date)',
',to_char(schedule_date,''W''),CUSTOMER_CODE,personnel_code',
'order by personnel_code,extract(year from schedule_date),extract(month from schedule_date),to_char(schedule_date,''W'') '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
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
,p_prn_header_font_color=>'#000000'
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(901731472629000802)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>901731472629000802
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901731643751000804)
,p_db_column_name=>'LABLE'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Lable'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901731788203000805)
,p_db_column_name=>'VALUE'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901731841410000806)
,p_db_column_name=>'CUSTOMER_CODE'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Customer code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901731973147000807)
,p_db_column_name=>'PERSONNEL_CODE'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Personnel code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(901738081510039829)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9017381'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PERSONNEL_CODE:CUSTOMER_CODE:LABLE:VALUE:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(901732059944000808)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CUSTOMER_CODE,extract(year from schedule_date)||''-''||extract(month from schedule_date) LABEL,--||''-''||to_char(schedule_date,''W'') lable,',
'personnel_code,',
'',
'--PERSONNEL_NAME, CUSTOMER_CODE, CUSTOMER_NAME,',
'--LOCATION, ',
'--TASK_CODE,-- ',
'TASK_DESC, --PROJECT_CODE, MODULE_CODE, ',
'MODULE_NAME,',
'LABOUR_HOURS/9 value--,-- description, ',
'',
'--extract(year from schedule_date)||''-''||extract(month from schedule_date) month',
'from CSS_PROJECT_TASKS_V@CSS254',
'where --task_code = ''ADM'' and ',
'schedule_date >= nvl(:p46_fd,schedule_date) and schedule_date <= nvl(:p46_td,schedule_date)',
'--and customer_code like ''LOGOS%''',
'--and (instr( :p46_employee,personnel_code) > 0 or :p46_employee is null)',
'',
'order by personnel_code,extract(year from schedule_date),extract(month from schedule_date)--,to_char(schedule_date,''W'') '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
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
,p_prn_header_font_color=>'#000000'
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
,p_plug_caching=>'CACHE'
,p_plug_caching_max_age_in_sec=>43200
,p_plug_cache_depends_on_items=>'APP_REQUEST_DATA_HASH'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(901732181343000809)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>901732181343000809
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901732422382000812)
,p_db_column_name=>'PERSONNEL_CODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Personnel code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901732595680000813)
,p_db_column_name=>'VALUE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901732895901000816)
,p_db_column_name=>'CUSTOMER_CODE'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Customer code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901732995736000817)
,p_db_column_name=>'LABEL'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Label'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(881286504695881716)
,p_db_column_name=>'TASK_DESC'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'Task desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(881286697503881717)
,p_db_column_name=>'MODULE_NAME'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Module name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(901742305288113518)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'9017424'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'PERSONNEL_CODE:VALUE:CUSTOMER_CODE:LABEL:TASK_DESC:MODULE_NAME'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(983313687478777681)
,p_report_id=>wwv_flow_imp.id(901742305288113518)
,p_group_by_columns=>'PERSONNEL_CODE:LABEL:CUSTOMER_CODE:MODULE_NAME:TASK_DESC'
,p_function_01=>'SUM'
,p_function_column_01=>'VALUE'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'N'
,p_sort_column_01=>'LABEL'
,p_sort_direction_01=>'ASC'
,p_sort_column_02=>'PERSONNEL_CODE'
,p_sort_direction_02=>'ASC'
,p_sort_column_03=>'MODULE_NAME'
,p_sort_direction_03=>'ASC'
,p_sort_column_04=>'TASK_DESC'
,p_sort_direction_04=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(901776268705005801)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CUSTOMER_CODE,',
'extract(year from schedule_date) label,--||''-''||extract(month from schedule_date) LABEL,--||''-''||to_char(schedule_date,''W'') lable,',
'personnel_code,',
'',
'--PERSONNEL_NAME, CUSTOMER_CODE, CUSTOMER_NAME,',
'--LOCATION, ',
'--TASK_CODE,-- TASK_DESC, PROJECT_CODE, MODULE_CODE, MODULE_NAME,',
'LABOUR_HOURS/9 value--,-- description, ',
'',
'--extract(year from schedule_date)||''-''||extract(month from schedule_date) month',
'from CSS_PROJECT_TASKS_V@CSS254',
'where --task_code = ''ADM'' and ',
'extract(year from schedule_date) > ''2020''',
'--and customer_code like ''LOGOS%''',
'and (instr( upper(:p46_customer),upper(customer_code)) > 0 or :p46_customer is null)',
'--and (instr( :p46_employee,personnel_code) > 0 or :p46_employee is null)',
'',
'order by personnel_code,extract(year from schedule_date)--,extract(month from schedule_date)--,to_char(schedule_date,''W'') '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
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
,p_prn_header_font_color=>'#000000'
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(901776341684005802)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>901776341684005802
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901776447492005803)
,p_db_column_name=>'PERSONNEL_CODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Personnel code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901776532601005804)
,p_db_column_name=>'VALUE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(901776895865005807)
,p_db_column_name=>'LABEL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Label'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(881285879173881709)
,p_db_column_name=>'CUSTOMER_CODE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Customer code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(901782973613012377)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9017830'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PERSONNEL_CODE:VALUE:LABEL:CUSTOMER_CODE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(881202659542680709)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(881202760576680710)
,p_button_name=>'Go'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Go'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(881202320199680706)
,p_name=>'P46_CUSTOMER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(881202760576680710)
,p_prompt=>'Customer'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct  customer_name, customer_code from  CSS_PROJECT_TASKS_V@CSS254',
' where extract (year from schedule_date) > 2018',
'order by upper(customer_name)'))
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'ALL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(881202834354680711)
,p_name=>'P46_EMPLOYEE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(881202760576680710)
,p_prompt=>'Employee'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct Personnel_Name, Personnel_code from  CSS_PROJECT_TASKS_V@CSS254 where personnel_active_flg = ''Y''',
'order by 1'))
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'ALL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(881285915676881710)
,p_name=>'P46_FD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(881202760576680710)
,p_item_default=>'01-JUL-2019'
,p_prompt=>'From'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(881286049069881711)
,p_name=>'P46_TD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(881202760576680710)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Till'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(881202476973680707)
,p_name=>'value Changed'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P46_CUSTOMER'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(881202515274680708)
,p_event_id=>wwv_flow_imp.id(881202476973680707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(877314142956390736)
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
