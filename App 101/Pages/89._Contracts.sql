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

prompt --application/pages/delete_00089
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>89);
end;
/
prompt --application/pages/page_00089
begin
wwv_flow_api.create_page(
 p_id=>89
,p_user_interface_id=>wwv_flow_api.id(64113831873839)
,p_name=>'Contracts'
,p_page_mode=>'NORMAL'
,p_step_title=>'Contracts'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Contracts'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20171009125743'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92408019195496501)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(94799857777349822)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(92408019195496501)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid=>true
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(94392184352682361)
,p_name=>'Contracts'
,p_parent_plug_id=>wwv_flow_api.id(94799857777349822)
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid=>true
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID",'''' AS CHILD, '''' as proposals,'''' parentcontract ,"APPROVAL_DATE",',
'   -- CASE WHEN RFP_FILES IS NOT NULL THEN',
'--''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || RFP_FILES END AS RFPCONTENT,',
'',
'   -- CASE WHEN RESPONSE_TO_RFP_FILES  IS NOT NULL THEN',
'--''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || RESPONSE_TO_RFP_FILES END AS ResponseCONTENT,',
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
'USAGE_TYPE = 2 and',
'   ',
'',
'( company_code = :P89_COMPANYNAME OR :P89_COMPANYNAME IS NULL )',
'AND',
'(STATUS = :P89_STATUS or :P89_STATUS is null)  AND ( DSP_CODE  like ''%''||upper(:P89_INTEGRATIONCODE)||''%''  or DSP_CODE is null)',
'AND ',
'(ID = :P89_PCI --- :P89_CONTRACT_ID ',
' OR ----:P89_CONTRACT_ID IS NULL)',
':P89_PCI IS NULL )',
'and created_date is not null',
'and NVL(OFFER_STATUS,0) != 1',
'order by ID  desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Excel'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
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
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_exp_filename=>'List of Contracts'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92370034172480830)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92370402287480830)
,p_query_column_id=>2
,p_column_alias=>'CHILD'
,p_column_display_sequence=>13
,p_column_heading=>'Child'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_VIEW,P40_CNTIDD:Show,#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#ws/small_page.gif" alt="">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92370806610480831)
,p_query_column_id=>3
,p_column_alias=>'PROPOSALS'
,p_column_display_sequence=>20
,p_column_heading=>'Proposals'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP:P36_CONTRACTID:#REF_TO_PIPELINE#'
,p_column_linktext=>'PIPELINE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92371220281480832)
,p_query_column_id=>4
,p_column_alias=>'PARENTCONTRACT'
,p_column_display_sequence=>19
,p_column_heading=>'Parentcontract'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID:#PARENTCONTRACT#'
,p_column_linktext=>'Parent Contract'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92371638479480832)
,p_query_column_id=>5
,p_column_alias=>'APPROVAL_DATE'
,p_column_display_sequence=>25
,p_column_heading=>'Approval Date'
,p_use_as_row_header=>'N'
,p_column_format=>'dd/mm/yyyy'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'APPROVAL_DATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92372898644480837)
,p_query_column_id=>6
,p_column_alias=>'DSP_CODE'
,p_column_display_sequence=>2
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92373294638480838)
,p_query_column_id=>7
,p_column_alias=>'REF_TO_PIPELINE'
,p_column_display_sequence=>21
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92373693601480838)
,p_query_column_id=>8
,p_column_alias=>'REF_TO_CONTRACT'
,p_column_display_sequence=>22
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92374076781480839)
,p_query_column_id=>9
,p_column_alias=>'PARENT_CONTRACT'
,p_column_display_sequence=>23
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92374400123480840)
,p_query_column_id=>10
,p_column_alias=>'COMPANY_CODE'
,p_column_display_sequence=>3
,p_column_heading=>'CLIENT'
,p_use_as_row_header=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(15612817231694462)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'COMPANY_CODE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92374889624480840)
,p_query_column_id=>11
,p_column_alias=>'PIPELINE'
,p_column_display_sequence=>24
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92375202197480841)
,p_query_column_id=>12
,p_column_alias=>'FINALIZED'
,p_column_display_sequence=>8
,p_column_heading=>'Finalized'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(20935140090118790)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'FINALIZED'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92375650030480841)
,p_query_column_id=>13
,p_column_alias=>'STATUS'
,p_column_display_sequence=>18
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92376064668480842)
,p_query_column_id=>14
,p_column_alias=>'CONTRACT_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Customer'
,p_column_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::P17_SELECTED_CONTRACT_ID:#ID#'
,p_column_linktext=>'#CONTRACT_DESC#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92376490404480842)
,p_query_column_id=>15
,p_column_alias=>'ENR'
,p_column_display_sequence=>14
,p_column_heading=>'Enr'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92376805552480843)
,p_query_column_id=>16
,p_column_alias=>'EST'
,p_column_display_sequence=>12
,p_column_heading=>'Est'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92377200729480845)
,p_query_column_id=>17
,p_column_alias=>'NET'
,p_column_display_sequence=>15
,p_column_heading=>'Net'
,p_use_as_row_header=>'N'
,p_column_format=>'S999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92377641305480845)
,p_query_column_id=>18
,p_column_alias=>'ENRUNITS'
,p_column_display_sequence=>16
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92378061339480846)
,p_query_column_id=>19
,p_column_alias=>'ESTUNITS'
,p_column_display_sequence=>17
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92378490471480846)
,p_query_column_id=>20
,p_column_alias=>'PM'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92378895756480847)
,p_query_column_id=>21
,p_column_alias=>'LAST_UPDATED'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92379269931480848)
,p_query_column_id=>22
,p_column_alias=>'STAFFENROL'
,p_column_display_sequence=>9
,p_column_heading=>'Staff'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::P40_CONTRACT_ID,P40_CONTRACT_DESC,P40_SHOW_WHAT,P40_SELECTED_INT_CODE:#ID#,#CONTRACT_DESC#,3,#DSP_CODE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil2_16x16.gif" alt="Staff Enrollment">'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92379695163480848)
,p_query_column_id=>23
,p_column_alias=>'MODULEWORKTYPE'
,p_column_display_sequence=>10
,p_column_heading=>'Module Work Type'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::P40_CONTRACT_ID,P40_CONTRACT_DESC,P40_SHOW_WHAT,P40_SELECTED_INT_CODE:#ID#,#CONTRACT_DESC#,4,#DSP_CODE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#ed-item.gif" alt="Module/WorkType">'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92380085724480849)
,p_query_column_id=>24
,p_column_alias=>'RECREATECONTRACTDATA'
,p_column_display_sequence=>11
,p_column_heading=>'RePrj'
,p_column_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.::P22_CONTRACT_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="Re-Create Projects">'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92380466942480849)
,p_query_column_id=>25
,p_column_alias=>'BRANCH_ID'
,p_column_display_sequence=>7
,p_column_heading=>'Branch Id'
,p_use_as_row_header=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(81277486830177530)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92380888823480850)
,p_query_column_id=>26
,p_column_alias=>'CONTRACTDOCUMENT'
,p_column_display_sequence=>26
,p_column_heading=>'Contract Documents'
,p_column_link=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP:P40_LCDID:#ID#'
,p_column_linktext=>'Contract Documents'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(94799898455349823)
,p_name=>'Child'
,p_parent_plug_id=>wwv_flow_api.id(94392184352682361)
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID", '''' as proposals,'''' parentcontract,',
'"DSP_CODE","REF_TO_PIPELINE","REF_TO_CONTRACT","PARENT_CONTRACT",',
'"COMPANY_CODE","REF_TO_PIPELINE" as Proposal,',
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
'id ReCreateContractData',
'from "#OWNER#"."LGS_CONTRACTS" ',
'WHERE  ',
'  PARENT_CONTRACT =    :P89_PCI      ---:P89_CNTIDD',
'  and usage_type = 2'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>':P89_VIEW =''Show'''
,p_display_condition_type=>'SQL_EXPRESSION'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92385552683480857)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_column_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP:P8_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92385980269480858)
,p_query_column_id=>2
,p_column_alias=>'PROPOSALS'
,p_column_display_sequence=>21
,p_column_heading=>'Proposal'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP:P36_CONTRACTID:#REF_TO_PIPELINE#'
,p_column_linktext=>'Pipeline'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92386359723480858)
,p_query_column_id=>3
,p_column_alias=>'PARENTCONTRACT'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92386769343480859)
,p_query_column_id=>4
,p_column_alias=>'DSP_CODE'
,p_column_display_sequence=>2
,p_column_heading=>'Integration Code'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID,P40_CONTRACT_DESC,P40_SELECTED_INT_CODE,P40_INTCODE_SELECTED:#ID#,#CONTRACT_DESC#,#DSP_CODE#,#ID#'
,p_column_linktext=>'#DSP_CODE#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92387175079480859)
,p_query_column_id=>5
,p_column_alias=>'REF_TO_PIPELINE'
,p_column_display_sequence=>14
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92387592381480859)
,p_query_column_id=>6
,p_column_alias=>'REF_TO_CONTRACT'
,p_column_display_sequence=>15
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92387985934480860)
,p_query_column_id=>7
,p_column_alias=>'PARENT_CONTRACT'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92388321733480860)
,p_query_column_id=>8
,p_column_alias=>'COMPANY_CODE'
,p_column_display_sequence=>16
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92388770653480861)
,p_query_column_id=>9
,p_column_alias=>'PROPOSAL'
,p_column_display_sequence=>22
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92389118268480861)
,p_query_column_id=>10
,p_column_alias=>'FINALIZED'
,p_column_display_sequence=>6
,p_column_heading=>'Finalized'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(20935140090118790)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92389567891480861)
,p_query_column_id=>11
,p_column_alias=>'STATUS'
,p_column_display_sequence=>17
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92389912255480862)
,p_query_column_id=>12
,p_column_alias=>'CONTRACT_DESC'
,p_column_display_sequence=>3
,p_column_heading=>'Customer'
,p_column_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP:P17_SELECTED_CONTRACT_ID:#ID#'
,p_column_linktext=>'#CONTRACT_DESC#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92390329454480862)
,p_query_column_id=>13
,p_column_alias=>'ENR'
,p_column_display_sequence=>11
,p_column_heading=>'Enr'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92390720000480862)
,p_query_column_id=>14
,p_column_alias=>'EST'
,p_column_display_sequence=>10
,p_column_heading=>'Est'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92391193012480863)
,p_query_column_id=>15
,p_column_alias=>'NET'
,p_column_display_sequence=>12
,p_column_heading=>'Net'
,p_use_as_row_header=>'N'
,p_column_format=>'S999G999G999G999G990D00'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'7'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92391538467480863)
,p_query_column_id=>16
,p_column_alias=>'ENRUNITS'
,p_column_display_sequence=>18
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92391997145480863)
,p_query_column_id=>17
,p_column_alias=>'ESTUNITS'
,p_column_display_sequence=>19
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92392356571480864)
,p_query_column_id=>18
,p_column_alias=>'PM'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92392796468480869)
,p_query_column_id=>19
,p_column_alias=>'LAST_UPDATED'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92393128604480870)
,p_query_column_id=>20
,p_column_alias=>'STAFFENROL'
,p_column_display_sequence=>7
,p_column_heading=>'Staff'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID,P40_CONTRACT_DESC,P40_SHOW_WHAT,P40_SELECTED_INT_CODE:#ID#,#CONTRACT_DESC#,3,#DSP_CODE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92393521532480871)
,p_query_column_id=>21
,p_column_alias=>'MODULEWORKTYPE'
,p_column_display_sequence=>8
,p_column_heading=>'MWT'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID,P40_CONTRACT_DESC,P40_SHOW_WHAT,P40_SELECTED_INT_CODE:#ID#,#CONTRACT_DESC#,4,#DSP_CODE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-page.png" class="apex-edit-page" alt="">'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92393997873480871)
,p_query_column_id=>22
,p_column_alias=>'RECREATECONTRACTDATA'
,p_column_display_sequence=>9
,p_column_heading=>'RePrj'
,p_column_link=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP:P22_CONTRACT_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(94401210949682444)
,p_name=>'Projects of  &P89_CONTRACT_DESC.'
,p_parent_plug_id=>wwv_flow_api.id(94799857777349822)
,p_template=>wwv_flow_api.id(13004471707590532)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'where contract_id =    :P89_INTCODE_SELECTED   ---:P89_CONTRACT_ID ',
'order by seq',
'  ',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'P89_CONTRACT_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'N'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
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
,p_prn_document_header=>'APEX'
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
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92399820183480881)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Edit'
,p_column_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::P20_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#e2.gif"  border="0">'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'N'
,p_print_col_width=>'0'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92400251269480882)
,p_query_column_id=>2
,p_column_alias=>'L_DESCRIPTION'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'L_DESCRIPTION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92400657837480882)
,p_query_column_id=>3
,p_column_alias=>'DSP_CODE'
,p_column_display_sequence=>4
,p_column_heading=>'Dsp Code'
,p_hidden_column=>'Y'
,p_include_in_export=>'N'
,p_print_col_width=>'0'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'DSP_CODE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92401085492480883)
,p_query_column_id=>4
,p_column_alias=>'END_DATE'
,p_column_display_sequence=>5
,p_column_heading=>'End Date'
,p_hidden_column=>'Y'
,p_include_in_export=>'N'
,p_print_col_width=>'0'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'END_DATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92401464991480884)
,p_query_column_id=>5
,p_column_alias=>'START_DATE'
,p_column_display_sequence=>6
,p_column_heading=>'Start Date'
,p_hidden_column=>'Y'
,p_include_in_export=>'N'
,p_print_col_width=>'0'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'START_DATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92401849240480884)
,p_query_column_id=>6
,p_column_alias=>'CONTRACT_ID'
,p_column_display_sequence=>7
,p_column_heading=>'Contract Id'
,p_hidden_column=>'Y'
,p_include_in_export=>'N'
,p_print_col_width=>'0'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'CONTRACT_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92402216461480885)
,p_query_column_id=>7
,p_column_alias=>'APPROVAL_DATE'
,p_column_display_sequence=>22
,p_column_heading=>'Approval Date'
,p_use_as_row_header=>'N'
,p_column_format=>'dd/mm/yyyy'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_table_name=>'LGS_CONTRACTS'
,p_ref_column_name=>'APPROVAL_DATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92402697233480885)
,p_query_column_id=>8
,p_column_alias=>'INT_CODE'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'INT_CODE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92403002354480886)
,p_query_column_id=>9
,p_column_alias=>'TOP LEVEL MODULE'
,p_column_display_sequence=>9
,p_column_heading=>'Top level module'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92394652468480873)
,p_query_column_id=>10
,p_column_alias=>'MODULE'
,p_column_display_sequence=>10
,p_column_heading=>'Module'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CURRENT_PROJECT,P40_CURRENT_PROJECT_DESC,P40_SHOW_WHAT,P40_ZERO:#ID#,#PROJECT_DESC#,2,0'
,p_column_linktext=>'#MODULE#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'12'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'MODULE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92395050660480874)
,p_query_column_id=>11
,p_column_alias=>'NEW_IMPLEMENTATION'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'NEW_IMPLEMENTATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92395454765480875)
,p_query_column_id=>12
,p_column_alias=>'MAINTENANCE'
,p_column_display_sequence=>12
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'MAINTENANCE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92395809248480875)
,p_query_column_id=>13
,p_column_alias=>'PRICING_DATE'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'PRICING_DATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92396211672480876)
,p_query_column_id=>14
,p_column_alias=>'ACTIVE'
,p_column_display_sequence=>14
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92396618616480876)
,p_query_column_id=>15
,p_column_alias=>'SEQ'
,p_column_display_sequence=>2
,p_column_heading=>'Seq'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'12'
,p_ref_schema=>'PRJ'
,p_ref_table_name=>'LGS_PROJECTS'
,p_ref_column_name=>'SEQ'
);
end;
/
begin
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92397060613480877)
,p_query_column_id=>16
,p_column_alias=>'ESTIMATE'
,p_column_display_sequence=>15
,p_column_heading=>'Est.'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'12'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92397487034480877)
,p_query_column_id=>17
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92397894593480878)
,p_query_column_id=>18
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92398273600480879)
,p_query_column_id=>19
,p_column_alias=>'EXP'
,p_column_display_sequence=>18
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92398656074480879)
,p_query_column_id=>20
,p_column_alias=>'EMP'
,p_column_display_sequence=>19
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92399067412480880)
,p_query_column_id=>21
,p_column_alias=>'GET_FROM_CSS'
,p_column_display_sequence=>20
,p_column_heading=>'Staff'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::P40_CURRENT_PROJECT,P40_CURRENT_PROJECT_DESC,P40_SHOW_WHAT:#ID#,#PROJECT_DESC#,1'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#menu/pencil2_16x16.gif" alt="Staff Enrollment">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_print_col_width=>'12'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92399492202480880)
,p_query_column_id=>22
,p_column_alias=>'PROJECT_DESC'
,p_column_display_sequence=>21
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(94411199399682461)
,p_name=>'Employee Enrollment &P89_CURRENT_PROJECT_DESC.'
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_display_column=>2
,p_display_point=>'BODY_3'
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
'                               where proj_id = :P89_CURRENT_PROJECT)',
'group by es.emp_name'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'P89_SHOW_WHAT'
,p_display_when_cond2=>'1'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92353426656480774)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92351863790480766)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92352237787480772)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92352678471480773)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92353088731480773)
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
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(94413644344682466)
,p_name=>'Task Enrollment in &P89_CURRENT_PROJECT_DESC.'
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_display_column=>2
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ppt.id, ppt.id task_Details,ppt.grade, ppt.estimated_days, ppt.enrolled_days, ppt.description, ppt.wrktyp_id, ppt.proj_id, ppt.qty, ',
'ppt.seq, ppt.id Est, ppt.id Work,',
'project_pck.get_project_work_estimate_num(ppt.id) Estimated,',
'project_pck.get_task_enrollment(ppt.id,''0'',''d'') Enrollment,',
'ppt.id Exp,',
'project_pck.get_project_task_expences(ppt.id) Expences,',
'project_pck.get_contract_id(ppt.proj_id) Contract,',
'project_pck.get_project_module(ppt.proj_id) Module,',
'PROJECT_PCK.get_project_desc(ppt.PROJ_ID) ||'' ''||',
'project_pck.get_work_type_desc(ppt.wrktyp_id) Project_description',
'from prj_projectwork_types ppt',
'where ppt.proj_id = :P89_current_project   ',
'/*and ( ppt.id in (select project_worktype_id from prj_estimated_dets)   ',
'      or ',
'      ppt.id in (select project_worktype_id from prj_enrolled_dets))*/',
'and  project_pck.get_if_prj_worktype_disp(ppt.id, :P89_ZERO) = 1',
'and ppt.seq not in (80,50,55,60,70,200,100,90)',
'order by ppt.seq',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'P89_SHOW_WHAT'
,p_display_when_cond2=>'2'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92354144629480779)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92354530443480779)
,p_query_column_id=>2
,p_column_alias=>'TASK_DETAILS'
,p_column_display_sequence=>3
,p_column_heading=>'TASK_DETAILS'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92354967752480780)
,p_query_column_id=>3
,p_column_alias=>'GRADE'
,p_column_display_sequence=>4
,p_column_heading=>'GRADE'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92355388388480781)
,p_query_column_id=>4
,p_column_alias=>'ESTIMATED_DAYS'
,p_column_display_sequence=>5
,p_column_heading=>'ESTIMATED_DAYS'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92355710598480781)
,p_query_column_id=>5
,p_column_alias=>'ENROLLED_DAYS'
,p_column_display_sequence=>6
,p_column_heading=>'ENROLLED_DAYS'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92356124949480784)
,p_query_column_id=>6
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>7
,p_column_heading=>'DESCRIPTION'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92356574324480785)
,p_query_column_id=>7
,p_column_alias=>'WRKTYP_ID'
,p_column_display_sequence=>8
,p_column_heading=>'Work Type'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(15760494688455984)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92356982832480785)
,p_query_column_id=>8
,p_column_alias=>'PROJ_ID'
,p_column_display_sequence=>10
,p_column_heading=>'PROJ_ID'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92357341268480789)
,p_query_column_id=>9
,p_column_alias=>'QTY'
,p_column_display_sequence=>11
,p_column_heading=>'QTY'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92357742762480789)
,p_query_column_id=>10
,p_column_alias=>'SEQ'
,p_column_display_sequence=>2
,p_column_heading=>'Seq'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92358130626480790)
,p_query_column_id=>11
,p_column_alias=>'EST'
,p_column_display_sequence=>13
,p_column_heading=>'Est.'
,p_column_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::P14_PROJECT_WORKTYPE_ID,P14_PROJECT_WORKTYPE_DESC,P14_PARENT_MODULE:#ID#,#PROJECT_DESCRIPTION#,#MODULE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#ws/small_page.gif" alt="Register / View Estimates">'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92358545100480791)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92358935414480792)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92359306611480792)
,p_query_column_id=>14
,p_column_alias=>'ENROLLMENT'
,p_column_display_sequence=>14
,p_column_heading=>'Enrollment (Days)'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92359721445480793)
,p_query_column_id=>15
,p_column_alias=>'EXP'
,p_column_display_sequence=>16
,p_column_heading=>'EXP'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92360116884480793)
,p_query_column_id=>16
,p_column_alias=>'EXPENCES'
,p_column_display_sequence=>17
,p_column_heading=>'EXPENCES'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92360544724480794)
,p_query_column_id=>17
,p_column_alias=>'CONTRACT'
,p_column_display_sequence=>18
,p_column_heading=>'CONTRACT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92360938092480795)
,p_query_column_id=>18
,p_column_alias=>'MODULE'
,p_column_display_sequence=>19
,p_column_heading=>'MODULE'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92361353411480796)
,p_query_column_id=>19
,p_column_alias=>'PROJECT_DESCRIPTION'
,p_column_display_sequence=>9
,p_column_heading=>'Work Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(94422853614682488)
,p_name=>'Staff enrolled in &P89_CONTRACT_DESC.'
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_display_column=>2
,p_display_point=>'BODY_3'
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
'                               where proj_id in (select id from lgs_projects where contract_id=:P89_CONTRACT_ID))',
'group by es.emp_name'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'P89_SHOW_WHAT'
,p_display_when_cond2=>'3'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92363105295480816)
,p_query_column_id=>1
,p_column_alias=>'EMP_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Staff'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92363568698480816)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92363940362480817)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92364346476480817)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92364725972480818)
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
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(94425192806682494)
,p_name=>'Module WorkType of Contract &P89_CONTRACT_DESC.'
,p_template=>wwv_flow_api.id(20903049949019134)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_display_column=>2
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select m.e_name module, wt.e_name Work_type, ',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) Estimated,',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Enrollment,',
'sum(project_pck.get_project_work_estimate_num(ppt.id)) -',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) Net',
'from prj_projectwork_types ppt, prj_work_types wt, prj_modules m',
'where  ppt.wrktyp_id  =wt.id',
'and  m.code   = project_pck.get_project_module(ppt.proj_id)',
'and      ppt.proj_id in (select id from lgs_projects where contract_id = :P89_CONTRACT_ID)',
'group by m.e_name, wt.e_name',
'having sum(project_pck.get_project_work_estimate_num(ppt.id)) +',
'sum(project_pck.get_task_enrollment(ppt.id,''0'',''d'')) <> 0',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'P89_SHOW_WHAT'
,p_display_when_cond2=>'4'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(20905651468019153)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92365460000480820)
,p_query_column_id=>1
,p_column_alias=>'MODULE'
,p_column_display_sequence=>1
,p_column_heading=>'Module'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92365837545480821)
,p_query_column_id=>2
,p_column_alias=>'WORK_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Work Type'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92366204638480821)
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92366634538480822)
,p_query_column_id=>4
,p_column_alias=>'ENROLLMENT'
,p_column_display_sequence=>4
,p_column_heading=>'Enr.'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92367047682480822)
,p_query_column_id=>5
,p_column_alias=>'NET'
,p_column_display_sequence=>5
,p_column_heading=>'Net'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92381297136480850)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(94392184352682361)
,p_button_name=>'ShowAll'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(114244386751508)
,p_button_image_alt=>'Show All'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92408465528496505)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(94799857777349822)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92381607246480851)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(94392184352682361)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92403473600480886)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(94401210949682444)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(20901145090019119)
,p_button_image_alt=>'Create New Project within the Contract &P89_CONTRACT_DESC.'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RP:P78_CONTRACT_ID,P78_INT_CODE:&P89_CONTRACT_ID.,&P89_SELECTED_INT_CODE.'
,p_button_condition=>'P89_CONTRACT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92361758187480797)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(94413644344682466)
,p_button_name=>'SHOWZEROS'
,p_button_static_id=>'SHOWZEROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(114244386751508)
,p_button_image_alt=>'Show Un-Used Items'
,p_button_position=>'TOP'
,p_button_redirect_url=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.::P89_ZERO:1'
,p_button_condition=>'P89_ZERO'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92362120914480800)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(94413644344682466)
,p_button_name=>'DONOTSHOWSEROS'
,p_button_static_id=>'DONOTSHOWSEROS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(114244386751508)
,p_button_image_alt=>'Hide Unused items'
,p_button_position=>'TOP'
,p_button_redirect_url=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.::P89_ZERO:0'
,p_button_condition=>'P89_ZERO'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(92407758654480920)
,p_branch_action=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 15-FEB-2011 22:33 by ADMIN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92362505700480801)
,p_name=>'P89_ZERO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(94413644344682466)
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92367797533480825)
,p_name=>'P89_VIEW'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(94799857777349822)
,p_item_default=>'non'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92368153721480826)
,p_name=>'P89_CNTIDD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(94799857777349822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92368563163480826)
,p_name=>'P89_PCI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(94799857777349822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92368997347480827)
,p_name=>'P89_CID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(94799857777349822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92369374736480827)
,p_name=>'P89_INTCODE_SELECTED'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(94799857777349822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92382806103480853)
,p_name=>'P89_CONTRACT_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(94392184352682361)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92383230588480854)
,p_name=>'P89_CONTRACT_DESC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(94392184352682361)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92383607039480854)
,p_name=>'P89_SELECTED_INT_CODE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(94392184352682361)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92384073696480855)
,p_name=>'P89_START_DATETOVALID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(94392184352682361)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92384499747480855)
,p_name=>'P89_END_DATETOVALID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(94392184352682361)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92384809607480856)
,p_name=>'P89_LCDID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(94392184352682361)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92403823487480887)
,p_name=>'P89_SHOW_WHAT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(94401210949682444)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92404209047480888)
,p_name=>'P89_CURRENT_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(94401210949682444)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92404635066480888)
,p_name=>'P89_CURRENT_PROJECT_DESC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(94401210949682444)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92408153759496502)
,p_name=>'P89_COMPANYNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(94799857777349822)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92408216094496503)
,p_name=>'P89_INTEGRATIONCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(94799857777349822)
,p_prompt=>'int code'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92408362276496504)
,p_name=>'P89_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(94799857777349822)
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
,p_field_template=>wwv_flow_api.id(20906254571019158)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92405408052480910)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(92381297136480850)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92405906739480914)
,p_event_id=>wwv_flow_api.id(92405408052480910)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' :P89_PCI := '''';',
' :P89_COMPANYNAME := NULL;',
' :P89_INTEGRATIONCODE := NULL;',
' :P89_STATUS := NULL;',
'end;',
''))
,p_attribute_02=>'P89_PCI,P89_STATUS,P89_COMPANYNAME,P89_INTEGRATIONCODE'
,p_attribute_03=>'P89_PCI,P89_STATUS,P89_COMPANYNAME,P89_INTEGRATIONCODE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92406327021480918)
,p_event_id=>wwv_flow_api.id(92405408052480910)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(92406721081480918)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(92403473600480886)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(92407253876480919)
,p_event_id=>wwv_flow_api.id(92406721081480918)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92405049721480906)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RUN_PROCESS_CONTRACT'
,p_process_sql_clob=>'transfer_data.create_enrolled_data_contract(:P89_SELECTED_CONTRACT_ID);'
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
