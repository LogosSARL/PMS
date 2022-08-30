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
,p_default_application_id=>222
,p_default_owner=>'PRJ'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 222 - PMS
--
-- Application Export:
--   Application:     222
--   Name:            PMS
--   Date and Time:   10:55 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00047
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>47);
end;
/
prompt --application/pages/page_00047
begin
wwv_flow_api.create_page(
 p_id=>47
,p_user_interface_id=>wwv_flow_api.id(148753632100243889)
,p_name=>'Efforts'
,p_page_mode=>'NORMAL'
,p_step_title=>'Efforts'
,p_step_sub_title=>'Efforts'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var aggR = $("#efforts .a-IRR-aggregate").first().parent();',
'if (aggR.length > 0) {',
'    aggR.parent().append(aggR.clone());',
'    var clonesAggR = aggR.parent().children().last();',
'    var sum = [];',
'    var total = 0; ',
'    for (var i = 0 ; i < aggR.children().length ; i ++ ) {',
'        if(aggR.children(''td'').eq(i).hasClass(''a-IRR-aggregate'')) {',
'            var elem = aggR.children(''td'').eq(i).text();',
'            sum.push(elem.replace('','', ''''));',
'            total += parseFloat(elem.replace('','', ''''));',
'        }',
'    }',
'',
'',
'    for (var i = 0 ; i < clonesAggR.children().length ; i ++ ) {',
'        if(clonesAggR.children(''td'').eq(i).hasClass(''a-IRR-aggregate'')) {',
'            var elem = parseFloat(sum.shift());',
'            clonesAggR.children(''td'').eq(i).text(((elem*100)/total).toFixed(2)+''%'');',
'        }',
'    }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'WADIH'
,p_last_upd_yyyymmddhh24miss=>'20220228130103'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1085841356322538540)
,p_plug_name=>'Efforts'
,p_region_name=>'efforts'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148719512587243497)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CUSTOMER_CODE,extract(year from schedule_date)||''-''||extract(month from schedule_date) LABEL,--||''-''||to_char(schedule_date,''W'') lable,',
'personnel_code,',
'',
'--PERSONNEL_NAME, CUSTOMER_CODE, CUSTOMER_NAME,',
'--LOCATION, ',
'--TASK_CODE,-- ',
'TASK_DESC, --PROJECT_CODE, MODULE_CODE, ',
'MODULE_NAME,',
'round(LABOUR_HOURS/9,2) value--,-- description, ',
', extract(year from schedule_date)||''-''||to_char(extract(month from schedule_date),''09'') || ''-'' || TASK_DESC month_task',
'--extract(year from schedule_date)||''-''||extract(month from schedule_date) month',
'from CSS_PROJECT_TASKS_V@CSS254',
'where --task_code = ''ADM'' and ',
'schedule_date >= nvl(:p47_fd,schedule_date) and schedule_date <= nvl(:p47_td,schedule_date)',
'--and customer_code like ''LOGOS%''',
'--and (instr( :p46_employee,personnel_code) > 0 or :p46_employee is null)',
'',
'order by personnel_code,extract(year from schedule_date),extract(month from schedule_date)--,to_char(schedule_date,''W'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1085841499043538540)
,p_name=>'Efforts'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JAWAD'
,p_internal_uid=>1085841499043538540
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1085841857377538555)
,p_db_column_name=>'CUSTOMER_CODE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Customer Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1085842263019538558)
,p_db_column_name=>'LABEL'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Label'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1085842603168538558)
,p_db_column_name=>'PERSONNEL_CODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Personnel Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1085843006853538559)
,p_db_column_name=>'TASK_DESC'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Task Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1085843401181538559)
,p_db_column_name=>'MODULE_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Module Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1085843844501538559)
,p_db_column_name=>'VALUE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(881288162455881732)
,p_db_column_name=>'MONTH_TASK'
,p_display_order=>16
,p_column_identifier=>'G'
,p_column_label=>'Month task'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1085850485131549522)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'PIVOT'
,p_report_alias=>'10858505'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_view_mode=>'REPORT'
,p_report_columns=>'CUSTOMER_CODE:LABEL:PERSONNEL_CODE:TASK_DESC:MODULE_NAME:VALUE:MONTH_TASK'
,p_flashback_enabled=>'N'
,p_chart_type=>'COLUMN'
,p_chart_label_column=>'MONTH_TASK'
,p_chart_label_title=>'Task'
,p_chart_value_column=>'VALUE'
,p_chart_aggregate=>'SUM'
,p_chart_value_title=>'#Days'
,p_chart_sorting=>'LABEL_ASC'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(1482420012750385441)
,p_report_id=>wwv_flow_api.id(1085850485131549522)
,p_name=>'Row text contains ''2020-6'''
,p_condition_type=>'SEARCH'
,p_allow_delete=>'Y'
,p_expr=>'2020-6'
,p_enabled=>'N'
);
wwv_flow_api.create_worksheet_pivot(
 p_id=>wwv_flow_api.id(1482420498360385443)
,p_report_id=>wwv_flow_api.id(1085850485131549522)
,p_pivot_columns=>'LABEL'
,p_row_columns=>'PERSONNEL_CODE:CUSTOMER_CODE'
);
wwv_flow_api.create_worksheet_pivot_agg(
 p_id=>wwv_flow_api.id(1482420868816385443)
,p_pivot_id=>wwv_flow_api.id(1482420498360385443)
,p_display_seq=>1
,p_function_name=>'SUM'
,p_column_name=>'VALUE'
,p_db_column_name=>'PFC1'
,p_column_label=>'Efforts'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_sum=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1085854057098781236)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Pivot'
,p_report_seq=>10
,p_report_type=>'PIVOT'
,p_report_alias=>'10858541'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_view_mode=>'REPORT'
,p_report_columns=>'CUSTOMER_CODE:LABEL:PERSONNEL_CODE:TASK_DESC:MODULE_NAME:VALUE:MONTH_TASK'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_pivot(
 p_id=>wwv_flow_api.id(1482422339663396498)
,p_report_id=>wwv_flow_api.id(1085854057098781236)
,p_pivot_columns=>'LABEL'
,p_row_columns=>'PERSONNEL_CODE:CUSTOMER_CODE'
);
wwv_flow_api.create_worksheet_pivot_agg(
 p_id=>wwv_flow_api.id(1482422764973396499)
,p_pivot_id=>wwv_flow_api.id(1482422339663396498)
,p_display_seq=>1
,p_function_name=>'SUM'
,p_column_name=>'VALUE'
,p_db_column_name=>'PFC1'
,p_column_label=>'Efforts'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_sum=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1085844248268540401)
,p_plug_name=>'Criteria'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(148720099995243498)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(881287185077881722)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1085844248268540401)
,p_button_name=>'Go'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(148742800503243679)
,p_button_image_alt=>'Go'
,p_button_position=>'BODY'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1085844397614540402)
,p_name=>'P47_FD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1085844248268540401)
,p_item_default=>'01-JAN-20'
,p_prompt=>'From'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1085844499436540403)
,p_name=>'P47_TD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1085844248268540401)
,p_item_default=>'31-DEC-20'
,p_prompt=>'To'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
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
