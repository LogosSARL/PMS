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
,p_user_interface_id=>wwv_flow_imp.id(148753632100243889)
,p_name=>'Contracts'
,p_step_title=>'Contracts'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function getCookie(cname) {',
'  var name = cname + "=";',
'  var decodedCookie = decodeURIComponent(document.cookie);',
'  var ca = decodedCookie.split('';'');',
'  for(var i = 0; i <ca.length; i++) {',
'    var c = ca[i];',
'    while (c.charAt(0) == '' '') {',
'      c = c.substring(1);',
'    }',
'    if (c.indexOf(name) == 0) {',
'      return c.substring(name.length, c.length);',
'    }',
'  }',
'  return "";',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'JAWAD'
,p_last_upd_yyyymmddhh24miss=>'20190109131252'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(293397226257575987)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(148719512587243497)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID", ',
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
'"ACTIVE",',
'"SEQ",',
'project_pck.get_project_days(ID,''e'') Estimate,',
'project_pck.get_task_project_enrollment(ID,''0'',''d'') Work,',
'project_pck.get_project_days(ID,''e'') - project_pck.get_task_project_enrollment(ID,''0'',''d'') Expences,',
'id Exp,',
'id Emp,',
'id Get_from_CSS,',
'PROJECT_PCK.GET_PROJECT_DESC(ID) Project_Desc',
'from "#OWNER#"."LGS_PROJECTS" ',
'where contract_id =    :P40_INTCODE_SELECTED   ---:P40_CONTRACT_ID ',
'order by seq',
'  ',
''))
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
 p_id=>wwv_flow_imp.id(293397269733575988)
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
,p_owner=>'SERINE'
,p_internal_uid=>293397269733575988
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149062791850464098)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP:P20_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149063185352464099)
,p_db_column_name=>'L_DESCRIPTION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'L description'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149063565338464099)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Dsp code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149063943271464100)
,p_db_column_name=>'END_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'End date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149064342976464101)
,p_db_column_name=>'START_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Start date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149064765395464101)
,p_db_column_name=>'CONTRACT_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Contract id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149065158554464102)
,p_db_column_name=>'APPROVAL_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Approval date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149065554146464103)
,p_db_column_name=>'INT_CODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Int code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149065910374464103)
,p_db_column_name=>'TOP LEVEL MODULE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Top level module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149066314461464104)
,p_db_column_name=>'MODULE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Module'
,p_column_link=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:RP:P103_SHOW_WHAT,P103_CURRENT_PROJECT,P103_CURRENT_PROJECT_DESC,P103_ZERO:2,#ID#,#PROJECT_DESC#,0'
,p_column_linktext=>'#MODULE#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149066720191464105)
,p_db_column_name=>'NEW_IMPLEMENTATION'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'New implementation'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149067122116464105)
,p_db_column_name=>'MAINTENANCE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Maintenance'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149067511179464107)
,p_db_column_name=>'PRICING_DATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Pricing date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149067923941464108)
,p_db_column_name=>'ACTIVE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Delete'
,p_column_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP:P21_CONTRACT_ID,P21_PROJECT_ID:#CONTRACT_ID#,#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149068380160464108)
,p_db_column_name=>'SEQ'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Seq'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149068722754464109)
,p_db_column_name=>'ESTIMATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Est'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149069151797464110)
,p_db_column_name=>'WORK'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Enr.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149069565753464110)
,p_db_column_name=>'EXPENCES'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Net'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149069978598464111)
,p_db_column_name=>'EXP'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Exp'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149070373212464111)
,p_db_column_name=>'EMP'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Emp'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149070771233464112)
,p_db_column_name=>'GET_FROM_CSS'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Staff'
,p_column_link=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:RP:P104_CURRENT_PROJECT,P104_CURRENT_PROJECT_DESC,P104_SHOW_WHAT:#ID#,#PROJECT_DESC#,1'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149071118653464112)
,p_db_column_name=>'PROJECT_DESC'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Project desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(293550890982360812)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1490715'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:SEQ:TOP LEVEL MODULE:MODULE:ACTIVE:ESTIMATE:WORK:EXPENCES:GET_FROM_CSS:APPROVAL_DATE:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(293473713256863627)
,p_plug_name=>'Contract'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID",'''' AS CHILD, '''' as proposals,'''' parentcontract ,"APPROVAL_DATE",',
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
'id ReCreateContractData,BRANCH_ID, '''' as contractdocument',
'from LGS_CONTRACTS ---, lgs_logos_branches ',
'WHERE  ',
'----  need permission',
'project_pck.get_if_contract_disp (id, V(''APP_USER'')) = 1  and  ---- lgs_contracts.BRANCH_ID(+) = lgs_logos_branches.llb_id and ',
'USAGE_TYPE = 2 ',
'',
'AND (ID =  :P40_CONTRACT_ID  ',
'     OR :P40_CONTRACT_ID IS NULL)',
'',
'and created_date is not null',
'and NVL(OFFER_STATUS,0) != 1',
'order by ID  desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(293474095691863627)
,p_name=>'Report 1'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:97:&APP_SESSION.::::P97_ROWID:#ROWID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'SERINE'
,p_internal_uid=>293474095691863627
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149053205382464071)
,p_db_column_name=>'ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_link=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.:RP:P83_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149053625618464072)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Integration Code'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID,P40_CONTRACT_DESC,P40_SELECTED_INT_CODE,P40_CID,P40_INTCODE_SELECTED:#ID#,#CONTRACT_DESC#,#DSP_CODE#,#CHILD#,#ID#'
,p_column_linktext=>'#DSP_CODE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149054030492464072)
,p_db_column_name=>'COMPANY_CODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Client'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(15612817231694462)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149054453250464073)
,p_db_column_name=>'FINALIZED'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Finalized'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149054886870464074)
,p_db_column_name=>'PARENT_CONTRACT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Parent Contract'
,p_column_link=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP:P94_CONTRACT_ID:#PARENT_CONTRACT#'
,p_column_linktext=>'PARENT CONTRACT'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149055229511464076)
,p_db_column_name=>'REF_TO_PIPELINE'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Ref To Pipeline'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149055609181464077)
,p_db_column_name=>'REF_TO_CONTRACT'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Ref To Contract'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149056002918464078)
,p_db_column_name=>'STATUS'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149056480070464079)
,p_db_column_name=>'APPROVAL_DATE'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Approval Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149056879319464079)
,p_db_column_name=>'BRANCH_ID'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Branch '
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(81277486830177530)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149046080030464054)
,p_db_column_name=>'CHILD'
,p_display_order=>64
,p_column_identifier=>'BP'
,p_column_label=>'Child'
,p_column_link=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP:P94_VIEW,P94_CNTIDD:Show,#ID#'
,p_column_linktext=>'#CHILD#'
,p_column_type=>'STRING'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149046403348464056)
,p_db_column_name=>'PROPOSALS'
,p_display_order=>74
,p_column_identifier=>'BQ'
,p_column_label=>'Proposal'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP:P36_CONTRACTID:#REF_TO_PIPELINE#'
,p_column_linktext=>'PROPOSALS'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149046871378464057)
,p_db_column_name=>'PARENTCONTRACT'
,p_display_order=>84
,p_column_identifier=>'BR'
,p_column_label=>'Parent Contract'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P94_CONRACT_ID:#ID#'
,p_column_linktext=>'PARENTCONTRACT'
,p_column_type=>'STRING'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149047218555464058)
,p_db_column_name=>'RFPCONTENT'
,p_display_order=>94
,p_column_identifier=>'BS'
,p_column_label=>'RPF'
,p_column_html_expression=>'<A HREF="#RFPCONTENT#">RFP FILE</A>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149047623062464058)
,p_db_column_name=>'RESPONSECONTENT'
,p_display_order=>104
,p_column_identifier=>'BT'
,p_column_label=>'Response'
,p_column_html_expression=>'<A HREF="#RESPONSECONTENT#">RESPONSE FILE</A>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149048008006464059)
,p_db_column_name=>'PIPELINE'
,p_display_order=>114
,p_column_identifier=>'BU'
,p_column_label=>'Pipeline'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149048463634464060)
,p_db_column_name=>'CONTRACT_DESC'
,p_display_order=>124
,p_column_identifier=>'BV'
,p_column_label=>'Customer'
,p_column_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP:P17_SELECTED_CONTRACT_ID:#ID#'
,p_column_linktext=>'#CONTRACT_DESC#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149048801521464060)
,p_db_column_name=>'ENR'
,p_display_order=>134
,p_column_identifier=>'BW'
,p_column_label=>'Enr'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'S999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149049284816464061)
,p_db_column_name=>'EST'
,p_display_order=>144
,p_column_identifier=>'BX'
,p_column_label=>'Est'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149049629262464061)
,p_db_column_name=>'NET'
,p_display_order=>154
,p_column_identifier=>'BY'
,p_column_label=>'Net'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'S999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149050084389464065)
,p_db_column_name=>'ENRUNITS'
,p_display_order=>164
,p_column_identifier=>'BZ'
,p_column_label=>'Enrunits'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149050405739464066)
,p_db_column_name=>'ESTUNITS'
,p_display_order=>174
,p_column_identifier=>'CA'
,p_column_label=>'Estunits'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149050890259464066)
,p_db_column_name=>'PM'
,p_display_order=>184
,p_column_identifier=>'CB'
,p_column_label=>'Pm'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149051240646464067)
,p_db_column_name=>'LAST_UPDATED'
,p_display_order=>194
,p_column_identifier=>'CC'
,p_column_label=>'Last updated'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149051655302464068)
,p_db_column_name=>'STAFFENROL'
,p_display_order=>204
,p_column_identifier=>'CD'
,p_column_label=>'Staff'
,p_column_link=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP:P107_CONTRACT_ID,P107_CONTRACT_DESC,P107_SELECTED_INT_CODE,P107_SHOW_WHAT:#ID#,#CONTRACT_DESC#,#DSP_CODE#,3'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149052014619464069)
,p_db_column_name=>'MODULEWORKTYPE'
,p_display_order=>214
,p_column_identifier=>'CE'
,p_column_label=>'Module Work Type'
,p_column_link=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP:P94_CONRACT_ID,P94_CONTRACT_DESC,P94_SHOW_WHAT,P94_SELECTED_INT_CODE:#ID#,#CONTRACT_DESC#,4,#DSP_CODE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil-alt.png" class="apex-edit-pencil-alt" alt="">'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149052488286464070)
,p_db_column_name=>'RECREATECONTRACTDATA'
,p_display_order=>224
,p_column_identifier=>'CF'
,p_column_label=>'RePrj'
,p_column_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP:P22_CONTRACT_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(149052873235464070)
,p_db_column_name=>'CONTRACTDOCUMENT'
,p_display_order=>234
,p_column_identifier=>'CG'
,p_column_label=>'Contract Document'
,p_column_link=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP:P94_LCDID:#ID#'
,p_column_linktext=>'CONTRACTDOCUMENT'
,p_column_type=>'STRING'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(293524048925932372)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1490572'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:DSP_CODE:COMPANY_CODE:CONTRACT_DESC:RFPCONTENT:RESPONSECONTENT:FINALIZED:STAFFENROL:MODULEWORKTYPE:RECREATECONTRACTDATA:EST:CHILD:ENR:NET:PARENT_CONTRACT:PROPOSALS:APPROVAL_DATE:CONTRACTDOCUMENT:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(149057678656464086)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(148742800503243679)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:97:&SESSION.::&DEBUG.:97'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149058081099464088)
,p_name=>'P40_CONTRACT_DESC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149058485953464090)
,p_name=>'P40_CONTRACT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149058881847464090)
,p_name=>'P40_SELECTED_INT_CODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149059264321464091)
,p_name=>'P40_START_DATETOVALID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149059675373464091)
,p_name=>'P40_END_DATETOVALID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149060008227464092)
,p_name=>'P40_LCDID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149060413707464093)
,p_name=>'P40_SHOW_WHAT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149060834960464093)
,p_name=>'P40_CNTIDD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149061290831464095)
,p_name=>'P40_VIEW'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149061612839464096)
,p_name=>'P40_CID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149062054876464096)
,p_name=>'P40_INTCODE_SELECTED'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149071927067464113)
,p_name=>'P40_CURRENT_PROJECT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(293397226257575987)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149072353952464114)
,p_name=>'P40_CURRENT_PROJECT_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(293397226257575987)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149072748834464114)
,p_name=>'P40_ZERO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(293397226257575987)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149075202876522101)
,p_name=>'P40_PCI'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(291158598635660231)
,p_name=>'P40_THEME_ID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(291158658650660232)
,p_name=>'P40_THEME_STYLE_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(293473713256863627)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(291158728082660233)
,p_name=>'New'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(291158818440660234)
,p_event_id=>wwv_flow_imp.id(291158728082660233)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s("P40_THEME_ID",getCookie("THEME_ID"));',
'$s("P40_THEME_STYLE_ID",getCookie("THEME_STYLE_ID"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(291158941700660235)
,p_event_id=>wwv_flow_imp.id(291158728082660233)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P40_THEME_ID,P40_THEME_STYLE_ID'
,p_attribute_03=>'P40_THEME_ID,P40_THEME_STYLE_ID'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(291159021527660236)
,p_event_id=>wwv_flow_imp.id(291158728082660233)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(291159165714660237)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_APP_STYLE'
,p_process_sql_clob=>'APEX_THEME.SET_CURRENT_STYLE(42,to_number(:P40_THEME_STYLE_ID));'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P40_THEME_STYLE_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
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
