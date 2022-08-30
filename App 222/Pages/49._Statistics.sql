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

prompt --application/pages/delete_00049
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>49);
end;
/
prompt --application/pages/page_00049
begin
wwv_flow_api.create_page(
 p_id=>49
,p_user_interface_id=>wwv_flow_api.id(148753632100243889)
,p_name=>'Statistics'
,p_page_mode=>'NORMAL'
,p_step_title=>'Statistics'
,p_step_sub_title=>'Statistics'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'WADIH'
,p_last_upd_yyyymmddhh24miss=>'20210524155457'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1349344595136002504)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148724461536243505)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(148773243826244270)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(148743388538243690)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1349345158051002506)
,p_plug_name=>'Statistics'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(148719512587243497)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id conid , a.DSP_CODE, a.COMPANY_CODE, a.START_DATE, a.END_DATE,  a.CONTRACT_TYPE_ID,  a.WHO_CREATED, a.ACCOUNT_MANAGER, a.USAGE_TYPE,',
'  a.PARENT_CONTRACT, a.PROJECT_NAME, a.REF_PM, a.REF_INTERNAL, a.OFFER_STATUS, a.REMARKS, a.STATUS,',
'  a.REFERENCES, a.ACCEPTANCE_DATE, a.DELIVERY_DATE, extract(year from (a.created_date)) ||''-''|| extract(month from (a.created_date)) month',
'  ',
' from LGS_CONTRACTS  a',
' /*, lgs_projects   b,PRJ_PROJECTWORK_TYPES  c ,  PRJ_WORK_TYPES d , ',
'      PRJ_ENROLLED_DETS e, WORK_TYPE_GROUPS g',
'      ',
' where  a.id = b.contract_id ',
'  and  b.id= c.proj_id ',
'  and c.WRKTYP_ID= d.id and c.ID = e.PROJECT_WORKTYPE_ID',
'  and a.created_date is not null ',
'  and  project_pck.get_if_contract_disp (a.id, V(''APP_USER'')) = 1',
' ',
'  and USAGE_TYPE = 2',
'  and d.work_type_group = g.id',
'  */',
'  order by a.id--, b.id , c.id,e.employee'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1349345255534002506)
,p_name=>'Statistics'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JAWAD'
,p_internal_uid=>1349345255534002506
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349345693903002513)
,p_db_column_name=>'CONID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Conid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349346028984002516)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Dsp Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349346463946002516)
,p_db_column_name=>'COMPANY_CODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(148756615181244033)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349346834594002516)
,p_db_column_name=>'START_DATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349347219059002517)
,p_db_column_name=>'END_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349347629092002517)
,p_db_column_name=>'CONTRACT_TYPE_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Contract Type Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349348053187002517)
,p_db_column_name=>'WHO_CREATED'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Who Created'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349348476643002518)
,p_db_column_name=>'ACCOUNT_MANAGER'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Account Manager'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349348854451002518)
,p_db_column_name=>'USAGE_TYPE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Usage Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(148755653219244031)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349349253160002518)
,p_db_column_name=>'PARENT_CONTRACT'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Parent Contract'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349349645416002518)
,p_db_column_name=>'PROJECT_NAME'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Project Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349350057771002519)
,p_db_column_name=>'REF_PM'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Ref Pm'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349350443793002519)
,p_db_column_name=>'REF_INTERNAL'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Ref Internal'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349350849731002519)
,p_db_column_name=>'OFFER_STATUS'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Offer Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(148754653298244031)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349351292937002519)
,p_db_column_name=>'REMARKS'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Remarks'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349351604294002519)
,p_db_column_name=>'STATUS'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(148755589278244031)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349352097006002519)
,p_db_column_name=>'REFERENCES'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'References'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349352414644002520)
,p_db_column_name=>'ACCEPTANCE_DATE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Acceptance Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1349352830960002520)
,p_db_column_name=>'DELIVERY_DATE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Delivery Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(724554458292242843)
,p_db_column_name=>'MONTH'
,p_display_order=>29
,p_column_identifier=>'U'
,p_column_label=>'Month'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1349370988732020930)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'13493710'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'CONID:DSP_CODE:COMPANY_CODE:START_DATE:END_DATE:CONTRACT_TYPE_ID:WHO_CREATED:ACCOUNT_MANAGER:USAGE_TYPE:PARENT_CONTRACT:PROJECT_NAME:REF_PM:REF_INTERNAL:OFFER_STATUS:REMARKS:STATUS:REFERENCES:ACCEPTANCE_DATE:DELIVERY_DATE:MONTH'
,p_sort_column_1=>'STATUS'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(1349376015883164080)
,p_report_id=>wwv_flow_api.id(1349370988732020930)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'STATUS'
,p_operator=>'!='
,p_expr=>'Approved & Closed'
,p_condition_sql=>'"STATUS" != #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# != ''Approved & Closed''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(1349376428036164080)
,p_report_id=>wwv_flow_api.id(1349370988732020930)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'WHO_CREATED'
,p_operator=>'='
,p_expr=>'HYAM'
,p_condition_sql=>'"WHO_CREATED" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''HYAM''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(1349376828653164082)
,p_report_id=>wwv_flow_api.id(1349370988732020930)
,p_group_by_columns=>'WHO_CREATED:MONTH:STATUS'
,p_function_01=>'COUNT'
,p_function_column_01=>'DSP_CODE'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_sort_column_01=>'MONTH'
,p_sort_direction_01=>'ASC'
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
