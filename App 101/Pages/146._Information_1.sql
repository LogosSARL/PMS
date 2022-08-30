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
--   Date and Time:   11:27 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 146
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00146
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>146);
end;
/
prompt --application/pages/page_00146
begin
wwv_flow_imp_page.create_page(
 p_id=>146
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Information'
,p_step_title=>'Information'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'ELISSAR'
,p_last_upd_yyyymmddhh24miss=>'20220708110036'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3186767116371723112)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID",',
''''' AS CHILD, '''' as proposals,'''' parentcontract ,"APPROVAL_DATE",',
'    CASE WHEN RFP_FILES IS NOT NULL THEN',
'''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || RFP_FILES END AS RFPCONTENT,',
'',
'    CASE WHEN RESPONSE_TO_RFP_FILES  IS NOT NULL THEN',
'''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || RESPONSE_TO_RFP_FILES END AS ResponseCONTENT,',
'"DSP_CODE","REF_TO_PIPELINE","REF_TO_CONTRACT","PARENT_CONTRACT",',
'"COMPANY_CODE",',
'(select distinct dtl.dsp_code from prj_companies dtl where dtl.code = lgs.company_code',
'and rownum = 1) as com_code',
',"REF_TO_PIPELINE" as pipeline,',
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
'id ReCreateContractData,BRANCH_ID, '''' as contractdocument   , ''BLUE'' color, created_date',
'from LGS_CONTRACTS lgs ---, lgs_logos_branches ',
'WHERE  ',
'----  need permission',
'project_pck.get_if_contract_disp (id, V(''APP_USER'')) = 1  and  ---- lgs_contracts.BRANCH_ID(+) = lgs_logos_branches.llb_id and ',
'USAGE_TYPE = 2 ',
'AND',
'created_date is not null',
'and NVL(OFFER_STATUS,0) != 1',
'and upper(dsp_code) not like ''%TEST%''',
'order by start_date,30,1  desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(3186767156802723112)
,p_name=>'Information'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JAWAD'
,p_internal_uid=>3186767156802723112
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593589718137177672)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593590102168177672)
,p_db_column_name=>'CHILD'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Child'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593590596052177672)
,p_db_column_name=>'PROPOSALS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Proposals'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593590923101177673)
,p_db_column_name=>'PARENTCONTRACT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Parentcontract'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593591371302177673)
,p_db_column_name=>'APPROVAL_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Approval Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593591723615177674)
,p_db_column_name=>'RFPCONTENT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Rfpcontent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593592140039177674)
,p_db_column_name=>'RESPONSECONTENT'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Responsecontent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593592565909177674)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Dsp Code'
,p_column_link=>'f?p=101:40:&SESSION.::&DEBUG.:RP:P40_CID,P40_CONTRACT_ID,P40_PCI:#ID#,#ID#,#ID#'
,p_column_linktext=>'#DSP_CODE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593592944091177675)
,p_db_column_name=>'REF_TO_PIPELINE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Ref To Pipeline'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593593343658177675)
,p_db_column_name=>'REF_TO_CONTRACT'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Ref To Contract'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593593718099177675)
,p_db_column_name=>'PARENT_CONTRACT'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Parent Contract'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593594148408177675)
,p_db_column_name=>'COMPANY_CODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(148754054268244016)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593594567807177675)
,p_db_column_name=>'PIPELINE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Pipeline'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593594941022177676)
,p_db_column_name=>'FINALIZED'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Finalized'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593595314534177676)
,p_db_column_name=>'STATUS'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(148755589278244031)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593595751471177676)
,p_db_column_name=>'row_color'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Row Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593596159607177676)
,p_db_column_name=>'CONTRACT_DESC'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Contract Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593596539262177677)
,p_db_column_name=>'ENR'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Enr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593596902990177677)
,p_db_column_name=>'EST'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Est'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593597317832177678)
,p_db_column_name=>'REM'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Rem'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593597744919177678)
,p_db_column_name=>'NET'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Net'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593598116907177678)
,p_db_column_name=>'ENRUNITS'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Enrunits'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593598577069177679)
,p_db_column_name=>'ESTUNITS'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Estunits'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593598988126177679)
,p_db_column_name=>'REMUNITS'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Remunits'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593599305626177679)
,p_db_column_name=>'PM'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Pm'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593599742776177679)
,p_db_column_name=>'LAST_UPDATED'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Last Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593600192087177679)
,p_db_column_name=>'STAFFENROL'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Staffenrol'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593600516621177680)
,p_db_column_name=>'MODULEWORKTYPE'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Moduleworktype'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593600918381177680)
,p_db_column_name=>'RECREATECONTRACTDATA'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Recreatecontractdata'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593601399578177680)
,p_db_column_name=>'BRANCH_ID'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Branch Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593601778494177680)
,p_db_column_name=>'CONTRACTDOCUMENT'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Contractdocument'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593602163838177680)
,p_db_column_name=>'COLOR'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1593589463236177671)
,p_db_column_name=>'COM_CODE'
,p_display_order=>42
,p_column_identifier=>'AG'
,p_column_label=>'Com code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1374091911175945225)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>52
,p_column_identifier=>'AH'
,p_column_label=>'Created date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(3186781588509736221)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'15936025'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COM_CODE:APPROVAL_DATE:DSP_CODE:FINALIZED:STATUS:CONTRACT_DESC:ENR:EST:REM:NET:PM::CREATED_DATE'
,p_break_on=>'COM_CODE:0:0:0:0:0'
,p_break_enabled_on=>'COM_CODE:0:0:0:0:0'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(1593757473513742868)
,p_report_id=>wwv_flow_imp.id(3186781588509736221)
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'STATUS'
,p_operator=>'='
,p_expr=>'In Progress'
,p_condition_sql=>' (case when ("STATUS" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''In Progress''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFFF99'
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
