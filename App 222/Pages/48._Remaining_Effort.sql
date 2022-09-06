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
--   Date and Time:   10:35 Tuesday September 6, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 48
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00048
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>48);
end;
/
prompt --application/pages/page_00048
begin
wwv_flow_imp_page.create_page(
 p_id=>48
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'Remaining Effort'
,p_step_title=>'Remaining Effort'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20220413124451'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(724553421044242833)
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
 p_id=>wwv_flow_imp.id(724554880296242847)
,p_plug_name=>'Summary'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'c.dsp_code,c.id,p.dsp_code pr,c.ACCOUNT_MANAGER man,',
'wtg.name Work_Type, ',
'pwt.e_name || ''-'' || wtg.name task ,',
'project_pck.get_project_work_estimate_num(ppt.id) Estimated,',
'project_pck.get_task_enrollment(ppt.id,''0'',''d'') Enrollment,',
'project_pck.get_project_work_remaining_num(ppt.id) Remaining,',
' -- case when (project_pck.get_project_work_estimate_num(ppt.id) -',
'	--		project_pck.get_task_enrollment(ppt.id,''0'',''d'')) < 0 then 0',
'       --else ',
'       project_pck.get_project_work_estimate_num(ppt.id) -',
'			project_pck.get_task_enrollment(ppt.id,''0'',''d'')',
'      -- end',
'	 WorkNeeded,',
'     case when project_pck.get_project_work_remaining_num(ppt.id) < (project_pck.get_project_work_estimate_num(ppt.id) -',
'			project_pck.get_task_enrollment(ppt.id,''0'',''d'')) then (project_pck.get_project_work_estimate_num(ppt.id) -',
'			project_pck.get_task_enrollment(ppt.id,''0'',''d''))',
'     else project_pck.get_project_work_remaining_num(ppt.id)',
'     end',
'     MaxRemaining,',
'project_pck.Get_work_still_needed(ppt.id) wn,',
'case when',
' project_pck.get_project_work_sys_rem_num(ppt.id)<0 then 0',
' else project_pck.get_project_work_sys_rem_num(ppt.id) end  System_Remaining',
'from prj_projectwork_types ppt, prj_work_types pwt, work_type_groups wtg, lgs_projects p, lgs_contracts c, prj_companies co',
'where p.id =ppt.proj_id',
'and   p.contract_id = c.id',
'and (',
'    (:APP_USER <> ''WADIH'' AND project_pck.get_if_contract_disp (c.id, :APP_USER) = 1) ',
'    or',
'    (:APP_USER = ''WADIH'' AND (project_pck.get_if_contract_disp (c.id, ''DIANA'') = 1 OR project_pck.get_if_contract_disp (c.id, ''HYAM'') = 1 ))',
'     )',
'and   ppt.wrktyp_id = pwt.id',
'and   pwt.work_type_group = wtg.id',
'and   c.company_code = co.code',
'--and  project_pck.get_if_prj_worktype_disp(ppt.id, :P5_ZERO) = 1',
'and   ( NVL(C.STATUS,1) = 1 AND NVL(C.FINALIZED,''N'')=''N'')',
'--and co.bus_type = nvl(:P48_BUS_TYPE, co.bus_type)',
'and c.WHO_CREATED = nvl(:P48_ACCOUNT_MANAGER, c.WHO_CREATED)',
'and (c.parent_contract = nvl(:P48_PARENT_CONTRACT, c.parent_contract) or c.id = nvl(:P48_PARENT_CONTRACT, c.id) )',
'and c.usage_type=2',
'and ((:P48_MNT is null and c.contract_type_id <> 2) or :P48_MNT is not null)',
'--and c.company_code = nvl(:P30_CLIENT,c.company_code)',
'--and UPPER(c.dsp_code) like ''%''|| UPPER(nvl(:P30_CNT, c.dsp_code)) || ''%''',
'--group by wtg.name, wtg.id'))
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(724554937734242848)
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
,p_internal_uid=>724554937734242848
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(724555033490242849)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Dsp code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(724555131296242850)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374089599230945201)
,p_db_column_name=>'WORK_TYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Work type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374089662245945202)
,p_db_column_name=>'TASK'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Task'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374089796320945203)
,p_db_column_name=>'ESTIMATED'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Estimated'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374089891814945204)
,p_db_column_name=>'ENROLLMENT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Enrollment'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374089905033945205)
,p_db_column_name=>'REMAINING'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Remaining'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374090044386945206)
,p_db_column_name=>'WORKNEEDED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Workneeded'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374090195047945207)
,p_db_column_name=>'WN'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Wn'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374090220358945208)
,p_db_column_name=>'SYSTEM_REMAINING'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'System remaining'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374090329118945209)
,p_db_column_name=>'MAXREMAINING'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Maxremaining'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374090557108945211)
,p_db_column_name=>'PR'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Pr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374090831133945214)
,p_db_column_name=>'MAN'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Man'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1374098339643948996)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'13740984'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'DSP_CODE:ID:WORK_TYPE:TASK:ESTIMATED:ENROLLMENT:REMAINING:WORKNEEDED:WN:SYSTEM_REMAINING:MAXREMAINING:PR:MAN'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(1383009998393238810)
,p_report_id=>wwv_flow_imp.id(1374098339643948996)
,p_group_by_columns=>'WORK_TYPE'
,p_function_01=>'SUM'
,p_function_column_01=>'ESTIMATED'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Estimated'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'Y'
,p_function_02=>'SUM'
,p_function_column_02=>'REMAINING'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'Remaining'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'Y'
,p_function_03=>'SUM'
,p_function_column_03=>'WORKNEEDED'
,p_function_db_column_name_03=>'APXWS_GBFC_03'
,p_function_label_03=>'Sys Remaining = Estimated - En'
,p_function_format_mask_03=>'999G999G999G999G990D00'
,p_function_sum_03=>'Y'
,p_function_04=>'SUM'
,p_function_column_04=>'ENROLLMENT'
,p_function_db_column_name_04=>'APXWS_GBFC_04'
,p_function_label_04=>'Done'
,p_function_format_mask_04=>'999G999G999G999G990D00'
,p_function_sum_04=>'Y'
,p_function_05=>'SUM'
,p_function_column_05=>'MAXREMAINING'
,p_function_db_column_name_05=>'APXWS_GBFC_05'
,p_function_label_05=>'Max Remaining Indicator'
,p_function_format_mask_05=>'999G999G999G999G990D00'
,p_function_sum_05=>'Y'
,p_function_06=>'RATIO_TO_REPORT_SUM'
,p_function_column_06=>'MAXREMAINING'
,p_function_db_column_name_06=>'APXWS_GBFC_06'
,p_function_label_06=>'Percentage'
,p_function_format_mask_06=>'999G999G999G999G990D00'
,p_function_sum_06=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1286501697374642997)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148724461536243505)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(148773243826244270)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(148743388538243690)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1286502121458643000)
,p_plug_name=>'Remaining Effort'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'c.dsp_code, c.description,c.id,p.dsp_code pr,c.ACCOUNT_MANAGER man,',
'(',
'   /*select listagg(cs.dsp_code,'';'')  WITHIN GROUP(',
'    ORDER BY',
'        cs.dsp_code',
'    ) As children',
'    from lgs_contracts cs',
'    where cs.parent_contract = c.id',
'    and cs.usage_type = 2',
'    */',
'    select distinct listagg(transfer_data.get_module_desc(ps.module),'';'')  WITHIN GROUP(',
'    ORDER BY',
'        transfer_data.get_module_desc(ps.module)',
'    ) As children',
'    from lgs_projects ps',
'    where ps.contract_id = c.id',
') children,',
'wtg.name Work_Type, ',
'pwt.e_name || ''-'' || wtg.name task ,',
'project_pck.get_project_work_estimate_num(ppt.id) Estimated,',
'project_pck.get_task_enrollment(ppt.id,''0'',''d'') Enrollment,',
'project_pck.get_project_work_remaining_num(ppt.id) Remaining,',
'  project_pck.get_project_work_estimate_num(ppt.id) -',
'			project_pck.get_task_enrollment(ppt.id,''0'',''d'')',
'	 WorkNeeded,',
'project_pck.Get_work_still_needed(ppt.id) wn,',
'project_pck.get_project_work_sys_rem_num(ppt.id)  System_Remaining',
'from prj_projectwork_types ppt, prj_work_types pwt, work_type_groups wtg, lgs_projects p, lgs_contracts c, prj_companies co',
'where p.id =ppt.proj_id',
'and   p.contract_id = c.id',
'and (',
'    (:APP_USER <> ''WADIH'' AND project_pck.get_if_contract_disp (c.id, :APP_USER) = 1) ',
'    or',
'    (:APP_USER = ''WADIH'' AND (project_pck.get_if_contract_disp (c.id, ''DIANA'') = 1 OR project_pck.get_if_contract_disp (c.id, ''HYAM'') = 1 ))',
'     )',
'and   ppt.wrktyp_id = pwt.id',
'and   pwt.work_type_group = wtg.id',
'and   c.company_code = co.code',
'--and  project_pck.get_if_prj_worktype_disp(ppt.id, :P5_ZERO) = 1',
'and   ( NVL(C.STATUS,1) = 1 AND NVL(C.FINALIZED,''N'')=''N'')',
'--and co.bus_type = nvl(:P48_BUS_TYPE, co.bus_type)',
'and c.WHO_CREATED = nvl(:P48_ACCOUNT_MANAGER, c.WHO_CREATED)',
'and (c.parent_contract = nvl(:P48_PARENT_CONTRACT, c.parent_contract) or c.id = nvl(:P48_PARENT_CONTRACT, c.id) )',
'and c.usage_type=2',
'and ((:P48_MNT is null and c.contract_type_id <> 2) or :P48_MNT is not null)',
'--and c.company_code = nvl(:P30_CLIENT,c.company_code)',
'--and UPPER(c.dsp_code) like ''%''|| UPPER(nvl(:P30_CNT, c.dsp_code)) || ''%''',
'--group by wtg.name, wtg.id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1286502267947643000)
,p_name=>'Remaining Effort'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>1286502267947643000
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1286502689055643012)
,p_db_column_name=>'WORK_TYPE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Work Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1286503446033643015)
,p_db_column_name=>'ESTIMATED'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Estimated'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1286503892227643015)
,p_db_column_name=>'ENROLLMENT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Enrollment'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1286504275513643015)
,p_db_column_name=>'REMAINING'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Remaining'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1286504650883643016)
,p_db_column_name=>'WORKNEEDED'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Workneeded'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1286505010485643016)
,p_db_column_name=>'WN'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Wn'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1286505436143643016)
,p_db_column_name=>'SYSTEM_REMAINING'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'System Remaining'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(881288099267881731)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>18
,p_column_identifier=>'I'
,p_column_label=>'Dsp code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(724554567542242844)
,p_db_column_name=>'ID'
,p_display_order=>28
,p_column_identifier=>'J'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(724554721911242846)
,p_db_column_name=>'TASK'
,p_display_order=>38
,p_column_identifier=>'L'
,p_column_label=>'Task'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374090410784945210)
,p_db_column_name=>'PR'
,p_display_order=>48
,p_column_identifier=>'M'
,p_column_label=>'Pr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374090653619945212)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>58
,p_column_identifier=>'N'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374090780654945213)
,p_db_column_name=>'CHILDREN'
,p_display_order=>68
,p_column_identifier=>'O'
,p_column_label=>'Children'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374090976122945215)
,p_db_column_name=>'MAN'
,p_display_order=>78
,p_column_identifier=>'P'
,p_column_label=>'Man'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1286506018585644416)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'PIVOT'
,p_report_alias=>'12865061'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_view_mode=>'REPORT'
,p_report_columns=>'WORK_TYPE:ESTIMATED:ENROLLMENT:REMAINING:WORKNEEDED:WN:SYSTEM_REMAINING:DSP_CODE:ID:TASK:PR:DESCRIPTION:CHILDREN:MAN'
);
wwv_flow_imp_page.create_worksheet_pivot(
 p_id=>wwv_flow_imp.id(1387793720044648979)
,p_report_id=>wwv_flow_imp.id(1286506018585644416)
,p_pivot_columns=>'WORK_TYPE'
,p_row_columns=>'DSP_CODE:DESCRIPTION:CHILDREN'
);
wwv_flow_imp_page.create_worksheet_pivot_agg(
 p_id=>wwv_flow_imp.id(1387794137934648980)
,p_pivot_id=>wwv_flow_imp.id(1387793720044648979)
,p_display_seq=>1
,p_function_name=>'SUM'
,p_column_name=>'ESTIMATED'
,p_db_column_name=>'PFC1'
,p_column_label=>'Estimated'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_sum=>'Y'
);
wwv_flow_imp_page.create_worksheet_pivot_agg(
 p_id=>wwv_flow_imp.id(1387794517334648980)
,p_pivot_id=>wwv_flow_imp.id(1387793720044648979)
,p_display_seq=>2
,p_function_name=>'SUM'
,p_column_name=>'REMAINING'
,p_db_column_name=>'PFC2'
,p_column_label=>'Remaining'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_sum=>'Y'
);
wwv_flow_imp_page.create_worksheet_pivot_agg(
 p_id=>wwv_flow_imp.id(1387794922281648980)
,p_pivot_id=>wwv_flow_imp.id(1387793720044648979)
,p_display_seq=>3
,p_function_name=>'SUM'
,p_column_name=>'WORKNEEDED'
,p_db_column_name=>'PFC3'
,p_column_label=>'Sys Remaining'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_sum=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(724553886167242837)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(724553421044242833)
,p_button_name=>'Go'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_image_alt=>'Go'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(724553395398242832)
,p_name=>'P48_BUS_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(724553421044242833)
,p_prompt=>'Business Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e_name,code',
'from logos.lgs_bus_types',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(724553908082242838)
,p_name=>'P48_PARENT_CONTRACT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(724553421044242833)
,p_prompt=>'Parent Cnt'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSP_CODE,ID',
'from LGS_CONTRACTS',
'where  usage_type = 2',
'and company_code in (',
'    select com.code from prj_companies com where com.bus_type = :P48_bus_type ',
')',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1374091067886945216)
,p_name=>'P48_ACCOUNT_MANAGER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(724553421044242833)
,p_prompt=>'Manager'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct account_manager v, account_manager l',
'from lgs_contracts',
'where created_date > to_date(''01-JAN-2021'',''dd-MON-yyyy'')'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1374091267391945218)
,p_name=>'P48_MNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(724553421044242833)
,p_prompt=>'Include Maintenance'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Yes;Yes'
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_imp.id(148742305227243640)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(724554071633242839)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P48_BUS_TYPE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(724554177988242840)
,p_event_id=>wwv_flow_imp.id(724554071633242839)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'null;',
'end;'))
,p_attribute_02=>'P48_BUS_TYPE'
,p_attribute_03=>'P48_BUS_TYPE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(724554218581242841)
,p_event_id=>wwv_flow_imp.id(724554071633242839)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_PARENT_CONTRACT'
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
