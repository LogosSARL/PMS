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
--     PAGE: 28
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00028
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>28);
end;
/
prompt --application/pages/page_00028
begin
wwv_flow_imp_page.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_tab_set=>'TS1'
,p_name=>'pdf'
,p_step_title=>'pdf'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_imp.id(20900830188019117)
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20120816124702'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1374829272505696)
,p_plug_name=>'pdf'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID, ',
'DSP_CODE,',
'COMPANY_CODE,',
'FINALIZED,',
'project_pck.get_contract_desc (id) Contract_desc,',
'project_pck.get_task_contract_enrollment (id,''0'',''d'') Enr,',
'project_pck.get_contract_estimate(id) Est,',
'project_pck.get_contract_estimate(id) - project_pck.get_task_contract_enrollment (id,''0'',''d'') Net,',
'project_pck.get_contract_enrollment(id) EnrUnits,',
'project_pck.get_contract_estimate(id) EstUnits,',
'id StaffEnrol,',
'id ModuleWorkType,',
'id ReCreateContractData',
'from lGS_CONTRACTS ',
'WHERE id = 466'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_output_show_link=>'Y'
,p_prn_content_disposition=>'INLINE'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1374902286505696)
,p_name=>'pdf'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>1
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1375121423505714)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1375201010505718)
,p_db_column_name=>'DSP_CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Dsp Code'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'DSP_CODE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1375322514505718)
,p_db_column_name=>'COMPANY_CODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Company Code'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'COMPANY_CODE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1375418586505718)
,p_db_column_name=>'FINALIZED'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Finalized'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'FINALIZED'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1375511609505718)
,p_db_column_name=>'CONTRACT_DESC'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Contract Desc'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'CONTRACT_DESC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1375624807505718)
,p_db_column_name=>'ENR'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Enr'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ENR'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1375724480505718)
,p_db_column_name=>'EST'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Est'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'EST'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1375823880505718)
,p_db_column_name=>'NET'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Net'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'NET'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1375900374505718)
,p_db_column_name=>'ENRUNITS'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Enrunits'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ENRUNITS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1376008851505718)
,p_db_column_name=>'ESTUNITS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Estunits'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ESTUNITS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1376124992505718)
,p_db_column_name=>'STAFFENROL'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Staffenrol'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'STAFFENROL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1376204523505720)
,p_db_column_name=>'MODULEWORKTYPE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Moduleworktype'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'MODULEWORKTYPE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1376305434505720)
,p_db_column_name=>'RECREATECONTRACTDATA'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Recreatecontractdata'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'RECREATECONTRACTDATA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1376411516505881)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'13765'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'ID:DSP_CODE:COMPANY_CODE:FINALIZED:CONTRACT_DESC:ENR:EST:NET:ENRUNITS:ESTUNITS:STAFFENROL:MODULEWORKTYPE:RECREATECONTRACTDATA'
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
