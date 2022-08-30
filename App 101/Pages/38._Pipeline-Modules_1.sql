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
--   Date and Time:   11:23 Tuesday August 30, 2022
--   Exported By:     PRJ
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 38
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00038
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>38);
end;
/
prompt --application/pages/page_00038
begin
wwv_flow_imp_page.create_page(
 p_id=>38
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Pipeline-Modules'
,p_step_title=>'Pipeline-Modules'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
,p_last_updated_by=>'DIANA'
,p_last_upd_yyyymmddhh24miss=>'20190218100710'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2417259169382477)
,p_plug_name=>'Pipeline-Modules'
,p_region_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "PPM_ID", ',
'"PPM_CNT_ID",',
'"PPM_MODULE",',
'"PPM_START_DATE",',
'"PPM_END_DATE",',
'"PPM_INT_CODE",',
'"PPM_NEW_IMPLEMENTATION",',
'"PPM_MAINTENANCE",',
'"PPM_PRICING_DATE",',
'"PPM_HIGH_LEVEL_ESTIMATE"',
'from "#OWNER#"."PRJ_PIPELINE_MODULES" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(2417689844382477)
,p_name=>'Pipeline-Modules'
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
,p_detail_link=>'f?p=&APP_ID.:39:&APP_SESSION.::::P39_PPM_ID:#PPM_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif"  border="0">'
,p_owner=>'SERINE'
,p_internal_uid=>2417689844382477
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2417718099382506)
,p_db_column_name=>'PPM_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Ppm Id'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2418165775382523)
,p_db_column_name=>'PPM_CNT_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Ppm Cnt Id'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2418849289382524)
,p_db_column_name=>'PPM_MODULE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Ppm Module'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2419257317382525)
,p_db_column_name=>'PPM_START_DATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Ppm Start Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2419662652382526)
,p_db_column_name=>'PPM_END_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Ppm End Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2420056983382526)
,p_db_column_name=>'PPM_INT_CODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Ppm Int Code'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2420438860382527)
,p_db_column_name=>'PPM_NEW_IMPLEMENTATION'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Ppm New Implementation'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2420873086382528)
,p_db_column_name=>'PPM_MAINTENANCE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Ppm Maintenance'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2421225625382529)
,p_db_column_name=>'PPM_PRICING_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Ppm Pricing Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2421696677382530)
,p_db_column_name=>'PPM_HIGH_LEVEL_ESTIMATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Ppm High Level Estimate'
,p_column_type=>'NUMBER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(338141875281396262)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3381419'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PPM_ID:PPM_CNT_ID:PPM_MODULE:PPM_START_DATE:PPM_END_DATE:PPM_INT_CODE:PPM_NEW_IMPLEMENTATION:PPM_MAINTENANCE:PPM_PRICING_DATE:PPM_HIGH_LEVEL_ESTIMATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2422025106382531)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(2417259169382477)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:39'
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
