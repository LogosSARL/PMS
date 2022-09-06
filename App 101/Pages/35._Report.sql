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
--     PAGE: 35
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00035
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>35);
end;
/
prompt --application/pages/page_00035
begin
wwv_flow_imp_page.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'Contracts Status'
,p_step_title=>'Report'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20170704135503'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51970137672930703)
,p_plug_name=>'Contract Status'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(20903049949019134)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT      '''' AS LINK ,lgs_contracts.id cntid, lgs_projects.CONTRACT_ID, lgs_projects.id, lgs_projects.START_DATE, lgs_projects.END_DATE, PRJ_PROJECT_STATUS_HISTORY.psh_DATE,   PRJ_PROJECT_STATUS_HISTORY.psh_STS_ID',
'FROM         PRJ_PROJECT_STATUS_HISTORY, lgs_contracts, lgs_projects,',
'(SELECT         lgs_projects.CONTRACT_ID, lgs_projects.id,max(PRJ_PROJECT_STATUS_HISTORY.psh_ID)  MAX_PSH_ID_COLUMN ',
'FROM         ',
'          lgs_contracts, lgs_projects,PRJ_PROJECT_STATUS_HISTORY, (select lgs_projects.CONTRACT_ID, lgs_projects.id,  max(PRJ_PROJECT_STATUS_HISTORY.psh_date)   MAX_DATE_COLUMN',
'                        from  lgs_contracts, lgs_projects, PRJ_PROJECT_STATUS_HISTORY',
'                        where lgs_projects.contract_id = lgs_contracts.id',
'                        and PRJ_PROJECT_STATUS_HISTORY.PSH_PRJ_ID = lgs_projects.ID',
'                        group by lgs_projects.CONTRACT_ID, lgs_projects.id)  MAX_DATE_PROJSTATUS_SUBQUERY',
'',
'WHERE  MAX_DATE_PROJSTATUS_SUBQUERY.MAX_DATE_COLUMN = PRJ_PROJECT_STATUS_HISTORY.PSH_DATE',
'       AND lgs_projects.contract_id = lgs_contracts.id',
'       and PRJ_PROJECT_STATUS_HISTORY.PSH_PRJ_ID = lgs_projects.ID',
'group by lgs_projects.CONTRACT_ID, lgs_projects.id)  MAX_PSH_ID_SUBQUERY',
'',
'WHERE MAX_PSH_ID_SUBQUERY.MAX_PSH_ID_COLUMN   = PRJ_PROJECT_STATUS_HISTORY.PSH_ID',
'AND lgs_projects.contract_id = lgs_contracts.id',
'       and PRJ_PROJECT_STATUS_HISTORY.PSH_PRJ_ID = lgs_projects.ID',
'       ',
'order by 1,2'))
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
 p_id=>wwv_flow_imp.id(51970407620930706)
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
,p_owner=>'ADMIN'
,p_internal_uid=>51970407620930706
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51970529473930707)
,p_db_column_name=>'CONTRACT_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Contract'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(95934808450922294)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51970678060930708)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Project'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(95935187076928414)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51971140504930713)
,p_db_column_name=>'PSH_STS_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(1974458000386842)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90139770377650616)
,p_db_column_name=>'START_DATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90139836909650617)
,p_db_column_name=>'END_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(90139939693650618)
,p_db_column_name=>'PSH_DATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Last Modified'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51972785444930729)
,p_db_column_name=>'LINK'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Link'
,p_column_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:P40_CONTRACT_ID:#CNTID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(51972999158930731)
,p_db_column_name=>'CNTID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Cntid'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(53566231995920725)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'535663'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LINK:CONTRACT_ID:ID:PSH_STS_ID:START_DATE:END_DATE:PSH_DATE::CNTID'
,p_sort_column_1=>'CONTRACT_ID'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'ID'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51971233952930714)
,p_name=>'colorRow'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(51970137672930703)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51971319038930715)
,p_event_id=>wwv_flow_imp.id(51971233952930714)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('$(''.u-tR'').each(function()\00A0{\00A0\00A0'),
unistr('\00A0\00A0if\00A0(\00A0$(this).text()\00A0===\00A0''Approved & Closed''\00A0)\00A0{\00A0\00A0'),
unistr('\00A0\00A0\00A0\00A0$(this).closest(''tr'').find(''td'').css({"color":"green"});\00A0\00A0'),
unistr('\00A0\00A0}\00A0\00A0'),
unistr('\00A0\00A0if\00A0(\00A0$(this).text()\00A0===\00A0''Cancelled''\00A0)\00A0{\00A0\00A0'),
unistr('\00A0\00A0\00A0\00A0$(this).closest(''tr'').find(''td'').css({"color":"gray"});'),
'      ',
unistr('\00A0\00A0}\00A0\00A0'),
unistr('\00A0\00A0if\00A0(\00A0$(this).text()\00A0===\00A0''Delivered & Client Testing''\00A0)\00A0{\00A0\00A0'),
unistr('\00A0\00A0\00A0\00A0$(this).closest(''tr'').find(''td'').css({"color":"blue"});\00A0\00A0'),
unistr('\00A0\00A0}\00A0\00A0'),
'  if ( $(this).text() === ''In Progress'' ) {  ',
'    $(this).closest(''tr'').find(''td'').css({"color":"red"});  ',
'  }  ',
'  ',
'});'))
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
