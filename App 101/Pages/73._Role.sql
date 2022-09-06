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
--     PAGE: 73
--   Manifest End
--   Version:         22.1.0
--   Instance ID:     713479013073404
--

begin
null;
end;
/
prompt --application/pages/delete_00073
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>73);
end;
/
prompt --application/pages/page_00073
begin
wwv_flow_imp_page.create_page(
 p_id=>73
,p_user_interface_id=>wwv_flow_imp.id(64113831873839)
,p_name=>'Stakeholders'' Role'
,p_step_title=>'Role'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'SERINE'
,p_last_upd_yyyymmddhh24miss=>'20170410115159'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(183371360242659035)
,p_plug_name=>'Report 1'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ROWID", ',
'"ORL_ID",',
'"ORL_EMPLOYEE",',
'"ORL_ROL_ID",',
'"ORL_OPP_ID"',
'from "#OWNER#"."OPP_ROLE" ',
'where ORL_OPP_ID = :P73_OPPID',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(183371745877659036)
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
,p_detail_link=>'f?p=&APP_ID.:74:&APP_SESSION.::::P74_ROWID:#ROWID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'SERINE'
,p_internal_uid=>183371745877659036
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183371802371659037)
,p_db_column_name=>'ROWID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183372279588659037)
,p_db_column_name=>'ORL_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Orl Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183372652016659038)
,p_db_column_name=>'ORL_EMPLOYEE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(1973668125372222)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183373083431659039)
,p_db_column_name=>'ORL_ROL_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Orl Rol Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(183485551426280711)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(183373448518659039)
,p_db_column_name=>'ORL_OPP_ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Orl Opp Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(183374388066660697)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1833744'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ROWID:ORL_ID:ORL_EMPLOYEE:ORL_ROL_ID:ORL_OPP_ID'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183239332116880612)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(183371360242659035)
,p_button_name=>'Back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_image_alt=>'Back'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(183373803559659040)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(183371360242659035)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(20901145090019119)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:74:P74_ORL_OPP_ID:&P73_OPPID.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(183238910847880608)
,p_name=>'P73_OPPID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(183371360242659035)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
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
