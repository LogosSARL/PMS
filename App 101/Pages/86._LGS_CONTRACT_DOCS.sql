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
--     PAGE: 86
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00086
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>86);
end;
/
prompt --application/pages/page_00086
begin
wwv_flow_imp_page.create_page(
 p_id=>86
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'LGS_CONTRACT_DOCS'
,p_step_title=>'LGS_CONTRACT_DOCS'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20170721162707'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29400343400305185)
,p_plug_name=>'Report 1'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "LCD_ID", ',
'"LCD_FILE_NAME",',
'"LCD_FILE_DESC", CASE WHEN LCD_FILE_NAME IS NOT NULL THEN',
'''f?p='' || :APP_ID || '':43:'' || :APP_SESSION || ''::::P43_FILE_NAME:'' || LCD_FILE_NAME END',
'AS Files,',
'"LCD_CNT_ID"',
'from "#OWNER#"."LGS_CONTRACT_DOCS" ',
'where LCD_CNT_ID = :P36_LCD_ID',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(29400744142305185)
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
,p_detail_link=>'f?p=&APP_ID.:87:&APP_SESSION.::::P87_LCD_ID:#LCD_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'JAWAD'
,p_internal_uid=>29400744142305185
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29400806834305210)
,p_db_column_name=>'LCD_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Lcd Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29401210689305216)
,p_db_column_name=>'LCD_FILE_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Contract Document File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29401669571305217)
,p_db_column_name=>'LCD_FILE_DESC'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Contract Document File Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29402006910305218)
,p_db_column_name=>'LCD_CNT_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Lcd Cnt Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(184221892820304845)
,p_db_column_name=>'FILES'
,p_display_order=>14
,p_column_identifier=>'E'
,p_column_label=>'Files'
,p_column_html_expression=>'<A HREF="#FILES#">#LCD_FILE_NAME#</a>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(29405167653343055)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'294052'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LCD_ID:LCD_FILE_NAME:LCD_FILE_DESC:LCD_CNT_ID:FILES'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(29402494746305219)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(29400343400305185)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.:87:P87_LCD_CNT_ID:&P36_LCD_ID.'
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
