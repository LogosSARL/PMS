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
--   Date and Time:   09:34 Thursday August 18, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.1.00.08
--   Instance ID:     108805670837021
--

prompt --application/pages/delete_00077
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>77);
end;
/
prompt --application/pages/page_00077
begin
wwv_flow_api.create_page(
 p_id=>77
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Report'
,p_page_mode=>'NORMAL'
,p_step_sub_title=>'jjj'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20210120141802'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23500518884918510)
,p_plug_name=>'Report  - Contract &P77_CONTRACT_NAME.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>41
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id conid , a.DSP_CODE, a.COMPANY_CODE, a.START_DATE, a.END_DATE,  a.CONTRACT_TYPE_ID,  a.WHO_CREATED, a.ACCOUNT_MANAGER, a.USAGE_TYPE,',
'  a.PARENT_CONTRACT, a.PROJECT_NAME, a.REF_PM, a.REF_INTERNAL, a.OFFER_STATUS, a.REMARKS, a.STATUS,',
'  a.REFERENCES, a.ACCEPTANCE_DATE, a.DELIVERY_DATE,',
'  PROJECT_PCK.get_contract_project_desc(c.ID) Project_Desc,c.id, c.id task_Details,c.grade, c.estimated_days, c.enrolled_days, c.description,',
'      c.wrktyp_id, c.proj_id, c.qty, '''' as ReportManagement, '''' as EffortRemaining,',
'c.seq, ',
'---project_pck.get_project_work_estimate_num(c.id) Estimated, project_pck.get_task_enrollment(c.id,''0'',''d'') ',
'(nvl(e.NO_OF_HOURS,0) / 8) Task_Enrollment,',
'c.id Exp,',
'project_pck.get_project_task_expences(c.id) Expences,',
'project_pck.get_contract_id(c.proj_id) Contract,',
'project_pck.get_project_module(c.proj_id) Module,get_project_work_enrollment(c.proj_id) as   Employee_Enrollment,',
'PROJECT_PCK.get_project_desc(c.PROJ_ID) ||'' ''|| project_pck.get_work_type_desc(c.proj_id) Projectdescription, g.name || ''-'' || d.E_NAME, e.employee',
' ',
' from LGS_CONTRACTS  a, lgs_projects   b,PRJ_PROJECTWORK_TYPES  c ,  PRJ_WORK_TYPES d , ',
'      PRJ_ENROLLED_DETS e, WORK_TYPE_GROUPS g',
'      ',
' where  a.id = b.contract_id ',
'  and  b.id= c.proj_id  and  (   a.id = :P77_CONTRACT   or   :P77_CONTRACT is null  )',
'  and c.WRKTYP_ID= d.id and c.ID = e.PROJECT_WORKTYPE_ID',
'  and a.created_date is not null ',
'  and  project_pck.get_if_contract_disp (a.id, V(''APP_USER'')) = 1',
'  AND        (  a.COMPANY_CODE= :P77_COMPANY OR :P77_COMPANY IS NULL )',
'  AND        (  c.WRKTYP_ID = :P77_TASK  OR :P77_TASK IS NULL )',
'  and USAGE_TYPE = 2',
'  and d.work_type_group = g.id',
'  order by a.id, b.id , c.id,e.employee   '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(23500695789918510)
,p_name=>'jjj'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>23500695789918510
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23572783693412205)
,p_db_column_name=>'WRKTYP_ID'
,p_display_order=>10
,p_column_identifier=>'DY'
,p_column_label=>'Wrktyp id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23572817416412206)
,p_db_column_name=>'PROJ_ID'
,p_display_order=>20
,p_column_identifier=>'DZ'
,p_column_label=>'Proj id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23572994161412207)
,p_db_column_name=>'QTY'
,p_display_order=>30
,p_column_identifier=>'EA'
,p_column_label=>'Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23573088496412208)
,p_db_column_name=>'EXPENCES'
,p_display_order=>40
,p_column_identifier=>'EB'
,p_column_label=>'Expences'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23573159461412209)
,p_db_column_name=>'CONTRACT'
,p_display_order=>50
,p_column_identifier=>'EC'
,p_column_label=>'Contract'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23573292398412210)
,p_db_column_name=>'MODULE'
,p_display_order=>60
,p_column_identifier=>'ED'
,p_column_label=>'Module'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23573554738412213)
,p_db_column_name=>'EXP'
,p_display_order=>70
,p_column_identifier=>'EG'
,p_column_label=>'Exp'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23573482544412212)
,p_db_column_name=>'SEQ'
,p_display_order=>110
,p_column_identifier=>'EF'
,p_column_label=>'Seq'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23573879874412216)
,p_db_column_name=>'PROJECT_DESC'
,p_display_order=>120
,p_column_identifier=>'EJ'
,p_column_label=>'Project Description'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23573986681412217)
,p_db_column_name=>'ID'
,p_display_order=>140
,p_column_identifier=>'EK'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23574073135412218)
,p_db_column_name=>'TASK_DETAILS'
,p_display_order=>150
,p_column_identifier=>'EL'
,p_column_label=>'Task Details'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(15760494688455984)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23574149862412219)
,p_db_column_name=>'GRADE'
,p_display_order=>160
,p_column_identifier=>'EM'
,p_column_label=>'Grade'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23574209541412220)
,p_db_column_name=>'ESTIMATED_DAYS'
,p_display_order=>170
,p_column_identifier=>'EN'
,p_column_label=>'Estimated days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23574394757412221)
,p_db_column_name=>'ENROLLED_DAYS'
,p_display_order=>180
,p_column_identifier=>'EO'
,p_column_label=>'Enrolled days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23574438855412222)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>190
,p_column_identifier=>'EP'
,p_column_label=>'Description'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23574515359412223)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>200
,p_column_identifier=>'EQ'
,p_column_label=>'DSP code'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(1991986855473901)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23574650055412224)
,p_db_column_name=>'COMPANY_CODE'
,p_display_order=>210
,p_column_identifier=>'ER'
,p_column_label=>'Company code'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(15612817231694462)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23574771944412225)
,p_db_column_name=>'START_DATE'
,p_display_order=>220
,p_column_identifier=>'ES'
,p_column_label=>'Start date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23574877472412226)
,p_db_column_name=>'END_DATE'
,p_display_order=>230
,p_column_identifier=>'ET'
,p_column_label=>'End date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23574990636412227)
,p_db_column_name=>'CONTRACT_TYPE_ID'
,p_display_order=>240
,p_column_identifier=>'EU'
,p_column_label=>'Contract type id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(15819099105941708)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23575087857412228)
,p_db_column_name=>'WHO_CREATED'
,p_display_order=>250
,p_column_identifier=>'EV'
,p_column_label=>'Who created'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23575165310412229)
,p_db_column_name=>'ACCOUNT_MANAGER'
,p_display_order=>260
,p_column_identifier=>'EW'
,p_column_label=>'Account manager'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23575279619412230)
,p_db_column_name=>'USAGE_TYPE'
,p_display_order=>270
,p_column_identifier=>'EX'
,p_column_label=>'Usage type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(1974049848378104)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23575301131412231)
,p_db_column_name=>'PARENT_CONTRACT'
,p_display_order=>280
,p_column_identifier=>'EY'
,p_column_label=>'Parent contract'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23575421613412232)
,p_db_column_name=>'PROJECT_NAME'
,p_display_order=>290
,p_column_identifier=>'EZ'
,p_column_label=>'Project name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23575521266412233)
,p_db_column_name=>'REF_PM'
,p_display_order=>300
,p_column_identifier=>'FA'
,p_column_label=>'Ref pm'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23575667400412234)
,p_db_column_name=>'REF_INTERNAL'
,p_display_order=>310
,p_column_identifier=>'FB'
,p_column_label=>'Ref internal'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23575736062412235)
,p_db_column_name=>'OFFER_STATUS'
,p_display_order=>320
,p_column_identifier=>'FC'
,p_column_label=>'Offer status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(1974234826383220)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23575810282412236)
,p_db_column_name=>'REMARKS'
,p_display_order=>330
,p_column_identifier=>'FD'
,p_column_label=>'Remarks'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23575920133412237)
,p_db_column_name=>'STATUS'
,p_display_order=>340
,p_column_identifier=>'FE'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(1974458000386842)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23576077203412238)
,p_db_column_name=>'REFERENCES'
,p_display_order=>350
,p_column_identifier=>'FF'
,p_column_label=>'References'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(20909035044019253)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23576108046412239)
,p_db_column_name=>'ACCEPTANCE_DATE'
,p_display_order=>360
,p_column_identifier=>'FG'
,p_column_label=>'Acceptance date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23576284442412240)
,p_db_column_name=>'DELIVERY_DATE'
,p_display_order=>370
,p_column_identifier=>'FH'
,p_column_label=>'Delivery date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23576365201412241)
,p_db_column_name=>'PROJECTDESCRIPTION'
,p_display_order=>380
,p_column_identifier=>'FI'
,p_column_label=>'Project Description'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27085584512379502)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>400
,p_column_identifier=>'FM'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27085676917379503)
,p_db_column_name=>'TASK_ENROLLMENT'
,p_display_order=>410
,p_column_identifier=>'FN'
,p_column_label=>'Task enrollment'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27085709291379504)
,p_db_column_name=>'EMPLOYEE_ENROLLMENT'
,p_display_order=>420
,p_column_identifier=>'FO'
,p_column_label=>'Employee enrollment'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29347235434709414)
,p_db_column_name=>'G.NAME||''-''||D.E_NAME'
,p_display_order=>430
,p_column_identifier=>'FP'
,p_column_label=>'Task'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27086906142379516)
,p_db_column_name=>'CONID'
,p_display_order=>440
,p_column_identifier=>'FQ'
,p_column_label=>'Conid'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27087486478379521)
,p_db_column_name=>'REPORTMANAGEMENT'
,p_display_order=>450
,p_column_identifier=>'FR'
,p_column_label=>'Reportmanagement'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27087572106379522)
,p_db_column_name=>'EFFORTREMAINING'
,p_display_order=>460
,p_column_identifier=>'FS'
,p_column_label=>'Effortremaining'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(23526560336920011)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'235266'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_view_mode=>'REPORT'
,p_report_columns=>'CONID:COMPANY_CODE:PROJECT_DESC:ACCOUNT_MANAGER:DSP_CODE:PROJECTDESCRIPTION:PROJECT_NAME:TASK_ENROLLMENT:EMPLOYEE:EMPLOYEE_ENROLLMENT:STATUS:GRADE:ESTIMATED_DAYS:ENROLLED_DAYS:START_DATE:END_DATE:CONTRACT_TYPE_ID:USAGE_TYPE:PARENT_CONTRACT:REF_INTERN'
||'AL:ACCEPTANCE_DATE:DELIVERY_DATE:G.NAME||''-''||D.E_NAME:REPORTMANAGEMENT:EFFORTREMAINING'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29346734666709409)
,p_plug_name=>'Employees & Clients'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29346235591709404)
,p_plug_name=>'Statistics of Enrollment'
,p_parent_plug_id=>wwv_flow_api.id(29346734666709409)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(29346344233709405)
,p_region_id=>wwv_flow_api.id(29346235591709404)
,p_chart_type=>'pie'
,p_height=>'400'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_value_format_scaling=>'auto'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(29346456208709406)
,p_chart_id=>wwv_flow_api.id(29346344233709405)
,p_seq=>10
,p_name=>'Enrollment'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null, a.dsp_code  label, project_pck.get_contract_enrollment(a.id)  value',
'from "LGS_CONTRACTS" a,',
'lgs_projects b ,',
'prj_projectwork_types c',
'where  a.id = b.contract_id ',
' and a.created_date is not null ',
' ---- and  project_pck.get_if_contract_disp (a.id, V(''APP_USER'')) = 1',
'  and  b.id= c.proj_id ',
'group by a.id, a.dsp_code',
'order by label'))
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55104983408705816)
,p_plug_name=>'Enrollment vs Estimation'
,p_parent_plug_id=>wwv_flow_api.id(29346734666709409)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20902053146019133)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(27582213498010996)
,p_region_id=>wwv_flow_api.id(55104983408705816)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(27582779237010999)
,p_chart_id=>wwv_flow_api.id(27582213498010996)
,p_seq=>10
,p_name=>'Enrollment'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null, a.dsp_code  label, project_pck.get_contract_enrollment(a.id)  value',
'from "LGS_CONTRACTS" a,',
'lgs_projects b ,',
'prj_projectwork_types c',
'where  a.id = b.contract_id ',
' and a.created_date is not null ',
' ---- and  project_pck.get_if_contract_disp (a.id, V(''APP_USER'')) = 1',
'  and  b.id= c.proj_id ',
'group by a.id, a.dsp_code',
'order by label'))
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(29346893088709410)
,p_chart_id=>wwv_flow_api.id(27582213498010996)
,p_seq=>20
,p_name=>'Estimation'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null, a.dsp_code  label, project_pck.get_contract_estimate(a.id)  value',
'from "LGS_CONTRACTS" a,',
'lgs_projects b ,',
'prj_projectwork_types c',
'where  a.id = b.contract_id ',
' and a.created_date is not null ',
' ---- and  project_pck.get_if_contract_disp (a.id, V(''APP_USER'')) = 1',
'  and  b.id= c.proj_id ',
'group by a.id, a.dsp_code',
'order by label'))
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(29346134179709403)
,p_chart_id=>wwv_flow_api.id(27582213498010996)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(29346027830709402)
,p_chart_id=>wwv_flow_api.id(27582213498010996)
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
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58650376015046100)
,p_plug_name=>'Statistics of Estimation'
,p_parent_plug_id=>wwv_flow_api.id(29346734666709409)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20902053146019133)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(29326521992528263)
,p_region_id=>wwv_flow_api.id(58650376015046100)
,p_chart_type=>'pie'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_value_format_scaling=>'auto'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(29327098243528264)
,p_chart_id=>wwv_flow_api.id(29326521992528263)
,p_seq=>10
,p_name=>'Estimation'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id link, a.dsp_code  label, project_pck.get_contract_estimate(a.id)  value',
'from "LGS_CONTRACTS" a,',
'lgs_projects b ,',
'prj_projectwork_types c',
'where  a.id = b.contract_id ',
' and a.created_date is not null ',
' --and  project_pck.get_if_contract_disp (a.id, V(''APP_USER'')) = 1',
'  and  b.id= c.proj_id ',
'group by a.id, a.dsp_code',
'order by label'))
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_link_target=>'f?p=&APP_ID.:77:&SESSION.::&DEBUG.:RP:P77_CONTRACT:&LINK.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58765903004946538)
,p_plug_name=>'Production: Statistics of Enrollment'
,p_parent_plug_id=>wwv_flow_api.id(29346734666709409)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20902053146019133)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(29385660139030391)
,p_region_id=>wwv_flow_api.id(58765903004946538)
,p_chart_type=>'pie'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_legend_rendered=>'on'
,p_legend_position=>'top'
,p_overview_rendered=>'off'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(29386126869030393)
,p_chart_id=>wwv_flow_api.id(29385660139030391)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select null, e.employee  label,  e.NO_OF_HOURS value',
'  from LGS_CONTRACTS  a, lgs_projects   b,PRJ_PROJECTWORK_TYPES  c ,  PRJ_WORK_TYPES d , PRJ_ENROLLED_DETS e',
'  where  a.id = b.contract_id ',
'  and  b.id= c.proj_id  ',
'  and c.WRKTYP_ID= d.id and c.ID = e.PROJECT_WORKTYPE_ID',
'  and a.created_date is not null ',
'---and  project_pck.get_if_contract_disp (a.id, V(''APP_USER'')) = 1',
'',
'and a.STATUS NOT IN (4,5)',
'--and (a.id = :P77_CONTRACT OR :P77_CONTRACT IS NULL)',
'order by label'))
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(75494091169638702)
,p_plug_name=>'Bi Report'
,p_parent_plug_id=>wwv_flow_api.id(29346734666709409)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_grid_column_span=>12
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29347105607709413)
,p_plug_name=>'Search Criteria'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>21
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76283054859357457)
,p_plug_name=>'Project Plan - Contract &P77_CONTRACT_NAME.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20902053146019133)
,p_plug_display_sequence=>31
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id',
'  from LGS_CONTRACTS  a, lgs_projects   b,PRJ_PROJECTWORK_TYPES  c ,  PRJ_WORK_TYPES d , PRJ_ENROLLED_DETS e',
' where  a.id = b.contract_id and  b.id= c.proj_id  and c.WRKTYP_ID= d.id and c.ID = e.PROJECT_WORKTYPE_ID',
'  and a.created_date is not null and USAGE_TYPE = 2 ',
'  AND A.ID = :P77_CONTRACT'))
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(48920767456552897)
,p_default_chart_type=>'ProjectGantt'
,p_chart_title=>'Project Plan'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart_27363002336804567'
,p_chart_width=>1200
,p_chart_height=>400
,p_display_attr=>':H:::::::::::N::::::::'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y::N:S:E::'
,p_pie_attr=>':::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME:Y:Y:Series::::Y:N'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'::'
,p_y_axis_label_font=>'::'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'::'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_grid_labels_font=>'Tahoma:10:#000000'
,p_chart_title_font=>'Tahoma:14:#0E1880'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(48921179354552901)
,p_chart_id=>wwv_flow_api.id(48920767456552897)
,p_series_seq=>10
,p_series_name=>'Project Plan'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select null, e.employee ||''-''||b.module|| ''-'' || e.module || ''-'' || g.name || ''-'' || d.E_NAME task_name,e.id, null, e.From_date, e.From_date + (No_Of_Hours/8), null ',
'  from LGS_CONTRACTS  a, lgs_projects   b,PRJ_PROJECTWORK_TYPES  c ,  PRJ_WORK_TYPES d , PRJ_ENROLLED_DETS e, WORK_TYPE_GROUPS g',
' where  a.id = b.contract_id and  b.id= c.proj_id  and c.WRKTYP_ID= d.id and c.ID = e.PROJECT_WORKTYPE_ID',
'  and a.created_date is not null and USAGE_TYPE = 2 ',
'  AND A.ID = :P77_CONTRACT',
'  and d.work_type_group = g.id',
'  ORDER BY 5'))
,p_series_query_type=>'SQL_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>100
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(881286352166881714)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(29346734666709409)
,p_button_name=>'New'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58523906257293402)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(75494091169638702)
,p_button_name=>'ResourceManagement'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Resource Management'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_button_redirect_url=>'http://192.168.3.201:7001/xmlpserver/PMS/Reports/Resource_Management.xdo?id=tareif&passwd=tareif&V_user=&APP_USER.&_xpt=1&_xmode=4&_xf=xlsx&_xautorun=true'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(881286252690881713)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(29346734666709409)
,p_button_name=>'Report'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Report'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_button_redirect_url=>'f?p=222:47:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(27087630624379523)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(75494091169638702)
,p_button_name=>'EffortRemaining'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Effort Remaining'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(881286414206881715)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(29346734666709409)
,p_button_name=>'remaining_effort'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Remaining'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_button_redirect_url=>'f?p=&APP_ID.:144:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23576970655412247)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(29347105607709413)
,p_button_name=>'GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Go'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT-CENTER'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(27090351306379550)
,p_branch_name=>'Go To Page http://192.168.3.201:7001/xmlpserver/PMS/Reports/Effort_Remaining.xdo?id=tareif&passwd=tareif&V_user=&APP_USER.&numofdayspermonth=V(''Number of Working Days'')&_xpt=1&_xmode=4&_xf=xlsx&_xautorun=true'
,p_branch_action=>'http://192.168.3.201:7001/xmlpserver/PMS/Reports/Effort_Remaining.xdo?id=tareif&passwd=tareif&V_user=&APP_USER.&numofdayspermonth=&P77_NUMBEROFWORKINGDAYS.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(27087630624379523)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23576784133412245)
,p_name=>'P77_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(29347105607709413)
,p_prompt=>'Company '
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23576877542412246)
,p_name=>'P77_TASK'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(29347105607709413)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27085841416379505)
,p_name=>'P77_CONTRACT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(29347105607709413)
,p_prompt=>'Contract'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE d, ID r',
'from   LGS_CONTRACTS',
'WHERE created_date is not null and USAGE_TYPE = 2',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27090060081379547)
,p_name=>'P77_NUMBEROFWORKINGDAYS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(75494091169638702)
,p_item_default=>'22'
,p_prompt=>'Number of Working Days'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>3
,p_cMaxlength=>2
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_rowspan=>9
,p_grid_column=>6
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29346917430709411)
,p_name=>'P77_CONTRACT_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(23500518884918510)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(60713192588026602)
,p_name=>'P77_REMAINING_EFFORT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(29346734666709409)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23577210660412250)
,p_name=>'rows color'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(23500518884918510)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27085456359379501)
,p_event_id=>wwv_flow_api.id(23577210660412250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''td[headers="Delivery date"]'').each(function() {  ',
'    var CurrentMonth = date.getDate() + ''/'' + date.getMonth() + ''/'' + date.getFullYear();',
'  if ( $(this).text() <= CurrentMonth ) {  ',
'    $(this).closest(''tr'').find(''td'').css({"color":"red"});  ',
' ',
'  }  ',
'});',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27090142163379548)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P77_NUMBEROFWORKINGDAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27090233461379549)
,p_event_id=>wwv_flow_api.id(27090142163379548)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29347035346709412)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetContractName'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select dsp_code into :P77_CONTRACT_NAME',
'from lgs_contracts',
'where id = :P77_contract;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P77_CONTRACT IS NOT NULL'
,p_process_when_type=>'PLSQL_EXPRESSION'
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
