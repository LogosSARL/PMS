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
--     PAGE: 100
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00100
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>100);
end;
/
prompt --application/pages/page_00100
begin
wwv_flow_imp_page.create_page(
 p_id=>100
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Work Needed'
,p_step_title=>'Work Needed'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180116134208'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(142122578788209783)
,p_plug_name=>'Work Needed'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID",'''' AS CHILD, '''' as proposals,'''' parentcontract ,"APPROVAL_DATE",',
'    "DSP_CODE","REF_TO_PIPELINE","REF_TO_CONTRACT","PARENT_CONTRACT",',
'"COMPANY_CODE","REF_TO_PIPELINE" as pipeline,',
'"FINALIZED","STATUS",account_manager,',
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
'id ReCreateContractData,BRANCH_ID, '''' as contractdocument',
'from LGS_CONTRACTS ---, lgs_logos_branches ',
'WHERE  ',
'----  need permission',
'project_pck.get_if_contract_disp (id, ''WADIH'') = 1  and  ---- lgs_contracts.BRANCH_ID(+) = lgs_logos_branches.llb_id and ',
'USAGE_TYPE = 2 ',
'and created_date is not null',
'and NVL(OFFER_STATUS,0) != 1',
'order by ID  desc'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(142122654227209783)
,p_name=>'Work Needed'
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
,p_owner=>'ADMIN'
,p_internal_uid=>142122654227209783
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142123037309209789)
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
 p_id=>wwv_flow_imp.id(142123451519209791)
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
 p_id=>wwv_flow_imp.id(142123824811209791)
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
 p_id=>wwv_flow_imp.id(142124200064209792)
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
 p_id=>wwv_flow_imp.id(142124688769209792)
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
 p_id=>wwv_flow_imp.id(142125062130209793)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Dsp Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142125424808209794)
,p_db_column_name=>'REF_TO_PIPELINE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Ref To Pipeline'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142125833370209795)
,p_db_column_name=>'REF_TO_CONTRACT'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Ref To Contract'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142126211083209795)
,p_db_column_name=>'PARENT_CONTRACT'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Parent Contract'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142126614040209796)
,p_db_column_name=>'COMPANY_CODE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142127029046209799)
,p_db_column_name=>'PIPELINE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Pipeline'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142127413023209800)
,p_db_column_name=>'FINALIZED'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Finalized'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142127840061209800)
,p_db_column_name=>'STATUS'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142128258820209803)
,p_db_column_name=>'ACCOUNT_MANAGER'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Account Manager'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142128629958209804)
,p_db_column_name=>'CONTRACT_DESC'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Contract Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142129066791209804)
,p_db_column_name=>'ENR'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Enr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142129464832209805)
,p_db_column_name=>'EST'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Est'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142129819363209806)
,p_db_column_name=>'NET'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Net'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142130280087209808)
,p_db_column_name=>'ENRUNITS'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Enrunits'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142130680524209809)
,p_db_column_name=>'ESTUNITS'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Estunits'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142131077592209809)
,p_db_column_name=>'PM'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Pm'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142131451285209810)
,p_db_column_name=>'LAST_UPDATED'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Last Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142131899308209810)
,p_db_column_name=>'STAFFENROL'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Staffenrol'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142132242810209811)
,p_db_column_name=>'MODULEWORKTYPE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Moduleworktype'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142132636278209811)
,p_db_column_name=>'RECREATECONTRACTDATA'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Recreatecontractdata'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142132911593209812)
,p_db_column_name=>'BRANCH_ID'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Branch Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142133307239209813)
,p_db_column_name=>'CONTRACTDOCUMENT'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Contractdocument'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(142133704419212670)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1421338'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ACCOUNT_MANAGER:DSP_CODE:CONTRACT_DESC:APPROVAL_DATE:ENR:EST:NET:'
,p_sort_column_1=>'ACCOUNT_MANAGER'
,p_sort_direction_1=>'ASC'
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
